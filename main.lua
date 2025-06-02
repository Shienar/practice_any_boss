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
	
	save.moddedCharName = options.moddedCharName
	save.moddedCharID = options.moddedCharID
	save.moddedCharID_T = options.moddedCharID_T
	save.useModded = options.useModded	
	save.useTainted = options.useTainted
	
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

local function loadData()
	if practiceMod:HasData() then
        save = json.decode(practiceMod:LoadData())
		
		for k, v in pairs(save) do
			options[tostring(k)] = v
		end
    end
end

local function detectModdedCharacters()
	if Isaac.GetPlayer().GetPlayerType(Isaac.GetPlayer()) > 40 then
		options.moddedCharName = Isaac.GetPlayer().GetName(Isaac.GetPlayer())
		options.moddedCharID = Isaac.GetPlayerTypeByName(options.moddedCharName, false)
		options.moddedCharID_T = Isaac.GetPlayerTypeByName(options.moddedCharName, true)
		
		saveData()
	end
end



--Handles character changes
local function onInit(player)

	loadData()
	
	if Isaac.GetChallenge() == challenge_id and options.currentCharacterID ~= nil then
		if options.useModded == true and options.useTainted == true and Isaac.GetPlayerTypeByName(options.moddedCharName, true) ~= -1 then		
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), options.moddedCharID_T)
		elseif options.useModded == true and options.useTainted == false and Isaac.GetPlayerTypeByName(options.moddedCharName, false) ~= -1 then
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), options.moddedCharID)
		elseif options.currentCharacterID ~= PlayerType.PLAYER_JACOB and options.currentCharacterID ~= PlayerType.PLAYER_THEFORGOTTEN_B then
			--Change to vanilla character that isn't a special case.
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), options.currentCharacterID)
		end
	end
end

--Handles items, stage, boss
local function onStart(a, isContinued)

	loadData()
	detectModdedCharacters()
	
	if Isaac.GetChallenge() == challenge_id and isContinued == false then
		
		--Fix some vanilla character starting health/items/pickups/etc
		while Isaac.GetPlayer().GetNumBombs(Isaac.GetPlayer()) > 0 do Isaac.GetPlayer().AddBombs(Isaac.GetPlayer(), -1) end
		while Isaac.GetPlayer().GetNumCoins(Isaac.GetPlayer()) > 0 do Isaac.GetPlayer().AddCoins(Isaac.GetPlayer(), -1) end
		while Isaac.GetPlayer().GetNumKeys(Isaac.GetPlayer()) > 0 do Isaac.GetPlayer().AddKeys(Isaac.GetPlayer(), -1) end
		
		local rng = RNG() -- required for familiars for Lilith / tainted forgotten
		
		if options.currentCharacterID == PlayerType.PLAYER_ISAAC then
			Isaac.ExecuteCommand("g d6")
			Isaac.GetPlayer().AddBombs(Isaac.GetPlayer(), 1)
		elseif options.currentCharacterID == PlayerType.PLAYER_MAGDALENE then
			Isaac.GetPlayer():AddMaxHearts(2)
		elseif options.currentCharacterID == PlayerType.PLAYER_CAIN then
			Isaac.GetPlayer():AddMaxHearts(-2)
			Isaac.GetPlayer().AddKeys(Isaac.GetPlayer(), 1)
			Isaac.ExecuteCommand("g paper clip")
		elseif options.currentCharacterID == PlayerType.PLAYER_JUDAS then
			Isaac.GetPlayer().AddCoins(Isaac.GetPlayer(), 3)
			Isaac.GetPlayer():AddMaxHearts(-4)
		elseif options.currentCharacterID == PlayerType.PLAYER_BLUEBABY then
			Isaac.GetPlayer():AddSoulHearts(5)
		elseif options.currentCharacterID == PlayerType.PLAYER_EVE then
			Isaac.ExecuteCommand("g razor blade")
			Isaac.GetPlayer():AddMaxHearts(-2)
		elseif options.currentCharacterID == PlayerType.PLAYER_SAMSON then
			Isaac.ExecuteCommand("g child's heart")
		elseif options.currentCharacterID == PlayerType.PLAYER_AZAZEL or options.currentCharacterID == PlayerType.PLAYER_AZAZEL_B then
			Isaac.GetPlayer():AddMaxHearts(-6)
			Isaac.GetPlayer():AddBlackHearts(6)
		elseif options.currentCharacterID == PlayerType.PLAYER_EDEN or options.currentCharacterID == PlayerType.PLAYER_EDEN_B then
			Isaac.GetPlayer().AddCoins(Isaac.GetPlayer(), math.random(0, 5))
			Isaac.GetPlayer().AddKeys(Isaac.GetPlayer(), math.random(0, 1))
			Isaac.GetPlayer().AddBombs(Isaac.GetPlayer(), math.random(0, 2))
		elseif options.currentCharacterID == PlayerType.PLAYER_LILITH or options.currentCharacterID == PlayerType.PLAYER_LILITH_B then
			Isaac.GetPlayer():AddMaxHearts(-4)
			Isaac.GetPlayer():AddBlackHearts(4)
			Isaac.GetPlayer().CheckFamiliar(Isaac.GetPlayer(), FamiliarVariant.INCUBUS, 1, rng)
		elseif options.currentCharacterID == PlayerType.PLAYER_KEEPER then
			Isaac.ExecuteCommand("g wooden nickel")
			Isaac.ExecuteCommand("g store key")
			Isaac.GetPlayer().AddKeys(Isaac.GetPlayer(), 1)
			Isaac.GetPlayer().AddBombs(Isaac.GetPlayer(), 1)
		elseif options.currentCharacterID == PlayerType.PLAYER_THEFORGOTTEN then
			Isaac.GetPlayer().AddSoulHearts(Isaac.GetPlayer(), 2)
			Isaac.GetPlayer():AddBoneHearts(-1)
		elseif options.currentCharacterID == PlayerType.PLAYER_BETHANY then
			Isaac.GetPlayer():AddSoulCharge(4)
		elseif options.currentCharacterID == PlayerType.PLAYER_JACOB then
			--J&E special case: The game will crash if you do this on player initialization.
			--A lot of other stuff is done later. These two require a lot of extra work.
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), options.currentCharacterID)
		elseif options.currentCharacterID == PlayerType.PLAYER_ISAAC_B then
			Isaac.GetPlayer().AddBombs(Isaac.GetPlayer(), 1)
		elseif options.currentCharacterID == PlayerType.PLAYER_MAGDALENE_B then
			Isaac.GetPlayer().AddMaxHearts(Isaac.GetPlayer(), 2)
		elseif options.currentCharacterID == PlayerType.PLAYER_CAIN_B then
			Isaac.GetPlayer().AddKeys(Isaac.GetPlayer(), 1)
		elseif options.currentCharacterID == PlayerType.PLAYER_JUDAS_B then
			Isaac.GetPlayer():AddMaxHearts(-6)
			Isaac.GetPlayer():AddBlackHearts(4)
			Isaac.GetPlayer().AddCoins(Isaac.GetPlayer(), 3)
		elseif options.currentCharacterID == PlayerType.PLAYER_BLUEBABY_B then
			Isaac.GetPlayer():AddSoulHearts(5)
			Isaac.GetPlayer():AddPoopMana(3)
		elseif options.currentCharacterID == PlayerType.PLAYER_EVE_B or options.currentCharacterID == PlayerType.PLAYER_APOLLYON_B then
			Isaac.GetPlayer():AddMaxHearts(-2)
		elseif options.currentCharacterID == PlayerType.PLAYER_THELOST_B then
			Isaac.GetPlayer().AddCoins(Isaac.GetPlayer(), 1)
		elseif options.currentCharacterID == PlayerType.PLAYER_KEEPER_B then
			Isaac.GetPlayer().AddBombs(Isaac.GetPlayer(), 1)
		elseif options.currentCharacterID == PlayerType.PLAYER_BETHANY_B then
			Isaac.GetPlayer().AddSoulHearts(Isaac.GetPlayer(), 5)
			Isaac.GetPlayer().SetBloodCharge(Isaac.GetPlayer(), 6)
		elseif options.currentCharacterID == PlayerType.PLAYER_THEFORGOTTEN_B then
			--The forgotten's skeletal body won't spawn in unless I change to jacob first
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), PlayerType.PLAYER_JACOB)
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), PlayerType.PLAYER_THEFORGOTTEN_B)
			Isaac.GetPlayer():AddMaxHearts(-6)
			Isaac.GetPlayer().AddSoulHearts(Isaac.GetPlayer(), 6)
		end
		
		--Add forgotten soul hearts if needed.
		
		
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