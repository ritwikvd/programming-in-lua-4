-- 6.1
function printlist(arr)
    print(table.unpack(arr))
end

-- 6.2
function excludefirst(...)
    print(select(2, ...))
end

-- 6.3
function excludelast(...)
    local list = table.pack(...)
    print(table.unpack(list, 1, list.n - 1))
end

-- 6.4
function getrandomindex(max, list)
    local index = math.random(max)
    if list[index] ~= nil then return getrandomindex(max, list) end
    return index;
end

function shuffle(list)
    local shuffled = {}
    for i=1, #list do
        local index = getrandomindex(#list, shuffled)
        shuffled[index] = list[i]
    end
    print(table.unpack(shuffled))
end

-- 6.5
function combos(arr, newarr)
    if #newarr == #arr then print(table.unpack(newarr))
    else
        for i=1, #arr do
            if not string.find( table.concat(newarr), arr[i]) then
                table.insert(newarr, arr[i])
                combos(arr, newarr)
                table.remove(newarr)
            end
        end
    end
end
