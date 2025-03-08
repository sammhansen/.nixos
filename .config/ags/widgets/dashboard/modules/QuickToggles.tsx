import { MaterialIcon } from "../../custom/MaterialIcon"
import { execAsync } from "astal/process"
import { Gtk } from "astal/gtk3"
import Notifd from "gi://AstalNotifd"
import { bind } from "astal"

const size = 20;

export function QuickToggles() {

	const notifications = Notifd.get_default()

	return <box>
		<box
			className="quick-toggle-box"
			halign={Gtk.Align.CENTER}
			vertical={true}
			hexpand={true}

		>
			<button
				className="quick-toggle-button"
				onClicked={() => {
				}}
			>
				<MaterialIcon icon="bedtime" size={size} />
			</button>
			<button
				className="quick-toggle-button"
				onClicked={() => {
				}}
			>
				<MaterialIcon icon="local_cafe" size={size} />
			</button>
			<button
				className="quick-button"
				onClicked={() => {
				}}
			>
				<MaterialIcon icon="fit_screen" size={size} />
			</button>
			<button
				className="quick-button"
				onClicked={() => {
				}}
			>
				<MaterialIcon icon="screen_record" size={size} />
			</button>

		</box>
		<box
			className="quick-button-box"
			vertical={true}
			halign={Gtk.Align.CENTER}
			hexpand={true}
		>
			<button
				className="quick-button"
				onClicked={() => {
				}}
			>
				<MaterialIcon icon="colorize" size={size} />
			</button>
			<button
				className="quick-button"
				onClicked={() => {
				}}
			>
				<MaterialIcon icon="local_cafe" size={size} />
			</button>
			<button
				className="quick-button"
				child={bind(notifications, "dontDisturb").as((dnd) => {
					return dnd ? (
						<MaterialIcon icon="notifications_active" size={size} />
					) : (
						<MaterialIcon icon="notifications_off" size={size} />
					)

				})}
				onClicked={() => {
					notifications.set_dont_disturb(!notifications.dontDisturb)
				}} />
			<box hexpand={true} />
			<button
				className="quick-button"
				onClicked={() => {
					notifications.notifications.forEach((notification) => {
						notification.dismiss()
					})
				}}
			>
				<MaterialIcon icon="mop" size={size} />
			</button>

		</box>
	</box >
} 
