-- F1: Open Terminal
hs.hotkey.bind({}, "F1", function()
    local app = hs.application.get("Terminal")
    if app then
        app:activate()
    else
        hs.application.launchOrFocus("Terminal")
    end
end)

-- F2: Open Cursor
hs.hotkey.bind({}, "F2", function()
    local app = hs.application.get("Cursor")
    if app then
        app:activate()
    else
        hs.application.launchOrFocus("Cursor")
    end
end)

-- F3: Open Chrome
hs.hotkey.bind({}, "F3", function()
    local app = hs.application.get("Chrome")
    if app then
        app:activate()
    else
        hs.application.launchOrFocus("Chrome")
    end
end)

-- F4: Open DataGrip
hs.hotkey.bind({}, "F4", function()
    local app = hs.application.get("DataGrip")
    if app then
        app:activate()
    else
        hs.application.launchOrFocus("DataGrip")
    end
end)


-- F5: Open ChatGPT
hs.hotkey.bind({}, "F5", function()
    local app = hs.application.get("ChatGPT")
    if app then
        app:activate()
    else
        hs.application.launchOrFocus("ChatGPT")
    end
end)

-- F8: Open Discord
hs.hotkey.bind({}, "F8", function()
    local app = hs.application.get("Discord")
    if app then
        app:activate()
    else
        hs.application.launchOrFocus("Discord")
    end
end)


-- F9: Open Notion
hs.hotkey.bind({}, "F9", function()
    local app = hs.application.get("Notion")
    if app then
        app:activate()
    else
        hs.application.launchOrFocus("Notion")
    end
end)

-- F10: Media Play/Pause
hs.hotkey.bind({}, "F10", function()
    local event = hs.eventtap.event.newSystemKeyEvent("PLAY", true)
    event:post()
    hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
end)

-- F11: Volume Down
hs.hotkey.bind({}, "F11", function()
    hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", true):post()
    hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", false):post()
end)

-- F12: Volume Up
hs.hotkey.bind({}, "F12", function()
    hs.eventtap.event.newSystemKeyEvent("SOUND_UP", true):post()
    hs.eventtap.event.newSystemKeyEvent("SOUND_UP", false):post()
end)