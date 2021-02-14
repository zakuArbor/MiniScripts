function formatCoord(x, y) {
	return x + "-" + y;
}

function formatSelector(title, x, y) {
	return title + "-" + formatCoord(x, y);
}

function getDirPositivity(dir) {
	if (dir == "up" || dir == "right") {
		return 1;
	}
	return -1;
}

function oppCoordAxis(coord_axis) {
	if (coord_axis == "x") {
		return "y";
	}
	return "x";
} 

function layer2TopPadding(map_height, y) {
	return -40;
}

class Actor {
	constructor(type, x, y, src) {
		this.type = type;
		this.x = x;
		this.y = y;
		this.src = src;
	}

	getCoord() {
		formatCoord(x,y);
	}

	getActorType() {
		return this.type;
	}

	getSrc() {
		return this.src;
	}

	getX() {
		return this.x;
	}

	getY() {
		return this.y;
	}
}

class Player extends Actor {
	constructor(x, y, src) {
		super("player", x, y, src);
	}

	getPlayerElem() {
		return document.getElementById(formatSelector("layer2", this.x, this.y));
	}

	getPlayerSpriteInfo(dir) {
		var dimension = {};
		switch (dir) {
			case "left":
				dimension["x"] = 0;
				dimension["y"] = 1;
				dimension["flip"] = 1;
				break;
			case "right":
				dimension["x"] = 0;
				dimension["y"] = 1;
				dimension["flip"] = -1; //flip the image
				break;
			case "up":
				dimension["x"] = 1;
				dimension["y"] = 0;
				dimension["flip"] = 1;
				break;
			case "down": 
				dimension["x"] = 2;
				dimension["y"] = 0;
				dimension["flip"] = 1;
				break;
			case "":
				break;
		}
		return dimension;
	}

	displaySprite(dir) {
		var sprite_info = this.getPlayerSpriteInfo(dir);
		var player_elem = document.getElementById("player");
		player_elem.style.backgroundPosition = sprite_info["x"] * 40 + "px " + sprite_info["y"] * 42.5 + "px";
		player_elem.style.transform = "scaleX(" + sprite_info["flip"] +")";
	}

	drawPlayer(map_height, dir) {
		(this.getPlayerElem()).innerHTML = "<div id = 'player'></div>";
		
		this.getPlayerElem().innerHTML = "<div id = 'player'></div>";
		(this.getPlayerElem()).firstChild.style.top = layer2TopPadding(map_height, this.getY()); //fix it's position in the map (it always appear 1 unit down by default)

		this.displaySprite(dir);
	}

	move(map_height, dir_info) {
		(this.getPlayerElem()).innerHTML = ""; //erase the player's previous locaton

		this[dir_info.coord_axis] += 1*(dir_info.dir_positivity);
		this.drawPlayer(map_height, dir_info.dir);
	}

}

class Tile {
	constructor() {

	}
	//A class that has no attributes
	//Could have every tile be an instance of the class Tile but it seems to cost a lot of space complexity
	//To decrease space usage, opted to have one class that just contains all the methods related to the tile
	getId(type, x, y) {
		return document.getElementById(type + "-" + formatCoord(x, y));
	}

	setLayer(actor, type) {

	}
}

class Board { 
	constructor (width, height, actors, player, actor_layer_types, invalid_coord, map) {
		this.width = width;
		this.height = height;
		this.actor_layer_types = actor_layer_types;
		console.log(player);
		this.player = new Player(player.x, player.y, player.img);
		this.actors = actors;
		this.tile = new Tile();
		this.invalid_coord = invalid_coord;
		this.map = map;
	}

	getHeight() {
		return this.height;
	}

	getWidth() {
		return this.width;
	}

	getElem(layer, x, y) {
		return document.getElementById(formatSelector(layer, x, y));
	}

	setActors(layer, actor_types, actors) {
		for (var i = 0; i < actor_types.length; i++) {
			//console.log(actor_types[i]);
			this.setActor(layer, actor_types[i], actors[actor_types[i]]);
		}
	}

	setActor(layer, actor_name, actors) {
		var actor;
		for (var i = 0; i < actors.length; i++) {
			actor = actors[i];
			//console.log(actor);
			(this.getElem(layer, actor["x"], actor["y"])).innerHTML = "<img src ='images/" + actor["img"] + "' class = '" + layer + "'/>";
			if (layer == "layer2") {
				(this.getElem(layer, actor["x"], actor["y"])).firstChild.style.top = layer2TopPadding(this.height, actor["y"]);
			}
		}
	}

	drawBoard() {
		var board = "";
		for (var y = this.height; y >= 0; y--) {
			board += "<tr>";
			for (var x = 0; x <= this.width; x++) {
				board += "<td id = '" + formatSelector("tile", x, y) + "' class = 'tile'>";

				board += "<div id = '" + formatSelector("layer1", x, y) + "'></div>";
				board += "<div id = '" + formatSelector("layer2", x, y) + "' class = 'layer2'></div>";

				board += "</td>";
			}
			board += "</tr>";
		}

		document.getElementById("board").innerHTML = board;
		this.setActors("layer1", this.actor_layer_types[0], this.actors);
		this.setActors("layer2", this.actor_layer_types[1], this.actors);
		this.player.drawPlayer(this.height, "right");
	}

	getCoordAxis(dir) {
		if (dir == "up" || dir == "down") {
			return "y";
		}
		return "x";
	}


	findClosestType(dir, dir_positivity, coord_axis, coords) {
		var distance;
		var shortest_distance = 9999;
		console.log("***************")
		for (var i = 0; i < coords.length; i++) {
			distance = dir_positivity*(coords[i] - this.player[coord_axis]);
			if (distance < shortest_distance && distance > 0 ) { //should always be greater than 0 but just in case
				shortest_distance = distance;
			}
		}
		console.log(shortest_distance);
		return shortest_distance;
	}

	calcDistance(dir, dir_positivity, coord_axis) {
		var opp_coord_aix = oppCoordAxis(coord_axis);
		var player_opp_position = (this.player["get" + opp_coord_aix.toUpperCase()])();
		var invalid_coords = this.invalid_coord[opp_coord_aix][player_opp_position];
		var closest_inval_distance = this.findClosestType(dir, dir_positivity, coord_axis, invalid_coords);

		var coords = this.map["dirt"][opp_coord_aix][player_opp_position];
		console.log(coords);
		var closest_valid_distance = this.findClosestType(dir, dir_positivity, coord_axis, coords);

		var distance = closest_inval_distance - 1; //-1 because we cannot go through a wall or a rock
		if (distance == (9999 - 1) || distance > closest_valid_distance) { //-1 because we cannot go through a wall or a rock
			distance = closest_valid_distance;
		}

		return distance == 9999 ? 0 : distance; 
	}

	move(dir) {
		var dir_positivity = getDirPositivity(dir);
		var coord_axis = this.getCoordAxis(dir);
		var distance = this.calcDistance(dir, dir_positivity, coord_axis);
		var height = this.height;
		var player = this.player;
		var dir_info = {"dir": dir, "dir_positivity": dir_positivity, "coord_axis": coord_axis};
		var pos = 0;
		var id = setInterval(frame, 30);
		function frame() {
			if (pos == distance) {
				clearInterval(id);
				console.log(player);
			} else {
				console.log(dir);
				console.log(player.getX());
				pos+=1;
				player.move(height, dir_info);
			}
		}
	}

	updateBoard(dir, player) {

	}
}