# final-project
Our final project for APCS2

List of Features:

1. Catching Pokemon, with a choice of throwing bait, mud, or a ball. Bait will make it harder to catch but less likely to run, mud will make it easier to catch but more likely to run, and the ball will attempt to capture the Pokemon depending on the modified catch rate.
2. Six different terrains, each with 10 different Pokemon to catch when walking in tall grass.
3. Pretty overworld in Processing, with working avatar that walks to different terrains in the overworld. Screen changing effects when an encounter occurs and animations while in "battle."
4. Pokedex to check description of captured Pokemon (triggered by pressing p)
5. Ability to change avatar //not completed yet
6. Music playing that changes based on terrain and type of battle (legends vs non-legends) //for this, the Sound library must be imported into Processing
 
To Be Implemented:

1. Input processing so that movement looks more fluid
2. Allowing the user to save data
3. Battle animations inside battle (like having the avatar literally throw mud/bait/ball)

Bugs That Are Known:
1. Once the game is closed, an error prints out in the terminal about a node. However, the code seems to be working while it is running.

Roadmap of Development Stages:

1. Creating a Pokemon database to extract all information from (like name, catch rate, Pokedex entry, etc.)
- Should be done by June 1
- Finished on May 31
2. Making algorithm for catching Pokemon and determining modified catch and escape rates from user input (bait, mud).
- Should be done by June 3
- Finished on June 3
3. Developing class for avatar that keeps track of Pokemon caught during session
- Should be done by June 6
- Finished on June 2
4. Finding pictures for overworld (in and out of battle), Pokemon, and avatars
- Should be done by June 6
- Avatar pictures found on June 2
- Terrain pictures (out of battle) found on June 3
- Terrain pictures (in battle) found on June 5
- Pokemon pictures found on June 6
5. Working on implementing game in Processing with different pictures. Person should be able to move with the arrow keys. During battle, person can decide bait, mud, or ball by pressing the arrow keys and enter on the keyboard.
- Should be done by June 9
- Finished moving avatar on June 4
- Finished basic battle functions on June 5
- Finished all battle functions on June 9
- Finished battle transitions on June 10
6. Implementing a Pokedex that updates as more Pokemon are caught
- Will do this if we have time
- Finished on June 11
7. Changing a person’s avatar, possibly with a settings tool.
- Will do this if we have time
8. Playing music
- Will do this if we have time
- Finished on June 11
9. Have beginning picture with instructions
- Will do this if we have time
- Finished on June 11

Instructions:
 
- Welcome to the Safari Zone! This is a special preserve housing Pokémon from five different regions: Kanto, Johto, Hoenn, Sinnoh, and Unova. You may explore for as long as you want and catch as many Pokémon as you wish. However, in order to maintain this preserve, you may only do so under some special restrictions.
- Each area houses 9 different species of wild Pokémon and one extremely rare Pokémon. This means that there are 60 Pokémon total for you to find and catch. Good luck!
 
Rules:
 
- You may not engage in Pokémon battles with any wild Pokémon. Instead, you will be provided with an unlimited supply of Bait, Mud, and Safari Balls.
- Wild Pokémon may flee at any time.
- Throwing Bait at a wild Pokémon will make it less likely to flee, but it will usually also make it harder to catch.
- Throwing Mud at a wild Pokémon will make it easier to catch, but it will usually also make it more likely to flee.
- When you are ready to catch a Pokémon, simply throw a Safari Ball at it.
- You may choose to run from a wild Pokémon at any time.
 
Controls:
 
- Use the arrow keys to move around the map and to choose between options during battle.
- The enter key finalizes your choice while in battle.
- Use keys 1-6 to choose which area of the Safari Zone to explore
	- Ocean - 1
	- Desert - 2
	- Meadow - 3
	- Forest - 4
	- Snow - 5
	- Cave - 6
- “P” will open the Pokédex, allowing you to see the information of all the Pokémon you have caught so far.

