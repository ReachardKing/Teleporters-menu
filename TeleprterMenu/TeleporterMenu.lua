menus = {
    ["Police Station"] = {
        {name ="Poleto Station", color=74, id=60, scale=0.5, x=-445.202, y=6014.36, z=31.7164},
        {name ="Sandy Station", color=74, id=60, scale=0.5, x=1854.21, y=3685.51, z=34.2671},
        {name ="Vinewood Station", color=74, id=60, scale=0.5, x=642.001, y=0.638351, z=82.7869},
        {name ="Vespucci Station", color=74, id=60, scale=0.5, x=-1090.02, y=-814.73, z=19.29},
        {name ="Davis Station", color=74, id=60, scale=0.5, x=360.624, y=-1584.47, z=29.2919},
        {name ="Lamesa Station", color=74, id=60, scale=0.5, x=825.987, y=-1290.03, z=28.2407},
        --{name ="Police Station", color=74, id=60, scale=0.5, x=1853.16, y=3687.39, z=34.27}, Paleto
        --{name ="Police Station", color=74, id=60, scale=0.5, x=-445.71, y=6013.67, z=31.72}, Sandy
        {name ="MRPD Station", color=74, id=60, scale=0.5, x=446.19, y=-984.9, z=30.69},
        {name ="Paire Station", color=74, id=60, scale=0.5, x=-1633.48, y=-1020.35, z=13.15},
        {name ="Senora Station", color=74, id=60, scale=0.5, x=2744.73, y=3473.68, z=55.65},
        {name ="Island Station", color=74, id=60, scale=0.5, x=-331.58, y=-2792.3, z=5.18},
        {name ="Park Rangers HQ", color=2, id=60, scale=0.5, x=379.13, y=792.57, z=190.41},
        {name ="Rockford Station", color=74, id=60, scale=0.5, x=-562.19, y=-131.18, z=38.43},
        {name ="FIB Station", color=74, id=60, scale=0.5, x=2475.65, y=-384.43, z=94.4},
        {name ="Highway Station", color=74, id=60, scale=0.5, x=-2209.49, y=-374.52, z=13.32}, 
        {name ="GrapeSeed Station", color=74, id=60, scale=0.5, x=1652.63, y=4882.82, z=42.16},
    
      },
      ['Hopital Station'] = { -- This will be the name of the category
      {name = 'Central Hospital', x=337.238, y=-1396.28, z=32.5092},
      {name = 'Mount ZOHAN', x=-450.586, y=-340.387, z=34.5014},
      {name = 'Sandy Hospital', x=1839.74, y=3672.0, z=34.2767},
      {name = 'Plibox Hopital', x=360.222, y=-582.222, z=28.8212},
      {name = 'Paleto Hospital', x=-243.463, y=6327.87, z=32.4262},
      {name = 'Eclips Hospital', x=-677.003, y=310.929, z=83.0841},
      {name = 'FICRE Hospital', x=1151.31, y=-1529.95, z=34.9904},
      {name = 'RockFord Hospital', x=-874.614, y=-308.375, z=39.5448},
      {name = 'Ocean Hospital', x=-1854.98, y=-347.03, z=49.43},
      },
      ['Fire Station'] = {
        {name = 'Davis Fire Station', x=215.786, y=-1642.49, z=29.7138},
        {name = 'Fire Station 7', x=1202.38, y=-1460.13, z=34.7642},
        {name = 'Port Fire Station', x=-1087.93, y=-2374.1, z=13.9451},
        {name = 'Paleto Fire Station', x=-379.942, y=6118.73, z=31.8456},
        {name = 'Rockford Fire Station', x=-635.992, y=-121.635, z=39.0138},
        {name = 'Sandy Fire Station', x=1697.26, y=3585.46, z=35.5443},
        {name = 'Zancudo Fire Station', x=-2113.74, y=2831.58, z=32.8093},
        {name = 'GrapeSeed Fire Station', x=1778.85, y=4601.99, z=37.72},
      },
}

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("~Teleportation menu", "~b~Teleportation menu", 1430, 0)
_menuPool:Add(mainMenu)

function Teleportation(menu)
    for Name, Category in pairs(menus) do
        local catagory = _menuPool:AddSubMenu(menu, Name, '', true)
        for _, coords in pairs(Category) do
            local tps = NativeUI.CreateItem(coords.name, '')
            catagory:AddItem(tps)

            tps.Activated = function(sender, item, index)
                local ped = GetPlayerPed(-1)
                SetEntityCoords(ped, coords.x, coords.y, coords.z)
            end
        end
    end
end

Teleportation(mainMenu)
_menuPool:RefreshIndex()

_menuPool:MouseControlsEnabled(false)
_menuPool:MouseEdgeEnabled(false)
_menuPool:ControlDisablingEnabled(false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
    end
end)

RegisterCommand("tp", function()
    _menuPool:ProcessMenus()
    Citizen.Wait(1)
    mainMenu:Visible(not mainMenu:Visible())
end)