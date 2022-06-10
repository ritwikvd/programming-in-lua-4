-- 3.1
-- valid: .0e12, 0x12, 0x!, 0xFFFFFFFF 0x1P10 0.1e1 0x0.1p1

-- 3.2
-- math.maxinteger * 2 = maxinteger + 1 (mininteger) + maxinteger (-1) - 1 = -2
-- math.mininteger * 2 = mininteger - 1 (maxinteger) + mininteger (-1) + 1 = 0
-- math.maxinteger * 2 = maxinteger + (maxinteger + mininteger - 1)*4611686018427387904 = maxinteger + (-2)^4611686018427387904
-- min * min = (min + min)*(math.abs(min)/2), min + min = min + max + 1 = -1 + 1 = 0

-- 3.3
for i = -10, 10 do
    print(i, i%3)
end
-- modulo with negative numbers breaks because the floor division for negatives is -inf


-- 3.4
-- 2^(3^4)

-- 3.5
