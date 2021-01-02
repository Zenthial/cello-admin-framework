--[[
  Admin Command Handler
  
  All commands should be children of this module
]]

local Commands = {}
Commands.CommandList = {}

function Commands:RegisterCommands()
    self.CommandList = {}
    for _, module in pairs(script:GetDescendants()) do
        if module:IsA("ModuleScript") then
            local commandToLoad = require(module)
            table.insert(self.CommandList, #self.CommandList+1, commandToLoad)
        end
    end
end

function Commands:ParseCommand(stringArray: table)
    local commandName = string.lower(string.sub(stringArray[1], 2)) -- Removing the prefix from the command
end

return Commands