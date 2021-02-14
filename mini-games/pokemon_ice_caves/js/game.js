function initBoard(map) {
	var board = "";
	for (var y = map.height; y >= 0; y--) {
		board += "<tr>";
		for (var x = 0; x <= map.width; x++) {
			if (y == 0 || y == map.height || x == 0 || x == map.width) {
				board += "<td id><img id =c" + x + "-" + y + " src = 'wall.png' class ='tile'></td>";
			}
			else {
				board += "<td>";
				board += "<img src=ice.png id =c" + x + "-" + y + " class=tile></td>";
			}
		}
		board += "</tr>";
	}
	document.getElementById("board").innerHTML = board;
	setActors(map);
}

function setActors(map) {
	setActor(map, "rock");
	setActor(map, "wall");
	setActor(map, "dirt");
	setActor(map, "stair");
	document.getElementById("pokeball").style.top = (map["height"] - map["pokeball"][0].y) * 42.5 + "px";
	document.getElementById("pokeball").style["margin-left"] = map["pokeball"][0].x * 40 + "px";
}
function setActor(map, actor_name) {
	var actor;
	for (var i = 0; i < map[actor_name].length; i++) {
		actor = map[actor_name][i];
		document.getElementById("c" + actor["x"] + "-" + actor["y"]).src = actor["img"];
	}
}

function get_dir_positivity(dir) {
	if (dir == "up" || dir == "right") {
		return 1;
	}
	return -1;
}

function get_coord_dir(dir) {
	if (dir == "up" || dir == "down") {
		return "y";
	}
	return "x";
}

function get_coord_array(map, inval_coord_dir, type) {
	if (inval_coord_dir == "x") {
		return map[type + "_y"];
	}
	return map[type + "_x"];
}

function calc_move(dir, map) {
	console.log("calc_move");
	console.log(player);

	var dir_positivity = get_dir_positivity(dir);
	var coord_dir = get_coord_dir(dir);
	var inval_coords = get_coord_array(map, coord_dir, "inval_coord");
	var val_coords = get_coord_array(map, coord_dir, "val_coord");
	var distance = find_closest_inval_distance(coord_dir, dir_positivity, inval_coords, val_coords, map["width"], map["height"]);
	return distance > 0 ? distance : 0;
}

function find_closest_type(coord_array, inval_coord_dir, dir_positivity) {
	var player_indep_coord;
	if (inval_coord_dir == "x") {
		player_indep_coord = player.y;
		player_dep_coord = player.x;
	}
	else {
		player_indep_coord = player.x;
		player_dep_coord = player.y;
	}

	var shortest_distance = 999; //default: no valid distance to travel

	const single_coords = coord_array[player_indep_coord];
	var distance;
	console.log(single_coords);
	console.log(player);
	for (var i = 0; i < single_coords.length && single_coords.length != 0; i++) {
		distance = dir_positivity*(single_coords[i] - player_dep_coord);
		console.log(single_coords[i] - player_dep_coord);
		if (distance < shortest_distance && distance > 0 ) { //should always be greater than 0 but just in case
			shortest_distance = distance;
			console.log("new_shortest distance" + shortest_distance);
		}
	}
	console.log("find_closest_type");
	console.log(shortest_distance);
	return shortest_distance;
}

function find_closest_wall(dir_positivity, inval_coord_dir, width, height) {
	var player_single_coord;
	var wall_coord;
	if (inval_coord_dir == "x") {
		player_single_coord = player.x;
		wall_coord = width;
	}
	else {
		player_single_coord = player.y;
		wall_coord = height;
	}

	if (dir_positivity == -1) {
		return player_single_coord;
	}
	return wall_coord - player_single_coord;
}

function find_closest_inval_distance(inval_coord_dir, dir_positivity, inval_coords, val_coords, width, height) {
	console.log("find closest_inval");
	var closest_inval = find_closest_type(inval_coords, inval_coord_dir, dir_positivity) - 1; //closest rock
	//subtract one because we cannot go through a rock
	console.log(closest_inval);
	console.log("pika");
	if (closest_inval > 900) {
		closest_inval = find_closest_wall(dir_positivity, inval_coord_dir, width, height) - 1;
		//check if there's a valid square before a wall and -1 because we cannot go through a wall
		var closest_val = find_closest_type(val_coords, inval_coord_dir, dir_positivity);
		closest_inval = (closest_val > 900 && closest_val < closest_inval) ? closest_val : closest_inval; 
	}
	return closest_inval; 
}

function get_player_sprite(dir) {
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
	}
	return dimension;
}

function getPlayerElem() {
	return document.getElementById("player");
}

function drawPlayer(dir, map_height) {
	var player_elem = getPlayerElem();
	//player_elem.style.backgroundPosition = player.y * 40 + "px" + " " + player.x * 40 + "px";
	var sprite = get_player_sprite(dir);
	//player_elem.style.top = player.y * 40 + "px";
	player_elem.style["margin-left"] = player.x * 40 + "px";
	player_elem.style["margin-top"] = (map_height - player.y) * 40 + "px"; 
	player_elem.style.backgroundPosition = sprite["x"] * 40 + "px " + sprite["y"] * 42.5 + "px";
	player_elem.style.transform = "scaleX(" + sprite["flip"] +")";
	//player.y + (): the reason is that margin starts from the top of the board and not at the bottom of the board where y coordinates in the coordinate system start
	console.log(sprite);
	console.log(player_elem.style.top);
}

function move(dir, map) {
	var distance = calc_move(dir, map);// * 40; //each block/square is 40px
	var player_elem = document.getElementById("player");
	var dir_positivity = get_dir_positivity(dir);
	var coord_dir = get_coord_dir(dir);
	var player_sprite = get_player_sprite(dir);
	console.log("move");
	console.log(distance);
	var pos = 0;
	var id = setInterval(frame, 30);
	function frame() {
		if (pos == distance) {
			clearInterval(id);
			console.log(player);
		} else {
			console.log("*****");
			console.log(player);
			player[coord_dir] += 1*dir_positivity;
			pos+=1;
			//document.getElementById("c" + player.x + "-" + player.y).style["background-color"] = "yellow";
			drawPlayer(dir, map["height"]);
			//pos+=10; 
			//player_elem.style.top = pos + "px"; 
			//player_elem.style.left = pos + "px"; 

		}
	}
}
/*
document.getElementById("image").style.backgroundPosition = 
`-256px 0px`;
*/

var player = {
	"x": 1,
	"y": 2
}