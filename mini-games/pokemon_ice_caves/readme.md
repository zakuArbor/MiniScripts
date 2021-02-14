# Ice Cave Path

## Tile Layering System

The map will be divided to squares as it was in the first version. This branch's goal is to make the game's structure to be more consistent and structured unlike its precedessor. Another goal is to avoid hardcoding values so that we can change maps without problems.


Current plan is to have each cell in a table to be a tile

Each tile will consist of layers. This will be done by have each tile have two divs (where each div is a layer). At most, each tile will have 2 layers.

The first layer will indicate the tile's main feature/image. The 2nd layer will be something on top of the tile. (i.e. a pokeball on top of a dirt)

HTML Selector Format for the layers:

**Tile**
* class: `.tile` 
* id: `#tile-<x>-<y>`

**Layer 1**
* class: `.layer1`
* id: `#layer1-<x>-<y>`

**Layer 2**
* class: `.layer2`
* id: `#layer2-<x>-<y>`

## OOP

This branch will utilize the idea of OOP to keep related attributes and methods to an object. This way we can ensure more modularity and any changes to the structure requires minimum change (i.e. changing how the html id and class selectors are formated or changing the attribute key names. Only need to change it once instead of going to every occurance in the code and change it).

Class: Board

Class: Actor

Class: Tile

