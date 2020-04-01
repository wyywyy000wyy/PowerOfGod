
BattlePlayer = {}

function BattlePlayer.New()
    local obj = {}
    setmetatable( obj, { __index = BattlePlayer } )
    obj:Init()
    return obj
end


function BattlePlayer.Init(self)
    self.pos_ = nil
end

function BattlePlayer.SendMsg(self, msg)

end