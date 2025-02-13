# 本人的 macOS Nix-Darwin 配置

## 截图

### 系统信息

![ SystemInfo ] (./screenshot/systeminfo.png)

### Kitty 终端

![kitty](./screenshot/kitty.png)

### tmux & btop & NeoVim

![tmux&btop&NeoVim](./screenshot/tmux_btop_neovim.png)

### yabai

![windows](./screenshot/windows.png)

## 一切皆 Nix

系统的一切，从系统设置到程序安装，从环境变量到用户配置等，均由 Nix 管理。

> [!NOTE]
> homebrew 和 cask 也在 nix-darwin 的管理之下,taps由flakes inputs输入,但是不会储存在Nix-store,这代表着配置和应用本身不能随时回滚。

> [!NOTE]
> 从 App Store 安装的程序由 mas 管理，但 mas 需要你的apple 账号拥有所选的软件。

> [!IMPORTANT]
> 在部分软件中，那些我经常更新或具有时效性的配置由 WebDAV 管理。例如，我用 WebDAV 管理订阅、同步 Obsidian 笔记，但这些软件本身及其配置仍由 Nix 管理。

> [!IMPORTANT]
> 闭源软件一般通过 brew cask 下载，而不是通过 Nixpkgs 下载，以确保软件为最新版本。

通过 flakes 特性保证配置的统一性、可读性以及易扩展性。

## 终端

- [kitty](https://sw.kovidgoyal.net/kitty/)
- [ghostty](https://github.com/ghostty-org/ghostty)
- [tmux](https://github.com/ghostty-org/ghostty)

## Shell

登录 Shell 为 zsh，与系统交互使用 nushell。配置中为 bash、zsh、nushell 添加了完整的系统环境变量，包括 nix、brew 等。zsh 和 nushell 使用 [starship](https://starship.rs/) 主题。

> [!TIP]
> 初次构建后，使用 `install_plugins` 命令安装插件。

## Yazi

加入了一些常用插件。

> [!TIP]
> 使用 `darwin-rebuild switch` 切换到新配置后，需要使用 `sudo ya pack -i` 命令来安装 Yazi 插件。

## 主题

[catppuccin](https://catppuccin.com/) 的 Mocha 主题。

## 窗口管理

使用 [yabai](https://github.com/koekeishiya/yabai/tree/master) 配合 [skhd](https://github.com/koekeishiya/skhd) 进行窗口管理。

> [!WARNING]
> 我关闭了系统完整性保护。

> [!TIP]
> 使用 `darwin-rebuild switch` 切换到新配置后，需要使用 `yabai-reload` 命令恢复通过 CLI 控制 yabai 服务的功能。

## 输入法与语言

本配置使用 [中州韵](https://rime.im/) 输入引擎，[鼠须管](https://github.com/rime/squirrel) 输入法搭配 [雾凇拼音](https://github.com/iDvel/rime-ice) 和 [微软双拼](https://github.com/rime/rime-double-pinyin) 作为中文输入法。

![Rime](./screenshot/rime.png)

> [!IMPORTANT]
> 我的系统使用繁体中文作为系统语言，部分配置可能与简体中文不同，例如 yabai 规则。

## skhd 快捷键

| 快捷键                                                           | 功能                              |
| ---------------------------------------------------------------- | --------------------------------- |
| `<kbd>Ctrl</kbd>` + `<kbd>Command</kbd>` - h j k l           | 聚焦指定方向的窗口                |
| `<kbd>Ctrl</kbd>` + `<kbd>Alt</kbd>` - h j k l               | 与指定方向的窗口交换位置          |
| `<kbd>Alt</kbd>` - `<kbd>Up</kbd>`                           | 聚焦到上一显示器                  |
| `<kbd>Alt</kbd>` - `<kbd>Down</kbd>`                         | 聚焦到下一显示器                  |
| `<kbd>Alt</kbd>` - `<kbd>Left</kbd>`                         | 聚焦到上一个 Space                |
| `<kbd>Alt</kbd>` - `<kbd>Right</kbd>`                        | 聚焦到下一个 Space                |
| `<kbd>Alt</kbd>` - 数字键                                      | 聚焦到指定编号的 Space            |
| `<kbd>Alt</kbd>` - `<kbd>+</kbd>`                            | 新增 Space                        |
| `<kbd>Alt</kbd>` - `<kbd>-</kbd>`                            | 删除 Space                        |
| `<kbd>Alt</kbd>` - `<kbd>[</kbd>`                            | 当前 Space 与上一个 Space 交换    |
| `<kbd>Alt</kbd>` - `<kbd>]</kbd>`                            | 当前 Space 与下一个 Space 交换    |
| `<kbd>Alt</kbd>` - `<kbd>```</kbd>`                          | 返回上一个 Space                  |
| `<kbd>Alt</kbd>` + `<kbd>Command</kbd>` - b                  | 平衡 Space 中窗口分割             |
| `<kbd>Alt</kbd>` + `<kbd>Shift</kbd>` - r                    | 旋转 Space                        |
| `<kbd>Alt</kbd>` + `<kbd>Command</kbd>` - r                  | 切换当前 parent 分割方向          |
| `<kbd>Alt</kbd>` + `<kbd>Shift</kbd>` - `<kbd>Left</kbd>`  | 移动聚焦窗口到上一个 Space        |
| `<kbd>Alt</kbd>` + `<kbd>Shift</kbd>` - `<kbd>Right</kbd>` | 移动聚焦窗口到下一个 Space        |
| `<kbd>Alt</kbd>` + `<kbd>Shift</kbd>` - 数字键               | 移动聚焦窗口到指定编号的 Space    |
| `<kbd>Alt</kbd>` + `<kbd>Command</kbd>` - z                  | 调整聚焦窗口大小以占据整个 parent |
| `<kbd>Alt</kbd>` + `<kbd>Shift</kbd>` - z                    | 切换聚焦窗口到全屏模式            |
| `<kbd>Alt</kbd>` + `<kbd>Command</kbd>` - m                  | 切换聚焦窗口到浮动模式            |
| `<kbd>Ctrl</kbd>` - 方向键                                     | 向指定方向拉伸聚焦窗口以放大      |
| `<kbd>Ctrl</kbd>` + `<kbd>Shift</kbd>` - 方向键              | 向指定方向挤压聚焦窗口以缩小      |
| `<kbd>Command</kbd>` + `<kbd>Shift</kbd>` - 方向键           | 向指定方向移动聚焦窗口            |
| `<kbd>Alt</kbd>` - a                                           | 打开 Arc Browser 应用             |
| `<kbd>Alt</kbd>` - s                                           | 打开 Spotify 应用                 |
| `<kbd>Alt</kbd>` - t                                           | 执行指令 終端機(ghostty)          |
| `<kbd>Alt</kbd>` - c                                           | 执行指令 code                     |
| `<kbd>Alt</kbd>` - f                                           | 打开 Finder 应用                  |
| `<kbd>Alt</kbd>` - w                                           | 打开 WeChat 应用                  |
| `<kbd>Alt</kbd>` - l                                           | 执行指令 LocalSend                |
| `<kbd>Alt</kbd>` - o                                           | 打开 Obsidian 应用                |
| `<kbd>Alt</kbd>` - `<kbd>return</kbd>`                       | 打开 WezTerm 应用                 |
| `<kbd>Alt</kbd>` - x                                           | 打开 yazi                         |
| `<kbd>Alt</kbd>` - j                                           | 打开 計算機 应用                  |
| `<kbd>Alt</kbd>` - z                                           | 执行指令 Zed                      |

## 不要在不了解的情况下直接套用我的配置

虽然理论上只需改一些变量名就可以在任何 Darwin 电脑上运行，但这可能并不适合你。

## 未来可能增加的功能

~~使用 [matugen](https://github.com/InioX/matugen) 等工具自动生成系统配色~~

基本完成，使用 wallust 根据壁纸和系统颜色生成主题，但效果有待优化。
