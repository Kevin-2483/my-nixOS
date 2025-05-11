-- 📂 路径基准
local base = "~~/shaders/AviSynth"

-- 🔁 当前索引
local index_lineart = 1
local index_photo = 1

-- ✅ 是否启用 Sharp 模式
local use_sharp = false

-- 🔀 获取当前 shader 路径
local function get_shader(type, index)
  local scale = ({ "2x", "3x", "4x" })[index]
  local sharp_suffix = use_sharp and "_Sharp" or ""
  return string.format("%s/%s/%s/AiUpscale_Fast%s_%s.glsl", base, type, scale, sharp_suffix, type)
end

-- 🖼 切换 LineArt（Ctrl+L）
mp.add_key_binding("ctrl+l", "cycle-lineart", function()
  local shader = get_shader("LineArt", index_lineart)
  mp.commandv("change-list", "glsl-shaders", "set", shader)
  mp.osd_message("LineArt: " .. (use_sharp and "Sharp " or "") .. ({ "2x", "3x", "4x" })[index_lineart])
  index_lineart = index_lineart % 3 + 1
end)

-- 📷 切换 Photo（Ctrl+P）
mp.add_key_binding("ctrl+p", "cycle-photo", function()
  local shader = get_shader("Photo", index_photo)
  mp.commandv("change-list", "glsl-shaders", "set", shader)
  mp.osd_message("Photo: " .. (use_sharp and "Sharp " or "") .. ({ "2x", "3x", "4x" })[index_photo])
  index_photo = index_photo % 3 + 1
end)

-- ✨ 切换 Sharp 模式（Ctrl+S）
mp.add_key_binding("ctrl+s", "toggle-sharp", function()
  use_sharp = not use_sharp
  mp.osd_message("Sharp mode: " .. (use_sharp and "ON" or "OFF"))
end)
