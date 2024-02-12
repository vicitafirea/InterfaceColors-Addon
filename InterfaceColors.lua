--local player = UnitName('player')
if type(InterfaceColors_Variables) ~= 'table' then
	InterfaceColors_Variables = {}
    InterfaceColors_Variables['classes'] = 'vanilla'
end
local HEARTHSTONE_CLASS_COLORS = {
    ["DRUID"]   = { r = 0.33, g = 0.20, b = 0.10 }, --55331a
    ["HUNTER"]  = { r = 0.11, g = 0.43, b = 0.10 }, --1d6d19
    ["MAGE"]    = { r = 0.29, g = 0.38, b = 0.64 }, --4a61a2
    ["PALADIN"] = { r = 0.77, g = 0.48, b = 0.11 }, --c47b1d
    ["PRIEST"]  = { r = 0.82, g = 0.83, b = 0.85 }, --d0d3d9
    ["ROGUE"]   = { r = 0.17, g = 0.17, b = 0.18 }, --2b2b2d
    ["SHAMAN"]  = { r = 0.16, g = 0.18, b = 0.36 }, --282f5c
    ["WARLOCK"] = { r = 0.37, g = 0.14, b = 0.45 }, --5e2372
    ["WARRIOR"] = { r = 0.56, g = 0.11, b = 0.04 }, --8e1b0b
}
local BRIGHTER_CLASS_COLORS = {
    ["DRUID"]   = { r = 0.54, g = 0.38, b = 0.27 }, --896246
    ["HUNTER"]  = { r = 0.34, g = 0.63, b = 0.29 }, --57a14b
    ["MAGE"]    = { r = 0.29, g = 0.58, b = 0.85 }, --4a94d9
    ["PALADIN"] = { r = 1.00, g = 0.69, b = 0.33 }, --ffb053
    ["PRIEST"]  = { r = 0.82, g = 0.83, b = 0.85 },
    ["ROGUE"]   = { r = 0.35, g = 0.35, b = 0.36 }, --58585b
    ["SHAMAN"]  = { r = 0.35, g = 0.36, b = 0.56 }, --5a5d8f
    ["WARLOCK"] = { r = 0.58, g = 0.33, b = 0.65 }, --9355a6
    ["WARRIOR"] = { r = 0.80, g = 0.32, b = 0.22 }, --cb5238
}
local RETAIL_CLASS_COLORS = {
    ["MAGE"]    = { r = 0.25, g = 0.78, b = 0.92 }, --3fc7eb
    ["SHAMAN"]  = { r = 0.00, g = 0.44, b = 0.87 }, --0070dd
    ["WARLOCK"] = { r = 0.53, g = 0.53, b = 0.93 }, --8788ee
}
local VANILLA_CLASS_COLORS = {
    ["HUNTER"]  = { r = 0.67, g = 0.83, b = 0.45 }, --aad372
    ["WARLOCK"] = { r = 0.58, g = 0.51, b = 0.79 }, --9482c9
    ["PRIEST"]  = { r = 1.00, g = 1.00, b = 1.00 }, --ffffff
    ["PALADIN"] = { r = 0.96, g = 0.55, b = 0.73 }, --f48cba
    ["MAGE"]    = { r = 0.41, g = 0.80, b = 0.94 }, --69ccf0
    ["ROGUE"]   = { r = 1.00, g = 0.96, b = 0.41 }, --fff468
    ["DRUID"]   = { r = 1.00, g = 0.49, b = 0.04 }, --ff7c0a
    ["SHAMAN"]  = { r = 0.96, g = 0.55, b = 0.73 }, --f48cba
    ["WARRIOR"] = { r = 0.78, g = 0.61, b = 0.43 }, --c69b6d
}

InterfaceColors_Config = function(msg)
    local msg = strlower(msg)
	if strfind(msg, 'retail') or strfind(msg, 'modern') then
        for k, v in pairs(RAID_CLASS_COLORS) do
            if k == 'MAGE' or k == 'SHAMAN' or k == 'WARLOCK' then
                RAID_CLASS_COLORS[k] = RETAIL_CLASS_COLORS[k]
            else
                RAID_CLASS_COLORS[k] = VANILLA_CLASS_COLORS[k]
            end
        end
        InterfaceColors_Variables['classes'] = 'retail'
        DEFAULT_CHAT_FRAME:AddMessage('InterfaceColors: Retail\'s class colors')
        return

	elseif strfind(msg, 'bright') or strfind(msg, 'brighter') then
        for k, v in pairs(RAID_CLASS_COLORS) do
            RAID_CLASS_COLORS[k] = BRIGHTER_CLASS_COLORS[k]
        end
        InterfaceColors_Variables['classes'] = 'brighter hs'
        DEFAULT_CHAT_FRAME:AddMessage('InterfaceColors: Hearthstone\'s brighter class colors')
        return

	elseif strfind(msg, 'hearthstone') then
        for k, v in pairs(RAID_CLASS_COLORS) do
            RAID_CLASS_COLORS[k] = HEARTHSTONE_CLASS_COLORS[k]
        end
        InterfaceColors_Variables['classes'] = 'hearthstone'
        DEFAULT_CHAT_FRAME:AddMessage('InterfaceColors: Hearthstone\'s class colors')
        return

    elseif strfind(msg, 'vanilla') or strfind(msg, 'classic') then
        for k, v in pairs(RAID_CLASS_COLORS) do
            RAID_CLASS_COLORS[k] = VANILLA_CLASS_COLORS[k]
        end
        InterfaceColors_Variables['classes'] = 'vanilla'
        DEFAULT_CHAT_FRAME:AddMessage('InterfaceColors: Vanilla\'s class colors')
        return
        
    elseif strfind(msg, 'tbc') or strfind(msg, 'shaman') then
        for k, v in pairs(RAID_CLASS_COLORS) do
            if k == 'SHAMAN' then
                RAID_CLASS_COLORS[k] = {r = 0.14, g = 0.35, b = 1.0} --2459ff
            else
                RAID_CLASS_COLORS[k] = VANILLA_CLASS_COLORS[k]
            end
        end
        InterfaceColors_Variables['classes'] = 'tbc'
        DEFAULT_CHAT_FRAME:AddMessage('InterfaceColors: TBC\'s class colors')
        return
	end
	DEFAULT_CHAT_FRAME:AddMessage('InterfaceColors.v1')
	DEFAULT_CHAT_FRAME:AddMessage('Subcommands: vanilla, retail, hearthstone, brighter hearthstone, tbc')
end
SlashCmdList['INTERFACECOLORS'] = InterfaceColors_Config
SLASH_INTERFACECOLORS1 = '/interfacecolors'

FACTION_BAR_COLORS = {
    [1] = {r = 0.80, g = 0.13, b = 0.13}, --cc2222
    [2] = {r = 0.95, g = 0.00, b = 0.00}, --f10000
    [3] = {r = 0.93, g = 0.36, b = 0.13}, --ee5b21
    [4] = {r = 1.00, g = 1.00, b = 0.00}, --ffff00
    [5] = {r = 0.00, g = 0.95, b = 0.08}, --00f115
    [6] = {r = 0.00, g = 1.00, b = 0.53}, --00ff88
    [7] = {r = 0.08, g = 0.95, b = 0.80}, --15f1cc
    [8] = {r = 0.00, g = 1.00, b = 1.00}, --00ffff
}

local original_GetDifficultyColor = GetDifficultyColor
function GetDifficultyColor(level)
    local levelDiff = level - UnitLevel("player")
    if levelDiff >= 4 then return QuestDifficultyColor["impossible"]
    elseif levelDiff >= 1 then return QuestDifficultyColor["verydifficult"]
    elseif levelDiff >= -3 then return QuestDifficultyColor["difficult"]
    elseif -levelDiff <= GetQuestGreenRange() then return QuestDifficultyColor["standard"]
    else return QuestDifficultyColor["trivial"]
    end
end