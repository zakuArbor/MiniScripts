colors = ['#ff6384', '#36a2eb', '#cc65fe', '#ffce56', '#da7f8c', '#d68b9a', '#d296a8', '#cca1b6', '#c5acc4', '#bdb7d3', '#b3c2e1', '#a7ccf0', '#98d7ff'];

function create_options(title) {
    return {
        cutoutPercentage: 50,
        responsive: false,
        maintainAspectRatio: false,
        "title": {
            display: true,
            text: title,
        },
        legend: { //legend credits to: https://jsfiddle.net/6bexkyd9/
            display: true,
            position: 'bottom',
            labels: {
                generateLabels: function(chart) {
                    var data = chart.data;
                    if (data.labels.length && data.datasets.length) {
                        return data.labels.map(function(label, i) {
                            var meta = chart.getDatasetMeta(0);
                            var ds = data.datasets[0];
                            var arc = meta.data[i];
                            var custom = arc && arc.custom || {};
                            var getValueAtIndexOrDefault = Chart.helpers.getValueAtIndexOrDefault;
                            var arcOpts = chart.options.elements.arc;
                            var fill = custom.backgroundColor ? custom.backgroundColor : getValueAtIndexOrDefault(ds.backgroundColor, i, arcOpts.backgroundColor);
                            var stroke = custom.borderColor ? custom.borderColor : getValueAtIndexOrDefault(ds.borderColor, i, arcOpts.borderColor);
                            var bw = custom.borderWidth ? custom.borderWidth : getValueAtIndexOrDefault(ds.borderWidth, i, arcOpts.borderWidth);

                            // We get the value of the current label
                            var value = chart.config.data.datasets[arc._datasetIndex].data[arc._index];

                            return {
                                // Instead of `text: label,`
                                // We add the value to the string
                                text: label + " : " + value,
                                fillStyle: fill,
                                strokeStyle: stroke,
                                lineWidth: bw,
                                hidden: isNaN(ds.data[i]) || meta.data[i].hidden,
                                index: i
                            };
                        });
                    } else {
                        return [];
                    }
                }
            }
        }

    };
}

function create_pie_chart(ctx, data, options) {
    return new Chart(ctx, {
        type: 'pie',
        data: data,
        options: options
    });
}

function get_course_year_graph_data(data) {
    var labels = Object.keys(data);

    var data_points = [];

    for (const property in data) {
        //data_points.push(count_by_credits(data[property]));
        data_points.push(data[property].length);
    }

    var graph_data = {
        "datasets": [{
            "data": data_points,
            "backgroundColor": colors,
        }],
        "labels": labels,
    }
    console.log(graph_data);
    return graph_data;
}

function draw_course_years(raw_data) {
    var data = get_course_year_graph_data(raw_data);
    var title = "Number of courses by year";
    
    var ctx = document.getElementById('year_chart');

    var options = create_options(title);
    return create_pie_chart(ctx, data, options);
}

function get_dept_graph_data(data, departments) {
    var labels = [];
    var data_points = [];
    //var data = order_by_department(raw_data);
    
    for (const property in data) {
        labels.push(departments[property]);
        data_points.push(data[property].length);
        //data_points.push(count_by_credits(data[property]));
    }

    return graph_data = {
        "datasets": [{
            "data": data_points,
            "backgroundColor": colors,
        }],
        "labels": labels,
    }
}

function list_courses(dept) {
    alert(dept);
}

function draw_course_departments(raw_data, departments) {
    var data = get_dept_graph_data(raw_data, departments);
    var title = "Number of courses by department";

    var ctx = document.getElementById('dept_chart');
    var ctx2 = document.getElementById('dept_chart');

    var options = create_options(title);
    return create_pie_chart(ctx, data, options);
}