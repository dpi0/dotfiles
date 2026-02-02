-- Show the file size and modified time in the file list "size_and_mtime"
-- https://yazi-rs.github.io/docs/configuration/yazi#mgr.linemode
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end

-- Show user/group of files in status bar
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	})
end, 500, Status.RIGHT)

-- GVFS
-- https://github.com/boydaihungst/gvfs.yazi#installation
require("gvfs"):setup({
	which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",
	blacklist_devices = { { name = "Wireless Device", scheme = "mtp" }, { scheme = "file" }, "Device Name" },
	save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",
	save_path_automounts = os.getenv("HOME") .. "/.config/yazi/gvfs_automounts.private",
	input_position = { "center", y = 0, w = 60 },
	password_vault = "keyring",
	key_grip = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB",
	save_password_autoconfirm = true,
})

-- BUNNY
require("bunny"):setup({
	hops = {
		{ key = "/", path = "/", desc = "Root" },
		{ key = "T", path = "/tmp", desc = "tmp" },
		{ key = "o", path = "/opt", desc = "opt" },
		{ key = "h", path = "~", desc = "Home" },
		{ key = "w", path = "~/Wallpapers", desc = "Wallpapers" },
		{ key = "v", path = "~/Videos", desc = "Videos" },
		{ key = "s", path = "~/Screenshots", desc = "Screenshots" },
		{ key = "p", path = "~/projects", desc = "Projects" },
		{ key = "P", path = "~/Pictures", desc = "Pictures" },
		{ key = "n", path = "~/notes", desc = "Notes" },
		{ key = "d", path = "~/Downloads", desc = "Downloads" },
		{ key = "b", path = "~/Backup", desc = "Backup" },
		{ key = "m", path = "~/Music", desc = "Music" },
		{ key = "D", path = "~/.dotfiles", desc = "Dotfiles" },
		{ key = "c", path = "~/.config", desc = "Config files" },
		{ key = "t", path = "~/temp", desc = "Temp (home)" },
		{ key = "S", path = "~/.sh", desc = "Shell scripts" },
		{ key = { "l", "s" }, path = "~/.local/share", desc = "Local share" },
		{ key = { "l", "b" }, path = "~/.local/bin", desc = "Local bin" },
		{ key = { "l", "t" }, path = "~/.local/state", desc = "Local state" },
		{ key = { "0", "l" }, path = "/hdd/Library", desc = "0x3110 HDD Library" },
		{ key = { "0", "d" }, path = "/hdd/Downloads", desc = "0x3110 HDD Downloads" },
		{ key = { "0", "h" }, path = "/home", desc = "0x3110 /home" },
		{ key = { "0", "o" }, path = "/opt", desc = "0x3110 /opt" },
		{ key = { "0", "D" }, path = "/data", desc = "0x3110 /data" },
	},
	desc_strategy = "path", -- If desc isn't present, use "path" or "filename", default is "path"
	ephemeral = true, -- Enable ephemeral hops, default is true
	tabs = true, -- Enable tab hops, default is true
	notify = false, -- Notify after hopping, default is false
	fuzzy_cmd = "fzf", -- Fuzzy searching command, default is "fzf"
})
