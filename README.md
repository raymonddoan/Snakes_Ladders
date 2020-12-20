# Snakes and Ladders

A simple Snakes and Ladders game for Coder Academy Project T1A3 by Raymond Doan

**Source Link:** https://github.com/whywesmurfing/Snakes_Ladders

# Problem Statement

At the time of this game's development, none of the available 'Snakes and Ladders' gems rendered a visual representation of the game for a user-friendly experience. In search of this, this gem was designed to fill in this gap in the ruby gem library. 

# Purpose and Scope

Based on the physical game, this application emulates the ancient game 'Snakes and Ladders'. From [Wikipedia](https://en.wikipedia.org/wiki/Snakes_and_Ladders):

> Snakes and Ladders, known originally as Moksha Patam, is an ancient Indian board game for two or more players regarded today as a worldwide classic. It is played on a game board with numbered, gridded squares. A number of "ladders" and "snakes" are pictured on the board, each connecting two specific board squares.

This purpose of this application is to provide a free version of the game that can be run on the terminal. The current version of the game has a limit of 2 players with one virtual dice. Players will navigate their piece from start to finish, avoid the snakes, and take shortcuts going up the ladders. The first player that reaches the final square on the board wins the game. To win the player will need to roll the number in the final square or higher. 

The target audience are people who getting into programming or who love games, ages from 6+. The development of Snakes and Ladders is to entertain the players of all ages with an ancient old game. In addition to this, Snakes and Ladder can be used as a lesson about the passage of life. According to [Times of India](https://timesofindia.indiatimes.com/Who-invented-the-board-game-Snakes-and-Ladders/articleshow/3585003.cms#:~:text=According%20to%20some%20historians%2C%20the,to%20stand%20for%20an%20evil.):

> The game was invented by Saint Gyandev in the 13th century AD. Originally, the game was used as a part of moral instruction to children. The squares in which ladders start were supposed to stand for a virtue and those housing the head of the snake were supposed to stand for an evil.



![SnakesandLadders_Gameplay](/docs/SnakesandLadders_Gameplay.png)



# How to install and use

To install and run

- Install Ruby by following instructions [here](https://www.ruby-lang.org/en/documentation/installation/)
- Once Ruby has been installed, enter the following into terminal:
  - `$ git clone https://github.com/whywesmurfing/Snakes_Ladders.git`
  - `$ bash install-game.sh` -- This will install all the gem dependencies required to run 'Snakes and Ladders'
  - `$ ruby snakes_ladders.rb -d` -- This will show the available command line arguments for the game.

# App Features 

## Player

* **Player name and colour selection:** Players are required to enter their `name` used to track through the game. Using `tty-prompt`, players will be required to select their colour of choice to be tracked in the game. Should the colour selected be already selected by the previous players, an error message will be shown to the player to pick a different colour.
* **Player rendering:** Players are rendered on the board as an `[X]` to indicate their position on the board. Depending on the colour chosen, the `[X]` will be coloured in the player's colour. The player is rendered through the board through a loop checking if the `player_position` is the same as the `location` ID. 

## Dice

* **Dice rolling:** Similar to other dice-rolling games, Snakes and Ladders requires the players to interact with the terminal to roll the dice. This will randomise an output value between `1` and `6` . The value will be stored in the `Player` Class as a value in the array `die_rolls`.

## Board and Squares

* **Board visualisation**: For a user-friendly experience, a board is rendered visually for the players to know where they are positioned. This is run through a loop to update the board based on where the player is positioned.  
* **Portals (Snakes and Ladders)**: As the main feature of the game, certain squares on the board are snakes or ladders, which change the `location` of the player to a new `destination`. When a player lands on a top of a snake, their playing piece will slide down to the bottom of the snake. Alternatively, when a player lands at the base of a ladder, it immediately climbs to the top of the ladder. Both of these portals will warp the players to the end-point square and update the player's `position` accordingly.  

## Game

* **Win condition**: In addition to the player's rolling the dice to update their position, within the same loop, the player's position is always checked to confirm whether or not the player has reached the end of the board. This is achieved by using  the `>=` comparison operator to compare the `player_position` to the `board.length`, noting that the player can roll further than the final square on the board to win and not just land on the final square.
* **CMD Line Arguments (--help, --version, --directory):** These give the option for the players to learn how to play the game prior to launching the game. 
  * --help shows the instructions to launch and play the game.
  * --version shows the current version of the 'Snakes and Ladders' game.
  * --directory shows the different usage functions available to the player.

# User Experience 

Upon launching the game by running the code:

 `$ ruby snakes_ladders.rb` 

Players will be required to enter in their name and prompted to select the colour of their choice. If they have chosen a colour previously selected, the following error message will be shown:

`Player 1 has already selected this colour. Please select a different colour.`

Once completed, Player 1 receives the following message and is requested to roll the dice:

`Player 1, your turn. Your position is square 0. 
 Press [RETURN] to roll the die.`

By pressing the `Return / Enter` key on their keyboard, the game will start by printing the following message and the board will be rendered to show their updated position on the board.  

`Player 1 rolls 5
Player 1 has landed on 5`

This complete Player 1's turn and moves onto Player 2. The same message and request are shown for Player 2.

![SnakesandLadders_Gameplay2](/docs/SnakesandLadders_Gameplay2.png)

This process repeats for both players until one player reaches the end of the board and wins the game.

![SnakesandLadders_Gameplay3](/docs/SnakesandLadders_Gameplay3.png)



# Control Flow diagram



![SnakesandLadders_ControlFlow](/docs/SnakesandLadders_ControlFlow.png)



# Implementation plan

Tech stack used:

* Source/Version Control:  `git`
* Language:  `ruby ver. 2. 7. 1`
* Gem Used:
  * `bundler` for managing gems
  * `rspec` for testing
  * `colorize` for colour in terminal
  * `tty-table` for board visualisation

See [here](https://trello.com/b/ydaluzh1/snakes-and-ladders) for the Trello board used to manage the implementation process.



