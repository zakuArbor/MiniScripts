getMap = function (mode) {
	var map = {};

	switch(1) {
		case 1:
			map["width"] = 12;
			map["height"] = 5;

			map["actors"] = {};

			map["player"] = {
				"x": 1, "y": 2, "img": "player-sprite-sheet.png"
			};

			map["actors"]["rock"] = [
				{"x": 3, "y": 1, "img": "rock.png"},
				{"x": 4, "y": 4, "img": "rock.png"},
				{"x": 6, "y": 1, "img": "rock.png"},
				{"x": 8, "y": 2, "img": "rock.png"},
				{"x": 10, "y": 1, "img": "rock.png"},
				{"x": 10, "y": 2, "img": "rock.png"},
				{"x": 10, "y": 4, "img": "rock.png"},
				{"x": 11, "y": 1, "img": "rock.png"},
				{"x": 11, "y": 2, "img": "rock.png"},
				{"x": 11, "y": 4, "img": "rock.png"},
				{"x": 12, "y": 3, "img": "rock.png"},
				{"x": 3, "y": 0, "img": "rock.png"},
				{"x": 2, "y": 0, "img": "rock.png"},
				{"x": 1, "y": 0, "img": "rock.png"},
				{"x": 0, "y": 0, "img": "rock.png"},
			];

			map["actors"]["wall"] = [
				{"x": 1, "y": 3, "img": "wall-1-3.png"},
				{"x": 1, "y": 4, "img": "wall-1-4.png"},
				{"x": 1, "y": 5, "img": "wall-1-5.png"},
				{"x": 4, "y": 0, "img": "wall-4-0.png"},
				{"x": 5, "y": 0, "img": "wall-x-0.png"},
				{"x": 6, "y": 0, "img": "wall-x-0.png"},
				{"x": 7, "y": 0, "img": "wall-x-0.png"},
				{"x": 8, "y": 0, "img": "wall-x-0.png"},
				{"x": 9, "y": 0, "img": "wall-x-0.png"},
				{"x": 10, "y": 0, "img": "wall-x-0.png"},
				{"x": 11, "y": 0, "img": "wall-10-0.png"},
				{"x": 12, "y": 2, "img": "wall-12-2.png"},
				{"x": 12, "y": 1, "img": "wall-12-y.png"},
				{"x": 12, "y": 0, "img": "wall-12-y.png"},
			];

			//add top walls
			for (var x = 2; x <= 12; x++) {
				map["actors"]["wall"].push({"x": x, "y": 5, "img": "wall.png"});
			}

			map["actors"]["dirt"] = [
				{"x": 0, "y": 1, "img": "dirt.png"},
				{"x": 0, "y": 2, "img": "dirt.png"},
				{"x": 0, "y": 5, "img": "dirt.png"},
				{"x": 0, "y": 4, "img": "dirt.png"},
				{"x": 1, "y": 1, "img": "dirt.png"},
				{"x": 1, "y": 2, "img": "dirt.png"},
				{"x": 10, "y": 3, "img": "dirt.png"},
				{"x": 11, "y": 3, "img": "dirt.png"},
				{"x": 12, "y": 4, "img": "dirt.png"},
			];

			//create a map of where the dirt is located
			map["map"] = {};
			map["map"]["dirt"] = {};
			map["map"]["dirt"]["x"] = {};
			map["map"]["dirt"]["y"] = {};
			map["map"]["dirt"]["x"][0] = [];

			//initialize map
			for (var width = 0; width <= map.width; width++) {
				map["map"]["dirt"]["x"][width] = []
			}

			for (var height = 0; height <= map.height; height++) {
				map["map"]["dirt"]["y"][height] = []
			}

			for (var i = 0; i < map["actors"]["dirt"].length; i++) {
				var dirt = map["actors"]["dirt"][i];

				map["map"]["dirt"]["x"][dirt["x"]].push(dirt["y"]);  
				map["map"]["dirt"]["y"][dirt["y"]].push(dirt["x"]);  
			}
			console.log(map["map"]);

			map["actors"]["ice"] = [];

			//add ice tiles where xE[2,9]-[4] and y = 4
			var ice_img = "ice.png"
			for (var x = 2; x <=9; x++) {
				if (x != 4) {
					map["actors"]["wall"].push({"x": x, "y": 4, "img": ice_img});
				}
			}

			//add ice tiles where xE[2,9] and y = 3
			for (var x = 2; x <=9; x++) {
				map["actors"]["wall"].push({"x": x, "y": 3, "img": ice_img});
			}

			//add ice tiles where xE[2,9]-[8] and y = 2
			var ice_img = "ice.png"
			for (var x = 2; x <=9; x++) {
				if (x != 8) {
					map["actors"]["wall"].push({"x": x, "y": 2, "img": ice_img});
				}
			}

			//add ice tiles where xE[2,9]-[3,6] and y = 1
			var ice_img = "ice.png"
			for (var x = 2; x <=9; x++) {
				if (x != 3 && x!= 6) {
					map["actors"]["wall"].push({"x": x, "y": 1, "img": ice_img});
				}
			}


			map["actors"]["stair"] = [
				{"x": 0, "y": 3, "img": "stair.png"}
			];

			map["actors"]["types"] = [["wall", "rock", "dirt", "ice", "stair"]];
			map["actors"]["types"].push(["pokeball"]);
			
			map["actors"]["pokeball"] = [
				{"x": 11, "y": 3, "img": "pokeball.png"}
			];

			map["invalid_coord"] = {};

			map["invalid_coord"]["x"] = {
				0: [],
				1: [3, 4],
				2: [],
				3: [1, 11],
				4: [4],
				5: [],
				6: [1],
				7: [],
				8: [2],
				9: [],
				10: [1, 2, 4],
				11: [1, 2, 4],
				12: [3]
			}

			map["invalid_coord"]["y"] = {
				0: [],
				1: [3, 6, 10, 11],
				2: [8, 10, 11],
				3: [1, 12, 11],
				4: [1,4, 10, 11],
				5: []
			}

			//add boundary of the top and bottom walls
			for (var x = 0; x <= 12; x++) {
				if (x != 0) {
					map["invalid_coord"]["x"][x].push(5);
					map["invalid_coord"]["y"][5].push(x);		
				}
				map["invalid_coord"]["x"][x].push(0);
				map["invalid_coord"]["y"][0].push(x);	
			}

			//right side of the wall
			for (var y = 0; y < 5; y++) {
				map["invalid_coord"]["x"][12].push(y);
				map["invalid_coord"]["y"][y].push(12);
			}

			break;
	}
	return map;
}