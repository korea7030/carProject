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
<script>
$(document).ready(function() {
	
	$('#model').change(function() {   // model 값 가져오기
		var year =$('#year option:selected').val();
		var brand =$('#brand option:selected').val();
		var model = $('#model option:selected').val();
		
		var url = "prob.do";
		if (brand == "") {
			alert("차종을 선택하세요");
			return;
		} else {
			$.ajax({
				type : 'POST',
				data : JSON.stringify({
		            "brand" : brand,
		            "year" : year,
		            "model" : model
		        }),
				dataType : 'json',
				url : url,
				contentType: "application/json; charset=utf-8",
				success : function(msg) {
					var select = "<option>정비위치</option>";
					if (msg["result"][0] == "N") {
						alert("선택한 모델의 정비내역이 없습니다.")
						$("#problem").find("option").remove().end().append("<option value = "+""+">"+"정비위치</option>");
					}
					else {
						$("#problem").find("option").remove().end().append("<option value = "+""+">"+"정비위치</option>");
						var sel = document.getElementById("problem");
						
						for (var key in msg["result"]) {
							if (msg["result"].hasOwnProperty(key)) {
								console.log(key);
// 								key = key.replace(" ", "&nbsp;");
// 								console.log("number : "+msg["result"][key]);
// 								$("#problem").append("<option value = "+key.replace(" ", "&nbsp;")+">" + key+"("+msg["result"][key]+")"+ "</option>");
								var objOp = document.createElement("option");
								objOp.text = key+"("+msg["result"][key]+")";
								objOp.value = key;
								sel.options.add(objOp);
							}
						}
					}
				},
				error : function(xhr, status, e) {
// 					alert(xhr.responseText);
				}
			});
		}
	})
	
	$('#brand').change(function() {   // model 값 가져오기
		var year =$('#year option:selected').val();
		var brand =$('#brand option:selected').val(); 
		var url = "select.do";
		if (year == "") {
			alert("연도를 선택하세요");
			return;
		} else {
			$.ajax({
				type : 'POST',
				data : JSON.stringify({
		            "brand" : brand,
		            "year" : year
		        }),
				dataType : 'json',
				url : url,
				contentType: "application/json; charset=utf-8",
				success : function(msg) {
					var select = "<option>모델선택</option>";
					if (msg["result"][0] == "N") {
						alert("선택한 차종의 정비이력이 없습니다.");
						$("#model").find("option").remove().end().append("<option value = "+""+">"+"모델선택</option>");
						$("#problem").find("option").remove().end().append("<option value = "+""+">"+"모델선택</option>");
					}
					else {
						$("#model").find("option").remove().end().append("<option value = "+""+">"+"모델선택</option>");
						var sel = document.getElementById("model");
						
						for (var key in msg["result"]) {
							if (msg["result"].hasOwnProperty(key)) {
								console.log(key);
								console.log("number change: "+msg["result"][key]);
// 								$("#model").append("<option value = "+key.replace(" ", "&nbsp;")+">" + key+"("+msg["result"][key]+")"+ "</option>");
								var objOp = document.createElement("option");
								objOp.text = key+"("+msg["result"][key]+")";
								objOp.value = key;
								sel.options.add(objOp);
							}
						}
					}
				},
				error : function(xhr, status, e) {
// 					alert(xhr.responseText);
				}
			});
		}
		
	});
	
	$('#year').change(function() {   // model 값 가져오기
		var year =$('#year option:selected').val();
		
		var url = "brand.do";
			$.ajax({
				type : 'POST',
				data : JSON.stringify({
		            "year" : year
		        }),
				dataType : 'json',
				url : url,
				contentType: "application/json; charset=utf-8",
				success : function(msg) {
					var select = "<option>차종선택</option>";
					
					if (msg["result"][0] == "N") {
						alert("선택한 연도의 정비이력이 없습니다.");
						$("#brand").find("option").remove().end().append("<option value = "+""+">"+"차종선택</option>");
						$("#model").find("option").remove().end().append("<option value = "+""+">"+"차종선택</option>");
						$("#problem").find("option").remove().end().append("<option value = "+""+">"+"차종선택</option>");
					}
					else {
						$("#brand").find("option").remove().end().append("<option value = "+""+">"+"차종선택</option>");
						
						for (var key in msg["result"]) {
							if (msg["result"].hasOwnProperty(key)) {
								console.log(key);
// 								key = key.replace(" ", "&nbsp;");
								$("#brand").append("<option value = "+key+">" + key+"("+msg["result"][key]+")"+ "</option>");
								
							}
						}
					}
				},
				error : function(xhr, status, e) {
// 					alert(xhr.responseText);
				}
			});
		});
})
</script>

</head>
<body>
		<form:form commandName = "CarVo" role="form" method="POST" action = "searchCar.do">
			<table class="table">
				<tbody>
					<tr>
						<td><form:select class="form-control" id="year" path="VHICHL_REG_DT">
								<option value="">년도선택</option>
								<option value="2016">2016</option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2013">2013</option>
								<option value="2012">2012</option>
								<option value="2011">2011</option>
								<option value="2010">2010</option>
								<option value="2009">2009</option>
								<option value="2008">2008</option>
								<option value="2007">2007</option>
								<option value="2006">2006</option>
								<option value="2005">2005</option>
								<option value="2004">2004</option>
								<option value="2003">2003</option>
								<option value="2002">2002</option>
								<option value="2001">2001</option>
								<option value="2000">2000</option>
								<option value="1999">1999</option>
								<option value="1998">1998</option>
								<option value="1997">1997</option>
								<option value="1996">1996</option>
								<option value="1995">1995</option>
						</form:select></td>
					</tr>
					<tr>
						<td><form:select class="form-control" id="brand" path="VHICHL_NM">
								<option value="">차종선택</option>
						</form:select></td>
					</tr>
					<tr>
						<td><form:select class="form-control" id="model" path="VHICHL_REQ_DT">
								<option value="">모델선택</option>
						</form:select></td>
					</tr>
					<tr>
						<td><form:select class="form-control" id="problem" path="VHICHL_WRK_ID">
								<option value="">정비위치</option>		
						</form:select></td>
					</tr>
				</tbody>
			</table>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-info">
					검색<i class="fa fa-check spaceLeft"></i>
				</button>
			</div>
		</form:form>
</body>
</html>
