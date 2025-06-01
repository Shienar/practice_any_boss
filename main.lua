practiceMod = RegisterMod("Practice ANY Boss!", 1)
local challenge_id = Isaac.GetChallengeIdByName("Practice ANY Bossfight!")
local options = require("content.options")
local json = require("json")
local save = {}

if ModConfigMenu then
    require("content.mcm")
end

local function saveData()
	save.currentCharacter = options.currentCharacter
	save.currentCharacterID = options.currentCharacterID
	save.characters = options.characters
	save.numberOfCharacters = options.numberOfCharacters
	
	save.treasureItemCount = options.treasureItemCount
	save.bossItemCount = options.bossItemCount
	save.shopItemCount = options.shopItemCount
	save.devilItemCount = options.devilItemCount 
	save.angelItemCount = options.angelItemCount
	save.secretItemCount = options.secretItemCount 
	save.planetariumItemCount = options.planetariumItemCount
	
	save.currentBoss = options.currentBoss
	
	practiceMod:SaveData(json.encode(save))
	

end

local function detectModdedCharacters()
	if Isaac.GetPlayer().GetPlayerType(Isaac.GetPlayer()) > 40 then
		
		--The current character is modded
		
		for k, v in pairs(options.characters) do
			if v == Isaac.GetPlayer().GetName(Isaac.GetPlayer()) then
				return
			end
		end
		
		
		--The current character is not in the options list
		
		options.characters[options.numberOfCharacters] = Isaac.GetPlayer().GetName(Isaac.GetPlayer())
		options.numberOfCharacters = options.numberOfCharacters + 1
		options.characterIDs[tostring(Isaac.GetPlayer().GetName(Isaac.GetPlayer()))] = Isaac.GetPlayer().GetPlayerType(Isaac.GetPlayer())
		
		saveData()
	end
end

local function loadData()
	if practiceMod:HasData() then
        save = json.decode(practiceMod:LoadData())
		
		for k, v in pairs(save) do
			options[tostring(k)] = v
		end
    end
end

--Handles character changes
local function onInit(player)

	loadData()
	if Isaac.GetChallenge() == challenge_id and options.currentCharacterID ~= nil then
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), options.currentCharacterID)
	end
end

--Handles items, stage, boss
local function onStart(a, isContinued)

	loadData()
	detectModdedCharacters()
	
	if Isaac.GetChallenge() == challenge_id and isContinued == false then
		
		--items
		Isaac.ExecuteCommand("combo 0."..options.treasureItemCount) --Treasure Items
		Isaac.ExecuteCommand("combo 1."..options.shopItemCount) --Shop Items
		Isaac.ExecuteCommand("combo 2."..options.bossItemCount) --Boss Items
		Isaac.ExecuteCommand("combo 3."..options.devilItemCount) --Devil Items
		Isaac.ExecuteCommand("combo 4."..options.angelItemCount) --Angel Items
		Isaac.ExecuteCommand("combo 5."..options.secretItemCount) --Secret Items
		Isaac.ExecuteCommand("combo 26."..options.planetariumItemCount) --Planetarium Items		
		
		--J&E Special case
		if options.currentCharacterID == 19 then
				
			--The characters' healths are messed up after using ChangePlayerType() to J&E, so
			--we need to manually fix them. Esau's will be fixed here, and Jacob's will 
			--get fixed before he receives his items.
			local Jacob = Isaac.GetPlayer().GetMainTwin(Isaac.GetPlayer())
			local Esau = Jacob.GetOtherTwin(Jacob)
			while Esau.GetBlackHearts(Esau) ~= 0 do Esau.AddBlackHearts(Esau, -1) end
			while Esau.GetSoulHearts(Esau) > 2 do Esau.AddSoulHearts(Esau, -1) end
			while Esau.GetSoulHearts(Esau) < 2 do Esau.AddSoulHearts(Esau, 1) end
			while Esau.GetMaxHearts(Esau) > 2 do Esau.AddMaxHearts(Esau, -1) end
			
			--Give each character a random, unique set of items.
			--There doesn't exist a "combo2" command, so I'm forced to do this.
			
			--collectibleList will become a new-line seperated list of Jacob's items.
			local collectibleList = Isaac.ExecuteCommand("listcollectibles")
			collectibleList = string.gsub(collectibleList, ",", "")
			collectibleList = string.gsub(collectibleList, ":%d", "\n")
			
			--collectibleTable will become a multi-string table of each collectible
			local pos,collectibleTable = 0,{}
			for st,sp in function() return string.find(collectibleList, "\n", pos, true) end do
				table.insert(collectibleTable, string.sub(collectibleList, pos, st - 1))
				pos = sp + 1
			end
			table.insert(collectibleTable, string.sub(collectibleList, pos))
				
			--Remove all of jacob's items and give them to esau
			for k, v in pairs(collectibleTable) do
				Isaac.ExecuteCommand("giveitem2 "..v)
				Isaac.ExecuteCommand("remove "..v)
			end
			
			--Fix Jacob's health.
			while Jacob.GetBlackHearts(Jacob) ~= 0 do Jacob.AddBlackHearts(Jacob, -1) end
			while Jacob.GetBoneHearts(Jacob) ~= 0 do Jacob.AddBoneHearts(Jacob, -1) end
			while Jacob.GetBrokenHearts(Jacob) ~= 0 do Jacob.AddBrokenHearts(Jacob, -1) end
			while Jacob.GetRottenHearts(Jacob) ~= 0 do Jacob.AddRottenHearts(Jacob, -1) end
			while Jacob.GetMaxHearts(Jacob) > 6 do Jacob.AddMaxHearts(Jacob, -1) end
			while Jacob.GetMaxHearts(Jacob) < 6 do Jacob.AddMaxHearts(Jacob, 1) end
			
			--Re-generate Jacob's items.
			Isaac.ExecuteCommand("combo 0."..options.treasureItemCount) --Treasure Items
			Isaac.ExecuteCommand("combo 1."..options.shopItemCount) --Shop Items
			Isaac.ExecuteCommand("combo 2."..options.bossItemCount) --Boss Items
			Isaac.ExecuteCommand("combo 3."..options.devilItemCount) --Devil Items
			Isaac.ExecuteCommand("combo 4."..options.angelItemCount) --Angel Items
			Isaac.ExecuteCommand("combo 5."..options.secretItemCount) --Secret Items
			Isaac.ExecuteCommand("combo 26."..options.planetariumItemCount) --Planetarium Items	
			
			
			Jacob.SetFullHearts(Jacob)
			Esau.SetFullHearts(Esau) 
		else
			Isaac.GetPlayer().SetFullHearts(Isaac.GetPlayer())
		end
		
		--stage
		stage = options.bossStage[options.currentBoss][math.random(1, #options.bossStage[options.currentBoss])]
		Isaac.ExecuteCommand("stage "..stage)
		
		--Boss room.
		bossRoom = options.bossIDArray[options.currentBoss][math.random(1, #options.bossIDArray[options.currentBoss])]
		if bossRoom ~= -1 then
			Isaac.ExecuteCommand("goto s.boss."..bossRoom)
		end
	end
end

--trophy spawn
local function spawnTrophy(Entity)
	
	if Isaac.GetChallenge() == challenge_id then
		Isaac.ExecuteCommand("spawn 5.370")
		return true
	end
	
	return nil
end

practiceMod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, saveData)
practiceMod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, onStart)
practiceMod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, onInit)
practiceMod:AddCallback(ModCallbacks.MC_PRE_SPAWN_CLEAN_AWARD, spawnTrophy)