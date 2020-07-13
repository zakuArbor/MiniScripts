/*
* Split data by course year
* All courses are formated with the following:
* 	* first 3 letters rep. department (i.e. csc => Computer Science)
*	* first 3 digits rep. course code where the first digit represent the year (i.e. 108, the first number '1' means it's first year)
*/
function order_by_course_year(data) {
	var obj = {
		"1st year": [],
		"2nd year": [],
		"3rd year": [],
		"4th year": []
	};
	var labels = Object.keys(obj);

	for (var i = 0; i < data.length; i++) {
		var course_level = data[i]["course_code"][3];
		switch(course_level) {
			case '1':
				obj[labels[0]].push(data[i]);
				break;
			case '2':
				obj[labels[1]].push(data[i]);
				break;
			case '3':
				obj[labels[2]].push(data[i]);
				break;
			case '4':
				obj[labels[3]].push(data[i]);
				break;
		}
	}
	return obj;
}

function order_by_department(data, departments) {
	var obj = {}
	for (var i = 0; i < data.length; i++) {
		var department = data[i]["course_code"].slice(0,3);
		if (obj.hasOwnProperty(department)) {
			obj[department].push(data[i]);
		}
		else {
			obj[department] = [data[i]];
		}
	}
	return obj;
}

function count_by_credits(data) {
	console.log("------");
	console.log(data);
	var credits = 0;
	for (var i = 0; i < data.length; i++) {
		credits += data[i]["credits"];
	}
	return credits;
}