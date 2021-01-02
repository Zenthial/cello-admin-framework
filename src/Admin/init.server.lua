--[[
    Author: tomspell
    Date: 1/1/2021
    Notes: This project is opensourced and encourages user collaboration. This should be forked and commands can be easily added by anyone who has programming skill.

    Goals: Create a basic lightweight admin commands with a flexible structure. Emphasis on readability of the code, with commands being easy to add and navigate
]]

-- Services
local Players = game:GetService("Players")

-- Admin Modules
local Core = script.Core
local Data = require(Core.Data)
local Commands = require(Core.Commands)
local Service = require(Core.Service)
local Settings = require(Core.Settings)
local Util = require(Core.Util)

-- Initialize Supporting Modules
coroutine.wrap(function()
    Commands:Initialize()
    Service:Initialize()
    Data:Initialize()
end)()
-- PlayerAdded Listener for the core aspect of the admin
Players.PlayerAdded:Connect(function(player)
    local donor = Instance.new("NumberValue")
    --[[
        donations will be done via gamepasses, can have 1-5/6
        donor value = highest purchased
    ]]
    donor.Value = 0
    donor.Parent = player 
    -- Chatted listener for typed admin commands
    player.Chatted:Connect(function(message)
        local splitString = Util:StringSplitter(message);

        if Service:CheckPrefix(splitString[1], Settings.Prefix) then
            if Service:CheckAdmin(player, Settings.Admins) then
                Commands:ParseCommand(splitString)
            end
        end

    end)
end)