
BattleAction = {}

function BattleAction.New(ID)
    local obj = {}
    setmetatable( obj, { __index = BattleAction } )
    obj:Init(ID)
    return obj
end


function BattleAction.Init(self,ID)
    self.actor_ = nil
    self.id_ = ID
end


Action_GameStart = {
    
}
