
<img width="1500" height="550" alt="ReDAHM_Logo" src="https://github.com/user-attachments/assets/8bb23711-d45c-486e-8a2f-9c314daa903c" />



WHAT IS REDAHM???
--------------------------
reDAHM is a recompilation of Destroy all humans: Path of the Furon for the xbox360 using the REXGLUE-SDK 

WHAT CAN BE DONE WITH IT OVER XENIA???
--------------------------------------------
quite literally anything as long as its within the means of C++, this means unlike xenia we can do things like enable the skins in the game (i.e. disco, biker, yellow jacket, etc). as long as it can be found in IDAPRO it can be changed in whatever way we want. 

WILL THE RE-Enlighted MOD WORK????
----------------------------------
yes, i made sure to test it before releasing this. once the mod is released i will leave instructions on how to install the mod into reDAHM


WHY reDAHM???
--------------------------
why not? initially the project was called POTFRecomp but i decided that name is a bit boring and long just to abbreviate Path of the Furon then add Recomp to the end, reDAHM is much nicer. 







REQUIREMENTS

US version of Destroy all Humas: Path of the Furon default.xex and the assets for the game

HOW TO BUILD
---------------------
   1. Install Rexglue-SDk following the <a href="https://github.com/rexglue/rexglue-sdk/wiki">wik</a>
   2. install Visual Studio Community edition and ensure you install the desktop development with C++ and make sure you check the box that says C++ clang compiler for windows (note: if you are using Mac or linux you can skip this for you will have to follow the wiki linked in step 1 to build the game)
   3. clone/download the repository
   4. dump your copy of Destroy all Humas: Path of the Furon and use a tool like ISO-Extract to dump the contents of the iso (INCLUDING THE DEFAULT.XEX FILE)
   5. place the contents of the iso in the assets folder(INCLUDING THE DEFAULT.XEX FILE)
   6. open the folder in visual studio, go into cmake targets view
   7. change the configuration to win-amd64-relwithdebinfo
   8. put rexglue.exe in your path environment variable and do rexglue codegen redahm_config.toml in a terminal (visual studios works, or you can use windows default terminal/cmd/powershell)
   9. right click reDAHM project and select build all
   10. copy the assets folder with the dumped contents of the iso in out/build/win-amd64-relwithdebinfo


HOW TO USE
--------------------
for the time being until a launcher is completed all you must do is download the repo and go into out/build/win-amd64-relwithdebinfo and either put the assets folder with the dumped assets, redahm.toml, and the default.xex in it or make a new folder somewhere and place the assets with the default.xex in there the only folder/files you should have are the kronosgame folder with its files and the default.xex


CURRENT ISSUES WITH THE GAME
--------------------------------
AUDIO SOUNDS LIKE GARBAGE AT THIS TIME, IM HOPING A REXGLUE UPDATE FIXES THIS, OR I FIND A WAY TO FIX IT MYSELF


IF YOU FIND ANY CRASHES PLEASE MAKE AN ISSUE EXPLAINING WHERE IT WAS AND WHAT YOU WERE DOING (i.e. went to shen-long, game crashed during loading or used pk ability on vehicle causing the game to crash)(no these dont happen ~~anymore~~ they're just examples)

CREDITS
----------------------
MaxDeadBear - for adding a handful of the CRT functions needed to make the game not crash while i was busy with another project
Raoul - Making the logo
DAHM team - for Re-Enlightened and knowing how to use UPK-Explorer
