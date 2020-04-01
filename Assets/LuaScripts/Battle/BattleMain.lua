

BattleMain = {}

function BattleMain.New()
    local obj = {}
    setmetatable( obj, { __index = BattleMain } )
    obj:Init()
    return obj
end


function BattleMain.Init(self)
    self.battle_players_ =  {} --

    self.rule_ = nil--BattleRule.New()
    self.judge_ = nil
    self.cur_round_step_ = nil
    self.cur_action_ = nil

    log("BattleMain.Init", self)
end

function BattleMain.BattleStart(self)
    local first_action
    self:DoAction(first_action)
end

BattleRound = {
    
}

function BattleMain.DoAction(self, action)
    local next_action
    local reports 

    next_action,reports = self.judge_:DoAction(self.battle_players_, self.cur_action_, action)
    
    if next_action.id_ == BattleDefine.ACTION_ERROR then
        local msg = GenMsg(MsgDefine.S2C_BATTLE_ERROR_ACTION)
        self:SendMsg(action.actor_, msg)
    elseif next_action.id_ == BattleDefine.ACTION_GAME_FINISH then
    else
        local msg = GenMsg(MsgDefine.S2C_BATTLE_WAIT_ACTION)
        self.cur_action_ = next_action
        msg.cur_action = next_action
        msg.reports = reports
        self:BroadMsg(msg)
    end
end

function BattleMain.GenMsg(ID)
    local msg = {
        id = ID,
    }
    return msg
end

function BattleMain.BroadMsg(self, msg)
    for _, player in pairs(self.battle_players_) do
        self:SendMsg(player, msg)
    end
end

function BattleMain.SendMsg(self, player, msg)
    player:SendMsg(msg)
end
