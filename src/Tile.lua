--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Manav Sinha
    manavsinha111@gmail.com

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety,isShiny)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
    self.opacity = 255

    --flag to check if current tile is shiny or not
    self.shiny = isShiny

    if self.shiny then
        Timer.every(1,function()
            Timer.tween(0.5,{
                [self] = {opacity = 150}
            }):finish(function()
                Timer.tween(0.5,{
                    [self] = {opacity = 255}
                })
            end)
        end)
    end
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)
        
    -- draw tile itself
    love.graphics.setColor(255, 255, 255, self.opacity)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
    -- if self.shiny then
    -- end
end