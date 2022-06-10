-- Exercise 1 and 2
N = 8 -- board size

-- check whether position (n,c) is free from attacks
function isplaceok (a, n, c)
    for i = 1, n - 1 do -- for each queen already placed
        if (a[i] == c) or -- same column?
            (a[i] - i == c - n) or -- same diagonal?
            (a[i] + i == c + n) then -- same diagonal?
            return false -- place can be attacked
        end
    end
    return true -- no attacks; place is OK
end

-- print a board
function printsolution (a)
    for i = 1, N do -- for each row
        for j = 1, N do -- and for each column
            -- write "X" or "-" plus a space
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

-- add to board 'a' all queens from 'n' to 'N'
function addqueen (a, n)
    if n > N then -- all queens have been placed?
        printsolution(a)
        return true
    else -- try to place n-th queen
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c -- place n-th queen at column 'c'
                if addqueen(a, n + 1) then
                    return true
                end
            end
        end
    end
end

-- run the program
-- addqueen({}, 1)


function printvalues(a)
    for i=1, N do 
        print(a[i])
    end
end

function valuenottaken(a,i,n)
for j=1, i-1 do
    if a[j] == n then return false
    end
end
return true
end

count = 0

function addqueen2(a, i)
    if(i > N) then count = count + 1
    else
        for j=1, N do
            if valuenottaken(a, i, j) then
                a[i] = j
                addqueen2(a, i+1)
            end
        end
    end
end

addqueen2({}, 1)
print(count) -- 40320 or 8!
