local options = {}

--item count
options.treasureItemCount = 0
options.bossItemCount = 0
options.shopItemCount = 0
options.devilItemCount = 0
options.angelItemCount = 0
options.secretItemCount = 0
options.planetariumItemCount = 0

--These are what the player scrolls through.
options.characters = {"Isaac", "Magdalene", "Cain", "Judas", "???", "Eve", "Samson", "Azazel", "Lazarus", "Eden", "The Lost", "Lilith", "Keeper", "Apollyon", "The Forgotten", "Bethany", "Jacob and Esau", "T. Isaac", "T. Magdalene", "T. Cain", "T. Judas", "T. ???", "T. Eve", "T. Samson", "T. Azazel", "T. Lazarus", "T. Eden", "T. Lost", "T. Lilith", "T. Keeper", "T. Apollyon", "T. Forgotten", "T. Bethany", "T. Jacob and Esau"}options.bossNameArray = {"Monstro", "Gemini", "Steven",  "Dingle", "Gurglings", "Larry Jr.", "Duke of Flies", "Widow", "Blighted Ovum", "The Haunt", "Pin", "Famine", "Fistula", "Chub", "C.H.A.D.", "Gurdy", "Mega Fatty", "Mega Maw", "Gurdy Jr.", "Peep", "The Husk", "The Hollow", "Carrion Queen", "Dark One", "Polycephalus", "The Wretched","Pestilence", "Monstro II", "Gish", "The Cage", "The Gate", "Loki", "The Adversary", "The Bloat", "Mask of Infamy", "War", "Blastocyst", "Mama Gurdy", "Scolex", "Mr. Fred", "Lokii", "Daddy Long Legs", "Triachnid", "Teratoma", "Death", "Conquest", "Headless Horseman", "Dangle", "Turdlings", "Little Horn", "Rag Man", "The Stain", "The Forsaken", "The Fallen", "The Frail", "Brownie", "Big Horn", "Rag Mega", "Sisters Vis", "The Matriarch", "Baby Plum", "Bumbino","Reap Creep", "The Pile", "The Rainmaker", "Min-Min", "Lil Blub", "Wormwood", "Clog", "Colostomia", "Turdlet", "Tuff Twins", "Hornfel", "Great Gideon", "Singe", "The Shell", "Clutch", "The Siren", "The Heretic", "The Visage", "The Horny Boys", "Chimera", "The Scourge", "Rotgut", "Mom", "Mom's Heart", "It Lives", "Satan", "Isaac", "The Lamb", "???", "Mega Satan", "Hush", "Delirium", "Mother", "Home", "Boss Rush"}                     
--These are linked to the character array and are used to swap to a specific character.
options.characterIDs = {}
options.characterIDs["Isaac"] = 0
options.characterIDs["Magdalene"] = 1
options.characterIDs["Cain"] = 2
options.characterIDs["Judas"] = 3
options.characterIDs["???"] = 4
options.characterIDs["Eve"] = 5
options.characterIDs["Samson"] = 6
options.characterIDs["Azazel"] = 7
options.characterIDs["Lazarus"] = 8
options.characterIDs["Eden"] = 9
options.characterIDs["The Lost"] = 10
options.characterIDs["Lilith"] = 13
options.characterIDs["Keeper"] = 14
options.characterIDs["Apollyon"] = 15
options.characterIDs["The Forgotten"] = 16
options.characterIDs["Bethany"] = 18
options.characterIDs["Jacob and Esau"] = 19
options.characterIDs["T. Isaac"] = 21
options.characterIDs["T. Magdalene"] = 22
options.characterIDs["T. Cain"] = 23
options.characterIDs["T. Judas"] = 24
options.characterIDs["T. ???"] = 25
options.characterIDs["T. Eve"] = 26
options.characterIDs["T. Samson"] = 27
options.characterIDs["T. Azazel"] = 28
options.characterIDs["T. Lazarus"] = 29
options.characterIDs["T. Eden"] = 30
options.characterIDs["T. Lost"] = 31
options.characterIDs["T. Lilith"] = 32
options.characterIDs["T. Keeper"] = 33
options.characterIDs["T. Apollyon"] = 34
options.characterIDs["T. Forgotten"] = 35
options.characterIDs["T. Bethany"] = 36
options.characterIDs["T. Jacob and Esau"] = 37

--Current options from the arrays
options.currentBoss = options.bossNameArray[1]
options.currentCharacter = options.characters[1]
options.currentCharacterID = options.characterIDs[options.characters[1]]

--Modded character compatibility
options.moddedCharName = "N/A"
options.moddedCharID = -1
options.moddedCharID_T = -1
options.useModded = false
options.useTainted = false

--These are linked to the bossNameArray and are used to send the player to a room
options.bossIDArray = {}
options.bossIDArray["Monstro"] = {1010, 1015}
options.bossIDArray["Gemini"] = {2050, 2051, 2052, 2053}
options.bossIDArray["Steven"] = {2070, 2071, 2072}
options.bossIDArray["Dingle"] = {5020, 5021}
options.bossIDArray["Gurglings"] = {5140, 5141, 5142, 5143, 5144}
options.bossIDArray["Larry Jr."] = {1020, 1124, 1021, 1026}
options.bossIDArray["Duke of Flies"] = {2010, 2014}
options.bossIDArray["Widow"] = {3340, 3341, 3342, 3343, 3344, 3345}
options.bossIDArray["Blighted Ovum"] = {3320, 3321, 3322, 3323}
options.bossIDArray["The Haunt"] = {5010, 5011}
options.bossIDArray["Pin"] = {3370, 3374}
options.bossIDArray["Famine"] = {4010, 4013, 4014}
options.bossIDArray["Fistula"] = {2060, 2061, 2063}
options.bossIDArray["Chub"] = {1030, 1126, 1031, 1055}
options.bossIDArray["C.H.A.D."] = {1100, 1101}
options.bossIDArray["Gurdy"] = {1040, 1130, 1041, 1058}
options.bossIDArray["Mega Fatty"] = {5050, 5051}
options.bossIDArray["Mega Maw"] = {5030, 5031}
options.bossIDArray["Gurdy Jr."] = {3280}
options.bossIDArray["Peep"] = {2020, 2021, 2022, 2023, 2024, 2025}
options.bossIDArray["The Husk"] = {3290, 3291, 3292, 3293, 3294, 3295}
options.bossIDArray["The Hollow"] = {3260, 3261, 3262, 3263, 3265}
options.bossIDArray["Carrion Queen"] = {3270, 3271, 3272, 3273}
options.bossIDArray["Dark One"] = {5080, 5081, 5082, 5084}
options.bossIDArray["Polycephalus"] = {5100, 5101, 5102, 5103, 5104, 506}
options.bossIDArray["The Wretched"] = {3360, 3361, 3362, 3363}
options.bossIDArray["Pestilence"] = {4020, 4021, 4022}
options.bossIDArray["Monstro II"] = {1050, 1067}
options.bossIDArray["Gish"] = {1110, 1111, 1112, 1113, 1114}
options.bossIDArray["The Cage"] = {5060, 5061, 5062, 5063, 5064}
options.bossIDArray["The Gate"] = {5040, 5041, 5042, 5044, 5045}
options.bossIDArray["Loki"] = {2030}
options.bossIDArray["Lokii"] = {3310}
options.bossIDArray["The Adversary"] = {5090, 5091, 5092, 5093, 5094}
options.bossIDArray["The Bloat"] = {3300, 3301, 3302, 3303}
options.bossIDArray["Mask of Infamy"] = {3350, 3351, 3352, 3353}
options.bossIDArray["War"] = {4030, 4034, 4035}
options.bossIDArray["Blastocyst"] = {2040, 2041, 2042, 2043}
options.bossIDArray["Mama Gurdy"] = {5070, 5071}
options.bossIDArray["Scolex"] = {1070, 1071, 1072, 1073, 1074, 1075}
options.bossIDArray["Mr. Fred"] = {5110, 5111, 5113}
options.bossIDArray["Daddy Long Legs"] = {3400, 3401, 3402, 3403}
options.bossIDArray["Triachnid"] = {3411, 3412, 3413}
options.bossIDArray["Teratoma"] = {3330, 3331, 3332, 3333}
options.bossIDArray["Death"] = {4040, 4041, 4042}
options.bossIDArray["Conquest"] = {4031, 4032}
options.bossIDArray["Headless Horseman"] = {4050, 4051, 4052}
options.bossIDArray["Dangle"] = {1117, 1118, 1119, 1120, 1121}
options.bossIDArray["Turdlings"] = {5146, 5147, 5148, 5149, 5150, 5151}
options.bossIDArray["Little Horn"] = {1088, 1096, 5373, 5374}
options.bossIDArray["Rag Man"] = {1019, 1029}
options.bossIDArray["The Stain"] = {1106, 1107, 1108, 1109, 1115}
options.bossIDArray["The Forsaken"] = {1079, 1085}
options.bossIDArray["The Fallen"] = {3500, 3501, 3502}
options.bossIDArray["The Frail"] = {3384, 3385, 3386, 3387, 3388, 3389}
options.bossIDArray["Brownie"] = {1097, 1098, 1116}
options.bossIDArray["Big Horn"] = {3394, 3395, 3396, 3397}
options.bossIDArray["Rag Mega"] = {3398}
options.bossIDArray["Sisters Vis"] = {3406, 3407, 3408, 3409}
options.bossIDArray["The Matriarch"] = {5152, 5153, 5154, 5155}
options.bossIDArray["Baby Plum"] = {5160, 5161, 5162, 5163, 5164, 5165}
options.bossIDArray["Reap Creep"] = {5250, 5251, 5252, 5253, 5254, 5255, 5256}
options.bossIDArray["The Pile"] = {5240, 5241, 5242, 5243, 5244}
options.bossIDArray["The Rainmaker"] = {5230, 5231, 5232}
options.bossIDArray["Min-Min"] = {5280}
options.bossIDArray["Lil Blub"] = {5170, 5171, 5172, 5173, 5174, 5175}
options.bossIDArray["Wormwood"] = {5180, 5181, 5182, 5183, 5184}
options.bossIDArray["Clog"] = {5190, 5191, 5192, 5193, 5194}
options.bossIDArray["Colostomia"] = {5330}
options.bossIDArray["Turdlet"] = {5320, 5321, 5322}
options.bossIDArray["Tuff Twins"] = {5200}
options.bossIDArray["Hornfel"] = {5220}
options.bossIDArray["Great Gideon"] = {5210, 5211, 5212, 5213, 5214}
options.bossIDArray["Singe"] = {5260, 5261, 5262, 5263, 5264}
options.bossIDArray["The Shell"] = {5310, 5311, 5312, 5313}
options.bossIDArray["Clutch"] = {6020, 6021, 6022}
options.bossIDArray["The Siren"] = {5370, 5371, 5372}
options.bossIDArray["The Heretic"] = {5290, 5291, 5292, 5293}
options.bossIDArray["The Visage"] = {5300, 5301}
options.bossIDArray["The Horny Boys"] = {6010, 6011, 6012}
options.bossIDArray["Chimera"] = {5350, 5351, 5352}
options.bossIDArray["The Scourge"] = {5360, 5361, 5362}
options.bossIDArray["Rotgut"] = {5340}
options.bossIDArray["Mom"] = {1060}
options.bossIDArray["Mom's Heart"] = {1080}
options.bossIDArray["It Lives"] = {1090, 1091, 1092, 1093, 1094}
options.bossIDArray["Satan"] = {3600}
options.bossIDArray["Isaac"] = {3380, 3381, 3382, 3383}
options.bossIDArray["The Lamb"] = {5130}
options.bossIDArray["???"] = {3390, 3391, 3392, 3393}
options.bossIDArray["Mega Satan"] = {5000}
options.bossIDArray["Hush"] = {-1}
options.bossIDArray["Delirium"] = {3414}
options.bossIDArray["Mother"] = {6000}
options.bossIDArray["Home"] = {-1}
options.bossIDArray["Boss Rush"] = {0, 1, 2, 3, 4, 5, 6}

--These are linked to the bossNameArray and are used to send the player to an appropriate stage
options.bossStage = {}
options.bossStage["Monstro"] = {"1", "1b", "2", "2b"}
options.bossStage["Gemini"] = {"1", "1b", "2", "2b"}
options.bossStage["Steven"] = {"1", "1b", "2", "2b"}
options.bossStage["Dingle"] = {"1", "1b", "2", "2b"}
options.bossStage["Gurglings"] = {"1", "1b", "2", "2b"}
options.bossStage["Larry Jr."] = {"1", "1b", "2", "2b"}
options.bossStage["Duke of Flies"] = {"1", "1a", "1b", "2", "2a", "2b"}
options.bossStage["Widow"] = {"1a", "2a"}
options.bossStage["Blighted Ovum"] = {"1a", "2a"}
options.bossStage["The Haunt"] = {"1a", "1b", "2a", "2b"}
options.bossStage["Pin"] = {"1a", "2a"}
options.bossStage["Famine"] = {"1", "1a", "1b", "2", "2a", "2b"}
options.bossStage["Fistula"] = {"1a", "2a"}
options.bossStage["Chub"] = {"3", "4"}
options.bossStage["C.H.A.D."] = {"3", "4"}
options.bossStage["Gurdy"] = {"3", "4"}
options.bossStage["Mega Fatty"] = {"3", "4"}
options.bossStage["Mega Maw"] = {"3", "4"}
options.bossStage["Gurdy Jr."] = {"3", "4"}
options.bossStage["Peep"] = {"3", "4"}
options.bossStage["The Husk"] = {"3a", "4a"}
options.bossStage["The Hollow"] = {"3a", "4a"}
options.bossStage["Carrion Queen"] = {"3a", "4a"}
options.bossStage["Dark One"] = {"3a", "4a"}
options.bossStage["Polycephalus"] = {"3a", "4a"}
options.bossStage["The Wretched"] = {"3a", "4a"}
options.bossStage["Pestilence"] = {"3", "3a", "3b", "4", "4a", "4b"}
options.bossStage["Monstro II"] = {"5", "5b", "6", "6b"}
options.bossStage["Gish"] = {"5", "5b", "6", "6b"}
options.bossStage["The Cage"] = {"5", "5b", "6", "6b"}
options.bossStage["The Gate"] = {"5", "5b", "6", "6b"}
options.bossStage["Loki"] = {"5", "5a", "5b", "6", "6a", "6b"}
options.bossStage["Lokii"] = {"7", "7a", "7b", "8", "8a", "8b"}
options.bossStage["The Adversary"] = {"5", "5a", "5b", "6", "6a", "6b"}
options.bossStage["The Bloat"] = {"7a", "8a"}
options.bossStage["Mask of Infamy"] = {"5a", "6a"}
options.bossStage["War"] = {"5", "5a", "5b", "6", "6a", "6b"}
options.bossStage["Blastocyst"] = {"7", "7b", "8", "8b"}
options.bossStage["Mama Gurdy"] = {"7", "7b", "8", "8b"}
options.bossStage["Scolex"] = {"7", "7b", "8", "8b"}
options.bossStage["Mr. Fred"] = {"7", "7b", "8", "8b"}
options.bossStage["Daddy Long Legs"] = {"7", "8"}
options.bossStage["Triachnid"] = {"7", "7b", "8", "8b"}
options.bossStage["Teratoma"] = {"7", "8"}
options.bossStage["Death"] = {"7", "7a", "7b", "8", "8a", "8b"}
options.bossStage["Conquest"] = {"7", "7a", "7b", "8", "8a", "8b"}
options.bossStage["Headless Horseman"] = {"1", "1a", "1b", "2", "2a", "2b", "3", "3a", "3b", "4", "4a", "4b", "5", "5a", "5b", "6", "6a", "6b", "7", "7a", "7b", "8", "8a", "8b"}
options.bossStage["Dangle"] = {"1", "1b", "2", "2b"}
options.bossStage["Turdlings"] = {"1", "1b", "2", "2b"}
options.bossStage["Little Horn"] = {"1", "1a", "1b", "2", "2a", "2b"}
options.bossStage["Rag Man"] = {"1", "1a", "1b", "2", "2a", "2b"}
options.bossStage["The Stain"] = {"3", "3a", "3b", "4", "4a", "4b"}
options.bossStage["The Forsaken"] = {"3", "3a", "3b", "4", "4a", "4b"}
options.bossStage["The Fallen"] = {"1", "1a", "1b", "2", "2a", "2b", "3", "3a", "3b", "4", "4a", "4b", "5", "5a", "5b", "6", "6a", "6b", "7", "7a", "7b", "8", "8a", "8b"}
options.bossStage["The Frail"] = {"3", "3a", "3b", "4", "4a", "4b"}
options.bossStage["Brownie"] = {"5", "5a", "5b", "6", "6a", "6b"}
options.bossStage["Big Horn"] = {"3", "3a", "3b", "4", "4a", "4b"}
options.bossStage["Rag Mega"] = {"3", "3a", "3b", "4", "4a", "4b"}
options.bossStage["Sisters Vis"] = {"5", "5a", "5b", "6", "6a", "6b", "7", "7a", "7b", "8", "8a", "8b"}
options.bossStage["The Matriarch"] = {"7", "7b", "8", "8b"}
options.bossStage["Baby Plum"] = {"1", "1a", "1b", "2", "2a", "2b"}
options.bossStage["Reap Creep"] = {"3", "3a", "3c", "4", "4a", "4c"}
options.bossStage["The Pile"] = {"3d", "4d", "5a", "6a"}
options.bossStage["The Rainmaker"] = {"1c", "2c"}
options.bossStage["Min-Min"] = {"1c", "2c"}
options.bossStage["Lil Blub"] = {"1c", "1d", "2c", "2d"}
options.bossStage["Wormwood"] = {"1c", "1d", "2c", "2d"}
options.bossStage["Clog"] = {"1d", "2d"}
options.bossStage["Colostomia"] = {"1d", "2d"}
options.bossStage["Turdlet"] = {"1d", "2d"}
options.bossStage["Tuff Twins"] = {"3c", "4c"}
options.bossStage["Hornfel"] = {"3c", "4c"}
options.bossStage["Great Gideon"] = {"3c", "4c"}
options.bossStage["Singe"] = {"3c", "4c"}
options.bossStage["The Shell"] = {"3c", "4c"}
options.bossStage["Clutch"] = {"3d", "4d"}
options.bossStage["The Siren"] = {"5c", "6c"}
options.bossStage["The Heretic"] = {"5c", "6c"}
options.bossStage["The Visage"] = {"5d", "6d"}
options.bossStage["The Horny Boys"] = {"5d", "6d"}
options.bossStage["Chimera"] = {"7c", "8c"}
options.bossStage["The Scourge"] = {"7c", "8c"}
options.bossStage["Rotgut"] = {"7c", "8c"}
options.bossStage["Mom"] = {"6", "6a", "6b"}
options.bossStage["Mom's Heart"] = {"8", "8a", "8b"}
options.bossStage["It Lives"] = {"8", "8a", "8b"}
options.bossStage["Satan"] = {"10"}
options.bossStage["Isaac"] = {"10a"}
options.bossStage["The Lamb"] = {"11"}
options.bossStage["???"] = {"11a"}
options.bossStage["Mega Satan"] = {"11", "11a"}
options.bossStage["Hush"] = {"9"}
options.bossStage["Delirium"] = {"12"}
options.bossStage["Mother"] = {"8c"}
options.bossStage["Home"] = {"13a"}
options.bossStage["Boss Rush"] = {"6", "6a", "6b"}

function options.resetDefaults()
	options.treasureItemCount = 0
	options.bossItemCount = 0
	options.shopItemCount = 0
	options.devilItemCount = 0
	options.angelItemCount = 0
	options.secretItemCount = 0
	options.planetariumItemCount = 0
	
	options.characters = {"Isaac", "Magdalene", "Cain", "Judas", "???", "Eve", "Samson", "Azazel", "Lazarus", "Eden", "The Lost", "Lilith", "Keeper", "Apollyon", "The Forgotten", "Bethany", "Jacob and Esau", "T. Isaac", "T. Magdalene", "T. Cain", "T. Judas", "T. ???", "T. Eve", "T. Samson", "T. Azazel", "T. Lazarus", "T. Eden", "T. Lost", "T. Lilith", "T. Keeper", "T. Apollyon", "T. Forgotten", "T. Bethany", "T. Jacob and Esau"}
	options.currentCharacter = options.characters[1]
	options.currentCharacterID = options.characterIDs[options.characters[1]]
	
	options.moddedCharName = "N/A"
	options.moddedCharID = -1
	options.moddedCharID_T = -1
	options.useModded = false
	options.useTainted = false
	
	options.currentBoss = options.bossNameArray[1]
end

return options