
module("BattlePlayer",package.seeall)

function New()
    local obj = {}
    setmetatable( obj, { __index = BattlePlayer } )
    obj:Init()
    return obj
end


function Init(self)

end

function SendMsg(self, msg)
    
end