-- Name of defibrillator item in database
local defibItemName = 'medikit'

Citizen.CreateThread(function()
	while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
	end
  
	while true do
		Citizen.Wait(10)
		if(IsControlJustReleased(1, 311))then
      TriggerServerEvent('defib:getAmbulancesCount')
		end
	end
end)

RegisterNetEvent("defib:useDefib")
AddEventHandler("defib:useDefib", function(ambulancesConnected)
  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
  if ambulancesConnected > 0 then
    ESX.ShowNotification("Médecin disponible, contactez une ambulance au plus vite !")
  elseif closestPlayer == -1 or closestDistance > 3.0 then
    ESX.ShowNotification("Aucun joueur à proximité")
  else
    ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(qtty)
      if qtty > 0 then
        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetEntityHealth(closestPlayerPed)
        
        if health == 0 then
          local playerPed = GetPlayerPed(-1)
          
          ESX.ShowNotification("Réanimation en cours")
          TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
          Citizen.Wait(10000)
          ClearPedTasks(playerPed)
          
          TriggerServerEvent('esx_ambulancejob:removeItem',defibItemName)
          TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
        else
          ESX.ShowNotification("Cette personne n\'a pas besoin de défibrillateur")
        end
      else
        ESX.ShowNotification("Vous n\'avez pas de défibrillateur sur vous")
      end
    end, defibItemName)
  end
end)
