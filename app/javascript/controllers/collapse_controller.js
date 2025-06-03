import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["section", "content"]

  toggle(event) {
    const clickedRow = event.currentTarget
    const nextRow = clickedRow.nextElementSibling

    if (nextRow && nextRow.dataset.collapseTarget === "content") {
      nextRow.classList.toggle("hidden")
    }
  }
}
