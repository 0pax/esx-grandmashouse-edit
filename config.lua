Config = {}

Config.EnableBlip = false -- Enables the blip on the map, set to false by default
Config.EnablePayment = true -- Turns on/off payment when getting treated, you can either set it to true or false, if you set it to true you can change the price below
Config.UseMythicNotify = true -- Use mythic notification system? On by default
Config.UseESXNotification = false -- Use default ESX notification system? Set Config.UseMythicNotify to false if this is set to true, off by default
Config.EnableGrandmaPed = true -- Enable random grandma ped? Will switch to a different kind of ped when server / script is restarted, just changes variation between the "a_f_m_eastsa_01" ped 
Config.Price = 1000 -- If Config.EnablePayment is enabled, change the price to your liking here.

Config.GrandmasLocation = {
    {x = 2433.91, y = 4965.50, z = 41.35} -- Location of the grandma ped (should be the same location as where the actual text and function is)
}

Config.Locations = {
    {x = 2433.91, y = 4965.50, z = 42} -- Location of the whole script
}

Config.Ped = 'a_f_m_eastsa_01' -- Change the grandma ped if you'd like
