--// Abbreviations
local insert = table.insert

--// Vars | Constants
local Modules = {}

--// Code
for _, Module: ModuleScript in script.Parent:GetDescendants() do

    if not Module:IsA("ModuleScript") then continue end

    insert(Modules, require(Module))
end

--// End