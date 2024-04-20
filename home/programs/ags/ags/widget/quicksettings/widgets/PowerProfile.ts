import { ArrowToggleButton, Menu } from "../ToggleButton"
import icons from "lib/icons"

import ppctl from "service/powerprofilesctl"
const ppprof = ppctl.bind("profile")

export const ProfileToggle = () => ArrowToggleButton({
    name: "ppctl-profile",
    icon: ppprof.as(p => icons.ppctl.profile[p]),
    label: ppprof,
    connection: [ppctl, () => ppctl.profile !== "balanced"],
    activate: () => ppctl.nextProfile(),
    deactivate: () => ppctl.setProfile("balanced"),
    activateOnArrow: false,
})

export const ProfileSelector = () => Menu({
    name: "ppctl-profile",
    icon: ppprof.as(p => icons.ppctl.profile[p]),
    title: "Profile Selector",
    content: [
        Widget.Box({
            vertical: true,
            hexpand: true,
            children: [
                Widget.Box({
                    vertical: true,
                    children: ppctl.profiles.map(prof => Widget.Button({
                        on_clicked: () => ppctl.setProfile(prof),
                        child: Widget.Box({
                            children: [
                                Widget.Icon(icons.ppctl.profile[prof]),
                                Widget.Label(prof),
                            ],
                        }),
                    })),
                }),
            ],
        }),
        Widget.Separator(),
        Widget.Button({
            on_clicked: () => Utils.execAsync("legion_gui --use_legion_cli_to_write"),
            child: Widget.Box({
                children: [
                    Widget.Icon(icons.ui.settings),
                    Widget.Label("Legion Tools Kit"),
                ],
            }),
        }),
    ],
})

