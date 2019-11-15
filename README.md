# defib
**Defibrillator**

A simple script to have a usable item Defibrillator when there is no EMS connected.

__Required script__ :
- esx_ambulancejob

__Install guide__ :
- Clone the repository defib
- Upload the defib folder to your FTP
- You need to ensure that the item "medikit" (from esx_ambulancejob) is present in your database
- Rename the label of the item "medikit" in your database to your liking, in my case Label = Defibrillator
- Add the command "start defib" in your server.cfg
- Once connected, get a medikit item in your inventory and press the key "**K**" near a dead person to execute the script

If no EMS online the animation will start and will end up with reanimation of the dead person
If an EMS is connected, you will get a notification saying that you need to call an EMS
