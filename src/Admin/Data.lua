local DataStoreService = game:GetService("DataStoreService")
local AdminStore = DataStoreService:GetDataStore("tomAdmin")

local Data = {}
Data.AdminTable = {}

function Data:Initialize(core)
    self.core = core
    self:InitializeAdminStore()
end

function Data:InitializeAdminStore()
    local adminList = AdminStore:GetAsync("Admins")
    if adminList == nil then
        adminList = {}
        AdminStore:SetAsync("Admins", adminList)
    end

    self.AdminTable = adminList
end

function Data:WriteAdmin(userId: number, adminLevel: number)
    self.AdminTable[userId] = adminLevel
    AdminStore:SetAsync("Admins", self.AdminTable)
end

function Data:RemoveAdmin(userId: number)
    assert(self.AdminTable[userId] ~= nil, "User is not in the admin table")
    self.AdminTable[userId] = 0
    AdminStore:SetAsync("Admins", self.AdminTable)
end

return Data