# defib
**Defibrillator**

A simple script to have a usable item Defibrillator when there is no EMS connected.

__Required script__ :
- esx_ambulancejob

__Order scripts start__ : 

- start esx_ambulancejob
- start defib

__Install guide__ :
- Clone the repository defib.
- Upload the defib folder to your FTP.
- You need to ensure that the item "medikit" (from esx_ambulancejob) is present in your database.
- Rename the label of the item "medikit" in your database to your liking, in my case Label = Defibrillator.
- Add the command "start defib" in your server.cfg.
- In esx_ambulancejob/server/main.lua -> line 10 please modify this way : 

OLD : 

if xPlayer.job.name == 'ambulance' then 

NEW : 

--if xPlayer.job.name == 'ambulance' then
	if true then

Thanks @JokreeTV for pointing this out ! 

__Use guide__ :
- Once connected, get a medikit item in your inventory and press the key "**K**" near a dead person to execute the script.
If no EMS online the animation will start and will end up with reanimation of the dead person.
If an EMS is connected, you will get a notification saying that you need to call an EMS and no reanimation will be possible.

__Conditions to use__ :
- You need to have the item "medikit" in your inventory and a dead person near you. Then press "**K**"

__Download Link__ :
https://github.com/Slamdunk91/defib
