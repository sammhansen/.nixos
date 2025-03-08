import { App } from "astal/gtk3"
import { bind } from "astal"
import Tray from "gi://AstalTray"
import { MaterialIcon } from "../../custom/MaterialIcon"
import { DashBoard } from "../../dashboard/Main"

export default function SysTray() {
	const tray = Tray.get_default()

	return <box vertical className="SysTray">
		<button
			className="notif-icon-button"
			onClicked={() => {
				App.toggle_window(DashBoard);
			}}
		>
			<MaterialIcon icon="notifications" />
		</button>
		{bind(tray, "items").as(items => items.map(item => (
			<menubutton
				tooltipMarkup={bind(item, "tooltipMarkup")}
				usePopover={false}
				actionGroup={bind(item, "actionGroup").as(ag => ["dbusmenu", ag])}
				menuModel={bind(item, "menuModel")}>
				<icon gicon={bind(item, "gicon")} />
			</menubutton>
		)))}
	</box>
}

