import { Controller } from "@hotwired/stimulus"

// Progressive enhancement over a plain link to the full-size file. Without
// JavaScript every photograph still opens on its own — the anchor is the real
// behaviour and this only intercepts it once the controller is connected, so the
// archive keeps working if this script never loads.
//
// The dialog is a native <dialog> opened with showModal(), which gives focus
// trapping, Escape, inertness of the page behind it, and focus restoration for
// free rather than hand-rolled and subtly wrong.
export default class extends Controller {
  static targets = ["link", "dialog", "image", "credit", "counter", "previous", "next"]

  connect() {
    this.index = 0
  }

  open(event) {
    // Let modified clicks (new tab, download, middle click) behave normally.
    if (event.metaKey || event.ctrlKey || event.shiftKey || event.altKey || event.button !== 0) return
    event.preventDefault()

    this.index = this.linkTargets.indexOf(event.currentTarget)
    this.show()
    this.dialogTarget.showModal()
  }

  close() {
    this.dialogTarget.close()
  }

  previous() {
    this.index = (this.index - 1 + this.linkTargets.length) % this.linkTargets.length
    this.show()
  }

  next() {
    this.index = (this.index + 1) % this.linkTargets.length
    this.show()
  }

  // Arrow keys are the expected way through a gallery; Escape is already native.
  keydown(event) {
    if (this.linkTargets.length < 2) return
    if (event.key === "ArrowLeft") { event.preventDefault(); this.previous() }
    if (event.key === "ArrowRight") { event.preventDefault(); this.next() }
  }

  show() {
    const link = this.linkTargets[this.index]
    const total = this.linkTargets.length

    this.imageTarget.src = link.getAttribute("href")
    this.imageTarget.alt = link.dataset.lightboxAlt || ""
    // The credit travels with the photograph into the lightbox. A full-screen
    // view that drops the © would break the one commitment this archive makes.
    this.creditTarget.textContent = link.dataset.lightboxCredit || ""
    this.counterTarget.textContent = `${this.index + 1} / ${total}`

    const single = total < 2
    this.previousTarget.hidden = single
    this.nextTarget.hidden = single
  }
}
