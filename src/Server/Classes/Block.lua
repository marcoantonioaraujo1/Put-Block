--// Abbreviations
local rad = math.rad

--// Vars | Constants

--// Code
local Block = {}

Block.__index = Block

--// Methods
function Block:PickUp(player: Player)
    local Character = player.Character
    local RightHand = Character.RightHand

    self.Weld = Instance.new("Weld")

    self.Weld.Part0 = self.Part
    self.Weld.Part1 = RightHand

    self.Weld.Parent = self.Part

    self.Holding = true
    self.Part.ProximityPrompt.ActionText = "Drop"

    self.Player = player
end

function Block:Drop()

    self.Weld:Destroy()

    self.Holding = false
    self.Player = nil

    self.Part.ProximityPrompt.ActionText = "Pick Up"
end

function Block:Initialize()
    local ProximityPrompt: ProximityPrompt = self.Part.ProximityPrompt

    ProximityPrompt.Triggered:Connect(function(playerWhoTriggered)

        if not self.Holding then

            self:PickUp(playerWhoTriggered)
        else

            if self.Player ~= playerWhoTriggered then return end

            self:Drop()
        end
    end)
end

function Block:Constructor(block: Part)

    self.Holding = false
    self.Part = block

    self:Initialize()
end

--// Constructor
function Block.new(...)
    local self = setmetatable({}, Block)

    self.Constructor(self, ...)

    return self
end

--// End
return Block