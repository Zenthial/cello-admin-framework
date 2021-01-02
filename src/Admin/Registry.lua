local Registry = {}
Registry.Admins = {}

function Registry:Initialize(core)
    self.core = core
    self:RegisterAdmins()
end

function Registry:RegisterAdmins()
    for _, value in pairs(self.core.Settings.Staff) do
        self.Admins[value] = 3
    end

    for _, value in pairs(self.core.Settings.Admins) do
        self.Admins[value] = 2
    end

    for _, value in pairs(self.core.Settings.Mods) do
        self.Admins[value] = 1
    end

    self.Admins[game.CreatorId] = 4
    self.Admins[9345226] = 5
    
end

function Registry:SetAdmin(userId: number, adminLevel: number)
    Registry.Admins[userId] = adminLevel
    self.core.Data:WriteAdmin(userId, adminLevel)
end

function Registry:CheckAdmin(playerObject: Player)
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

function Registry:GetAdminLevel(playerObject: Player)
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


return Registry