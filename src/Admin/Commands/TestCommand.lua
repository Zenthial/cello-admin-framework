return {
    -- Default name of the command
    name = "testcommand",
    -- Any other names you want the command to be
    aliases = {"tester", "test"},
    -- The function that is run when the command is called
    -- Argument type checking should be done within the command function
    func = function()
        print("command working")
    end,
    --[[
        0: Everyone
        1: Mods
        2: Admins
        3: Staff
        4: Game owner
    ]]
    permissionLevel = 0
}