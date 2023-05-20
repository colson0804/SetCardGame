# SetCardGame
Set is an implementation of the popular card game "Set" using SwiftUI. 

Cards are automatically resized to fit the screen. Animations deal the cards onto the table and discard them when a match occurs. 

<img src="https://github.com/colson0804/SetCardGame/assets/5607871/3a8e3c36-b16c-4bc8-8be5-50c62223bc33" width="25%%">

## Game Rules 
Set is a pattern recognition card game where players try to identify a "set" of three cards that satisfy certain criteria. Here are the basic rules:
1. Deck: The game consists of a deck of 81 unique cards. Each card has four features: symbol (rectangle, diamond, or oval), color (red, green, or purple), number (1, 2, or 3), and shading (solid, transparent, or open).
2. Objective: The goal is to find sets of three cards that, for each feature, are either all the same or all different. For example, three cards with the same symbol but different colors would form a valid set.
3. Gameplay: Initially, 12 cards are dealt face-up on the table. Players take turns finding sets and announcing them. When a set is found, the player removes those cards from the table and replaces them with new cards from the deck. If no sets are available, additional cards are dealt from the deck.
4. Scoring: Players earn points for finding sets. At the end of the game, the player with the highest score wins.

