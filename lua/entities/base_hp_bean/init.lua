AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

function ENT:SpawnFunction( ply, tr )

	if ( !tr.Hit ) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 25
	local ent = ents.Create( "base_hp_bean" )
	ent:SetPos( SpawnPos + Vector(0,0,-10) )
	ent:Spawn()
	ent:SetSkin(math.random(0,12))
	ent:Activate()
	
	if ShouldSetOwner then
		ent.Owner = ply
	end
	return ent
	
end

----------------
-- Initialize --
----------------
function ENT:Initialize()
	
	self.Entity:SetModel( "models/props/hp/bean.mdl" )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_NOCLIP )
	self.Entity:SetSolid( SOLID_NONE )
	self.Entity:DrawShadow( false )
	self.Entity:SetSkin(math.random(0,12))
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
	print(self.Entity:EntIndex())
end

local removed = {}

function ENT:Think()


if not self:IsValid() or not self.Entity:IsValid() then return end
for k,v in pairs(ents.FindInSphere(self.Entity:GetPos(),20)) do
	if v:IsValid() and v:IsPlayer() and not table.HasValue(removed,tostring(self.Entity:EntIndex())) then
	v:addXP(beanstbl.Points, true, false)
	self.Entity:SetMaterial( "Models/effects/vol_light001", true )
	self:EmitSound( "hpbeans/swoosh.wav" )
	table.insert(removed,tostring(self.Entity:EntIndex()))
	timer.Simple(beanstbl.respawn_time,function() 
	if self.Entity:IsValid() then 
		self.Entity:SetMaterial( "", true )
	end 
	
	for k,v in pairs(removed) do 
		if v == tostring(self.Entity:EntIndex()) then 
			table.remove(removed,k) end 
		end 
	end)
end
end
end