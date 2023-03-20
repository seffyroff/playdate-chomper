local gfx <const> = playdate.graphics
local maze = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 1},
    {1, 0, 1, 0, 1, 0, 1, 1, 0, 1},
    {1, 0, 1, 0, 0, 0, 1, 0, 0, 1},
    {1, 0, 1, 1, 1, 1, 1, 0, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
}
local tileSize = 40
-- draw player using circle
local player = {
    x = 0,
    y = 0,
    sprite = gfx.sprite.create(20, 20, gfx.kColorYellow)
}

local finish = {
    x = 0,
    y = 0,
    sprite = gfx.sprite.create(20, 20, gfx.kColorRed)
}

-- draw maze
function DrawMaze()
    -- draw maze
    for i = 1, #maze do
        for j = 1, #maze[i] do
            if maze[i][j] == 1 then
                gfx.fillRect((j - 1) * tileSize, (i - 1) * tileSize, tileSize, tileSize)
            end
        end
    end
end
-- 
-- draw player
function DrawPlayer()
    -- draw player
    if player then
        gfx.sprite.draw(player.sprite, player.x, player.y)
    end
end
-- 
-- draw end
function DrawEnd()
    -- draw end
    if finish then
        gfx.sprite.draw(finish.sprite, finish.x, finish.y)
    end
end
-- 
-- draw
-- function playdate.update()
--     drawMaze()
--     drawPlayer()
--     drawEnd()
-- end


-- -- Path: source\main.lua
-- -- Common CoreLibs imports.
-- import "CoreLibs/object"
-- import "CoreLibs/graphics"
-- import "CoreLibs/sprites"
-- import "CoreLibs/timer"

-- -- Project imports
-- import "button"
-- import "crank"
-- import "lifecycle"
-- import "simulator"
-- import "game"

-- -- Use common shorthands for playdate code
-- local gfx <const> = playdate.graphics

-- --- By convention, most games need to perform some initial setup when they're
-- --- initially launched. Perform that setup here.
-- ---
-- --- Note: This will be called exactly once. If you're looking to do something
-- --- whenever the game is resumed from the background, see playdate.gameWillResume
-- --- in lifecycle.lua
-- local function gameDidLaunch()
--     print(playdate.metadata.name .. " launched!")

--     gfx.setBackgroundColor(gfx.kColorBlack)
-- end
-- gameDidLaunch()

-- --- This update method is called once per frame.
-- function playdate.update()
--     -- Example code. Draw a full-screen rectangle and the frames per second
--     gfx.fillRect(0, 0, 400, 240)
--     playdate.drawFPS(0,0)

--     -- Update and draw all sprites. Calling this method in playdate.update
--     -- is generally what you want, if you're using sprites.
--     -- See https://sdk.play.date/1.9.3/#f-graphics.sprite.update for more info
--     gfx.sprite.update()

--     -- Update all timers once per frame.
