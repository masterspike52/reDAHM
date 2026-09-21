<img width="1500" height="550" alt="ReDAHM_Logo" src="https://github.com/user-attachments/assets/d80c06b9-bc26-4fca-b235-22de8d32971b" />


What is ReDahm?
----------------------------
ReDahm is a recompilation of Destroy all humans: Path of the Furon on the xbox 360 made with the Rexglue-SDK

What makes it different from playing on xenia?
------------------------------------------------
unlike xenia ReDahm can be changed in ways xenia can only dream, i.e. i could add things like grahical optimizations, extra menus, hotswapping models, proper mod support, unlockable DLC, and really anything i want provided i can find where i need to hook it. other than this it does use the xenos emulation pipeline (which is default to rexglue, 
this could be changed in the future by hand but would require more help).

How to play it
----------------------------
The preference is for you to download the latest release from releases then do the following

1. download https://digiex.net/attachments/isoextract-rar.7679/ this tool is used to extract your iso's contents for the xbox 360. please use it to extract your destroy all humans path of the furon (xbox360) assets from the iso
2. run redahm.exe and use the gui to select your assets location

If you have redahm.cfg in the folder with your exe you must either move your assets to the same directory that you specified previously or delete redahm.cfg so you can select a new location


How to Build it
----------------------------------------
1. follow https://github.com/rexglue/rexglue-sdk/wiki/Getting-Started to learn to install rexglue (you can use default but i use https://github.com/SolarRecomps/rexglue-ostentation/tree/dev when i build)
2. clone the ReDahm Repo
3. run rexglue codegen
4. build with cmake from cmd/powershell or use VS

