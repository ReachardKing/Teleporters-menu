-----------------------------------------------------------
----            Player Teleportation Menu              ----
----             Made by Tamir112#5345                 ----
----        For more scripts and updates Join:         ----
----              discord.gg/bDPaRDeBKJ                ----
----                                                   ----
-----------------------------------------------------------


local command = "tp" -- This is the command to open the menu, change what is in the "" only!!


menus = {


}


-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 
-- DO NOT EDIT BELOW THIS IF YOU DO NOT KNOW WHAT YOU ARE DOING !! -- 

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("", "~b~Tamir112's Teleportation menu", 1430, 0)
_menuPool:Add(mainMenu)


function tp(menu)
  for Name, Category in pairs(menus) do
    local catagory = _menuPool:AddSubMenu(menu, Name, '', true)
    for _, coords in pairs(Category) do
        local tps = NativeUI.CreateItem(coords.name, '')
        catagory:AddItem(tps)
end

tp(mainMenu)
_menuPool:RefreshIndex() 


_menuPool:MouseControlsEnabled (false)
_menuPool:MouseEdgeEnabled (false)
_menuPool:ControlDisablingEnabled(false)


Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)
      _menuPool:ProcessMenus()

  end
end) 

RegisterCommand(command, function ()
  _menuPool:ProcessMenus()
  Citizen.Wait(1)
  mainMenu:Visible(not mainMenu:Visible())
       
 
 end) 





 
  function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end




