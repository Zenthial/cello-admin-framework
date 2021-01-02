return function()
    local Util = require(script.Parent.Util)
    local Service = require(script.Parent.Service)
    local PlaceholderPlayer = {Name = "0", UserId = 9345226}

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
            expect(Service:CheckAdmin(PlaceholderPlayer)).to.equal(true)
        end)

        it("should fail a user not in the admin list", function()
            expect(Service:CheckAdmin({Name = "Jeff", UserId = 123213})).to.equal(false)
        end)
    end)

    describe("Basic string parsing tests", function()
        it("should remove the prefix", function()
            local str = "!test"
            expect(string.sub(str, 2)).to.equal("test")
        end)
    end)
end