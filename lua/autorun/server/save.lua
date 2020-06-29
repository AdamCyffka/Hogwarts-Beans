-- CHECK IF DIRECTORY EXISTS
if !file.Exists("hpbeans_save","DATA") then

file.CreateDir("hpbeans_save")

end
-- SAVING
concommand.Add("save_beans",function(ply)

if !ply:IsSuperAdmin() then return false end

local import = {}

if file.Exists("hpbeans_save/"..game.GetMap()..".txt","DATA") then

import = util.JSONToTable(file.Read("hpbeans_save/"..game.GetMap()..".txt","DATA"))

end

for k,v in pairs(ents.FindByClass("base_hp_bean")) do

table.insert(import,v:GetPos())

end

file.Write("hpbeans_save/"..game.GetMap()..".txt",util.TableToJSON(import))

end)


-- LOADING

hook.Add("InitPostEntity","load_hp_beans",function()

if not file.Exists("hpbeans_save/"..game.GetMap()..".txt","DATA") then return end

local spawn = {}


local spawn = util.JSONToTable(file.Read("hpbeans_save/"..game.GetMap()..".txt","DATA"))

for k,v in pairs(spawn) do

local ent = ents.Create("base_hp_bean")
ent:SetPos(v)
ent:Spawn()

end

end)