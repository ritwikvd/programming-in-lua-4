-- Exercise 1
-- Regular recursive
function fact(n)
    if n <= 0 then
        return 1
    else
        return n * fact(n-1)
    end
end

-- print(fact(io.read("*n")))

-- With tail call optimisation
function facttailopt(n, m)
    if n <= 0 then
        return m
    else
        return facttailopt(n-1, n*m)
    end
end

-- With iterative
-- redo fact with loop
function factiter(n)
    local fact = 1
    local nn = n

    while true do
        if nn == 1 then return fact end

        fact = fact * nn
        nn = nn - 1
    end
end

function factiter2(n)
    local fact = 1
    for i=1,n do
       fact = fact*i 
    end
    return fact
end

-- Exercise 2
function norm(x, y)
    return math.sqrt(x^2 + y^2)
end

function twice(x)
    return 2.0 * x
end

-- Prefere dofile because changes can be run again

-- Exercise 3
-- No

-- Exercise 4
-- ___, End, NULL

-- Exercise 5
-- value is false because type returns a string so it'll return "nil"

-- Exercise 6
-- Compare the value with false and true using ==

-- Exercise 7
-- No and yes

-- Exercise 8
-- print(arg[0])
