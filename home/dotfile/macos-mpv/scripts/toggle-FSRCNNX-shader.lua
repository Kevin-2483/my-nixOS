local shaders = {
  "~~/shaders/FSRCNNX_x2_8-0-4-1.glsl",
  "~~/shaders/FSRCNNX_x2_16-0-4-1.glsl"
}

local current = 1

mp.add_key_binding("ctrl+f", "toggle-shader", function()
  mp.commandv("change-list", "glsl-shaders", "set", shaders[current])
  mp.osd_message("Shader: " .. shaders[current])
  current = current % #shaders + 1
end)
