function HasEnoughBalloons(target)
        local balloons = Tracker:ProviderCountForCode("total_balloons")
        local count = tonumber(target) or Tracker:ProviderCountForCode(target)
        return balloons >= count
end