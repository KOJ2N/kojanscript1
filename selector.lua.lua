-- Server Car & Skin Selector UI Script
local windowOpen = false

-- Define a hotkey to toggle the menu (Default: F3 key)
local toggleKey = ac.ControlButton("serverSelector/Toggle", { 
    keyboard = { key = ui.KeyIndex.F3 } 
})

function script.update(dt)
    -- Check if the hotkey is pressed
    if toggleKey:pressed() then
        windowOpen = not windowOpen
    end
end

function script.windowMain(dt)
    -- If window is closed, don't render anything
    if not windowOpen then return end

    -- Draw the popup tool window
    ui.toolWindow("Server Car & Skin Menu", vec2(250, 200), vec2(400, 300), false, true, function()
        ui.text("Welcome to the Server Menu!")
        ui.textColored("Press F3 to close this window.", rgbm.colors.gray)
        ui.separator()

        ui.spacing()
        ui.text("Available Options:")

        -- Example Button 1: Skin / Color Change action
        if ui.button("Apply Skin Variant A", vec2(-1, 0)) then
            ui.toast(ui.ToastType.Success, "Skin changed to Variant A!")
            -- Add your skin switching logic or chat command trigger here:
            -- ac.sendChatMessage("!skin variant_a")
        end

        ui.spacing()

        -- Example Button 2
        if ui.button("Apply Skin Variant B", vec2(-1, 0)) then
            ui.toast(ui.ToastType.Success, "Skin changed to Variant B!")
            -- ac.sendChatMessage("!skin variant_b")
        end

        ui.separator()
        
        -- Close Button at the bottom
        if ui.button("Close Menu", vec2(-1, 0)) then
            windowOpen = false
        end
    end)
end