--[[
addons/dc-17m/lua/tfa/att/sniper_blaster.lua
--]]
if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Sniper Attachment"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "8 Rounds", 
TFA.AttachmentColors["+"], "462% Damage Boost",
TFA.AttachmentColors["-"], "Slower Firerate" }
ATTACHMENT.Icon = "entities/tfa_swch_dc17m_s.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "SB"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["sniper_blaster"] = {
			["active"] = true
		},
		["scope"] = {
			["active"] = true
		},
		["dc15"] = {
			["active"] = false
		}
	},
	["WElements"] = {
		["sniper_blaster"] = {
			["active"] = true
		},
		["dc15"] = {
			["active"] = false
		}
	},
	["IronSightsPos"] = Vector(-4.825, -10, 0.65),
	["IronSightsAng"] = Vector(0, 0, 0),
	["IronSightTime"] = function( wep, val ) return val * 1.20 end,
	["IronSightMoveSpeed"] = 0.8,
	["RTOpaque"] = true,
	["RTMaterialOverride"] = -1,
	["RTScopeAttachment"] = -1,
	["ScopeReticule_Scale"] = {1,1},
	["RunSightsPos"] = Vector(5.226, -2, 0),
    ["RunSightsAng"] = Vector(-22, 35, -22),
    ["InspectPos"] = Vector(8, -4.8, -3),
    ["InspectAng"] = Vector(11.199, 38, 0),

["Primary"] = {
		["RPM_Semi"] = 150,
		["ClipSize"] = 8,
		["IronAccuracy"] = function( wep, val) return val * .8 end,
		["Damage"] = function( wep, val) return val * 4.62 end,
		["DefaultClip"] = 500,
		["RPM"] = 150,
		["Spread"] = 0,
		["Range"] = 56162,
		["Sound"] = "weapons/bf3/e11_heavy.wav",
		
		
	},
	["CanJam"] = true,
	["JamChance"] = 0,
}


local cd = {}

local myret
local myshad
local debugcv = GetConVar("cl_tfa_debug_rt")

ATTACHMENT.FOV = 100
ATTACHMENT.Reticule = "#sw/visor/sw_ret_redux_blue"


function ATTACHMENT:Attach(wep)
	if not IsValid(wep) then return end
	wep.RTCodeOld = wep.RTCodeOld or wep.RTCode
	wep.RTCode = function( myself , rt, scrw, scrh)
		if not IsValid(myself.Owner) then return end
		local rttw, rtth
		rttw = ScrW()
		rtth = ScrH()
		local att, ts
		if wep:VMIV() then
			att = wep.OwnerViewModel:GetAttachment( wep.RTAttachment_E11 or 0 )
		end
		if att and att.Pos then
			if not wep.LastOwnerPos then
				wep.LastOwnerPos = wep.Owner:GetShootPos()
			end

			local owoff = wep.Owner:GetShootPos() - wep.LastOwnerPos
			wep.LastOwnerPos = wep.Owner:GetShootPos()
			local pos = att.Pos - owoff
			ts = pos:ToScreen()
		end
		if not myret then
			myret = Material( self.Reticule )
		end
		if not myshad then
			myshad = Material( "vgui/scope_shadowmask_test")
		end

		local ang = myself.Owner:EyeAngles()
		if wep.ScopeAngleTransforms_E11 then
			ang:RotateAroundAxis(ang:Right(), wep.ScopeAngleTransforms_E11.p )
			ang:RotateAroundAxis(ang:Up(), wep.ScopeAngleTransforms_E11.y )
			ang:RotateAroundAxis(ang:Forward(), wep.ScopeAngleTransforms_E11.r )
		end
		cd.angles = ang
		cd.origin = myself.Owner:GetShootPos()
		cd.x = 0 
		cd.y = 10
		cd.w = 512
		cd.h = 512
		cd.fov = 4
		cd.drawviewmodel = false
		cd.drawhud = false
		render.Clear(0, 0, 0, 255, true, true)
		if myself.CLIronSightsProgress > 0.005 then
			render.RenderView(cd)
		end
		cam.Start2D()
		if ts then
			local scrpos = ts

			scrpos.x = scrpos.x / scrw
			scrpos.y = scrpos.y / scrh

			scrpos.x = scrpos.x - 0.5
			scrpos.y = scrpos.y - 0.5
			if wep.ScopeOverlayTransforms_E11 then
				scrpos.x = scrpos.x + wep.ScopeOverlayTransforms_E11[1]
				scrpos.y = scrpos.y + wep.ScopeOverlayTransforms_E11[2]
			end
			scrpos.x = scrpos.x * rttw
			scrpos.y = scrpos.y * rtth
			scrpos.x = math.Clamp(scrpos.x, -1024, 1024)
			scrpos.y = math.Clamp(scrpos.y, -1024, 1024)

			if wep.ScopeOverlayTransformMultiplier_E11 then
				scrpos.x = scrpos.x * wep.ScopeOverlayTransformMultiplier_E11
				scrpos.y = scrpos.y * wep.ScopeOverlayTransformMultiplier_E11
			end

			if not self.scrpos then
				self.scrpos = scrpos
			end

			self.scrpos.x = math.Approach(self.scrpos.x, scrpos.x, (scrpos.x - self.scrpos.x) * FrameTime() * 10)
			self.scrpos.y = math.Approach(self.scrpos.y, scrpos.y, (scrpos.y - self.scrpos.y) * FrameTime() * 10)
			scrpos = self.scrpos

			local rtow, rtoh = 0, 0
			if wep.RTScopeOffset_E11 then
				rtow = self.RTScopeOffset_E11[1] * rttw
				rtoh = self.RTScopeOffset_E11[2] * rtth
			end
			local rtw, rth = rttw * 1, rtth * 1
			if self.RTScopeScale_E11 then
				rtw = rtw * self.RTScopeScale_E11[1]
				rth = rth * self.RTScopeScale_E11[2]
			end
			local distfac = math.pow( 1 - math.Clamp( ( att.Pos:Distance( wep.Owner:GetShootPos() ) - ( wep.ScopeDistanceMin_E11 or 2 ) ) / ( wep.ScopeDistanceRange_E11 or 10 ), 0, 1 ), 1 )
			rtw = Lerp( distfac, rtw * 0.1, rtw * 2 )
			rth = Lerp( distfac, rth * 0.1, rth * 2 )
			local cpos = Vector( -scrpos.x + rttw / 2, -scrpos.y + rtth / 2, 0 )
			cpos.x = math.Round(cpos.x)
			cpos.y = math.Round(cpos.y)

			surface.SetMaterial(myret)
			surface.SetDrawColor(color_white)
			if debugcv and debugcv:GetBool() then
				surface.DrawTexturedRect( rttw / 2 - rtw / 4 + rtow, rtth / 2 - rth / 4 + rtoh, rtw / 2, rth / 2)
			else
				surface.DrawTexturedRect( cpos.x - rtw / 4 + rtow, cpos.y - rth / 4 + rtoh, rtw / 2, rth / 2)

				surface.SetMaterial(myshad)
				surface.SetDrawColor(color_white)
				surface.DrawTexturedRect( cpos.x - rtw / 2, cpos.y - rth / 2, rtw, rth )

				surface.SetDrawColor(color_black)
				surface.DrawRect( cpos.x - rtw / 15 - 2047, cpos.y - 1024, 2048, 2048)
				surface.DrawRect( cpos.x + rtw / 15 - 1, cpos.y - 1024, 2048, 2048)
				surface.DrawRect( cpos.x - 1024, cpos.y - rtw / 5 - 2047, 2048, 2048)
				surface.DrawRect( cpos.x - 1024, cpos.y + rtw / 5 - 1, 2048, 2048)
			end
		else
			surface.SetMaterial(myret)
			surface.SetDrawColor(color_white)
			surface.DrawTexturedRect(0,0,rttw,rtth)
			surface.SetMaterial(myshad)
			surface.SetDrawColor(color_white)
		end
		surface.SetDrawColor(ColorAlpha(color_black, 255 * (1 - myself.CLIronSightsProgress)))
		surface.DrawRect(0, 0, scrw, scrh)
		cam.End2D()
	end
wep:Unload()
end


function ATTACHMENT:Detach(wep)
	if not IsValid(wep) then return end
	wep.RTCode = wep.RTCodeOld
	wep.RTCodeOld = nil
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end


