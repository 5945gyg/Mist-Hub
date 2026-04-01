if not script_key then print("script_key was not found") return end
if not script_id then print("script_id was not found") return end

repeat task.wait() until game:IsLoaded()

local LocalPlayer = game:GetService("Players").LocalPlayer
local ScriptContext = game:GetService("ScriptContext")

local success, response = pcall(function()
    pcall(function()
        if getconnections then
            for i,v in getconnections(ScriptContext.Error) do
                v:Disable()
            end
        end
    end)
    loadstring(game:HttpGet(string.format("https://api.luarmor.net/files/v4/loaders/%s.lua", script_id)))()
end)

if not success then
    return LocalPlayer:Kick("[Mist Hub] Failed to load script. Error message: " .. response) 
end