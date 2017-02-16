function Get-TimeUntilRogueOne
{
$now = Get-Date
$time = get-date "Thursday, December 15, 2016 7:40:00 PM"
$aftertime = get-date "Thursday, December 15, 2016 8:40:00 PM"
$result = $time - $now
$result2 = $aftertime - $now
    if ($result.Days -le 1)
    {
    write-host ("There is only {0} day, {1} hours, {2} minutes and {3} seconds, until Star Wars Rogue One"`
     -f $result.days,$result.Hours,$result.Minutes,$result.Seconds) `
     -ForegroundColor Yellow -BackgroundColor Black
    write-host ("There is {0} day, {1} hours, {2} minutes and {3} seconds, until an Imperial Star Destroyer appears on screen"`
     -f $result2.days,$result2.Hours,$result2.Minutes,$result2.Seconds) `
     -ForegroundColor Yellow -BackgroundColor Black
    }
    else
    {
    write-host ("There are only {0} days, {1} hours, {2} minutes and {3} seconds, until Star Wars Rogue One"`
     -f $result.days,$result.Hours,$result.Minutes,$result.Seconds)`
     -ForegroundColor Yellow -BackgroundColor Black
    write-host ("There are {0} days, {1} hours, {2} minutes and {3} seconds, until an Imperial Star Destroyer appears on screen"`
     -f $result2.days,$result2.Hours,$result2.Minutes,$result2.Seconds) `
     -ForegroundColor Yellow -BackgroundColor Black
    }
}

function Get-TimeUntil8
{
$now = Get-Date
$time = get-date "Thursday, December 14, 2017 8:00:00 PM"
$aftertime = get-date "Thursday, December 14, 2017 8:00:00 PM"
$result = $time - $now
$result2 = $aftertime - $now
    if ($result.Days -le 1)
    {
    write-host ("There is only {0} day, {1} hours, {2} minutes and {3} seconds, until Star Wars Episode VIII: The Last Jedi"`
     -f $result.days,$result.Hours,$result.Minutes,$result.Seconds) `
     -ForegroundColor Yellow -BackgroundColor Black
    write-host ("There is {0} day, {1} hours, {2} minutes and {3} seconds, until an Imperial Star Destroyer appears on screen"`
     -f $result2.days,$result2.Hours,$result2.Minutes,$result2.Seconds) `
     -ForegroundColor Yellow -BackgroundColor Black
    }
    else
    {
    write-host ("There are only {0} days, {1} hours, {2} minutes and {3} seconds, until Star Wars Episode VIII: The Last Jedi"`
     -f $result.days,$result.Hours,$result.Minutes,$result.Seconds)`
     -ForegroundColor Yellow -BackgroundColor Black
    write-host ("There are {0} days, {1} hours, {2} minutes and {3} seconds, until an Imperial Star Destroyer appears on screen"`
     -f $result2.days,$result2.Hours,$result2.Minutes,$result2.Seconds) `
     -ForegroundColor Yellow -BackgroundColor Black
    }
}

Get-TimeUntil8
