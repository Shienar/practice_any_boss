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

local function onStart(a, isContinued)
	
	loadData()
	
	
	
	if Isaac.GetChallenge() == challenge_id and isContinued == false then

		--character
		if options.currentCharacterID ~= nil then
			Isaac.GetPlayer().ChangePlayerType(Isaac.GetPlayer(), options.currentCharacterID)
		end
	
		--items
		Isaac.ExecuteCommand("combo 0."..options.treasureItemCount) --Treasure Items
		Isaac.ExecuteCommand("combo 1."..options.shopItemCount) --Shop Items
		Isaac.ExecuteCommand("combo 2."..options.bossItemCount) --Boss Items
		Isaac.ExecuteCommand("combo 3."..options.devilItemCount) --Devil Items
		Isaac.ExecuteCommand("combo 4."..options.angelItemCount) --Angel Items
		Isaac.ExecuteCommand("combo 5."..options.secretItemCount) --Secret Items
		Isaac.ExecuteCommand("combo 26."..options.planetariumItemCount) --Planetarium Items		
		
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
local function onRoomClear(Entity)
	
	if Isaac.GetChallenge() == challenge_id then
		Isaac.ExecuteCommand("spawn 5.370")
	end
	
	return true
end


practiceMod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, saveData)
practiceMod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, onStart)
practiceMod:AddCallback(ModCallbacks.MC_PRE_SPAWN_CLEAN_AWARD, onRoomClear)