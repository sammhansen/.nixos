import { Gtk } from "astal/gtk3";
import Mpris from "gi://AstalMpris";
import { bind, Variable } from "astal";
import { MaterialIcon } from "../../custom/MaterialIcon"

const size = 30;

function lengthStr(length: number) {
	const min = Math.floor(length / 60);
	const sec = Math.floor(length % 60);
	const sec0 = sec < 10 ? "0" : "";
	return `${min}:${sec0}${sec}`;
}

function MediaPlayer({ player }: { player: Mpris.Player }) {
	const { START, END, CENTER } = Gtk.Align;

	const title = bind(player, "title").as((t) => t || "Unknown Track");

	const coverArt = bind(player, "coverArt").as(
		(c) => `background-image: url('${c}')`,
	);

	const artist = bind(player, "artist").as((a) => a || "Unknown Artist");

	// player.position will keep changing even when the player is paused.  This is a workaround
	const realPosition = Variable(player.position);
	bind(player, "position").subscribe((position) => {
		if (player.playbackStatus === Mpris.PlaybackStatus.PLAYING) {
			realPosition.set(position);
		}
	});

	const playIcon = bind(player, "playbackStatus").as((s) =>
		s === Mpris.PlaybackStatus.PLAYING ? (
			<MaterialIcon icon="pause" size={size} />
		) : (
			<MaterialIcon icon="play_arrow" size={size} />
		)
	);

	return (
		<box
			className="player-parent-box"
		>
			<box className="player-bg-box" css={coverArt}>
				<box
					className="player-overlay"
					vertical={true}
				>
					<label
						className="player-title"
						truncate={true}
						halign={Gtk.Align.START}
						label={title}
					/>
					<label
						className="player-artist"
						truncate={true}
						halign={Gtk.Align.START}
						label={artist}
					/>
					<box className="seek-parent-box" vertical={false}>
						<label
							className="labelSmall"
							halign={START}
							visible={bind(player, "length").as((l) => l > 0)}
							label={realPosition().as(lengthStr)}
						/>
						<slider
							className="seek-slider"
							hexpand={true}
							visible={bind(player, "length").as((l) => l > 0)}
							onDragged={({ value }) => {
								player.position = value * player.length;
								realPosition.set(player.position);
							}}
							value={realPosition().as((position) => {
								return player.length > 0 ? position / player.length : 0;
							})}
						/>
						<label
							className="player-duration"
							halign={END}
							visible={bind(player, "length").as((l) => l > 0)}
							label={bind(player, "length").as((l) =>
								l > 0 ? lengthStr(l) : "0:00",
							)}
						/>
					</box>
				</box>
				<box
					halign={Gtk.Align.END}
				>
					<box
						className="mediactrl-parent-box"
						vertical={true}
						valign={Gtk.Align.FILL}
					>
						<button
							className="player-control-prev"
							onClicked={() => player.previous()}
							visible={bind(player, "canGoPrevious")}
							valign={Gtk.Align.START}
						>
							<MaterialIcon icon="skip_previous" size={size} />
						</button>
						<button
							className="player-control-pause"
							onClicked={() => player.play_pause()}
							visible={bind(player, "canControl")}
							valign={Gtk.Align.CENTER}
							child={playIcon}
						/>
						<button
							className="player-control-next"
							onClicked={() => player.next()}
							visible={bind(player, "canGoNext")}
							valign={Gtk.Align.END}
						>
							<MaterialIcon icon="skip_next" size={size} />
						</button>

					</box>
				</box>

			</box>

		</box>
	);
}

export default function() {
	const mpris = Mpris.get_default();
	return (
		<box className="media-players-container" vertical={true}>
			{bind(mpris, "players").as((players) => {
				return players.map((player) => <MediaPlayer player={player} />);
			})}
		</box>
	);
}
