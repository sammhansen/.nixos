import { bind } from "astal";
import { Gtk } from "astal/gtk3";
import Battery from "gi://AstalBattery";

export default function BatteryLevel() {
	const bat = Battery.get_default();
	const maxHeight = 100; // Max height of batt-container

	return (
		<box
			vertical
			// widthRequest={200}
			className="Battery"
			visible={bind(bat, "isPresent")}
		>
			<box hexpand />
			<box
				className="batt-container"
				hexpand
				halign={Gtk.Align.CENTER}
				heightRequest={maxHeight}
				widthRequest={40}
			>
				<box
					className="batt-bar"
					hexpand={true}
					valign={Gtk.Align.END} // Align to bottom
					heightRequest={bind(bat, "percentage").as(p => Math.floor(p * maxHeight))}
				/>
			</box>
			<box hexpand />

			<label
				className="batt-percentage-text"
				label={bind(bat, "percentage").as(p =>
					`${Math.floor(p * 100)}`
				)}
			/>
		</box>
	);
}

