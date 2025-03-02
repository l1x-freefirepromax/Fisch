task.spawn(function()
    pcall(function()
        local v1, v2 = {items = {}}, {}

        local function v3(v4)
            if not v4 then return end
            v4:WaitForChild("Humanoid", math.huge)
            v4:WaitForChild("HumanoidRootPart", math.huge)

            for _, v5 in pairs(v2) do if v5 then v5:Disconnect() end end
            for _, v6 in pairs(v1.items) do
                if v6.connections then
                    for _, v7 in pairs(v6.connections.taskmanager) do task.cancel(v7) end
                    for _, v8 in pairs(v6.connections.connected) do if v8 then v8:Disconnect() end end
                end
            end

            task.wait(2.5) v1 = {items = {}}
            local v9, v10 = game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui"), workspace.active
            if not v9 then return end

            local function v11(v12, v13)
                local v14 = v12:FindFirstChild(v13)
                if v14 then v14:Destroy() end
            end

            for _, v15 in pairs({"TimeEvent", "HandwrittenNote", "DebugPixels", "WaterTrapDebug", "shutdown", "TopbarCenteredClipped", "TopbarStandardClipped"}) do
                v11(v9, v15)
            end
            v11(v10, "Leaderboards")

            local function v16(v17, v18)
                local v19 = v17:FindFirstChild(v18)
                if not v19 then return end
                for _, v20 in pairs({"inventory", "menu_safezone", "stats_safezone"}) do
                    local v21 = v19:FindFirstChild(v20)
                    if v21 then
                        local v22 = v21:FindFirstChild("scroll")
                        if v22 then
                            v1.items[v18 .. "//" .. v20] = {main_frame = v19, scroll = v22, connections = {}}
                        end
                    end
                end
            end

            local v23 = v9:FindFirstChild("hud") and v9.hud:FindFirstChild("safezone")
            if not v23 then return end

            v16(v23, "backpack")
            v16(v23, "equipment")
            v16(v23, "menu")

            for _, v24 in pairs(v23:GetChildren()) do if v24.Name == "lvlup" then v24:Destroy() end end
        end

        v3(game:GetService("Players").LocalPlayer.Character)
        game:GetService("Players").LocalPlayer.CharacterAdded:Connect(v3)
    end)
end)
