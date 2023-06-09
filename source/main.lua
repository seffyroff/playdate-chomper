-- Common CoreLibs imports.
import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

-- Toybox imports
import "../toyboxes/toyboxes.lua"


-- Project imports
import "button"
import "crank"
import "lifecycle"
import "simulator"

-- Use common shorthands for playdate code
local gfx <const> = playdate.graphics

--- By convention, most games need to perform some initial setup when they're
--- initially launched. Perform that setup here.
---
--- Note: This will be called exactly once. If you're looking to do something
--- whenever the game is resumed from the background, see playdate.gameWillResume
--- in lifecycle.lua
local function gameDidLaunch()
    print(playdate.metadata.name .. " launched!")

    gfx.setBackgroundColor(gfx.kColorBlack)
end
gameDidLaunch()

local tilemap
function setup()
    LDtk.load("images/chomper-1.ldtk")
    tilemap = LDtk.create_tilemap("Level_0")
    local layerSprite = gfx.sprite.new()
    layerSprite:setTilemap(tilemap)
    layerSprite:Add()
    local collisionTiles = LDtk.get_empty_tileIDs("Level_0", "Wall", "Tiles")
    if collisionTiles then
        playdate.graphics.sprite.addWallSprites(tilemap, collisionTiles)
    end
end

setup()

--- This update method is called once per frame.
function playdate.update()
    -- Example code. Draw a full-screen rectangle and the frames per second
    gfx.fillRect(0, 0, 400, 240)
    playdate.drawFPS(0,0)
    tilemap:draw(0,0)
    -- Update and draw all sprites. Calling this method in playdate.update
    -- is generally what you want, if you're using sprites.
    -- See https://sdk.play.date/1.9.3/#f-graphics.sprite.update for more info
    gfx.sprite.update()
    
    -- Update all timers once per frame. This is required if you're using
    -- timers in your game.
    -- See https://sdk.play.date/1.9.3/#f-timer.updateTimers for more info
    playdate.timer.updateTimers()
end
