local love = require("love")
local anim = require("lib.animation")
local anim8

local player

function love.load()
    anim8 = require('lib.anim8')
    love.graphics.setDefaultFilter("nearest", "nearest")

    player = {}
    player.x = 400
    player.y = 200
    player.spriteSheet = love.graphics.newImage('assets/spritesheet/Player_SpriteSheet.png')
    player.grid = anim8.newGrid(
        16, 16, 
        player.spriteSheet:getWidth(), 
        player.spriteSheet:getHeight()
    )
    player.animations = {}
    player.animations.walk = anim8.newAnimation(player.grid('1-4', 2), 0.1)
end

function love.update(dt)
    player.animations.walk:update(dt)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    love.graphics.setBackgroundColor(0.47, 0.47, 0.47,1)
    player.animations.walk:draw(player.spriteSheet, player.x, player.y, nil, 5)
end
