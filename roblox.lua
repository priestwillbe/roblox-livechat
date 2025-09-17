--[[
                   _
                 *"_"*
        _..._    /`_`\    _..._
      .'     '. | / \ | .'     '.
,    /         ')\^_^/('         \    ,
\`--'  .--.    (_.> <._)    .--.  '--`/
 '.__.'    '._/   \_/   \_.'    '.__.'
             /     _     \
             \  \_/|\_/  /
              \  //^\\  /
               \/`   `\/
                |     |
                |     |
                |     |
                |     |
                |     |
                |     |
                |     |
                |     |
                |     |
                \_.__./
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Socket = WebSocket.connect("ws://localhost:8080") -- change the websocket to your host if you are not running the server on your own machine
local Message;

Socket.OnClose:Connect(function()
    print("lost connection with the websocket")
end)

Socket.OnMessage:Connect(function(msg)
  print(msg)
end)

-- to send data to the websocket
-- Socket:Send("kawaii")

-- here is an example with ui

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "roblox websocket live chat",
    Icon = "server", 
    Author = "zzZ",
    Folder = "zzZ",
})

local Tab = Window:Tab({
    Title = "socket",
    Icon = "bird",
    Locked = false,
})
local Input = Tab:Input({
    Title = "message",
    Desc = "message to send",
    Value = "",
    InputIcon = "bird",
    Type = "Input", 
    Placeholder = "message goes here",
    Callback = function(input) 
      Message = LocalPlayer.Name .. ": " .. input
    end
})

local Button = Tab:Button({
    Title = "send",
    Desc = "send the message to websocket",
    Locked = false,
    Callback = function()
      if Message ~= nil then
        Socket:Send(Message)
      end
    end
})
