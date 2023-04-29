--// Classes
local ClassesFolder = script.Parent.Parent.Classes
local BlockClass = require(ClassesFolder.Block)

--// Vars | Constants
local Block: Part = workspace.Block
local BlockInstance = BlockClass.new(Block)

--// Code

--// End
return true