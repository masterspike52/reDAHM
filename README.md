REQUIREMENTS

US version of Destroy all Humas: Path of the Furon default.xex

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
