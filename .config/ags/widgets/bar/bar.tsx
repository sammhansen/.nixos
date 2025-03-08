import { App, Astal, Gtk, type Gdk } from "astal/gtk3"
import LauncherButton from "./modules/launcherbutton"
import WorkSpaces from "./modules/workspaces"
// import Media from "./modules/media"
import Time from "./modules/time"
import SysTray from "./modules/systray"
import BatteryLevel from "./modules/battery"
import Media from "./modules/media"
import { Sys } from "./modules/sys";

const AnchorTop = (
	<box vertical spacing={8} hexpand valign={Gtk.Align.START}>
		<LauncherButton />
		<Sys />
	</box>
);

const AnchorCenter = (
	<box vertical spacing={8}>
		<WorkSpaces />
	</box>
);

const AnchorBottom = (
	<box vertical spacing={8} vexpand hexpand={false} valign={Gtk.Align.END}>
		<Time format="%H" />
		<Time format="%M" />
		<SysTray />
		<BatteryLevel />
	</box>
);

export default function Bar(monitor: Gdk.Monitor) {
	const { TOP, BOTTOM, LEFT } = Astal.WindowAnchor

	return <window
		className="Bar"
		gdkmonitor={monitor}
		exclusivity={Astal.Exclusivity.EXCLUSIVE}
		anchor={TOP | BOTTOM | LEFT}
	>
		<box
			className="box_bg"
		// marginTop={5}
		// marginBottom={5}
		// marginLeft={5}
		// heightRequest={60}
		// widthRequest={800}
		>
			<centerbox
				vertical
				cssName="centerbox"
				start_widget={AnchorTop}
				center_widget={AnchorCenter}
				end_widget={AnchorBottom}
			/>
		</box>
	</window>
}
