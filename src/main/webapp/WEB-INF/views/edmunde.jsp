<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<div id="results-body"></div>
<script>
	window.sdkAsyncInit = function() {
		var year = '${param.ed_year}';
		var brand = '${param.ed_brand}';
		var model = '${param.ed_model}';
		
		// Instantiate the SDK
		var res = new EDMUNDSAPI('jrjqg5yagzrc968scyzrgfss');
// 		console.log(res);
		// Optional parameters
		var options = {
			"state" : "new"
		};
		// Callback function to be called when the API response is returned
		function success(res) {
// 			alert(res.url);
			var body = document.getElementById('results-body');
// 			alert(res.styles.length);
// 			alert(res.size());
			console.log(res);
// 			body.innerHTML = res.years[0].styles[0].name+ res.years[1].styles[1].name;
// 			body.innerHTML = res.photos[0].title;
			
// 			alert(body.innerHTML);
		}
		// Oops, Houston we have a problem!
		function fail(data) {
			console.log(data);
		}
		// Fire the API call
// 		res.api('/api/vehicle/v2/'+brand+'/'+model+'/'+year, options, success, fail);
		res.api('/api/media/v2/'+brand+'/'+model+'/'+year+'/photos', options, success, fail);
//  		alert(res.years[0]);
 		
//  		var fso=new ActiveXObject('Scripting.FileSystemObject');
//  		 var fileObj=fso.CreateTextFile("C:\\write.txt",true);
//  		 fileObj.WriteLine(res);
//  		 fileObj.Close();
 		
		// Additional initialization code such as adding Event Listeners goes here
	};

	// Load the SDK asynchronously
	(function(d, s, id) {
		var js, sdkjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		var context = "${pageContext.request.contextPath}";
		
		js = d.createElement(s);
		js.id = id;
		js.src = context+'/resources/sdk-javascript-master/edmunds.api.sdk.js';
// 		alert(js.src);
		sdkjs.parentNode.insertBefore(js, sdkjs);
	}(document, 'script', 'edmunds-jssdk'));
</script>