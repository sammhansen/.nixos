import { App, Astal } from "astal/gtk3";
import { bind } from "astal";
import { Gtk, Gdk } from "astal/gtk3";
import MediaPlayers from "./modules/Media";
import { MaterialIcon } from "../custom/MaterialIcon"

export const Player = "player-window";

export default function() {

	let window: Gtk.Window;

	return (
		<window
			exclusivity={Astal.Exclusivity.NORMAL}
			anchor={
				Astal.WindowAnchor.TOP
			}
			layer={Astal.Layer.TOP}
			className="player-window"
			name={Player}
			application={App}
			margin={5}
			widthRequest={434}
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
					<box vertical={true}>
						<MediaPlayers />
					</box>
				</box>
				<box vexpand={true} />
			</box>
		</window>
	);
}
