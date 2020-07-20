--[[
addons/dc-17m/lua/autorun/install_tfa_base.lua
--]]
local function checkForTFA()
	if TFA and TFA_BASE_VERSION and TFA_BASE_VERSION >= 4 then return end -- we're 100% good

	if CLIENT then
		Derma_Query(
			"Yo. this gun needs TFA base, get it with the button",
			function() gui.OpenURL("http://steamcommunity.com/workshop/filedetails/?id=415143062") end
		)
	else
		print("#################### YO!!! ####################")
		print("Guns need dat TFA Base.")
		print("http://steamcommunity.com/workshop/filedetails/?id=415143062")
		print("####################################################")
	end
end

hook.Add("InitPostEntity", "INSTALL TFA BASE", checkForTFA)

