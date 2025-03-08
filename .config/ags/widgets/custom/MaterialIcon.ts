import { Widget } from "astal/gtk3";

export interface MaterialIconProps extends Widget.LabelProps {
	icon: string;
	size?: number; // Only allow pixel values
}

export function MaterialIcon({ icon, size = 16, ...props }: MaterialIconProps): JSX.Element {
	return new Widget.Label({
		className: "icon-material",
		css: `font-size: ${size}px;`, // Set the size dynamically
		label: icon,
		...props,
	});
}

