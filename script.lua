--No Traffic
Citizen.CreateThread(function ()
	while true do
	  Citizen.Wait(0)
		if Config.NoTraffic == true then
			SetParkedVehicleDensityMultiplierThisFrame(0.0)		
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetVehicleDensityMultiplierThisFrame(0.0)
			SetSomeVehicleDensityMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		end
	end
  end)
  
  AddEventHandler('onResourceStart', function (resourceName)
	if Config.NoTraffic == true then
	  SetFarDrawVehicles(false)
	end
  end)
  
  AddEventHandler('onResourceStop', function (resourceName)
	if Config.NoTraffic == true then
	  SetFarDrawVehicles(true)
	end
  end)  

--Keep Engine On
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if Config.KeepEngineOn == true then

		local ped = GetPlayerPed(-1)
		
		if DoesEntityExist(ped) and IsPedInAnyVehicle(ped, false) and IsControlPressed(2, 75) and not IsEntityDead(ped) and not IsPauseMenuActive() then
			local engineWasRunning = GetIsVehicleEngineRunning(GetVehiclePedIsIn(ped, true))
			Citizen.Wait(1000)
			if DoesEntityExist(ped) and not IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and not IsPauseMenuActive() then
				local veh = GetVehiclePedIsIn(ped, true)
				if (engineWasRunning) then
					SetVehicleEngineOn(veh, true, true, true)
				end
			end
		end
		end
	end
end)

--Infite Ammo
local infiniteAmmoList = {
	{hash="0x1B06D571"},
	{hash="0xBFE256D4"},
	{hash="0x5EF9FEC4"},
	{hash="0x22D8FE39"},
	{hash="0x3656C8C1"},
	{hash="0x99AEEB3B"},
	{hash="0xBFD21232"},
	{hash="0x88374054"},
	{hash="0xD205520E"},
	{hash="0x83839C4"},
	{hash="0x47757124"},
	{hash="0xDC4DB296"},
	{hash="0xC1B3C3D1"},
	{hash="0xCB96392F"},
	{hash="0x97EA20B8"},
	{hash="0xAF3696A1"},
	{hash="0x2B5EF5EC"},
	{hash="0x917F6C8C"},
	{hash="0x57A4368C"},
	{hash="0x45CD9CF3"},
	--SMG's
	{hash="0x13532244"},
	{hash="0x2BE6766B"},
	{hash="0x78A97CD0"},
	{hash="0xEFE7E2DF"},
	{hash="0x0A3D4D34"},
	{hash="0xDB1AA450"},
	{hash="0xBD248B55"},
	{hash="0x476BF155"},
	--Shotguns
	{hash="0x1D073A89"},
	{hash="0x555AF99A"},
	{hash="0x7846A318"},
	{hash="0xE284C527"},
	{hash="0x9D61E50F"},
	{hash="0xA89CB99E"},
	{hash="0x3AABBBAA"},
	{hash="0xEF951FBB"},
	{hash="0x12E82D3D"},
	{hash="0x5A96BA4"},
	--AR's
	{hash="0xBFEFFF6D"},
	{hash="0x394F415C"},
	{hash="0x83BF0278"},
	{hash="0xFAD1F1C9"},
	{hash="0xAF113F99"},
	{hash="0xC0A3098D"},
	{hash="0x969C3D67"},
	{hash="0x7F229F94"},
	{hash="0x84D6FAFD"},
	{hash="0x624FE830"},
	{hash="0x9D1F17E6"},
	{hash="0xC78D71B4"},
	{hash="0xD1D5F52B"},
	--LMG's
	{hash="0x9D07F764"},
	{hash="0x7FD62962"},
	{hash="0xDBBD7280"},
	{hash="0x61012683"},
	--Sniper Rifles
	{hash="0x05FC3C11"},
	{hash="0x0C472FE2"},
	{hash="0xA914799"},
	{hash="0xC734385A"},
	{hash="0x6A6C02E0"},
	{hash="0x6E7DDDEC"},
	--Heavy Weapons
	{hash="0xB1CA77B1"},
	{hash="0xA284510B"},
	{hash="0x4DD2DC56"},
	{hash="0x42BF8A85"},
	{hash="0x7F7497E5"},
	{hash="0x6D544C99"},
	{hash="0x63AB0442"},
	{hash="0x0781FE4A"},
	{hash="0xB62D1F67"},
	{hash="0xDB26713A"},
	--Throwables
	{hash="0x93E220BD"},
	{hash="0xA0973D5E"},
	{hash="0x24B17070"},
	{hash="0x2C3731D9"},
	{hash="0xAB564B93"},
	{hash="0x787F0BB"},
	{hash="0xBA45E8B8"},
	{hash="0x23C9F95C"},
	{hash="0xFDBC8A50"},
	{hash="0x497FACC3"},
	--Other
	{hash="0x34A67B97"},
	{hash="0xFBAB5776"},
	{hash="0x060EC506"},
	{hash="0xBA536372"},
	{hash="0x184140A1"}
  }

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(500)
    if Config.InfiniteAmmo == true then
    for _, info in pairs(infiniteAmmoList) do
	      SetPedInfiniteAmmo(GetPlayerPed(-1), true, infiniteAmmoList.hash)
    end
    end
    end
end)

--Infinite Stamina
Citizen.CreateThread( function()
 while true do
    Citizen.Wait(1000)
    if Config.InfiniteStamina == true then
    RestorePlayerStamina(PlayerId(), 1.0)
    end
	end
end)

--No Wanted Level
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(1)
    if Config.NoWantedLevel == true then
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    if Config.PVP == false then
        DisableControlAction(2, 12, true)
        DisableControlAction(2, 13, true)
        DisableControlAction(2, 14, true)
        DisableControlAction(2, 15, true)
        DisableControlAction(2, 16, true)
        DisableControlAction(2, 17, true)
        DisableControlAction(2, 24, true)
        DisableControlAction(2, 25, true)
        DisableControlAction(2, 37, true)
		DisableControlAction(2, 140, true)
        DisableControlAction(2, 141, true)
		DisableControlAction(2, 142, true)
        DisableControlAction(2, 157, true)
		DisableControlAction(2, 158, true)
		DisableControlAction(2, 159, true)
		DisableControlAction(2, 160, true)
		DisableControlAction(2, 161, true)
		DisableControlAction(2, 162, true)
		DisableControlAction(2, 163, true)
		DisableControlAction(2, 164, true)
		DisableControlAction(2, 165, true)
		DisableControlAction(2, 257, true)
		DisableControlAction(2, 263, true)
		DisableControlAction(2, 264, true)
        DisablePlayerFiring(PlayerId(), true)
    end
    end
end)
