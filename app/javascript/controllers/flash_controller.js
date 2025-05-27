import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  connect() {
    this.showFormErrors()
  }

  showFormErrors() {
    const errorList = document.querySelectorAll("#form-errors li")
    if (errorList.length > 0) {
      const messages = Array.from(errorList).map(li => li.textContent)
      const html = `<ul style="text-align: left;">${messages.map(msg => `<li>• ${msg}</li>`).join('')}</ul>`

      Swal.fire({
        title: "❌ Não foi possível salvar",
        html: html,
        icon: "error",
        confirmButtonText: "OK",
        confirmButtonColor: "#ef4444"
      })
    }
  }
}
