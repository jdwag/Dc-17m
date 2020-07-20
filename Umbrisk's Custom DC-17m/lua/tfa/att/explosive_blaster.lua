--[[
addons/dc-17m/lua/tfa/att/explosive_blaster.lua
--]]
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Anti-Armor Attachment"
ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "923% Damage Boost",
TFA.AttachmentColors["-"], "1 Round", 
 }

ATTACHMENT.ShortName = "EX"

ATTACHMENT.Icon = "entities/tfa_swch_dc17m_a.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.Damage = 5

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["explosive_blaster"] = {
			["active"] = true
		},
		["dc15"] = {
			["active"] = false
		}
	},
	["WElements"] = {
		["explosive_blaster"] = {
			["active"] = true
		},
		["dc15"] = {
			["active"] = false
		}
	},
	["Primary"] = {
		["Damage"] = function( wep, val) return val * 9.23 end,
		["ClipSize"] = 1,
		["DefaultClip"] = 500,
		["RPM"] = 100,
		["RPM_Burst"] = 50,
		["Spread"] = .02,
		["Range"] = 39366,
		["Sound"] = "weapons/bf3/e11_heavy.wav",
		["DamageTypeHandled"] = true,
		["DamageType"] = DMG_BLAST,
		["AmmoConsumption"] = 1,
		["Ammo"] = "ar2"
		
	},
	["TracerName"] = "effect_sw_laser_blue",
	["ImpactEffect"] = "Explosion",
	["MoveSpeed"] = 1,
	--["ImpactDecal"] = "Explosion",
	["CanJam"] = false,
}

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end



