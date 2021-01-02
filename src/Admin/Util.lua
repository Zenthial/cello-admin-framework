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

function Util:CheckPrefix(str: string, prefix: string)
    local start, stop = string.find(str, prefix)
    if (start and stop) ~= nil and start == 1 then
        return true
    else
        return false
    end
end

return Util