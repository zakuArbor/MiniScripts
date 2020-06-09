colors = ['#ff6384', '#36a2eb', '#cc65fe', '#ffce56'];

function get_course_year_graph_data(raw_data) {
    var labels = ["1st year", "2nd year", "3rd year", "4th year"];

    data = order_by_course_year(raw_data);
    graph_data = {
        "datasets": [{
            "data": [
            data.first.length,
            data.second.length,
            data.third.length,
            data.fourth.length
            ],
            "backgroundColor": colors,
        }],
        "labels": labels,
    }
    console.log(graph_data);
    return graph_data;

}

function draw_course_year(raw_data) {
    data = get_course_year_graph_data(raw_data);
    title = "Number of courses by year";


    var ctx = document.getElementById('myChart');

    var options = {
        cutoutPercentage: 50,
        responsive: true,
        maintainAspectRatio: false,
        "title": {
            display: true,
            text: title,
        }
    }

    var chart = new Chart(ctx, {
        type: 'pie',
        data: data,
        options: options
    });
}