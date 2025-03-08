export default function LauncherButton(): JSX.Element {
	return <button
		marginTop={3}
		className="launcher_button"
		onClicked="anyrun"
	>
		<label
			className="launcher_label"
			label=" "
		/>
	</button>
}
