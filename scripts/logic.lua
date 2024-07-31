function CheckBalloons(target)
        local balloons = Tracker:ProviderCountForCode("total_balloons")
        local count = tonumber(target) or Tracker:ProviderCountForCode(target)
        return balloons >= count
end

function CheckDinoBalloons(target)
        local balloons = Tracker:ProviderCountForCode("dino_balloons")
        local count = tonumber(target) or Tracker:ProviderCountForCode(target)
        return balloons >= count
end

function CheckSnowBalloons(target)
        local balloons = Tracker:ProviderCountForCode("snow_balloons")
        local count = tonumber(target) or Tracker:ProviderCountForCode(target)
        return balloons >= count
end

function CheckSherbetBalloons(target)
        local balloons = Tracker:ProviderCountForCode("sherbet_balloons")
        local count = tonumber(target) or Tracker:ProviderCountForCode(target)
        return balloons >= count
end

function CheckForestBalloons(target)
        local balloons = Tracker:ProviderCountForCode("forest_balloons")
        local count = tonumber(target) or Tracker:ProviderCountForCode(target)
        return balloons >= count
end