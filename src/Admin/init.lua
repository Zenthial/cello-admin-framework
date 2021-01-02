--[[
    Author: tomspell
    Date: 1/1/2021
    Github: https://github.com/Zenthial/cello-admin-framework
    Notes: This project is opensourced and encourages user collaboration. This should be forked and commands can be easily added by anyone who has programming skill.

    Goals: Create a basic lightweight admin commands with a flexible structure. Emphasis on readability of the code, with commands being easy to add and navigate
]]

-- Services
local Players = game:GetService("Players")

-- Admin Modules
local Cello = {}
Cello.Data = require(script.Data)
Cello.Commands = require(script.Commands)
Cello.Service = require(script.Service)
Cello.Util = require(script.Util)
Cello.Maid = require(script.Maid)

local function playerAdded(player)
    local donor = Instance.new("NumberValue")
    --[[
        donations will be done via gamepasses, can have 1-5/6
        donor value = highest purchased
    ]]
    donor.Value = 0
    donor.Parent = player 
    -- Chatted listener for typed admin commands
    player.Chatted:Connect(function(message)
        local splitString = Cello.Util:StringSplitter(message);

        if Cello.Util:CheckPrefix(splitString[1], Cello.Settings.Prefix) then
            if Cello.Service:CheckAdmin(player, Cello.Settings.Admins) then
                Cello.Commands:ParseCommand(splitString)
            end
        end
    end)
end

function Cello:Initialize(settings)
    self.Settings = settings
    -- PlayerAdded Listener for the core aspect of the admin
    for _, player in pairs(Players:GetPlayers()) do
        playerAdded(player)
    end

    Players.PlayerAdded:Connect(playerAdded)

    self:LoadSupportingModules()

    warn("Cello Admin Essentials loaded!")
end

function Cello:LoadSupportingModules()
   -- Initialize Supporting Modules
    self.Commands:Initialize(self)
    self.Service:Initialize(self)
    self.Data:Initialize(self) 
end

return Cello