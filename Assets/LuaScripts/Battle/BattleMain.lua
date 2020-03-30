
module("BattleMain",package.seeall)

function New()
    local obj = {}
    setmetatable( obj, { __index = BattleMain } )
    obj:Init()
    return obj
end


function Init(self)
    self.battle_players_ =  {} --

    self.rule_ = nil--BattleRule.New()
    self.cur_player_ = nil--self.rule_:GetFirstPlayer(self.battle_players_)
    self.cur_round_step_ = nil
    self.wait_action_ = nil
end

function BattleStart(self)
end


function Round(self, player)

    local step = BattleDefine.ROUND_STEP_START
    local next_player
    local wait_action
    local actions 
    while step ~= BattleDefine.ROUND_STEP_WAIT_ACTION then
        step,next_player,actions,wait_action = self.rule_:RoundRule(step, player, self.battle_players_)
    end
    self.cur_player_ = next_player
    local msg = GenMsg(MsgDefine.S2C_BATTLE_WAIT_ACTION)
    msg.actions = actions
    msg
end

function GenMsg(ID)
    local msg = {
        id = ID,
    }
    return msg
end

function BroadMsg(self, msg)
    for _, player in pairs(self.battle_players_) do
        self:SendMsg(player, msg)
    end
end

function SendMsg(self, player, msg)
    player:SendMsg(msg)
end

function GenAction(self, player)
end

function update(self)

end