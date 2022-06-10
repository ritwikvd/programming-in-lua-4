function testiterator(num)
    return function (_s, _v)
        if _v + 1 > _s then return nil end
        return _v + 1
    end, num, 0
end

-- 18.2
function testiteratorwithstep(num, step, initvalue)
    return function (statetable, oldvalue)
        local step = statetable.step
        local maxnum = statetable.max
        if oldvalue + step > maxnum then return nil end
        return oldvalue + step
    end, {max = num, step = step}, initvalue
end

function allwords()
    local all = io.read("a")
    return string.gmatch(all, "%w+")
end

function createll()
    local root = {name = "1", next = {}}
    local node = root
    for i=2,10 do
        node.next.name = tostring(i)
        node.next.next = i < 10 and {} or nil
        node = node.next
    end
    return root
end

function iteratell(root)
for i in function (_, node) return node == nil and root or node.next end , nil, nil do
    print(i.name)
end
end

-- 18.3
function uniquewords(filename)
    local filestream = assert( io.open(filename, "r"))
    local filestring = filestream:read("a")
    local wordtable = {}
    for i in string.gmatch(filestring, "%a+") do
        wordtable[i] = ( wordtable[i] or 0 ) + 1
    end

    local uniques = {}
    for i,v in pairs(wordtable) do
       if v == 1 then table.insert(uniques, i) end
    end

    local indexcount = 1
    return function ()
        indexcount = indexcount + 1
        return uniques[indexcount - 1]
    end
end

-- 18.4
function substrings(str)
    local firstindex = 1
    local secondindex = 1

    function getsub()
        if firstindex == #str and secondindex == #str then return nil end
        local sub = string.sub(str, firstindex, secondindex)
        firstindex = secondindex == #str and firstindex + 1 or firstindex
        secondindex = secondindex == #str and 1 or secondindex + 1

        return sub == "" and getsub() or sub
    end

    return function ()
        return getsub()
    end
end
