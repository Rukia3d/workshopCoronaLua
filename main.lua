-----------------------------------------------------------------------------------------
--
-- copy this file to your main.lua
--
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- Module variables visible for all functions
-----------------------------------------------------------------------------------------

-- Display groups for organizing the level. 
-- The order of declaration will be the order in wich tey appear on the screen.
-- It makes sure the actor will alwasy be on top of the background and so on.
local backgroundsGroup = display.newGroup()
local actorsGroup = display.newGroup()
local instructionsGroup = display.newGroup()
local touchGroup = display.newGroup()

-- Variables that keep the game control
local touchRect -- The rectabgle that catches player swipes on the screen
local sound -- The variable where the soundtrack loads

-- Tables to keep sets of images
local catImages  = {} -- For all the images of our character
local instrImages  = {} -- For all the images of our instructions

-- Static variables that won't be changed by game
local INSTRUCTIONNUM = 15 -- the number of the instructions before the game ends

-- variables to keep game stats
local instructionCount = 0 -- the number of shown instructions to know how many instructions player finished/failed
local currentInstruction = 'idle' -- the current instruction to compare with player's gesture

-----------------------------------------------------------------------------------------
-- Load game for the first time
-----------------------------------------------------------------------------------------
function setPlayScene()
	-- Part1: reset game stats
	setGameStats()
	-- Part1: load a background
	loadSceneBackground()

	-- Part2: load all backgrounds
	-- loadBackgrounds()
	-- Part2: hide all backgrounds
	-- hideBackgrounds()
	-- Part2: display a random one
	-- displayRandomBackground()

	-- Part1: load all the character poses into catImages
	loadAllCatPoses()
	hideAllCatPoses()

	-- Part1: display the idle character lose
	displayCat("idle")

	-- Part2: load lives images
	-- loadLives()
	-- hideLives()
	-- Part2: display the max number of lives - LIVESNUM
	-- displayLives()

	-- load music by saving the value returned by the loadMusic() into sound variable
	-- sound = loadMusic() 
	-- start playing music
	-- audio.play(sound)
	
	-- Part1: load all instruction images into instrImages 
	loadAllInstructions()
	hideAllInstructions()
	-- Part1: display our first ramdom instruction, save it into currentInstruction
	displayRandInstruction()
	
	-- Part2: create and hide the restart button
	--createRestartButton()

	-- Part2: load all info images into textImages
	-- loadAllInfoImages()
	-- hideAllInfoImages()
	-- Part2: display one informational image that explains how to olay the game and hide it after ANIMTIME 
	-- displayInfoImage("info")

	-- Part1: creeate a swipe listener for player's touches
	createSwipeListener() 
end

function createSwipeListener()
	--[[ 
	-- create a new Rectangle in the middle of the screen with the size of the screen, save it into touchRect
	-- add it to touchGroup display group
	touchRect = display.newRect(touchGroup, 0, 0, display.contentWidth, display.contentHeight )
	-- position it in the middle
	touchRect.anchorX = 0
	touchRect.anchorY = 0
	-- change it's alpha to 0 to make it transparent
	touchRect.alpha = 0
	-- set the parameter isHitTestable to true to make sure ot still resieves hits wile transparent
	touchRect.isHitTestable = true
	-- add a "touch" event listener with a name playerSwipeEvent
	touchRect:addEventListener("touch", playerSwipeEvent)
	]]
end

-----------------------------------------------------------------------------------------
-- Reset the game stats before the level
-----------------------------------------------------------------------------------------
function setGameStats()
	instructionCount = 0;
end

-----------------------------------------------------------------------------------------
-- Set the stage
-----------------------------------------------------------------------------------------
function loadSceneBackground()
	-- Load background image
	
	-- Position it
	
	-- Resize it
end

-----------------------------------------------------------------------------------------
-- Set the character
-----------------------------------------------------------------------------------------

function loadAllCatPoses()
	--- load each one character image separately and put it into catImages table with a relevant key

	-- Iterate through catImages table and position and resize each image
end

function hideAllCatPoses()
	-- Iterate through catImages table and hide each one
end

function displayCat(pose)
	-- Make the relevant character pose visible using "pose" paraneter as a key
end

-----------------------------------------------------------------------------------------
-- Set the instructions
-----------------------------------------------------------------------------------------

function loadAllInstructions() 

	-- load each one instruction image separately and put it into instrImages table with a relevant key
	--[[
	local instUp = display.newImage(instructionsGroup, "img/icons/upSw.png")
	instrImages["up"] = instUp

	local instDown = display.newImage(instructionsGroup, "img/icons/downSw.png")
	instrImages["down"] = instDown

	local instLeft = display.newImage(instructionsGroup, "img/icons/leftSw.png")
	instrImages["left"] = instLeft

	local instRight = display.newImage(instructionsGroup, "img/icons/rightSw.png")
	instrImages["right"] = instRight

	-- Iterate through instrImages table and position and resize each image
	for k in pairs(instrImages) do
		instrImages[k].x = display.contentWidth/1.3
		instrImages[k].y = display.contentHeight/2
		instrImages[k]:scale(0.8, 0.8)
	end
	]]
end

function hideAllInstructions() 
	--[[
	-- Iterate through instrImages table and hide each one
	for k in pairs(instrImages) do
		instrImages[k].isVisible = false
	end
	]]
end


function displayRandInstruction()
	-- create an indexed instructionKeys table that holds keys for instrImages
	--local instructionKeys = {"up", "down", "right", "left"}
	-- create a local variable i to hold a random number from 1 to 4

	-- create a local variable key to hold a random element from instructionKeys using random i as an index


	-- make a random element of instrImages visible using  variable key as a key

	-- save used key into currentInstruction

	-- add one to instructionCount to count this instruction

end

-----------------------------------------------------------------------------------------
-- Events
-----------------------------------------------------------------------------------------
function playerSwipeEvent(event)
	-- check the phase of the event
		-- create a local variable result to keep the direction of the swipe
		-- if the x coordinate of event changed, we are dealing with a horizontal swipe
			-- if the x coordinate at the end is smaller, we are dealing with swipe to the left
				-- save string "left" to the result variable
			-- else the x coordinate at the end is bigger, we are dealing with swipe to the right
				-- save string "right" to the result variable
		-- else we are dealing with a vertical swipe
			-- if the y coordinate at the end is smaller, we are dealing with swipe up
				-- save string "up" to the result variable
			-- else the y coordinate at the end is bigger, we are dealing with swipe down
				-- save string "down" to the result variable
		-- Calculate the result, giving the function calculateResult the variable result as a parameter
end

function calculateResult(result)
	-- Hide all character images and instructions
	-- If it wasn't the last instruction - game continues
		-- if the result is the same as currentInstruction, we have a right gesture
			-- Display a character in the same position as a currentInstruction (instructions and character images have the same keys)
			-- Display another ramdom instruction
		-- else (the result is not the same as currentInstruction)
			-- display character falling
			-- stop playing music
	-- Else it was a last instruction and game ends
		-- Remove the listener
		-- stop audio
		-- if the result is the same as currentInstruction, we have a right gesture
			-- Display a character in the same position as a currentInstruction (instructions and character images have the same keys)
		-- else (the result is not the same as currentInstruction)
			-- display character falling
end

-----------------------------------------------------------------------------------------
-- Sound function
-----------------------------------------------------------------------------------------
function loadMusic()
	-- create a local variable i in the range from 1 to 3
	local i = math.random(1,3)

	-- create a local indexed table musicNames with strings that contain names of compositions in sound folder
	local musicNames = {"track1.wav","track2.wav","track3.wav"}

	-- create a local variable soundtrack
	-- take one composition from the musicNames with index i and use it as a name of file in audio.loadSound function
	-- don't forget to set {loops = -1,} when you loading your sound
	local soundtrack = audio.loadSound("sounds/"..musicNames[i],{loop=-1})

	-- return this soundtrack variable
	return  soundtrack 
end


setPlayScene()