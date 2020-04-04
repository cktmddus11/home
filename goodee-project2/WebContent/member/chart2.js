var randomColorFactor = function() {
	return Math.round(Math.random() * 255); // 0 ~ 255랜덤값
}
var randomColor = function(opacity) { // opacity 투명도
	return "rgba(" + randomColorFactor() + "," + randomColorFactor() + ","
			+ randomColorFactor() + "," + (opacity || '.3') + ")";
};
function barGraphprint(data) {
	var rows = JSON.parse(data);
	var homeworks = [];
	var datas = [];
	var colors = [];
	$.each(rows, function(index, item) {
		homeworks[index] = item.homework; // 차승연
		datas[index] = item.cnt; // cnt 10
		colors[index] = randomColor(1);
	})
	console.log(data);
	var horizontalBarChartData = {
		labels : homeworks,
		datasets : [ {
			label : 'homework',
			backgroundColor : window.chartColors.red,
			borderColor : window.chartColors.red,
			borderWidth : 1,
			data : datas
		} ]

	};

	var ctx = document.getElementById('chart1').getContext('2d');
	window.myLine = new Chart(ctx, {
		type : 'horizontalBar',
		data : horizontalBarChartData,
		options : {
			// Elements options apply to all of the options unless overridden in
			// a dataset
			// In this case, we are setting the border of each horizontal bar to
			// be 2px wide
			elements : {
				rectangle : {
					borderWidth : 1,
				}
			},
			responsive : true,
			legend : {
				position : 'right',
			},
			title : {
				display : true,
				text : 'homework'
			},
			scales : {
				xAxes : [ {
					ticks : {
						// beginAtZero: true,
						min : 0,
						max : 3,
						stepSize : 1,
						fontSize : 14,
					}
				} ]
			}
		}
	});
}
function barGraphprint2(data) {
	var rows = JSON.parse(data);
	var grades = [];
	var datas = [];
	var colors = [];
	$.each(rows, function(index, item) {
		grades[index] = item.grade; // 차승연
		datas[index] = item.cnt; // cnt 10
		colors[index] = randomColor(1);
	})
	console.log(data);
	var horizontalBarChartData = {
		labels : grades,
		datasets : [ {
			label : 'grade',
			backgroundColor : window.chartColors.red,
			borderColor : window.chartColors.red,
			borderWidth : 1,
			data : datas
		} ]

	};

	var ctx = document.getElementById('chart2').getContext('2d');
	window.myLine = new Chart(ctx, {
		type : 'horizontalBar',
		data : horizontalBarChartData,
		options : {
			// Elements options apply to all of the options unless overridden in
			// a dataset
			// In this case, we are setting the border of each horizontal bar to
			// be 2px wide
			elements : {
				rectangle : {
					borderWidth : 1,
				}
			},
			responsive : true,
			legend : {
				position : 'right',
			},
			title : {
				display : true,
				text : 'homework'
			},
			scales : {
				xAxes : [ {
					ticks : {
						// beginAtZero: true,
						min : 0,
						max : 20,
						stepSize : 1,
						fontSize : 14,
					}
				} ]
			}
		}
	});
}