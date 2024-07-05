-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

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
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
