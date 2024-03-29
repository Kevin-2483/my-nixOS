import { Menu, ArrowToggleButton } from "../ToggleButton"
import icons from "lib/icons.js"
import { dependencies, sh } from "lib/utils"
import options from "options"
const { wifi } = await Service.import("network")

export const NetworkToggle = () => ArrowToggleButton({
    name: "network",
    icon: wifi.bind("icon_name"),
    label: wifi.bind("ssid").as(ssid => ssid || "Not Connected"),
    connection: [wifi, () => wifi.enabled],
    deactivate: () => wifi.enabled = false,
    activate: () => {
        wifi.enabled = true
        wifi.scan()
    },
    onRightClick: () => sh(options.quicksettings.networkSettings.value),
})

export const WifiSelection = () => Menu({
    name: "network",
    icon: wifi.bind("icon_name"),
    title: "Wifi Selection",
    content: [
    Widget.Scrollable({
            hscroll: 'never',
            vscroll: 'automatic',
            css: `
                        min-height: 300px;
                    `,
            child: 
        Widget.Box({
            vertical: true,
            setup: self => self.hook(wifi, () => self.children =
                wifi.access_points.map(ap => Widget.Button({
                    on_clicked: () => {
                        if (dependencies("nmcli"))
                            Utils.execAsync(`nmcli device wifi connect ${ap.bssid}`)
                    },
                    on_secondary_click: () => sh(options.quicksettings.networkSettings.value),
                    child: Widget.Box({
                        children: [
                            Widget.Icon(ap.iconName),
                            Widget.Label(ap.ssid || ""),
                            Widget.Icon({
                                icon: icons.ui.tick,
                                hexpand: true,
                                hpack: "end",
                                setup: self => Utils.idle(() => {
                                    if (!self.is_destroyed)
                                        self.visible = ap.active
                                }),
                            }),
                        ],
                    }),
                })),
            ),
        }),
        }),
        Widget.Separator(),
        Widget.Button({
            on_clicked: () => sh(options.quicksettings.networkSettings.value),
            child: Widget.Box({
                children: [
                    Widget.Icon(icons.ui.settings),
                    Widget.Label("Network"),
                ],
            }),
        }),
    ],
})
