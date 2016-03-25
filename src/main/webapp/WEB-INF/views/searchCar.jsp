<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55363739-2', 'auto');
  ga('send', 'pageview');

</script>
<style type="text/css">

   html, body {
/*         height: 100%; */
/*         width : 100%; */
        margin: 0px;
    }

    .container {
        height: 100%;
        width : 100%;
        background: #f0e68c;
    }
  </style>
</head>
<body>
<%-- ${carCount} --%>
		<div class="highcharts-container" id="chart"
			style="width: 100%; height: 100%; text-align: left; line-height: normal; overflow: hidden; position: relative; z-index: 0;">
		</div>
	<br>

		<script id="script_code">
			
			var data = ${carCount};
			var prob = "${prob}";
			var datalength = Object.keys(data).length;
			function chart(prm_data, prm_prob) {
				jui.ready([ "chart.builder" ], function(chart) {
// 					alert(this.get("width"));
// 					alert(this.getData(1));
					chart("#chart", {
						padding : { left : 100, right : 100, top : 100, bottom : 100 },
						width :  "100%",
						height : 500,
						theme : "jennifer",
						
						axis : {
							data : [ prm_data
							//                     { "yellow" : 36, "red" : 45, black : 18, blue : 10, green : 5, cyan : 100, cross : 33, xxx : 30, ddd : 2 }
							]
						},
						brush : [ {
							type : "pie",
							showText : true,
							format : function(k, v, max) {
								return this.icon("check") + k + ": " + v +" 회"+ "("
										+ ((v / max) * 100).toFixed(2) + "%)";
							},
//	 						orient : "left",
							active : [ prm_prob ],
						//                 activeEvent : "click"
						} ],
						widget : [ {
							type : "legend",
							orient : "bottom"
							
						}, {
							type : "tooltip",
							orient: "left"
						}, {
							type : "title",
							text  : "정비이력",
							size : "14"
						}
						]
					});
				})	
			}
			
			if (data == "No Result") {
				var div = document.getElementById("chart");
				div.innerText = "정비이력 내역 없음";
			} else {
				if (datalength == 1) {
					chart(data, null);
				} else { 
					chart(data, prob);
				}
				
			}
		</script>
		
</body>
</html>