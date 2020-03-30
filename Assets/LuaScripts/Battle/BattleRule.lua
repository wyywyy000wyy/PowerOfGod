
module("BattleRule",package.seeall)

function New()
    local obj = {}
    setmetatable( obj, { __index = BattleRule } )
    obj:Init()
    return obj
end


function Init(self)

end

function RoundRule(self, ID, player)
    
end