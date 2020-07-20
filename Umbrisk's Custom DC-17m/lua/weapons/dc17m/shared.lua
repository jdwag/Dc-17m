--[[
addons/dc-17m/lua/weapons/remake/shared.lua
--]]
SWEP.Gun							= ("dc17m_rifle_remastered")
if (GetConVar(SWEP.Gun.."_allowed")) != nil then
	if not (GetConVar(SWEP.Gun.."_allowed"):GetBool()) then SWEP.Base = "tfa_blacklisted" SWEP.PrintName = SWEP.Gun return end
end

if ( CLIENT ) then
	SWEP.PrintName	= "DC-17m"
	SWEP.Category	= "Interchangeable DC-17m"
	SWEP.Type	= "DC17m Blaster Rifle"
	SWEP.Manufacturer = "Republic factory"
	SWEP.Author	= "Jdawg"
	SWEP.Slot = 2
	SWEP.SlotPos = 0
end

SWEP.Base							= "tfa_gun_base"
SWEP.Spawnable						= true
SWEP.AdminSpawnable					= true
SWEP.DrawCrosshair					= true
SWEP.DrawCrosshairIS 				= false

--SWEP.DrawAmmo						= true
SWEP.data 							= {}
SWEP.data.ironsights				= 1
SWEP.Secondary.IronFOV				= 60
SWEP.FiresUnderwater 				= true

SWEP.IronInSound 					= nil
SWEP.IronOutSound 					= nil
SWEP.CanBeSilenced					= false
SWEP.Silenced 						= false
SWEP.SelectiveFire					= true
SWEP.DisableBurstFire				= false
SWEP.OnlyBurstFire					= false
SWEP.DefaultFireMode 				= "auto"
SWEP.FireModeName 					= nil
SWEP.DisableChambering 				= true
SWEP.DoMuzzleFlash 					= true
SWEP.CustomMuzzleFlash 				= true
SWEP.MuzzleFlashEffect 				= ""

SWEP.Primary.ClipSize				= 60
SWEP.Primary.DefaultClip			= 500
SWEP.Primary.RPM					= 850
SWEP.Primary.RPM_Burst				= 700
SWEP.Primary.RPM_Semi				= 850
SWEP.Primary.Ammo					= "ar2"
SWEP.Primary.AmmoConsumption 		= 1
SWEP.Primary.Range 					= 26244
SWEP.Primary.RangeFalloff 			= -1
SWEP.Primary.NumShots				= 1
SWEP.Primary.Automatic				= true
SWEP.Primary.BurstDelay				= 0.1
SWEP.Primary.Sound 					= Sound ("weapons/dc17m_br/dc17m_br_fire.ogg");
SWEP.Primary.ReloadSound 			= Sound ("weapons/bf3/heavy.wav");
SWEP.Primary.PenetrationMultiplier 	= 0
SWEP.Primary.Damage					= 65
SWEP.Primary.HullSize 				= 0
SWEP.DamageType 					= nil



SWEP.FireModes = {
	"Auto",
	"Semi",
}

SWEP.IronRecoilMultiplier			= 0.25
SWEP.CrouchRecoilMultiplier			= 0.4
SWEP.JumpRecoilMultiplier			= 1.3
SWEP.WallRecoilMultiplier			= 1.1
SWEP.ChangeStateRecoilMultiplier	= 1.3
SWEP.CrouchAccuracyMultiplier		= 0.81
SWEP.ChangeStateAccuracyMultiplier	= 1.18
SWEP.JumpAccuracyMultiplier			= 2
SWEP.WalkAccuracyMultiplier			= 1.18
SWEP.NearWallTime 					= 0.25
SWEP.ToCrouchTime 					= 0.25
SWEP.WeaponLength 					= 25
SWEP.SprintFOVOffset 				= 5
SWEP.ProjectileVelocity 			= 9

SWEP.ProjectileEntity 				= nil

SWEP.AutoSwitchTo			= true
SWEP.AutoSwitchFrom			= false


SWEP.ViewModel						= "models/bf2017/c_dlt19.mdl"
SWEP.WorldModel						= "models/rcremastered/w_dc-17m.mdl"
SWEP.ViewModelFOV					= 70
SWEP.ViewModelFlip					= false
SWEP.MaterialTable 					= nil
SWEP.UseHands 						= true
SWEP.HoldType 						= "ar2"

SWEP.ShowWorldModel = false

SWEP.BlowbackEnabled 				= true
SWEP.BlowbackVector 				= Vector(0,1)
SWEP.BlowbackCurrentRoot			= 0
SWEP.BlowbackCurrent 				= 0
SWEP.BlowbackBoneMods 				= nil
SWEP.Blowback_Only_Iron 			= true
SWEP.Blowback_PistolMode 			= false
SWEP.Blowback_Shell_Enabled 		= false
SWEP.Blowback_Shell_Effect 			= "None"

SWEP.Tracer							= 0
SWEP.TracerName 					= "effect_sw_laser_blue"
SWEP.TracerCount 					= 1
SWEP.TracerLua 						= false
SWEP.TracerDelay					= 0.01
SWEP.ImpactEffect 					= nil
SWEP.ImpactDecal 					= "FadingScorch"

SWEP.VMPos = Vector(2.3, 0, -3.5)
SWEP.VMAng = Vector(0,0,0)

SWEP.IronSightTime 					= 0.35
SWEP.Primary.KickUp					= 0.2
SWEP.Primary.KickDown				= 0.1
SWEP.Primary.KickHorizontal			= .1
SWEP.Primary.StaticRecoilFactor 	= 0.5
SWEP.Primary.Spread					= .0035
SWEP.Primary.IronAccuracy 			= .002
SWEP.Primary.SpreadMultiplierMax 	= 2
SWEP.Primary.SpreadIncrement 		= .5
SWEP.Primary.SpreadRecovery 		= 0.8
SWEP.DisableChambering 				= true
SWEP.MoveSpeed 						= 1
SWEP.IronSightsMoveSpeed 			= .9

SWEP.IronSightsPos = Vector(-4.36, -4, 1.5)
SWEP.IronSightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(5.226, -2, -2)
SWEP.RunSightsAng = Vector(-22, 35, -22)
SWEP.InspectPos = Vector(8, -4.8, -3)
SWEP.InspectAng = Vector(11.199, 38, 0)



SWEP.ViewModelBoneMods = {
	["v_dlt19_reference001"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 1), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["dc15"] = { type = "Model", model = "models/rcremastered/w_dc-17m.mdl", bone = "v_dlt19_reference001", rel = "", pos = Vector(0.5, 5, 3), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["sniper_blaster"] = { type = "Model", model = "models/rcremastered/weapons/w_dc-17m_sniper.mdl", bone = "v_dlt19_reference001", rel = "",  pos = Vector(0, 5, 3), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false },
["scope"] = { type = "Model", model = "models/rtcircle.mdl", bone = "v_dlt19_reference001", rel = "sniper_blaster", pos = Vector(-1.4, -1.11, 5), angle = Angle(0, 180, 0), size = Vector(0.45, 0.45, 0.45), color = Color(255, 255, 255, 255), surpresslightning = false, material = "!tfa_rtmaterial", skin = 0, bodygroup = {}, active = false },
["explosive_blaster"] = { type = "Model", model = "models/rcremastered/weapons/w_dc-17m_antiarmor.mdl", bone = "v_dlt19_reference001", rel = "",  pos = Vector(0.5, 5, 3), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false },

}


SWEP.WElements = {
	["dc15"] = { type = "Model", model = "models/rcremastered/w_dc-17m.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10, 0, -4.9), angle = Angle(-8, 0, 180), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }, 
["sniper_blaster"] = { type = "Model", model = "models/rcremastered/weapons/w_dc-17m_sniper.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11, 1, -4), angle = Angle(-8, 0, 180), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false },
["explosive_blaster"] = { type = "Model", model = "models/rcremastered/weapons/w_dc-17m_antiarmor.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11, 1, -4), angle = Angle(-8, 0, 180), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, active = false }, 	

}

SWEP.Attachments = {
	[1] = { 
	header = "Modes",
	atts = { "sniper_blaster", "explosive_blaster" , "shotgun"},
	},
}--


SWEP.ThirdPersonReloadDisable		=false
SWEP.RTScopeAttachment				= -1
SWEP.Scoped_3D 						= false
SWEP.ScopeReticule 					= "scope/gdcw_elcanreticle" 
SWEP.Secondary.ScopeZoom 			= 50
SWEP.ScopeReticule_Scale 			= {2.5,2.5}
if surface then
	SWEP.Secondary.ScopeTable = nil
end
local BaseClass = baseclass.Get( SWEP.Base )

