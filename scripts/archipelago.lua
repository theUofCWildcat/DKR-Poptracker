ScriptHost:LoadScript("scripts/item_mapping.lua")
ScriptHost:LoadScript("scripts/location_mapping.lua")

CurrentIndex = -1

function Reset(slotData)
    CurrentIndex = -1

    --Manually Tracked Items
    Tracker:FindObjectForCode("dino_trophy").Active = false
    Tracker:FindObjectForCode("snow_trophy").Active = false
    Tracker:FindObjectForCode("sherbet_trophy").Active = false
    Tracker:FindObjectForCode("forest_trophy").Active = false
    Tracker:FindObjectForCode("goal").CurrentStage = 0
    Tracker:FindObjectForCode("total_balloons").AcquiredCount = 0
    
    --Auto-tracked Items
    for _, value in pairs(ITEM_MAPPING) do
        local itemCode = value[1]
        local itemType = value[2]
        if itemCode then
            local item = Tracker:FindObjectForCode(itemCode)
            if item then
                if itemType == "toggle" then
                    item.Active = false
                elseif itemType == "consumable" then
                    item.AcquiredCount = 0
                elseif itemType == "progressive" then
                    item.CurrentStage = 0
                end
            end
        end
    end

    --Locations
    for _, value in pairs(LOCATION_MAPPING) do
        local area = value[1]
        local section = value[2]
        local address = "@" .. area .. "/" .. section
        local location = Tracker:FindObjectForCode(address)
        if location then
            location.AvailableChestCount = location.ChestCount
        end
    end

    --Settings
    if slotData == nil then
        return
    end
    if slotData["victory_condition"] then
        local setting = Tracker:FindObjectForCode("goal")
        setting.CurrentStage = slotData["victory_condition"]
    end
    if slotData["skip_trophy_races"] == "true" then
        local setting = Tracker:FindObjectForCode("skip_trophies")
        setting.CurrentStage = 1
    else
        local setting2 = Tracker:FindObjectForCode("skip_trophies")
        setting2.CurrentStage = 0
    end
    if slotData["shuffle_wizpig_amulet"] == "true" then
        local setting = Tracker:FindObjectForCode("wizpig_amulet_randomized")
        setting.CurrentStage = 1
    else
        local setting2 = Tracker:FindObjectForCode("wizpig_amulet_randomized")
        setting2.CurrentStage = 0
    end
    if slotData["shuffle_tt_amulet"] == "true" then
        local setting = Tracker:FindObjectForCode("tt_amulet_randomized")
        setting.CurrentStage = 1
    else
        local setting2 = Tracker:FindObjectForCode("tt_amulet_randomized")
        setting2.CurrentStage = 0
    end
end

function ItemReceived(index, id, name, player)
    if index <= CurrentIndex then
        return
    else
        CurrentIndex = index
    end

    local mapping = ITEM_MAPPING[id]
    local itemCode = mapping[1]
    local itemType = mapping[2]
    local item = Tracker:FindObjectForCode(itemCode)
    local tot_balloons = Tracker:FindObjectForCode("total_balloons")
    if item then
        if itemType == "toggle" then
            item.Active = true
        elseif itemType == "consumable" then
            item.AcquiredCount = item.AcquiredCount + item.Increment
            tot_balloons.AcquiredCount = tot_balloons.AcquiredCount + tot_balloons.Increment
        elseif itemType == "progressive" then
            item.CurrentStage = item.CurrentStage + 1
        end
    end
end

function LocationChecked(id, name)
    local mapping = LOCATION_MAPPING[id]
    if not mapping then
        return
    end

    local area = mapping[1]
    local section = mapping[2]
    local address = "@" .. area .. "/" .. section
    local location = Tracker:FindObjectForCode(address)
    if location then
        location.AvailableChestCount = location.AvailableChestCount - 1
    end
end

Archipelago:AddClearHandler("Reset", Reset)
Archipelago:AddItemHandler("Item Received", ItemReceived)
Archipelago:AddLocationHandler("Location Checked", LocationChecked)
