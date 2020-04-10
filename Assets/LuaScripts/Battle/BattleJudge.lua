

BattleJudge = {

}

function BattleJudge.New()
    local obj = {}
    setmetatable( obj, { __index = BattleJudge } )
    obj:Init()
    return obj
end


function BattleJudge.Init(self)
    self.rules_ = {}
    self.players_ = {}
end

function BattleJudge:BattleStart(self)
    
end

function BattleJudge.DoAction(self, _cur_action, _action)

end