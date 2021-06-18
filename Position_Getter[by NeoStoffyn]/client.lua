local display = false




RegisterCommand("nui", function(source, args)
    SetDisplay(not display)
end)

--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("changeValue", function(data)
    local pos = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    if data.info == "X" then 
        _info = pos.x
    elseif data.info == "Y" then 
        _info = pos.y
    elseif data.info == "Z" then 
        _info = pos.z
    elseif data.info == "H" then 
        _info = heading
    elseif data.info == "XYZ" then 
        _info = "{x = "..pos.x..", y = "..pos.y..", z = "..pos.z.."}"
    elseif data.info == "XYZH" then 
        _info = "{x = "..pos.x..", y = "..pos.y..", z = "..pos.z..", h = "..heading.."}"
    elseif data.info == "vct2" then 
        _info = "vector2("..pos.x..", "..pos.y..")"
    elseif data.info == "vct3" then 
        _info = "vector3("..pos.x..", "..pos.y..", "..pos.z..")"
    elseif data.info == "vct4" then 
        _info = "vector3("..pos.x..", "..pos.y..", "..pos.z..", "..heading..")"
    end 
    SendNUIMessage({
        type = "ui",
        status = true,
        position = _info
    })
end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)


function SetDisplay(bool)
    local pos = GetEntityCoords(PlayerPedId())
    local Pheading = GetEntityHeading(PlayerPedId())
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        position = pos.x
    })
end




RegisterCommand('pos', function(source)
    SetDisplay(not display) 
end, false)       


