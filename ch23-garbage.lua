-- -- Regular implementation of default values
-- local function setdefault1(table, default)
--     setmetatable(table, {__index = function () return default end})
-- end
-- -- The problem with this is the creation of a closure and a table with every invocation
--
-- -- Tables with default values using weak keys
-- local defaultstable1 = {}
-- setmetatable(defaultstable1, {__mode = "k"})
-- local _mt = {__index = function (t) return defaultstable1[t] end}
--
-- local function setdefault2(table, default)
--     setmetatable(table, _mt)
--     defaultstable1[table] = default
-- end
--
-- local t = {}
-- setdefault2(t, "default")
--
-- print(t.a)
--
-- t=nil
-- collectgarbage()
-- for i in pairs(defaultstable1) do print(i, "printing") end
--
-- -- Using weak values
-- local defaultstable2 = {}
-- setmetatable(defaultstable2, {__mode = "v"})
--
-- local function setdefault3(table, default)
--     local _mt = defaultstable2[default]
--     if not _mt then
--         _mt = {__index = function () return default end}
--         defaultstable2[default] = _mt
--     end
--     setmetatable(table, _mt)
-- end
--
-- local t = {}
-- setdefault3(t, "default2")
--
-- print(t.a)
--
-- t=nil
-- collectgarbage()
-- for i in pairs(defaultstable2) do print(i, "printing") end

local count = 0

 local mt = {__gc = function () count = count - 1; print("inside"..count) end}
 local a = {}

 for i = 1, 3 do
 count = count + 1
 a[i] = setmetatable({}, mt)
 end

 error("this is an error")
 -- collectgarbage()
 -- print(collectgarbage("count") * 1024, count)
 -- a = nil
 -- collectgarbage()
 -- print(collectgarbage("count") * 1024, count)
 -- collectgarbage()
 -- print(collectgarbage("count") * 1024, count)
