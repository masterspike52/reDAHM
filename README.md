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
you can play the game by either downloading the release from releases and extracting the assets of your iso to a folder or you can download the game through goopie (which is reccomended as to only need 1 program that takes care of all of it) 
the only thing you need to provide is the U.S. Version of Destroy all humans: Path of the furon for the xbox 360. you can download goopie from https://goopie.xyz/#/downloads then follow these instructions

1. open goopie launcher
2. select destroy all humans: path of the furon from the libray
3. click select game, this will ask you to select your ISO (Destroy all humans: Path of the Furon)
4. once its done extracting your assets from the iso you can click install
5. it will by default install the latest release, you can then click play.


How to Build it
----------------------------------------
1. follow https://github.com/rexglue/rexglue-sdk/wiki/Getting-Started to learn to install rexglue (you can use default but i use https://github.com/SolarRecomps/rexglue-ostentation/tree/dev when i build)
2. clone the ReDahm Repo
3. run rexglue codegen
4. build with cmake from cmd/powershell or use VS

