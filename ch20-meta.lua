local _mt = {
    -- 20.1
    __sub =
    function (a,b)
        local sub = {}
        for i in pairs(a) do
            if not b[i] then table.insert(sub, i) end
        end
        return sub
    end,

    -- 20.2
    __len =
    function (a)
        local count = 0
        for _ in pairs(a) do count = count + 1 end
        return count
    end
}

local set1 = {[10] = true, [24] = true}
local set2 = {[11] = true, [24] = true}
setmetatable(set1, _mt)
setmetatable(set2, _mt)

print(table.concat( set1 - set2 ))
