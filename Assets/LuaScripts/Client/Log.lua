local function tojson(tbl,checked,indent)
    assert(tbl~=nil)
    if not indent then indent=0 end
    if not checked then checked={} end

    local r="\n"
    local prev=""
    for i=1,indent do
        prev = prev.."\t"
    end

    local str="{"..r
    local prev2 = prev.."\t"

    for i,v in ipairs(checked) do
        if v == tbl then
            return "{"..tostring(tbl).."}"..r
        end
    end
    table.insert(checked,tbl)

    for k, v in pairs(tbl) do
        if type(v) == "table" then
            str = str..prev2..tostring(k)..":"..tojson(v,checked,indent+1)
        else
            str = str..prev2..tostring(k)..":"..tostring(v)..r
        end
    end

    str=str..prev.."}"..r
    return str
end

local function decode_single(arg)
	local s
	if type(arg)=="table" then
		return tojson(arg)
	else
		s=tostring(arg)
	end
	return s
end

local function decode(...)
	local s=""
	local arg={...}
	for i,v in ipairs(arg) do
		if i > 1 then
			s = s..","
		end
		s = s..decode_single(v)
	end
	return s
end

function log(...)
    UnityEngine.Debug.Log(string.format("%s\r\n%s\r\n\r\n",decode(...) , debug.traceback("",2)))
end

function log_warning(...)
    UnityEngine.Debug.LogWarning(string.format("%s\r\n%s\r\n\r\n",decode(...) , debug.traceback("",2)))
end

function log_error(...)
    UnityEngine.Debug.LogError(string.format("%s\r\n%s\r\n\r\n",decode(...) , debug.traceback("",2)))
end