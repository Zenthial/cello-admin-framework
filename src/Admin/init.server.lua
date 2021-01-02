--[[
    Author: tomspell
    Date: 1/1/2021
    Notes: This project is opensourced and encourages user collaboration. This should be forked and commands can be easily added by anyone who has programming skill.
]]

-- Services
local Players = game:GetService("Players")

-- Admin Variables
local Commands = require(script.Commands)
local Settings = require(script.Settings)
local Util = require(script.Util)

coroutine.wrap(function()
    Commands:RegisterCommands()
end)()

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        local splitString = Util:StringSplitter(message);
        if Util:CheckPrefix(splitString[1], Settings.prefix) then
            if Util:CheckAdmin(player, Settings.admins) then
                -- command handling here
                
            end
        end
    end)
end)