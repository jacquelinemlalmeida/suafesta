import { Application } from "@hotwired/stimulus"
import GuestsController from "./guests_controller"
import FlashController from "./flash_controller"


const application = Application.start()
application.register("guests", GuestsController)
application.register("flash", FlashController)
