-- local co = coroutine.create(function(a)
--     print(a)
--     print(coroutine.yield(1))
--     return "done"
-- end)
-- print(coroutine.resume(co, "first resume"))
-- print(coroutine.resume(co, "second resume"))
-- print(coroutine.status(co))

local stream = assert( io.open("ch24-coroutines.lua"))
local producer = coroutine.create(function()
    while true do
        local block = stream:read()
        if not block then return nil end
        coroutine.yield(block)
    end end)

local consumer = function ()
    while true do
        local ok, block = coroutine.resume(producer)
        if not ok or not block then return nil end
        io.write(block, "\n")
    end
end

consumer()
