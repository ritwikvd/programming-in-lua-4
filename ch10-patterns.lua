-- 10.1
function split(str, delim)
    local paddedstr = delim..str..delim
    local list  = {}
    for w in string.gmatch(paddedstr, delim.."%w+") do
        local nw = string.gsub(w, delim, "")
        table.insert(list, nw)
    end
    print(table.unpack(list))
end

-- 10.2
function transliterate(str, table)
    return string.gsub(str, ".", function (c) 
        local value = table[c]
        return value == nil and "" or value
    end)
end

-- 10.7
function revutf8(str)
    local list = {}
    string.gsub(str, utf8.charpattern, function (x) table.insert(list, x); return x end)
    local str1 = ""
    for _,v in ipairs(list) do
        str1 = v..str1
    end
    return str1
end



