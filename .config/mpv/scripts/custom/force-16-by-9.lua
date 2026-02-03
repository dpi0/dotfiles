local function set_aspect_if_video()
	local tracks = mp.get_property_native("track-list")
	for _, track in ipairs(tracks) do
		if track.type == "video" and track.selected and not track.albumart then
			mp.set_property("video-aspect-override", "16:9")
			-- mp.osd_message("Aspect Ratio set: 16:9")
			break
		end
	end
end

mp.register_event("file-loaded", set_aspect_if_video)
mp.observe_property("track-list", "native", function()
	set_aspect_if_video()
end)
