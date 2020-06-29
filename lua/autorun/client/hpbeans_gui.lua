if SERVER then return end

local Mat = Material( "vgui/hp/counter.png" )

surface.CreateFont( "BeansFont24", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 24,
	weight = 1000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

hook.Add( "HUDPaint", "beansdrawcounter", function()
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.SetMaterial( Mat )
	surface.DrawTexturedRect(beanstbl.vguiX, beanstbl.vguiY, 140, 140 )
		
	surface.SetFont( "BeansFont24" )
	surface.SetTextColor( 255, 255, 255, 255 )
	local curtextposx = beanstbl.vguiX + 70 - string.len(LocalPlayer():getDarkRPVar("xp")) * 5
	
	surface.SetTextPos( curtextposx, beanstbl.vguiY + 104 )

if (LocalPlayer():getDarkRPVar('level')) then
--[[]	
for i = (((10+(((LocalPlayer():getDarkRPVar('level') or 1)*((LocalPlayer():getDarkRPVar('level') or 1)+1)*90))))*LevelSystemConfiguration.XPMult)/2,(((10+(((LocalPlayer():getDarkRPVar('level') or 1)*((LocalPlayer():getDarkRPVar('level') or 1)+1)*90))))*LevelSystemConfiguration.XPMult)/2  do
	if string.len(tostring(LocalPlayer():getDarkRPVar('xp'))) > i then
		surface.SetTextPos( curtextposx - 5, 114 )
	end
end
--]]
	surface.DrawText( LocalPlayer():getDarkRPVar('xp'))
end
end )
