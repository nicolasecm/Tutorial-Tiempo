local spam = {}
local vehicle = {}

function spawnVehiclePlayer(player, cmd, vehicle_id)
	if spam[player] and getTickCount() - spam[player] < 10000 then
		return outputChatBox("No puedes usar el comando aun, espera otro tiempo", player, 255, 0, 0)
	end

	local vehicleName = getVehicleNameFromModel( tonumber(vehicle_id))

	if not vehicleName then
		outputChatBox("El id del vehiculo que colocaste no existe", player, 255, 0, 0)
	else
		if isElement(vehicle[player]) then
			destroyElement(vehicle[player])
		end
		local x, y, z = getElementPosition(player)
		vehicle[player] = createVehicle(tonumber(vehicle_id),  x + 5, y, z)
		spam[player] = getTickCount()
	end
end
addCommandHandler("vehicle", spawnVehiclePlayer)