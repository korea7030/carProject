<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function goPage(page) {
// 		alert(page);
// 		alert(carHist);
		var brand = '${brand}';
		var model = '${model}';
		var prob = '${prob}';
		var year = '${year}';
		var carCount = '${carCount}';
		var totCount = '${totCount}';
		
		document.carForm.pageNo.value = page;
		document.carForm.year.value = year;
		document.carForm.model.value = model;
		document.carForm.brand.value = brand;
		document.carForm.prob.value = prob;
		document.carForm.method = "post";
		document.carForm.carCount.value = carCount;
		document.carForm.totCount.value = totCount;
		document.carForm.submit();
	}
</script>
<script type="text/javascript">
$(document).ready(function () {
    $('.togglesettings').hide();
    $('.togglesettings:first').show();
    $('.showpageblock').on('click', function () {
        var $t = $(this).closest('.editblocks').next().find('.togglesettings').stop(true).slideToggle();
        $('.togglesettings').not($t).stop(true).slideUp();
        return false;
    });
});
</script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-55363739-2', 'auto');
  ga('send', 'pageview');

</script>
</head>
<body>
<form name = "carForm" id = "carForm" action = "goPage.do" method = "post">

<input type ="hidden" name = "pageNo" value = "" />
<input type ="hidden" name = "brand" value = "" />
<input type ="hidden" name = "model" value = "" />
<input type ="hidden" name = "prob" value = "" />
<input type ="hidden" name = "year" value = "" />
<input type ="hidden" name = "carCount" value = "" />
<input type = "hidden" name = "totCount" value = "" />

<div id="internal-page-problem-results">
		<h2 align="center">정비이력 리스트  <small> ${hist} ${prob} ${count}</small></h2>
		<section id="problems">
		<div class="table-responsive">
				<c:choose>
					<c:when test="${carHist eq 'N'}">
						<table class="table table-hover">
							<tr align="Center">
										<td colspan="5">${prob } 정비이력 리스트가 없습니다.</td>
							</tr>
						</table>						
					</c:when>
					
					<c:otherwise>
					<table class="table table-hover">
					<thead>
					<th>차명</th>
					<th>차 상세내용</th>
					<th>지불금액</th>
					<th>km</th>
					</thead>				
					<tbody>
						<c:choose>
							<c:when test="${carHist.size() >0}">
								<c:forEach items="${carHist}" var="k">
									<tr class="editblocks">
<!-- 										<td align="center" class="showpageblock"></td>  -->
										<td align="center" class="showpageblock">${k.VHICHL_ASORT_CD}</td>
										<td>${k.VHICHL_DSTNC}</td>	
										<td align="center">${k.VHICHL_UPD_CD}</td>
										<td>${k.VHICHL_REQ_DT}</td>
									</tr>
									<tr>
										<td colspan = 4><div class="togglesettings">${k.VHICHL_WRK_ID}</div></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
						</tbody>
					</table>
					</c:otherwise>
					
				</c:choose> 
				
		</div>
		<div align="center">
			<nav>
				<ul class="pagination">
				<c:choose>
					<c:when test="${paging.pageNo eq paging.firstPageNo}">
						<li>
							<span aria-hidden="true">처음 페이지</span>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="javascript:goPage(${paging.firstPageNo});" class="first"><span aria-hidden="true">처음 페이지</span></a>
						</li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${paging.pageNo eq paging.prevPageNo}">
						<li>
							<span aria-hidden="true">◀</span>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="javascript:goPage(${paging.prevPageNo});" class="prev"><span aria-hidden="true">◀</span></a>
						</li>
					</c:otherwise>
				</c:choose>
    			
					<c:forEach var="i" begin="${paging.startPageNo}"
						end="${paging.endPageNo}" step="1">
								<c:choose>
									<c:when test="${i eq paging.pageNo}">
										<li><a href="javascript:goPage(${i});" class="choice">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="javascript:goPage(${i});">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
<%-- <a href="goPage.do?carCount=${carCount}&carHist=${carHist}&page=${paging.nextPageNo}&year=${year}&brand=${brand}&model=${model}&prob=${prob}" --%>
				<c:choose>
					<c:when test="${paging.pageNo eq paging.nextPageNo}">
						<li><span aria-hidden="true">▶</span></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:goPage(${paging.nextPageNo});" class="next"><span aria-hidden="true">▶</span></a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${paging.pageNo eq paging.finalPageNo}">
						<li><span aria-hidden = "true"> 마지막 페이지</span></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:goPage(${paging.nextPageNo});" class="next"><span aria-hidden="true">마지막 페이지</span></a></li>
					</c:otherwise>
				</c:choose>
				</ul>	
			</nav>
		</div>
			</section>
	</div>
	
</form>
<%-- <jsp:include page = "edmunde.jsp" flush = "true"> --%>
<%-- 		<jsp:param name = "ed_year" value = "${year}"/> --%>
<%-- 		<jsp:param name = "ed_brand" value = "${brand}"/> --%>
<%-- 		<jsp:param name = "ed_model" value = "${model}"/> --%>
<%--</jsp:include> --%>
</body>
</html>