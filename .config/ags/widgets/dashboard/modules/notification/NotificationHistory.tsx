import Notifd from "gi://AstalNotifd"
import { bind } from "astal"
import Notification from "./Notification"
import { Gtk } from "astal/gtk3"
import { MaterialIcon } from "../../../custom/MaterialIcon"

export default function() {
	const notifications = Notifd.get_default()

	return <box
		className="notifhistory-parent-box"
		vertical={true}>
		<scrollable
			className="notification-scrollable"
			vscroll={Gtk.PolicyType.AUTOMATIC}
			hscroll={Gtk.PolicyType.NEVER}
			vexpand
			propagateNaturalHeight={true}
		>
			<box
				vertical={true}
			>
				{bind(notifications, "notifications").as((notificationsList) => {
					if (notificationsList.length === 0) {
						return <box
							className="material-notifs-cleared"
							halign={Gtk.Align.CENTER}
							valign={Gtk.Align.CENTER}
						>
							<MaterialIcon icon="check" size="60" />
						</box>
					} else {
						return notificationsList.map((notification) => {
							return <Notification
								setup={() => { }}
								onHoverLost={() => { }}
								onHover={() => { }}
								notification={notification}
								useHistoryCss={true} />
						})
					}
				})}

			</box>
		</scrollable>
	</box >
}
