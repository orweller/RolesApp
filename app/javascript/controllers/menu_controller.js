import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["dropdown"]

  connect() {
    this.element.addEventListener("click", this.handleElementClick.bind(this))
    document.addEventListener("click", this.handleDocumentClick.bind(this))
    console.log("menu controller connected")
  }

  disconnect() {
    this.element.removeEventListener("click", this.handleElementClick.bind(this))
    document.removeEventListener("click", this.handleDocumentClick.bind(this))
    console.log("menu controller disconnected")
  }

  handleElementClick(event) {
    event.stopPropagation()
  }

  handleDocumentClick(event) {
    if (!this.element.contains(event.target)) {
      this.closeMenu()
    }
  }

  toggleMenu() {
    this.dropdownTarget.classList.toggle("hidden")
  }

  closeMenu() {
    this.dropdownTarget.classList.add("hidden")
  }
}
