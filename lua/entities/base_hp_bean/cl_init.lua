include('shared.lua')

--local spheremat = Material("models/wireframe")

function ENT:Draw()
	
	self.Entity:DrawModel()
	--render.SetMaterial(spheremat)
	--render.DrawSphere( self.Entity:GetPos() + Vector(0,0,15), 30, 50, 50, Color(0,255,0,255) )
end

local speed = 80
function ENT:Think()
	local ang = self:GetAngles()
	ang:RotateAroundAxis(self:GetUp(), FrameTime()*speed)
	self:SetAngles(ang)
	
end