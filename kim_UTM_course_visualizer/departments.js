function get_departments() {
	return {
		"AST": "Astronomy",
		"ANT": "Anthropology",
		"BIO": "Biology",
		"JBC": "Biology",
		"HSC": "Biomedical Communications",
		"CHM": "Chemistry",
		"JCP": "Chemistry",
		"CPS": "Chemistry",
		"JCB": "Chemistry",
		"CIN": "Cinema Studies",
		"CLA": "Classical Civilization",
		"CCT": "Communication, Culture, Information and Technology",
		"MGD": "Communication, Culture, Information and Technology",
		"WRI": "Communication, Culture, Information and Technology",
		"CSC": "Computer Science",
		"CBJ": "Computer Science",
		"CTE": "Concurrent Teacher Education",
		"DTS": "Diaspora and Transnational Studies",
		"DRE": "Drama",
		"DRS": "Drama",
		"ERS": "Earth Science",
		"ECO": "Economics",
		"EDS": "Education Studies",
		"ENG": "English",
		"ENV": "Environment",
		"JEP": "Environment",
		"FAH": "Fine Art History",
		"FAH": "Fine Art History",
		"VST": "Fine Art History",
		"FAS": "Fine Art Studio",
		"FYE": "First Year Experience",
		"FSC": "Forensic Science",
		"FRE": "French",
		"FSL": "French",
		"LTL": "French",
		"GGR": "Geography",
		"HHS": "Geography",
		"JEG": "Geography",
		"JGE": "Geography",
		"HIS": "History",
		"RLG": "History of Religions",
		"IMI": "Institute for Management and Innovation",
		"ITA": "Italian",
		"GER": "Language Studies",
		"LAT": "Language Studies",
		"SPA": "Language Studies",
		"HIN": "Language Studies",
		"CHI": "Language Studies",
		"PRS": "Language Studies",
		"URD": "Language Studies",
		"ARA": "Language Studies",
		"SAN": "Language Studies",
		"FGI": "Language Studies",
		"HBA": "Language Teaching and Learning: French and Italian",
		"LIN": "Linguistics",
		"JAL": "Linguistics",
		"MGM": "Management",
		"MGT": "Management",
		"MAT": "Mathematics",
		"PHL": "Philosophy",
		"JCP": "Physics",
		"PHY": "Physics",
		"JPE": "Political Science",
		"POL": "Political Science",
		"PSY": "Psychology",
		"SOC": "Sociology",
		"STA": "Statistics",
		"UTM": "Student Development and Transition",
		"VCC": "Visual Culture and Communication",
		"WGS": "Women and Gender Studies"		
	}
}

function get_dept_codes() {
	return {
		"Astronomy": ["AST"],
		"Anthropology": ["ANT"],
		"Biology": ["BIO","JBC"],
		"Biomedical Communications": ["HSC"],
		"Chemistry": ["CHM","CPS","JCB"],
		"Physics": ["JCP","PHY"],
		"Cinema Studies": ["CIN"],
		"Classical Civilization": ["CLA"],
		"Communication, Culture, Information and Technology": ["CCT","MGD","WRI"],
		"Computer Science": ["CSC","CBJ"],
		"Concurrent Teacher Education": ["CTE"],
		"Diaspora and Transnational Studies": ["DTS"],
		"Drama": ["DRE","DRS"],
		"Earth Science": ["ERS"],
		"Economics": ["ECO"],
		"Education Studies": ["EDS"],
		"English": ["ENG"],
		"Environment": ["ENV","JEP"],
		"Fine Art History": ["FAH","VST"],
		"Fine Art Studio": ["FAS"],
		"First Year Experience": ["FYE"],
		"Forensic Science": ["FSC"],
		"French": ["FRE","FSL","LTL"],
		"Geography": ["GGR","HHS","JEG","JGE"],
		"History": ["HIS"],
		"History of Religions": ["RLG"],
		"Institute for Management and Innovation": ["IMI"],
		"Italian": ["ITA"],
		"Language Studies": ["GER","LAT","SPA","HIN","CHI","PRS","URD","ARA","SAN","FGI"],
		"Language Teaching and Learning: French and Italian": ["HBA"],
		"Linguistics": ["LIN","JAL"],
		"Management": ["MGM","MGT"],
		"Mathematics": ["MAT"],
		"Philosophy": ["PHL"],
		"Political Science": ["JPE","POL"],
		"Psychology": ["PSY"],
		"Sociology": ["SOC"],
		"Statistics": ["STA"],
		"Student Development and Transition": ["UTM"],
		"Visual Culture and Communication": ["VCC"],
		"Women and Gender Studies": ["WGS"]
	}
}

/*
* Used to generate data for all the course codes associated with a department name
*/
function dept_name_codes() {
	var obj = {}
	var depts = get_departments();
	for (const key in depts) {
		if (depts[key] in obj) {
			obj[depts[key]].push(key);
		}
		else {
			obj[depts[key]] = [key];
		}
	}
	return obj;
}
console.log(dept_name_codes());