import Swal from "sweetalert2"

document.addEventListener("turbo:load", () => {
  const flashElement = document.querySelector("[data-flash-success]")
  if (flashElement) {
    const message = flashElement.dataset.flashSuccess
    if (message && message.length > 0) {
      Swal.fire({
        title: "🎉 Tudo certo!",
        text: message,
        icon: "success",
        confirmButtonText: "Fechar",
        confirmButtonColor: "#8b5cf6"
      })

      flashElement.remove()
    }
  }
})
