# Tancuri

Multiplayer hints ?
https://www.reddit.com/r/godot/comments/19b11eo/can_you_use_steam_for_multiplayer/?rdt=59870

# From link: 
https://godotsteam.com/
This, get the precompiled version, its the exact same as the normal godot exe but with steam functionality in it. the only requirements are 1: create a text document called steam_appid.txt, with the contents 480 in it(480 is just a test number, if you purchase a steam id you use yours but for easy use 480 for now). then make a singleton with a single line of code

func onready():
var whatever = steam.init

I might be wrong on the code above, but its basically that, read the documentation to be sure, but for steam remote play together its that easy. For proper multiplayer outside of shared/split screen there is also the P2P in it, but thats more complex.

https://www.youtube.com/watch?v=si50G3S1XGU&ab_channel=DawnsCrowGames
This video has an example of a lobby system which is not needed, but has some good examples of functions with steam.

PS: a bug with Steam is your controller might not work, if so when you launch the game with steam initilized open steam overlay and display steam controller layout.

Otherwise read docs, its easy as piss.

# From link: 

I made a couple tutorials on Godot Steam implementations that use the High Level Multiplayer APIs if you want to stick to that:

The GDExtension version: https://youtu.be/xugYYCz0VHU

Custom pre-compiled version of Godot: https://youtu.be/MoRl9kQb6L0

These are generally referred to as Steam Multiplayer Peer implementations.
They are nice if you don't want to handle manually sending messages. These implementations wrap the lower level Steam APIs (from GodotSteam) and expose them as High Level APIs. So you can develop and test your game using ENet, then when ready, flip the switch to Steam. My videos above talk about this in more detail.
