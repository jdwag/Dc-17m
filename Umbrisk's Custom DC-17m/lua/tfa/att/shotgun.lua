if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Shotgun Attachment"
ATTACHMENT.ShortName = "SG" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["+"],"15 Rounds",
TFA.AttachmentColors["+"],"Fires 5 Pellets",
}
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
		["RPM_Semi"] = 240,
		["Damage"] = function( wep, val) return val * .54 end,
		["NumShots"] = 5,
		["RPM"] = 240,
		["Range"] = 19420,
		["Spread"] = .03,
		["IronAccuracy"] = .03,
		["AmmoConsumption"] = 1,
		["DefaultClip"] = 500,
		["ClipSize"] = 15,
    },
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

