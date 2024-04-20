import { sh } from "lib/utils"

type Profile = "performance" | "balanced" | "power-saver"
type Mode = "Hybrid" | "Integrated"

class PowerProfilesctl extends Service {
    static {
        Service.register(this, {}, {
            "profile": ["string", "r"],
            "mode": ["string", "r"],
        })
    }

    available = !!Utils.exec("which powerprofilesctl")
    #profile: Profile = "balanced"
    #mode: Mode = "Hybrid"

    async nextProfile() {
        const charging = await sh("upower -i /org/freedesktop/UPower/devices/line_power_ADP0 | grep -E 'online'")
        const isCharging = charging.includes("no")
        console.log(charging) // 喵~
        console.log(isCharging) // 喵~
		console.log(`充电状态：${isCharging ? '是' : '否'}`)
        if (!isCharging) {
            // 如果正在充电，则切换到 Performance 或 Balanced
            if (this.#profile === "balanced") {
                await sh("powerprofilesctl set performance")
            } else {
                await sh("powerprofilesctl set balanced")
            }
        } else {
            // 如果未在充电，则切换到 Balanced 或 Quiet
            if (this.#profile === "balanced") {
                await sh("powerprofilesctl set power-saver")
            } else {
                await sh("powerprofilesctl set balanced")
            }
        }

        // 获取当前电源模式并更新 #profile 属性
        const profile = await sh("powerprofilesctl get")
        const p = profile.trim() as Profile
        this.#profile = p

        // 通知其他部分电源模式已更新
        this.changed("profile")
    }

    async setProfile(prof: Profile) {
        await sh(`powerprofilesctl set ${prof}`)
        this.#profile = prof
        this.changed("profile")
    }

    async nextMode() {
        // As powerprofilesctl doesn't support mode switching, this method remains unchanged
    }

    constructor() {
        super()

        if (this.available) {
            sh("powerprofilesctl get").then(p => this.#profile = p.trim() as Profile)
            // As powerprofilesctl doesn't support mode querying, this part is skipped
        }
    }

    get profiles(): Profile[] { return ["performance", "balanced", "power-saver"] }
    get profile() { return this.#profile }
    get mode() { return this.#mode }
}

export default new PowerProfilesctl
