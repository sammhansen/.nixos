import { Gtk, App } from "astal/gtk3";
import { bind } from "astal";
import Mpris from "gi://AstalMpris";
import { WINDOW_NAME as MEDIA_PLAYER } from "../../player/player";

export default function Media() {
  const mpris = Mpris.get_default();

  return (
    <eventbox
      className="Media"
      onClick={() => {
        App.toggle_window(MEDIA_PLAYER);
      }}
    >
      {bind(mpris, "players").as((ps) =>
        ps[0] ? (
          <box className="mpris_onbar">
            <label
              label={bind(ps[0], "title").as(() => {
                const title = ps[0]?.title || "Unknown Track";
                return title;
              })}
            />
            <button className="Cover" valign={Gtk.Align.CENTER} label="♪" />
          </box>
        ) : (
          ""
        )
      )}
    </eventbox>
  );
}

