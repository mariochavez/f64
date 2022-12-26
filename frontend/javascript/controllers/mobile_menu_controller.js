import { Controller } from "@hotwired/stimulus"
import { useClickOutside, useTransition } from "stimulus-use"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    this.html = document.querySelector("html")

    useClickOutside(this);
    useTransition(this, { element: this.menuTarget })
  }

  disconnect() {
    this.html.style.overflow = "auto"
  }

  toggle() {
    const open = !this.menuTarget.classList.contains("hidden")
    if (open) {
      this.html.style.overflow = "auto"
      this.menuTarget.classList.add("hidden")
    } else {
      this.html.style.overflow = "hidden"
      this.menuTarget.classList.remove("hidden")
    }
  }
}
