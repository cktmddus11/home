var randomColorFactor = function() {
	return Math.round(Math.random() * 255); // 0 ~ 255랜덤값
}
var randomColor = function(opacity) { // opacity 투명도
	return "rgba(" + randomColorFactor() + "," + randomColorFactor() + ","
			+ randomColorFactor() + "," + (opacity || '.3') + ")";
};
function lineGraphprint(data) {
	var rows = JSON.parse(data);
	var semester_codes = [];
	var datas = [];
	var colors = [];
	$.each(rows, function(index, item) {
		semester_codes[index] = item.semester_code; // 차승연
		datas[index] = item.grade_avg; // cnt 10
		colors[index] = randomColor(1);
	})
	console.log(datas);
	var config = {

		type : 'line',
		data : {
			labels : semester_codes,
			datasets : [ {
				label : 'score avg',
				borderColor : window.chartColors.red,
				backgroundColor : [ window.chartColors.red,
						window.chartColors.orange, window.chartColors.yellow,
						window.chartColors.green, window.chartColors.blue, ],
				fill : false,
				data : datas
			} ]
		}, 
		options : {
			responsive : true,
			scales : {
				yAxes : [ {
					ticks : {
						// beginAtZero: true,
						min : 0.0,
						max : 5.0,
						stepSize : 0.5,
						fontSize : 14,
					}
				} ]
			}
		}
	}
	var ctx = document.getElementById('linecanvas').getContext('2d');
	window.myLine = new Chart(ctx, config);
};
function pieGraphprint(data) {
	console.log(data);
	var rows = JSON.parse(data);
	var grade = [];
	var datas = [];
	var colors = [];
	$.each(rows, function(index, item) {
		grade[index] = item.grade2; // 차승연
		datas[index] = item.cnt; // cnt 10
		colors[index] = randomColor(1);
	})
	var config2 = {
		type : 'pie',
		data : {
			labels : grade,
			datasets : [{
				label : datas,
				backgroundColor : [ window.chartColors.red,
						window.chartColors.orange, window.chartColors.yellow,
						window.chartColors.green, window.chartColors.blue, ],
				fill : false,
				data : datas,
			} ]
		},
		options : {
			responsive : true,
		}
	}	
	
	var ctx2 = document.getElementById('piecanvas').getContext('2d');
	window.myLine = new Chart(ctx2, config2);

}
