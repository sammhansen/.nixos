import { App } from "astal/gtk3"
import style from "./scss/style.scss"
import Bar from "./widgets/bar/bar"
import NotificationPopups from "./widgets/notifications/NotificationPopups"
import OSD from "./widgets/osd/osd"
import Player from "./widgets/player/Main"
import DashBoard from "./widgets/dashboard/Main"

App.start
	({
		css: style,
		main() {
			App.get_monitors().map(Bar)
			OSD()
			NotificationPopups()
			Player()
			DashBoard()
		},
	})
