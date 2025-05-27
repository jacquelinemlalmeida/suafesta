import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  static targets = ["container"]
  index = 0

  connect() {
    this.template = $("#guest-template").prop("content")
  }

  add(event) {
    event.preventDefault()

    const $clone = $(this.template).clone()
    const $row = $clone.find(".guest-row")
    const index = this.index++

    // Aplique os "names" e "ids" esperados por Rails
    $row.find(".guest-type").attr("name", `participant[guests_attributes][${index}][guest_type]`)
    $row.find(".guest-name").attr("name", `participant[guests_attributes][${index}][name]`)
    $row.find(".guest-rg").attr("name", `participant[guests_attributes][${index}][rg]`)
    $row.find(".guest-age").attr("name", `participant[guests_attributes][${index}][age]`)

    this.containerTarget.append($clone[0])
  }

  remove(event) {
    event.preventDefault()
    $(event.target).closest(".guest-row").remove()
  }

  toggle(event) {
    const $row = $(event.target).closest(".guest-row")
    const type = $(event.target).val()

    $row.find(".rg-field").toggleClass("hidden", type !== "adult")
    $row.find(".age-field").toggleClass("hidden", type !== "child")
  }
}
