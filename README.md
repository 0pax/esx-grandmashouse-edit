# esx-grandmashouse-edit
A edited version of Livid_Fizz's original ESX Grandmashouse (https://forum.cfx.re/t/release-esx-grandmas-house-rp-revive/852182)


# Dependecies
- ESX
- Mythic Notify (https://github.com/FlawwsX/mythic_notify)
- Mythic Progressbar (https://github.com/HalCroves/mythic_progbar)

# Changelog
- Changed __resource.lua to fxmanifest.lua
- Added a new config file, gives more flexibility for the script.
- Removed the need for pogressbars, only uses mythic_progbar as of now.
- Script now removes money from the players ESX bank account
- Added possibility to have grandma ped, change the location of her in the config and set it to true / false on Config.EnableGrandmaPed (Most of the code taken from https://forum.cfx.re/u/chip/)
- Changed location of the NPC and the actual location to be changed in the config, you can add several locations, although the DrawText will begin to flicker, I'll look into the problem.
- Added possibility to change the grandma ped in the config file

# Configuration Settings
- Config.EnableBlip = false -- Enables the blip on the map, set to false by default
- Config.EnablePayment = true -- Turns on/off payment when getting treated, you can either set it to true or false, if you set it to true you can change the price below
- Config.UseMythicNotify = true -- Use mythic notification system? On by default
- Config.UseESXNotification = false -- Use default ESX notification system? Set Config.UseMythicNotify to false if this is set to true, off by default
- Config.EnableGrandmaPed = true -- Enable random grandma ped? Will switch to a different kind of ped when server / script is restarted, just changes variation between the "a_f_m_eastsa_01" ped 
- Config.Price = 1000 -- If Config.EnablePayment is enabled, change the price to your liking here.

- Config.GrandmasLocation = {
    {x = 2433.91, y = 4965.50, z = 41.35} -- Location of the grandma ped (should be the same location as where the actual text and function is)
}

- Config.Locations = {
    {x = 2433.91, y = 4965.50, z = 42} -- Location of the whole script
}

- Config.Ped = 'a_f_m_eastsa_01' -- Change the grandma ped if you'd like
