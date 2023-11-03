local itemCache = {}

-- Function to cache items from a specific container (bag or bank)
local function CacheItemsFromContainer(bagId)
    for slotId = 1, GetContainerNumSlots(bagId) do
        local itemLink = GetContainerItemLink(bagId, slotId)
        if itemLink then
            table.insert(itemCache, itemLink)
        end
    end
end

-- Function to cache equipped items
local function CacheEquippedItems()
    for slotId = 1, 19 do
        local itemLink = GetInventoryItemLink("player", slotId)
        if itemLink then
            table.insert(itemCache, itemLink)
        end
    end
end

-- Function to update the cache
local function UpdateCache()
    -- Clear the cache
    itemCache = {}

    -- Cache equipped items
    CacheEquippedItems()

    -- Cache all character's bag slots
    for bagId = 0, 4 do
        CacheItemsFromContainer(bagId)
    end
end

-- Event handler for when the game is loaded or UI is reloaded
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event)
    UpdateCache()
end)

-- Command to manually update the cache
SLASH_UPDATERD1 = "/updaterd"
SlashCmdList["UPDATERD"] = function()
    UpdateCache()
    print("RazzleDazzle item cache updated!")
end

-- Command to print cached items
SLASH_PRINTCACHE1 = "/printcache"
SlashCmdList["PRINTCACHE"] = function()
    for _, itemLink in ipairs(itemCache) do
        print(itemLink)
    end
end
