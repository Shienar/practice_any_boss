local MCM = require("scripts.modconfig")
local options = require("content.options")

local category = "Practice Bossfights"
MCM.UpdateCategory(category, {
    Info = "Allows players to practice against tough bosses!",
})

local function getTableIndex(tbl, val)
  for i, v in ipairs(tbl) do
    if v == val then
      return i
    end
  end

  return 0
end

MCM.AddSpace(category)

--Character Selection
MCM.AddSetting(category, {
	Type = MCM.OptionType.NUMBER,
	CurrentSetting = function()
		return getTableIndex(options.characters, options.currentCharacter)
	end,
	Minimum = 1,
	Maximum = 34,
	Display = function()
		return "Character: " .. options.currentCharacter
	end,
	OnChange = function(n)
		options.currentCharacter = options.characters[n]
		options.currentCharacterID = options.characterIDs[options.currentCharacter]
		
	end,
		Info = { "This is the character that you will play as when you start the challenge." }
})

MCM.AddSpace(category)

--Treasure items
MCM.AddSetting(category, {
    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function()
        return options.treasureItemCount
    end,

    Minimum = 0,
    Maximum = 25,

    Display = function()
        return "Treasure Room Items: " .. options.treasureItemCount
    end,

    OnChange = function(i)
        options.treasureItemCount = i
		
    end,

    Info = { "Change the number of treasure room items you will be given." }
})

--Boss items
MCM.AddSetting(category, {
    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function()
        return options.bossItemCount
    end,

    Minimum = 0,
    Maximum = 25,

    Display = function()
        return "Boss Items: " .. options.bossItemCount
    end,

    OnChange = function(i)
        options.bossItemCount = i
		
    end,

    Info = { "Change the number of boss items you will be given." }
})

--Shop items
MCM.AddSetting(category, {
    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function()
        return options.shopItemCount
    end,

    Minimum = 0,
    Maximum = 25,

    Display = function()
        return "Shop Room Items: " .. options.shopItemCount
    end,

    OnChange = function(i)
        options.shopItemCount = i
		
    end,

    Info = { "Change the number of shop room items you will be given." }
})

--Devil items
MCM.AddSetting(category, {
    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function()
        return options.devilItemCount
    end,

    Minimum = 0,
    Maximum = 25,

    Display = function()
        return "Devil Room Items: " .. options.devilItemCount
    end,

    OnChange = function(i)
        options.devilItemCount = i
		
    end,

    Info = { "Change the number of devil room items you will be given." }
})

--Angel items
MCM.AddSetting(category, {
    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function()
        return options.angelItemCount
    end,

    Minimum = 0,
    Maximum = 25,

    Display = function()
        return "Angel Room Items: " .. options.angelItemCount
    end,

    OnChange = function(i)
        options.angelItemCount = i
		
    end,

    Info = { "Change the number of angel room items you will be given." }
})

--Secret items
MCM.AddSetting(category, {
    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function()
        return options.secretItemCount
    end,

    Minimum = 0,
    Maximum = 25,

    Display = function()
        return "Secret Room Items: " .. options.secretItemCount
    end,

    OnChange = function(i)
        options.secretItemCount = i
		
    end,

    Info = { "Change the number of secret room items you will be given." }
})

--Planetarium items
MCM.AddSetting(category, {
    Type = ModConfigMenu.OptionType.NUMBER,

    CurrentSetting = function()
        return options.planetariumItemCount
    end,

    Minimum = 0,
    Maximum = 25,

    Display = function()
        return "Planetarium Items: " .. options.planetariumItemCount
    end,

    OnChange = function(i)
        options.planetariumItemCount = i
		
    end,

    Info = { "Change the number of planetarium items you will be given." }
})

MCM.AddSpace(category)

--Boss Selection
MCM.AddSetting(category, {
	Type = MCM.OptionType.NUMBER,
	CurrentSetting = function()
		return getTableIndex(options.bossNameArray, options.currentBoss)
	end,
	Minimum = 1,
	Maximum = 96,
	Display = function()
		return "Boss: " .. options.currentBoss
	end,
	OnChange = function(n)
		options.currentBoss = options.bossNameArray[n]
		
	end,
		Info = { "This is the boss that you will be teleported to when you start the challenge." }
})


