local love = require("love")
function love.conf(t)
    t.window.width = 1280
    t.window.height = 720
    t.window.display = 1
    t.window.resizable = true
    t.console = true
end