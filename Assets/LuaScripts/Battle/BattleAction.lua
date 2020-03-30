
module("BattleAction",package.seeall)

function New()
    local obj = {}
    setmetatable( obj, { __index = BattleAction } )
    obj:Init()
    return obj
end


function Init(self)

end

