-- 12.1
function addmonth(time)
    local datetable = os.date("*t", time)
    datetable.month = datetable.month + 1;
    return os.date("%c", os.time(datetable))
end

-- 12.3
function secondspassed(time)
    local datetable = os.date("*t", time)
    return datetable.hour * 3600 + datetable.min * 60 + datetable.sec
end
function secondspassed1(time)
    local datetable = os.date("*t", time)
    datetable.hour = 0; datetable.min = 0; datetable.sec = 0
    return os.difftime(time, os.time(datetable))
end

-- 12.4
function getfirstfri(year)
    local datetable = os.date("*t", os.time({year=year, month=1, day=1}))
    local  firstdayofweek = tonumber( os.date("%w", os.time(datetable)))
    local firstfri = firstdayofweek <= 5 and ( 5-firstdayofweek ) or 6
    datetable.day = datetable.day + firstfri
    return os.date("%j", os.time(datetable))
end

-- 12.5
function diffindays(time1, time2)
    return os.difftime(time1, time2) // (60 * 60 * 24)
end
