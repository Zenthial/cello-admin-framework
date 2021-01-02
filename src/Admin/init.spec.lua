return function()
    local Util = require(script.Parent.Util)
    local AdminService = require(script.Parent.Service)
    local Placeholder1Player = {Name = "tomspell", UserId = 0}
    local Placeholder2Player = {Name = "0", UserId = 9345226}

    describe("Prefix check", function()
        it("should return true with the prefix !", function()
            local testString = "!test"
            expect(Util:CheckPrefix(testString, "!")).to.equal(true)
        end)

        it("should return false without the prefix !", function()
            local testString = "?test"
            expect(Util:CheckPrefix(testString, "!")).to.equal(false)
        end)
    end)

    describe("Admin check", function()
        it("should approve the userid of tomspell", function()
            expect(AdminService:CheckAdmin(Placeholder2Player)).to.equal(true)
        end)

        it("should fail a user not in the admin list", function()
            expect(AdminService:CheckAdmin({Name = "Jeff", UserId = 123213})).to.equal(false)
        end)
    end)

    describe("Basic string parsing tests", function()
        it("should remove the prefix", function()
            local str = "!test"
            expect(string.sub(str, 2)).to.equal("test")
        end)
    end)
end