-- 5.1
-- output: monday, sunday, sunday
sunday = "monday"; monday = "sunday"
 t = {sunday = "monday", [sunday] = monday}
 print(t.sunday, t[sunday], t[t.sunday])

-- 5.2
-- the value would be the table a itself; no they're the same; error

-- 5.3
bell = [[\a]]
escapes = {[bell] = "bell"}
print(
escapes["\\a"]
)

-- 5.4
function poly(coeffs, x)
    count = 0
    for i,v in ipairs(coeffs) do
        count  = count + v*x^(i-1)
    end
    return count
end

-- 5.5
-- no i can't

-- 5.6
function isvalidsequence(table)
    local lastint = 0
    for i,v in pairs(table) do
        if math.type(i) == "integer" then
      if i ~= lastint + 1 then
          return false
      else lastint = i
      end
        end
    end
return true
end
