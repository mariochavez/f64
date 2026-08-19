require "bridgetown"

Bridgetown.load_tasks

# Run rake without specifying any command to execute a deploy build by default.
task default: :deploy

#
# Standard set of tasks, which you can customize if you wish:
#
desc "Build the Bridgetown site for deployment"
task :deploy => [:clean, "frontend:build"] do
  Bridgetown::Commands::Build.start
end

desc "Build the site in a test environment"
task :test do
  ENV["BRIDGETOWN_ENV"] = "test"
  Bridgetown::Commands::Build.start
end

desc "Runs the clean command"
task :clean do
  Bridgetown::Commands::Clean.start
end

namespace :frontend do
  desc "Build the frontend with esbuild for deployment"
  task :build do
    sh "yarn run esbuild"
  end

  desc "Watch the frontend with esbuild during development"
  task :dev do
    sh "yarn run esbuild-dev"
  rescue Interrupt
  end
end

desc "Check the built site for the SEO artifacts that are easy to lose silently"
task :verify do
  errors = []
  output = File.expand_path("output", __dir__)

  %w(sitemap.xml robots.txt _headers).each do |file|
    path = File.join(output, file)
    errors << "#{file} is missing or empty" unless File.size?(path)
  end

  sitemap = File.join(output, "sitemap.xml")
  if File.size?(sitemap)
    urls = File.read(sitemap).scan("<loc>").size
    puts "sitemap.xml lists #{urls} URLs"
    errors << "sitemap.xml only has #{urls} URLs" if urls < 30
  end

  pages = Dir.glob(File.join(output, "**", "*.html"))
  errors << "no HTML pages were built" if pages.empty?
  uncanonical = pages.reject { |page| File.read(page).include?('rel="canonical"') }
  errors << "pages without a canonical tag: #{uncanonical.join(", ")}" if uncanonical.any?

  maps = Dir.glob(File.join(output, "**", "*.map"))
  errors << "sourcemaps leaked into production: #{maps.join(", ")}" if maps.any?

  abort "Verification failed:\n  #{errors.join("\n  ")}" if errors.any?
  puts "#{pages.size} pages verified"
end

desc "Build for production, verify, and deploy to Cloudflare"
task :publish do
  # Set before invoking, so esbuild sees it too and leaves out the sourcemaps.
  ENV["BRIDGETOWN_ENV"] = "production"
  Rake::Task[:deploy].invoke
  Rake::Task[:verify].invoke
  sh "npx wrangler deploy"
end

#
# Add your own Rake tasks here! You can use `environment` as a prerequisite
# in order to write automations or other commands requiring a loaded site.
#
# task :my_task => :environment do
#   puts site.root_dir
#   automation do
#     say_status :rake, "I'm a Rake tast =) #{site.config.url}"
#   end
# end
