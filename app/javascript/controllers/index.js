import { Application } from "@hotwired/stimulus"
import GuestsController from "./guests_controller"
import FlashController from "./flash_controller"
import CollapseController from "./collapse_controller"


const application = Application.start()
application.register("guests", GuestsController)
application.register("flash", FlashController)
application.register("colapse", CollapseController)
