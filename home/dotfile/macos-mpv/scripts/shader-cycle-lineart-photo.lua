function cycle_lineart()
  local shader = get_shader("LineArt", index_lineart)
  mp.commandv("change-list", "glsl-shaders", "set", shader)
  mp.osd_message("LineArt: " .. (use_sharp and "Sharp " or "") .. ({ "2x", "3x", "4x" })[index_lineart])
  index_lineart = index_lineart % 3 + 1
end

function cycle_photo()
  local shader = get_shader("Photo", index_photo)
  mp.commandv("change-list", "glsl-shaders", "set", shader)
  mp.osd_message("Photo: " .. (use_sharp and "Sharp " or "") .. ({ "2x", "3x", "4x" })[index_photo])
  index_photo = index_photo % 3 + 1
end

function toggle_sharp()
  use_sharp = not use_sharp
  mp.osd_message("Sharp mode: " .. (use_sharp and "ON" or "OFF"))
end

-- 绑定注册
mp.register_script_message("cycle-lineart", cycle_lineart)
mp.register_script_message("cycle-photo", cycle_photo)
mp.register_script_message("toggle-sharp", toggle_sharp)
