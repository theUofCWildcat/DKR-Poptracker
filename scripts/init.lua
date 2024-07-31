-- Logic
ScriptHost:LoadScript("scripts/logic.lua")

-- Items
Tracker:AddItems("items/amulets.json")
Tracker:AddItems("items/balloons.json")
Tracker:AddItems("items/bosses.json")
Tracker:AddItems("items/keys.json")
Tracker:AddItems("items/settings.json")
Tracker:AddItems("items/trophies.json")

-- Maps
Tracker:AddMaps("maps/maps.json")   
-- Locations
Tracker:AddLocations("locations/Dino_Domain.json")
Tracker:AddLocations("locations/Snowflake_Mountain.json")
Tracker:AddLocations("locations/Sherbet_Island.json")
Tracker:AddLocations("locations/Dragon_Forest.json")
Tracker:AddLocations("locations/Future_Fun_Land.json")
Tracker:AddLocations("locations/Overworld.json") 

-- Layout
Tracker:AddLayouts("layouts/items.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/broadcast.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/layout.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/archipelago.lua")
end
