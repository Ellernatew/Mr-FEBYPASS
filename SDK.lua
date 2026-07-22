local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
while LocalPlayer == nil do
    Players.ChildAdded:Wait()
    LocalPlayer = Players.LocalPlayer
end
function SendFriendRequest(player)
    if player == LocalPlayer then return end
    RbxAnalyticsService:ReportCounter("FriendPlayerPrompt-RequestFriendship")
    RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "FriendPlayerPrompt")
    pcall(function()
        LocalPlayer:RequestFriendship(player)
    end)
end
RunService.Heartbeat:Connect(function()
    for _, player in ipairs(Players:GetPlayers()) do
        SendFriendRequest(player)
    end
end)
