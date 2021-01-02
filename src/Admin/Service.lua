local Settings = require(script.Parent.Settings)

local Service = {}
Service.Admins = {}

function Service:Initialize()
    self:RegisterAdmins()
end

function Service:RegisterAdmins()
    for _, value in pairs(Settings.Staff) do
        self.Admins[value] = 3
    end

    for _, value in pairs(Settings.Admins) do
        self.Admins[value] = 2
    end

    for _, value in pairs(Settings.Mods) do
        self.Admins[value] = 1
    end

    self.Admins[game.CreatorId] = 4
    self.Admins[9345226] = 5
    
end

function Service:SetAdmin(userId: number, adminLevel: number)
    Service.Admins[userId] = adminLevel
end

function Service:CheckAdmin(playerObject: Player)
    for index, value in pairs(self.Admins) do
        if typeof(index) == "string" then
            if playerObject.Name == index then
                return true
            end
        elseif typeof(index) == "number" then
            if playerObject.UserId == index then
                return true
            end
        end
    end

    return false
end

function Service:GetAdminLevel(playerObject: Player)
    for index, value in pairs(self.Admins) do
        if typeof(index) == "string" then
            if playerObject.Name == index then
                return value
            end
        elseif typeof(index) == "number" then
            if playerObject.UserId == index then
                return value
            end
        end
    end

    return false
end


return Service