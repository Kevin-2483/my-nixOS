import options from "options"

const { sleep, reboot, logout, lock, shutdown, hibernate } = options.powermenu

export type Action = "sleep" | "reboot" | "hibernate" | "logout" | "lock" | "shutdown"

class PowerMenu extends Service {
    static {
        Service.register(this, {}, {
            "title": ["string"],
            "cmd": ["string"],
        })
    }

    #title = ""
    #cmd = ""

    get title() { return this.#title }
    get cmd() { return this.#cmd }

    action(action: Action) {
        [this.#cmd, this.#title] = {
            sleep: [sleep.value, "Sleep"],
            reboot: [reboot.value, "Reboot"],
            hibernate: [hibernate.value, "Hibernate"],
            logout: [logout.value, "Log Out"],
            lock: [lock.value, "Lock"],
            shutdown: [shutdown.value, "Shutdown"], 
        }[action]

        this.notify("cmd")
        this.notify("title")
        this.emit("changed")
        App.closeWindow("powermenu")
        App.openWindow("verification")
    }

    readonly shutdown = () => {
        this.action("shutdown")
    }
}

const powermenu = new PowerMenu
Object.assign(globalThis, { powermenu })
export default powermenu
