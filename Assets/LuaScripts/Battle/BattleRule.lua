
BattleRule = {
    id_gen = 0
}

function BattleRule.New( _type, _obj)
    local obj = _obj or {}
    setmetatable( obj, { __index = BattleRule } )
    BattleRule.id_gen = BattleRule.id_gen + 1
    obj:Init(BattleRule.id_gen , _type)
    return obj
end


function BattleRule.Init(self, _id, _type)
    self.id = _id
    self.type = _type
    self.desc = "战斗规则描述"
    self.check = function()
        return true
    end
    self.excute = function(...)
    end
end

function BattleRule.RoundRule(self, ID, player)

end

Rule_PlayerCount = BattleRule.New(
    {
        type = BattleDefine.RULE_PLAYER_COUNT,
        desc = "战斗人数",
        count = 2,
        check = function (self, _judge, _players)
            if not _players or #_players ~= self.count then
                return false
            end
            return true
        end,
    }
)

Rule_PlayerFirst = BattleRule.New(
    {
        type = BattleDefine.RULE_PLAYER_FIRST,
        desc = "战斗初始谁先出手",
        excute = function (self, _judge, _players)
            if not _players or #_players ~= self.count then
                return false
            end
            return true
        end,
    }
)

Rule_CardCount = BattleRule.New(
    {
        type = BattleDefine.RULE_CARD_COUNT,
        desc = "手牌数",
        init_count = 3,
        max_count = 10,
    }
)

Rule_CardPick = BattleRule.New(
    {
        type = BattleDefine.RULE_CARD_PICK,
        desc = "摸牌",
        excute = function(self, _judge, _player, _count)

        end,
    }
)