local shaders = {
  "~~/shaders/FSRCNNX_x2_8-0-4-1.glsl",
  "~~/shaders/FSRCNNX_x2_16-0-4-1.glsl"
}

local current = 1

function toggle_shader()
  mp.commandv("change-list", "glsl-shaders", "set", shaders[current])
  mp.osd_message("Shader: " .. shaders[current])
  current = current % #shaders + 1
end

mp.register_script_message("toggle-shader", toggle_shader)
