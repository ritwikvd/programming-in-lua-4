-- 4.1
str = [==[
<![CDATA[
    Hello World
    ]]>
]==]
print(str)

-- 4.2 the \z escape sequence
-- 4.3
function insert(str, index, stringtobeinserted)
    local restofstring = string.sub(str, index)
    local newstr = string.gsub(str, restofstring, stringtobeinserted)
   print(newstr..restofstring)
end

-- 4.4
function insertutf(str, index, stringtobeinserted)
    local restofstring = string.sub(str, utf8.offset(str, index))
    local newstr = restofstring == "" and str..stringtobeinserted or string.gsub(str, restofstring, stringtobeinserted)
   print(newstr..restofstring)
end

-- 4.5
function remove(str, index, length)
    removedstring = string.sub(str, index, index + length - 1)
    return string.gsub(str, removedstring, "")
end

-- 4.6
function removeutf(str, index, length)
    local counter = 0
    local finalstr = ""
    for i, c in utf8.codes(str) do
        counter = counter + 1
       if not ( counter >= index and counter <= index + length - 1 ) then
        finalstr = finalstr..utf8.char(c)
       end
    end
    print(finalstr)
end

-- 4.7
function isstrictpali(str)
    return str == string.reverse(str) and true or false
end

-- 4.8
function islaxpali(str)
    local formattedstr = string.gsub( string.lower(str) , " ", "")
    return formattedstr == string.reverse(formattedstr) and true or false
end

-- 4.9
function ispaliutf(str)
    for i=1,math.ceil(utf8.len(str)/2) do
        if utf8.codepoint(str, utf8.offset(str,i)) ~= utf8.codepoint(str, utf8.offset(str, -i)) then
           return false 
        end
    end
    return true
end
