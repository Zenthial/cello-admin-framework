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

    for _, commandInfo in pairs(self.CommandList) do
        local foundCommand = false
        if string.lower(commandInfo.name) == commandName then
            foundCommand = true
        else
            for _, alias in pairs(commandInfo.aliases) do
                if string.lower(alias) == commandName then
                    foundCommand = true
                end
            end
        end

        if foundCommand then
            self:RunCommand(commandInfo, stringArray)
            break;
        end
    end
end

function Commands:RunCommand(commandInfo, stringArray)
    local func = commandInfo.func
    local command = table.remove(stringArray, 1)
    func(unpack(stringArray))
end

return Commands