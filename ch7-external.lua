-- 7.1
function sort(inputfile, outputfile)
    if inputfile then io.input(inputfile) end
    if outputfile then io.output(outputfile) end
    local lineslist = {}

    io.output():setvbuf("no")

    for line in io.lines() do
        table.insert(lineslist, line)
    end

    table.sort(lineslist)

    for _,v in ipairs(lineslist) do
        io.write(v, "\n")
    end

end

-- 7.2
function confirmandsort(...)
    local outputfile = select(2, ...)

    if not outputfile then
        sort(...)
        return
    end

    if select(3, os.execute("test -e "..outputfile)) == 0 then
        io.stdout:write("The output file exists; are you sure you want to overwrite? (y|!y)")
        if io.stdin:read() ~= "y" then return else sort(...) end
    end
end

-- 7.3
function copy()
    for line in io.lines()  do
        io.write(line)
    end
end

-- 7.4
function getlastline(file)
    local lastline
    for line in io.open(file, "r"):lines() do
        lastline = line
    end
    return lastline
end

function getlastline1(file)
    local fileasstring  = io.open(file, "r"):read("a")
    local reversed = string.reverse(fileasstring)
    local indexofnewline = string.find(reversed, "\n")
    return string.sub(reversed, 1, indexofnewline - 1)
end

function getlastline2(file)
    os.execute("tail -1 "..file)
end

-- 7.5
function getlastnlines(file, n)
    os.execute("tail -"..n.." "..file)
end
