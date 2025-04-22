local RunService = game:GetService("RunService")

local module = {}

function module.server()
	assert(RunService:IsServer(), "Tried to access KnitServer on the client")
	return require(script.KnitServer)
end

function module.client()
	assert(RunService:IsClient(), "Tried to access KnitClient on the server")
	if RunService:IsRunning() then
		local KnitServer = script:FindFirstChild("KnitServer")
		if KnitServer then
			KnitServer:Destroy()
		end
	end
	return require(script.KnitClient)
end

return module
