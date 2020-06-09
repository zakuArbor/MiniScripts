/*
* Split data by course year
* All courses are formated with the following:
* 	* first 3 letters rep. department (i.e. csc => Computer Science)
*	* first 3 digits rep. course code where the first digit represent the year (i.e. 108, the first number '1' means it's first year)
*/
function order_by_course_year(data) {
	var obj = {
		"first": [],
		"second": [],
		"third": [],
		"fourth": []
	};
	for (var i = 0; i < data.length; i++) {
		course_level = data[i]["course_code"][3];
		switch(course_level) {
			case '1':
				obj.first.push(data[i]);
				break;
			case '2':
				obj.second.push(data[i]);
				break;
			case '3':
				obj.third.push(data[i]);
				break;
			case '4':
				obj.fourth.push(data[i]);
				break;
		}
	}
	console.log(obj);
	return obj;
}

function order_by_department(data, departments) {

}