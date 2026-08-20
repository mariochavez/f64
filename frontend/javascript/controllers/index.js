import { application } from "./application"

import MobileMenuController from "./mobile_menu_controller"
application.register("mobile-menu", MobileMenuController)

import LightboxController from "./lightbox_controller"
application.register("lightbox", LightboxController)
