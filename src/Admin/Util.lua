local Util = {}

function Util:StringSplitter(stringToSplit: string, separator: string)
    if separator == nil then
		separator = "%s"
	end
	local t={}
	for str in string.gmatch(stringToSplit, "([^"..separator.."]+)") do
		table.insert(t, str)
	end
    return t
end

function Util:CheckAdmin(playerObject: Player, adminList: table)
    for _, value in pairs(adminList) do
        if typeof(value) == "string" then
            if playerObject.Name == value then
                return true
            end
        elseif typeof(value) == "number" then
            if playerObject.UserId == value then
                return true
            end
        end
    end

    return false
end

function Util:CheckPrefix(str: string, prefix: string)
    local start, stop = string.find(str, prefix)
    if (start and stop) ~= nil and start == 1 then
        return true
    else
        return false
    end
end

return Util