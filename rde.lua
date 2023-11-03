SLASH_RDE1 = "/rde"
SlashCmdList["RDE"] = function(input)
    -- Create character structure
    WowSimsExporter:CreateCharacterStructure("player")
    
    -- Get equipped and bag gear
    local equippedAndBagGear = WowSimsExporter:GetGearEnchantGems(true)
    
    -- Merge with RazzleDazzle gear cache
    for _, item in ipairs(RazzleDazzleGearCache) do
        table.insert(equippedAndBagGear.items, item)
    end
    
    -- Get talents and glyphs
    WowSimsExporter:CreateTalentEntry()
    WowSimsExporter:CreateGlyphEntry()
    
    -- Generate the JSON output
    local jsonData = LibParse:JSONEncode(WowSimsExporter.Character)
    
    -- Display the JSON data in a frame for the user to copy
    local frame = CreateFrame("Frame", "RDEExportFrame", UIParent, "BasicFrameTemplateWithInset")
    frame:SetSize(500, 400)
    frame:SetPoint("CENTER")
    frame.title = frame:CreateFontString(nil, "OVERLAY")
    frame.title:SetFontObject("GameFontHighlight")
    frame.title:SetPoint("LEFT", frame.TitleBg, "LEFT", 5, 0)
    frame.title:SetText("RDE Exported Data")

    local editBox = CreateFrame("EditBox", nil, frame)
    editBox:SetMultiLine(true)
    editBox:SetFontObject("ChatFontNormal")
    editBox:SetWidth(460)
    editBox:SetHeight(340)
    editBox:SetPoint("TOPLEFT", 15, -25)
    editBox:SetText(jsonData)
    editBox:HighlightText()

    local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", editBox, "TOPLEFT", 0, 0)
    scrollFrame:SetPoint("BOTTOMRIGHT", editBox, "BOTTOMRIGHT", 0, 0)
    scrollFrame:SetScrollChild(editBox)
end
