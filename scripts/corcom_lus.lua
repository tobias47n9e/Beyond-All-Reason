--BASE PIECES:
local pelvis, torso, head, luparm, nanogun, nanospray, mlasflsh, ruparm, biggun, bigflsh, rthigh, rleg, rfoot, lthigh, lleg, lfoot = piece("pelvis", "torso", "head", "luparm", "nanogun", "nanospray", "mlasflsh", "ruparm", "biggun", "bigflsh", "rthigh", "rleg", "rfoot", "lthigh", "lleg", "lfoot")
local ground = piece("ground")
--shieldpiece
local shield = piece("shield")
--LVL1 : 
local pelvis1, torso1, head1, luparm1, nanogun1, nanospray1, mlasflsh1, ruparm1, biggun1, bigflsh1, rthigh1, rleg1, rfoot1, lthigh1, lleg1, lfoot1 = piece("pelvis1", "torso1", "head1", "luparm1", "nanogun1", "nanospray1", "mlasflsh1", "ruparm1", "biggun1", "bigflsh1", "rthigh1", "rleg1", "rfoot1", "lthigh1", "lleg1", "lfoot1")

--LVL2 :
local torso2 = piece("torso2")

--LVL3:
local nanogun3, nanospray3, mlasflsh3 = piece("nanogun3", "nanospray3", "mlasflsh3")

--LVL4:
local biggun4, bigflsh4 = piece("biggun4", "bigflsh4")

--LVL5:
local rthigh5, lthigh5, rleg5, lleg5, rfoot5, lfoot5 = piece("rthigh5", "lthigh5", "rleg5", "lleg5", "rfoot5", "lfoot5")
--MovePelvisY+5

--Pieces to hide at level 1 (spawn)
lvl1hides = {}
lvl1hides = {rthigh5, lthigh5, rleg5, lleg5, rfoot5, lfoot5, biggun4, bigflsh4, nanogun3, nanospray3, mlasflsh3, torso2}

--Stats Tables:
--Weapon: Laser
Range = {300,375,430,430,475,525,575,630,700,800,1000}
AOE = {12,12,12,16,16,16,24,24,24,32,32}
ReloadTime = {0.4,0.4,0.4,0.2,0.2,0.2,0.2,0.2,0.2,0.2,0.2}
Damages = {75,75,125,125,125,150,150,200,200,250,250}
--Weapon:SeaLaser
Range2 = {300,375,430,430,475,525,575,630,700,800,1000}
AOE2 = {12,12,12,16,16,16,24,24,24,32,32}
ReloadTime2 = {1,1,1,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5}
Damages21 = {75*2,75*2,125*2,125*2,125*2,150*2,150*2,200*2,200*2,250*2,250*2}
Damages22 = {0.5,0.5,0.5,0.75,0.75,0.75,1,1,1,1,1}
--Weapon:Dgun
ReloadTime3 = {0.9,0.9,0.8,0.8,0.7,0.7,0.6,0.6,0.6,0.5,0.4}
--Speeds
BuildSpeed = {300,325,350,400,450,500,550,600,700,800,900}
MoveSpeed = {1.25,1.275,1.3,1.35,1.40,1.45,1.5,1.5,1.5,1.5,1.5}
--Armor/hp
ShieldPower = {1000,1250,1500,2000,2500,3000,4000,4000,4000,4000,4000}
HealOnLevelUp = {0,250,250,500,500,500,500,500,500,500,500}
DamageMultiplierNoDgun = {1,1,1,1,1,1,0.9,0.8,0.7,0.6,0.5}
--Vision
LOS = {450,500,550,600,625,650,675,700,725,750,800}
Sonar = {450,450,500,500,550,550,600,600,650,650,700}
Radar = {700,700,800,1000,1200,1400,1600,2000,2400,2800,3200}

local SIG_WALK = 2
local PlaySoundFile 	= Spring.PlaySoundFile
local GetUnitPosition 	= Spring.GetUnitPosition
local GetGameFrame 		= Spring.GetGameFrame
common = include("headers/common_includes_lus.lua")

function Emit(pieceName, effectName)
local x,y,z,dx,dy,dz	= Spring.GetUnitPiecePosDir(unitID, pieceName)
Spring.SpawnCEG(effectName, x,y,z, dx, dy, dz)
end

function move(piece, axis, goal, speed)
if speed then
	Move(piece, axis, goal,speed*currentSpeed/100)
else
	Move(piece, axis, goal)
end
end

function turn(piece, axis, goal, speed)
if speed then
	Turn(piece, axis, math.rad(goal), math.rad(speed)*currentSpeed/100)
else
	Turn(piece, axis, math.rad(goal))
end
end



function UnitSpeed()
	while (true) do
		vx,vy,vz,Speed = Spring.GetUnitVelocity(unitID)
		currentSpeed = Speed*100*30/moveSpeed
		if (currentSpeed < 35) then currentSpeed = 35 end
		local mm, mu, em, eu = Spring.GetUnitResources(unitID)
		local null, fxp = Spring.GetUnitExperience(unitID)
		local movexp = (Speed or 0) * 0.000005
		local xptoadd = (mm * 0.00000005) + (mu * 0.0000005) + ((em/60) * 0.00000005) + ((eu/60)*0.0000005) + movexp
		Spring.SetUnitExperience(unitID, null + xptoadd)
		randomness = math.random(-10,10)
		currentSpeed = currentSpeed + randomness
		Sleep (1)
	end
end

function MotionControl()
	justmoved = true
	while (true) do
	-- Spring.Echo(dgunning)
	-- Spring.Echo(aiming)
		if (moving) then
			-- Spring.Echo("moving")
			dgunning = false
			if (aiming) then
				walklegs()
			else
				walk()
			end
			justmoved = true
		else
			if( justmoved ) then
					move(pelvis , 2, 0)
					turn(pelvis , 1, 0, 50)
					turn(lthigh , 1, 0, 40)
					turn(rthigh , 1, 0, 40)
					turn(torso , 2,0, 10)
					turn(rleg , 1, 0, 180)
					turn(lleg , 1, 0, 180)
				if not (aiming) then
					turn(ruparm , 1, 0, 20)
					turn(luparm , 1, 0, 20)
					turn(nanogun , 1, 0,20)
					turn(biggun , 1, 0,20)
				end
				justmoved = false
			end
			Sleep (100)
		end
		Sleep (1)
	end
end

function script.Create()
for ct, piecenum in pairs (lvl1hides) do
	Hide(piecenum)
end
	-- for i = 1, #UnitDefs[Spring.GetUnitDefID(unitID)].weapons do
		-- Spring.Echo(i.." "..WeaponDefs[UnitDefs[Spring.GetUnitDefID(unitID)].weapons[i].weaponDef].name)
	-- end
-- Stats = {
-- bp=UnitDefs[Spring.GetUnitDefID(unitID)].buildSpeed,
-- Range = 300,
-- msec=UnitDefs[Spring.GetUnitDefID(unitID)].metalMake,
-- esec=UnitDefs[Spring.GetUnitDefID(unitID)].energyMake,
-- los=UnitDefs[Spring.GetUnitDefID(unitID)].losRadius,
-- airlos=UnitDefs[Spring.GetUnitDefID(unitID)].airLosRadius,
-- radar=UnitDefs[Spring.GetUnitDefID(unitID)].radarRadius,
-- sonar=UnitDefs[Spring.GetUnitDefID(unitID)].sonarRadius,
-- armor=1,
-- }
	level = 0
	-- side = math.random(0,1)
	randomness = math.random(-25,25)
	-- addheight = 0
	Hide (bigflsh)
	Hide (mlasflsh)
	-- Turn (mlasflsh, 1 , (1/(6.28*8))*90 )
	-- Move (mlasflsh, 1 , 0.5 )
	-- Move (mlasflsh, 3 , 0.25 )
	-- Turn (bigflsh, 1 , (1/(6.28*8))*90 )
	-- Move (bigflsh, 1 , 0.5 )
	-- Move (bigflsh , 2 , -0.35 )
	Hide (nanospray)
	moving = false
	aiming = false
	building = false
	justfired = false
	dgunning = false
	buildy = 0
	buildx = 0
	moveSpeed = UnitDefs[Spring.GetUnitDefID(unitID)].speed
	currentSpeed = 100
	Spring.UnitScript.StartThread(MotionControl)
	Spring.UnitScript.StartThread(UnitSpeed)
	Spring.UnitScript.StartThread(HandleLevelUps)
	Spring.SetUnitNanoPieces(unitID, {mlasflsh})
end

function HandleLevelUps()
while(true) do
local null, fxp = Spring.GetUnitExperience(unitID)
local realxp = 10 * fxp
-- Spring.Echo(level)
if realxp > 10 and level == 10 then
LevelUpModel(10)
LevelUpStats(10)
elseif realxp > 9 and level == 9 then
LevelUpModel(9)
LevelUpStats(9)
elseif realxp > 8 and level == 8 then
LevelUpModel(8)
LevelUpStats(8)
elseif realxp > 7 and level == 7 then
LevelUpModel(7)
LevelUpStats(7)
elseif realxp > 6 and level == 6 then
LevelUpModel(6)
LevelUpStats(6)
elseif realxp > 5 and level == 5 then
LevelUpModel(5)
LevelUpStats(5)
elseif realxp > 4 and level == 4 then
LevelUpModel(4)
LevelUpStats(4)
elseif realxp > 3 and level == 3 then
LevelUpModel(3)
LevelUpStats(3)
elseif realxp > 2 and level == 2 then
LevelUpModel(2)
LevelUpStats(2)
elseif realxp > 1 and level == 1 then
LevelUpModel(1)
LevelUpStats(1)
elseif realxp >= 0 and level == 0 then
LevelUpModel(0)
LevelUpStats(0)
end
Sleep(1)
end
end

function switchpieces(piecenum1, piecenum2)
Hide(piecenum1)
Show(piecenum2)
end

function LevelUpStats(curLevel)
	level = curLevel + 1
	Spring.SetUnitMaxRange(unitID, Range[level])
	for i = 23, 29 do
	-- if UnitDefs[Spring.GetUnitDefID(unitID)].weapons[i] then
		-- Spring.Echo(WeaponDefs[UnitDefs[Spring.GetUnitDefID(unitID)].weapons[i].weaponDef].name)
	-- end
		if i - 22 == level - 1 or (i == 29 and i - 22 <= level -1) then	
			Spring.SetUnitShieldState(unitID, i, true)
		else
			-- Spring.Echo(i)
			Spring.SetUnitShieldState(unitID, i, false)
		end
	end
	for i = 1,11 do
		Spring.SetUnitWeaponState(unitID,i, "range", Range[level])
		-- Spring.SetUnitWeaponDamages(unitID,i, "damageAreaOfEffect", AOE[level])
		-- Spring.SetUnitWeaponState(unitID,i, "reloadTime", ReloadTime[level])
	end
	for i = 12,22 do
		Spring.SetUnitWeaponState(unitID,i, "range", Range2[level])
		-- Spring.SetUnitWeaponDamages(unitID,i, "damageAreaOfEffect", AOE2[level])
		-- Spring.SetUnitWeaponState(unitID,i, "reloadTime", ReloadTime2[level])
	end
	Spring.SetUnitWeaponState(unitID,30, "reloadTime", ReloadTime3[level])
	Spring.SetUnitBuildSpeed(unitID, BuildSpeed[level], BuildSpeed[level], BuildSpeed[level]*0.7)
	Spring.SetUnitSensorRadius(unitID,"los", LOS[level])
	Spring.SetUnitSensorRadius(unitID,"airLos",LOS[level])
	Spring.SetUnitSensorRadius(unitID,"radar",Radar[level])
	Spring.SetUnitSensorRadius(unitID,"sonar",Sonar[level])
	Spring.MoveCtrl.SetGroundMoveTypeData(unitID, "maxSpeed", MoveSpeed[level]*30)
	curHP = Spring.GetUnitHealth(unitID)
	-- Spring.Echo(maxhealth)
	Spring.SetUnitHealth(unitID, curHP + HealOnLevelUp[level])
end

function LevelUpModel(curLevel)
Emit(pelvis, "greencannonimpact")
if curLevel == 0 then
elseif curLevel == 1 then
	switchpieces(torso1, torso2)
elseif curLevel == 2 then
	switchpieces(nanogun1, nanogun3)
	nanospray = nanospray3
	mlasflsh = mlasflsh3
	Spring.SetUnitNanoPieces(unitID, {mlasflsh})

elseif curLevel == 3 then
	switchpieces(biggun1, biggun4)
	bigflsh = bigflsh4

elseif curLevel == 4 then
	switchpieces(rthigh1, rthigh5)
	switchpieces(lthigh1, lthigh5)
	switchpieces(rleg1, rleg5)
	switchpieces(lleg1, lleg5)
	Move(ground, 2, 5)

elseif curLevel == 5 then

end
end

function script.StartMoving()
	building = false
	moving = true
	dgunning = false
end
	
function script.StopMoving()
	moving = false
end

function script.AimFromWeapon(weapon)
if weapon <= 11 then
return torso
elseif weapon >= 12 and weapon <= 22 then
return torso
elseif weapon == 30 then
return biggun
elseif weapon >= 23 and weapon <= 29 then
return shield
end
end

function script.AimWeapon(weapon, heading, pitch)
-- Spring.Echo(weapon)
if weapon >= 23 and weapon <= 29 then
if weapon - 22 == level then
return true
else
return false
end
end
if weapon <= 11 then
	if weapon == level then
	if dgunning then
		return false
	else
		Spring.UnitScript.Signal(31)
		Spring.UnitScript.StartThread(Restore,3000)
		aiming = true
		Turn(luparm, 1, 0, math.rad(200))
		Turn(torso, 2, heading, math.rad(400))
		Turn(nanogun, 1, math.rad(-20)-pitch, math.rad(250))
		WaitForTurn(nanogun, 1)
		WaitForTurn(torso, 2)
		justfired = true
		return true
	end
	else
	return false
	end
elseif weapon >= 12 and weapon <= 22 then
	if weapon - 11 == level then
	_,uwlaserheight = Spring.GetUnitPosition(unitID)
	if uwlaserheight > -15 then
		return false
	else 
	if dgunning then
		return false
	else
		Spring.UnitScript.Signal(31)
		Spring.UnitScript.StartThread(Restore,3000)
		aiming = true
		Turn(luparm, 1, 0, math.rad(200))
		Turn(torso, 2, heading, math.rad(400))
		Turn(nanogun, 1, math.rad(-20)-pitch, math.rad(250))
		WaitForTurn(nanogun, 1)
		WaitForTurn(torso, 2)
		justfired = true
		return true
	end
	end
	else
	return false
	end
elseif weapon == 30 then
	Spring.UnitScript.Signal(31)
	Spring.UnitScript.StartThread(Restore,1000)
	dgunning = true
	aiming = true
	Turn(torso, 2, heading, math.rad(400))
	Turn(ruparm, 1, 0, math.rad(200))
	Turn(biggun, 1, math.rad(-20)-pitch, math.rad(200))
	WaitForTurn(biggun, 1)
	WaitForTurn(torso, 2)
	return true
end
end

function script.FireWeapon(weapon)
if weapon <= 11 then
Spring.UnitScript.Signal(31)
Spring.UnitScript.StartThread(Restore,3000)
justfired = false
elseif weapon >= 12 and weapon <= 22 then
Spring.UnitScript.Signal(31)
Spring.UnitScript.StartThread(Restore,3000)
justfired = false
elseif weapon == 3 then
Spring.UnitScript.Signal(31)
Spring.UnitScript.StartThread(Restore,1000)

dgunning = false
end
end

function script.QueryWeapon(weapon)
if weapon <= 11 then
return mlasflsh
elseif weapon >= 12 and weapon <= 22 then
return mlasflsh
elseif weapon == 30 then
return bigflsh
elseif weapon >= 23 and weapon <= 29 then
return shield
end
end

function script.StartBuilding(heading, pitch)
		Spring.UnitScript.Signal(31)
Spring.UnitScript.StartThread(Restore,3000)

		-- Spring.UnitScript.SetSignalMask(31)
		dgunning = false
		aiming = true
		building = true
		Turn(luparm, 1, 0, math.rad(200))
		Turn(torso, 2, heading, math.rad(400))
		Turn(nanogun, 1, math.rad(-20)-pitch, math.rad(250))
		WaitForTurn(nanogun, 1)
		WaitForTurn(torso, 2)
		SetUnitValue(COB.INBUILDSTANCE, 1)
		return true
end

function script.StopBuilding()
		Spring.UnitScript.Signal(31)
Spring.UnitScript.StartThread(Restore,3000)

		building = false
		SetUnitValue(COB.INBUILDSTANCE, 0)
end

function Restore(sleeptime)
Spring.UnitScript.SetSignalMask(31)
Sleep(sleeptime)
dgunning = false
	if building == false then
	Turn (torso, 2, 0,math.rad(110))
	Turn(nanogun, 1, 0, math.rad(45))
	Turn(biggun, 1, 0, math.rad(45))
	Turn(ruparm, 1, 0, math.rad(45))
	Turn(luparm, 1, 0, math.rad(45))
	Spring.UnitScript.WaitForTurn ( biggun, 1 )
	Spring.UnitScript.WaitForTurn ( biggun, 1 )
	Spring.UnitScript.WaitForTurn ( torso, 2 )
	dgunning = false
	aiming = false
end
end

function walk()

	if moving then
	
		move(pelvis , 2, -1.000000, 6.644295)
		move(bigflsh , 1, 0.000000)
		move(mlasflsh , 2, 0.000000)
		move(mlasflsh , 3, 0.000000)
		move(nanospray , 1, 5.000000, 33.221477)
		move(nanospray , 2, -8.000000, 53.154362)
		move(nanospray , 3, -7.000000, 46.510067)
		turn(pelvis , 1, 4.000000, 26.577181)
		turn(rthigh , 1, 17.000000, 112.953020)
		turn(lthigh , 1, -41.000000, 272.416107)
		turn(torso , 2, 6.000000, 39.865772)
		turn(luparm , 1, 30.000000, 199.328859)
		turn(ruparm , 1, -10.000000, 66.442953)
		turn(biggun , 1, 41.000000, 272.416107)
		turn(nanogun , 1, 36.000000, 239.194631)
		turn(lleg , 1, 42.000000, 279.060403)
		turn(lfoot , 1, -5.000000, 33.221477)
		turn(rleg , 1, 27.000000, 179.395973)
		turn(rfoot , 1, -28.000000, 186.040268)
		Sleep(12000 / currentSpeed)
	end
	if moving then
	
		move(pelvis , 2, 0.000000, 6.644295)
		turn(pelvis , 1, 5.000000, 6.644295)
		turn(rthigh , 1, 7.000000, 66.442953)
		turn(lthigh , 1, -33.000000, 53.154362)
		turn(torso , 2, 3.000000, 19.932886)
		turn(luparm , 1, 25.000000, 33.221477)
		turn(ruparm , 1, -5.000000, 33.221477)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 32.000000, 66.442953)
		turn(lfoot , 1, -5.000000)
		turn(rleg , 1, 39.000000, 79.731544)
		turn(rfoot , 1, -27.000000, 6.644295)
		Sleep(11000 / currentSpeed)
	end	
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 5.000000)
		turn(rthigh , 1, -11.000000, 119.597315)
		turn(lthigh , 1, -26.000000, 46.510067)
		turn(torso , 2, 0.000000, 19.932886)
		turn(luparm , 1, 20.000000, 33.221477)
		turn(ruparm , 1, 0.000000, 33.221477)
		turn(biggun , 1, 41.000000)
		turn(lfoot , 1, -10.000000, 33.221477)
		turn(rleg , 1, 51.000000, 79.731544)
		Sleep(10000 / currentSpeed)
	end	
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000, 8.534483)
		turn(rthigh , 1, -19.000000, 68.275862)
		turn(lthigh , 1, 1.000000, 230.431034)
		turn(torso , 2, -3.000000, 25.603448)
		turn(luparm , 1, 10.000000, 85.344828)
		turn(ruparm , 1, 10.000000, 85.344828)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 6.000000, 221.896552)
		turn(lfoot , 1, -9.000000, 8.534483)
		turn(rleg , 1, 52.000000, 8.534483)
		turn(rfoot , 1, -23.000000, 34.137931)
		Sleep(9000 / currentSpeed)
	end	
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000)
		turn(rthigh , 1, -42.000000, 152.818792)
		turn(lthigh , 1, 8.000000, 46.510067)
		turn(torso , 2, -6.000000, 19.932886)
		turn(luparm , 1, 0.000000, 66.442953)
		turn(ruparm , 1, 20.000000, 66.442953)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 10.000000, 26.577181)
		turn(lfoot , 1, -16.000000, 46.510067)
		turn(rleg , 1, 51.000000, 6.644295)
		turn(rfoot , 1, -6.000000, 112.953020)
		Sleep(10000 / currentSpeed)
	end	
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 3.000000, 6.644295)
		turn(rthigh , 1, -49.000000, 46.510067)
		turn(lthigh , 1, 11.000000, 19.932886)
		turn(torso , 2, -9.000000, 19.932886)
		turn(luparm , 1, -5.000000, 33.221477)
		turn(ruparm , 1, 25.000000, 33.221477)
		turn(biggun , 1, 41.000000)
		turn(lleg , 1, 19.000000, 59.798658)
		turn(lfoot , 1, -23.000000, 46.510067)
		turn(rleg , 1, 33.000000, 119.597315)
		Sleep(11000 / currentSpeed)
	end		
	if moving then

		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000, 6.644295)
		turn(rthigh , 1, -44.000000, 33.221477)
		turn(lthigh , 1, 19.000000, 53.154362)
		turn(torso , 2, -6.000000, 19.932886)
		turn(luparm , 1, -10.000000, 33.221477)
		turn(ruparm , 1, 30.000000, 33.221477)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 23.000000, 26.577181)
		turn(lfoot , 1, -26.000000, 19.932886)
		turn(rleg , 1, 49.000000, 106.308725)
		turn(rfoot , 1, -8.000000, 13.288591)
		Sleep(12000 / currentSpeed)
	end		
	if moving then

		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 5.000000, 6.644295)
		turn(rthigh , 1, -33.000000, 73.087248)
		turn(lthigh , 1, 3.000000, 106.308725)
		turn(torso , 2, -3.000000, 19.932886)
		turn(luparm , 1, -5.000000, 33.221477)
		turn(ruparm , 1, 25.000000, 33.221477)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 44.000000, 139.530201)
		turn(lfoot , 1, -27.000000, 6.644295)
		turn(rleg , 1, 41.000000, 53.154362)
		turn(rfoot , 1, -13.000000, 33.221477)
		Sleep(11000 / currentSpeed)
	end		
	if moving then

		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 5.000000)
		turn(rthigh , 1, -26.000000, 46.510067)
		turn(lthigh , 1, -12.000000, 99.664430)
		turn(torso , 2, 0.000000, 19.932886)
		turn(luparm , 1, 0.000000, 33.221477)
		turn(ruparm , 1, 20.000000, 33.221477)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 62.000000, 119.597315)
		turn(rleg , 1, 36.000000, 33.221477)
		turn(rfoot , 1, -15.000000, 13.288591)
		Sleep(10000 / currentSpeed)
	end	
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000, 8.534483)
		turn(rthigh , 1, 6.000000, 273.103448)
		turn(lthigh , 1, -26.000000, 119.482759)
		turn(torso , 2, 3.000000, 25.603448)
		turn(luparm , 1, 10.000000, 85.344828)
		turn(ruparm , 1, 10.000000, 85.344828)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 72.000000, 85.344828)
		turn(lfoot , 1, -26.000000, 8.534483)
		turn(rleg , 1, 3.000000, 281.637931)
		turn(rfoot , 1, -12.000000, 25.603448)
		Sleep(9000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000)
		turn(rthigh , 1, 16.000000, 66.442953)
		turn(lthigh , 1, -39.000000, 86.375839)
		turn(torso , 2, 6.000000, 19.932886)
		turn(luparm , 1, 21.000000, 73.087248)
		turn(ruparm , 1, 0.000000, 66.442953)
		turn(biggun , 1, 41.000000)
		turn(nanogun , 1, 36.000000)
		turn(lleg , 1, 55.000000, 112.953020)
		turn(lfoot , 1, -23.000000, 19.932886)
		turn(rleg , 1, 8.000000, 33.221477)
		turn(rfoot , 1, -19.000000, 46.510067)
		Sleep(10000 / currentSpeed)
	end		
	move(pelvis , 2, 0.000000)
	turn(pelvis , 1, 3.000000, 6.644295)
	turn(rthigh , 1, 22.000000, 39.865772)
	turn(lthigh , 1, -48.000000, 59.798658)
	turn(torso , 2, 9.000000, 19.932886)
	turn(luparm , 1, 25.000000, 26.577181)
	turn(ruparm , 1, -5.000000, 33.221477)
	turn(biggun , 1, 41.000000)
	turn(lleg , 1, 40.000000, 99.664430)
	turn(lfoot , 1, -8.000000, 99.664430)
	turn(rleg , 1, 11.000000, 19.932886)
	turn(rfoot , 1, -23.000000, 26.577181)
	Sleep(11000 / currentSpeed)
	end	

function walklegs()

	if moving then
	
		move(pelvis , 2, -1.000000, 6.644295)
		move(bigflsh , 1, 0.000000)
		move(mlasflsh , 2, 0.000000)
		move(mlasflsh , 3, 0.000000)
		move(nanospray , 1, 5.000000)
		move(nanospray , 2, -8.000000)
		move(nanospray , 3, -7.000000)
		turn(pelvis , 1, 4.000000, 6.644295)
		turn(rthigh , 1, 17.000000, 33.221477)
		turn(lthigh , 1, -41.000000, 46.510067)
		turn(lleg , 1, 42.000000, 13.288591)
		turn(lfoot , 1, -5.000000, 19.932886)
		turn(rleg , 1, 27.000000, 106.308725)
		turn(rfoot , 1, -28.000000, 33.221477)
		Sleep(12000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000, 6.644295)
		turn(pelvis , 1, 5.000000, 6.644295)
		turn(rthigh , 1, 7.000000, 66.442953)
		turn(lthigh , 1, -33.000000, 53.154362)
		turn(lleg , 1, 32.000000, 66.442953)
		turn(lfoot , 1, -5.000000)
		turn(rleg , 1, 39.000000, 79.731544)
		turn(rfoot , 1, -27.000000, 6.644295)
		Sleep(11000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 5.000000)
		turn(rthigh , 1, -11.000000, 119.597315)
		turn(lthigh , 1, -26.000000, 46.510067)
		turn(lfoot , 1, -10.000000, 33.221477)
		turn(rleg , 1, 51.000000, 79.731544)
		Sleep(10000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000, 8.534483)
		turn(rthigh , 1, -19.000000, 68.275862)
		turn(lthigh , 1, 1.000000, 230.431034)
		turn(lleg , 1, 6.000000, 221.896552)
		turn(lfoot , 1, -9.000000, 8.534483)
		turn(rleg , 1, 52.000000, 8.534483)
		turn(rfoot , 1, -23.000000, 34.137931)
		Sleep(9000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000)
		turn(rthigh , 1, -42.000000, 152.818792)
		turn(lthigh , 1, 8.000000, 46.510067)
		turn(lleg , 1, 10.000000, 26.577181)
		turn(lfoot , 1, -16.000000, 46.510067)
		turn(rleg , 1, 51.000000, 6.644295)
		turn(rfoot , 1, -6.000000, 112.953020)
		Sleep(10000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 3.000000, 6.644295)
		turn(rthigh , 1, -49.000000, 46.510067)
		turn(lthigh , 1, 11.000000, 19.932886)
		turn(lleg , 1, 19.000000, 59.798658)
		turn(lfoot , 1, -23.000000, 46.510067)
		turn(rleg , 1, 33.000000, 119.597315)
		Sleep(11000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000, 6.644295)
		turn(rthigh , 1, -44.000000, 33.221477)
		turn(lthigh , 1, 19.000000, 53.154362)
		turn(lleg , 1, 23.000000, 26.577181)
		turn(lfoot , 1, -26.000000, 19.932886)
		turn(rleg , 1, 49.000000, 106.308725)
		turn(rfoot , 1, -8.000000, 13.288591)
		Sleep(12000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 5.000000, 6.644295)
		turn(rthigh , 1, -33.000000, 73.087248)
		turn(lthigh , 1, 3.000000, 106.308725)
		turn(lleg , 1, 44.000000, 139.530201)
		turn(lfoot , 1, -27.000000, 6.644295)
		turn(rleg , 1, 41.000000, 53.154362)
		turn(rfoot , 1, -13.000000, 33.221477)
		Sleep(11000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 5.000000)
		turn(rthigh , 1, -26.000000, 46.510067)
		turn(lthigh , 1, -12.000000, 99.664430)
		turn(lleg , 1, 62.000000, 119.597315)
		turn(rleg , 1, 36.000000, 33.221477)
		turn(rfoot , 1, -15.000000, 13.288591)
		Sleep(10000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000, 8.534483)
		turn(rthigh , 1, 6.000000, 273.103448)
		turn(lthigh , 1, -26.000000, 119.482759)
		turn(lleg , 1, 72.000000, 85.344828)
		turn(lfoot , 1, -26.000000, 8.534483)
		turn(rleg , 1, 3.000000, 281.637931)
		turn(rfoot , 1, -12.000000, 25.603448)
		Sleep(9000 / currentSpeed)
	end		
	if moving then
	
		move(pelvis , 2, 0.000000)
		turn(pelvis , 1, 4.000000)
		turn(rthigh , 1, 16.000000, 66.442953)
		turn(lthigh , 1, -39.000000, 86.375839)
		turn(lleg , 1, 55.000000, 112.953020)
		turn(lfoot , 1, -23.000000, 19.932886)
		turn(rleg , 1, 8.000000, 33.221477)
		turn(rfoot , 1, -19.000000, 46.510067)
		Sleep(10000 / currentSpeed)
	end		
	move(pelvis , 2, 0.000000)
	turn(pelvis , 1, 3.000000, 6.644295)
	turn(rthigh , 1, 22.000000, 39.865772)
	turn(lthigh , 1, -48.000000, 59.798658)
	turn(lleg , 1, 40.000000, 99.664430)
	turn(lfoot , 1, -8.000000, 99.664430)
	turn(rleg , 1, 11.000000, 19.932886)
	turn(rfoot , 1, -23.000000, 26.577181)
	Sleep(11000 / currentSpeed)
	end	


function script.Killed()
return 1
end