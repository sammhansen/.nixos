import { App, Astal } from "astal/gtk3";
import { bind } from "astal";
import { Gtk, Gdk } from "astal/gtk3";
import NotificationHistory from "./modules/notification/NotificationHistory";
import { QuickToggles } from "./modules/QuickToggles"

export const DashBoard = "dashboard-window";

export default function() {

	let window: Gtk.Window;

	return (
		<window
			exclusivity={Astal.Exclusivity.NORMAL}
			anchor={
				Astal.WindowAnchor.BOTTOM
			}
			layer={Astal.Layer.TOP}
			className="dashboard-window"
			name={DashBoard}
			application={App}
			margin={5}
			heightRequest={300}
			keymode={Astal.Keymode.ON_DEMAND}
			visible={false}
			onKeyPressEvent={function(self, event: Gdk.Event) {
				if (event.get_keyval()[1] === Gdk.KEY_Escape) {
					self.hide();
				}
			}}
			setup={(self) => {
				window = self;
			}}
		>
			<box>
				<box
					// vertical={true}
					setup={(self) => {
						setTimeout(() => {
							bind(window, "hasToplevelFocus").subscribe((hasFocus) => {
								if (hasFocus) {
									self.className = "focusedWindow";
								} else {
									self.className = "window";
								}
							});
						}, 1_000);
					}}
				>
					<box>
						<box
							vertical={true}
						>
							<QuickToggles />
						</box>
						<box
							vertical={true}
						>
							<NotificationHistory />
						</box>
					</box>
				</box>
				<box vexpand={true} />
			</box>
		</window>
	);
}
