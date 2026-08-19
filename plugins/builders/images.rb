# frozen_string_literal: true

module Builders
  # Every `<img>` on this site used to ship without `width`/`height`, so the
  # browser could not reserve space for a photo before it arrived and the whole
  # page shifted as each one loaded. Rather than hand-maintaining dimensions for
  # ~300 files, this builder reads them out of the image headers at build time
  # and exposes them to the templates — add a photo and its dimensions are
  # simply correct.
  #
  # Only the formats this site actually uses are supported (JPEG, PNG, SVG).
  # An unreadable or unknown file yields `nil`, and the templates fall back to
  # emitting no dimensions rather than a wrong or broken attribute.
  class Images < SiteBuilder
    def build
      helper(:image_dimensions) { |path| Images.dimensions(site, path) }
      helper(:webp_for) { |path| Images.webp_for(site, path) }
    end

    # Cached per build; ~300 header reads would otherwise repeat across pages.
    def self.dimensions(site, path)
      @dimensions ||= {}
      @dimensions.fetch(path) do
        @dimensions[path] = read_dimensions(site.in_source_dir(path.to_s))
      end
    end

    # A sibling `.webp` is only advertised when it was actually generated, so a
    # missing conversion degrades to the JPEG instead of a broken <source>.
    def self.webp_for(site, path)
      candidate = path.to_s.sub(%r{\.(jpe?g|png)\z}i, ".webp")
      return nil if candidate == path.to_s

      File.exist?(site.in_source_dir(candidate)) ? candidate : nil
    end

    def self.read_dimensions(absolute_path)
      return nil unless File.file?(absolute_path)

      case File.extname(absolute_path).downcase
      when ".jpg", ".jpeg" then File.open(absolute_path, "rb") { |io| jpeg(io) }
      when ".png"          then File.open(absolute_path, "rb") { |io| png(io) }
      when ".svg"          then svg(File.read(absolute_path, 1024))
      end
    rescue StandardError => e
      Bridgetown.logger.warn("Images:", "could not read dimensions for #{absolute_path}: #{e.message}")
      nil
    end

    # Walk the JPEG marker segments until a Start Of Frame, which is the only
    # place the pixel dimensions are recorded.
    def self.jpeg(io)
      return nil unless io.read(2) == "\xFF\xD8".b

      loop do
        byte = io.read(1)
        return nil if byte.nil?
        next unless byte == "\xFF".b

        marker = io.read(1)
        return nil if marker.nil?

        code = marker.ord
        next if code == 0xFF                       # fill bytes before a marker
        next if code == 0x01 || (0xD0..0xD9).cover?(code) # standalone, no payload

        length = io.read(2)&.unpack1("n")
        return nil if length.nil? || length < 2

        # SOF0-SOF15, excluding the DHT/JPG/DAC markers that share the range.
        if (0xC0..0xCF).cover?(code) && ![0xC4, 0xC8, 0xCC].include?(code)
          frame = io.read(5)
          return nil if frame.nil? || frame.bytesize < 5

          _precision, height, width = frame.unpack("Cnn")
          return [width, height]
        end

        io.seek(length - 2, IO::SEEK_CUR)
      end
    end

    def self.png(io)
      header = io.read(24)
      return nil if header.nil? || header.bytesize < 24
      return nil unless header.start_with?("\x89PNG\r\n\x1A\n".b)

      header[16, 8].unpack("N2")
    end

    def self.svg(head)
      if (box = head[/viewBox\s*=\s*["']\s*[\d.+-]+[,\s]+[\d.+-]+[,\s]+([\d.]+)[,\s]+([\d.]+)/m])
        _ = box
        return [Regexp.last_match(1).to_f.round, Regexp.last_match(2).to_f.round]
      end

      width  = head[/\bwidth\s*=\s*["']([\d.]+)/m, 1]
      height = head[/\bheight\s*=\s*["']([\d.]+)/m, 1]
      return nil unless width && height

      [width.to_f.round, height.to_f.round]
    end
  end
end
