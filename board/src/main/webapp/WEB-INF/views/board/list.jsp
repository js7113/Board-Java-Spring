<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html lang="en">
<%@ include file = "../include/head.jsp" %>

<body class="hold-transition sidebar-mini">

<div class="wrapper">
	<%@ include file = "../include/main_header.jsp" %> 
	<%@ include file = "../include/left_column.jsp" %>

  	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
  	<!-- Content Header (Page header) -->
    	<div class="content-header">
      		<div class="container-fluid">
        		<div class="row mb-2">
          			<div class="col-sm-6">
            			<h1 class="m-0">Starter Page</h1>
          			</div><!-- /.col -->
          			<div class="col-sm-6">
            			<ol class="breadcrumb float-sm-right">
              				<li class="breadcrumb-item"><a href="/">Home</a></li>
              				<li class="breadcrumb-item active">목록</li>
            			</ol>
          			</div><!-- /.col -->
        		</div><!-- /.row -->
      		</div><!-- /.container-fluid -->
    	</div>
    <!-- /.content-header -->

    	<!-- Main content -->
	    <div class="content">
	      	<div class="container-fluid">
	      		<div class="col-lg-12"> 
	      			<div class="card">
	      			
	      				<div class="card-header"> 
	      					<h3 class="card-title">게시글 목록</h3> 
	      				</div>
	      				
	      				<div class="card-body"> 
	      					<table class="table table-bordered"> 
	      						<tbody> 
	      						<tr> 
	      							<th style="width: 30px">#</th> 
	      							<th>제목</th> 
	      							<th style="width: 100px">작성자</th> 
	      							<th style="width: 150px">작성일</th> 
	      							<th style="width: 60px">조회</th> 
	      						</tr> 
	      						<c:forEach items="${list}" var="list"> 
	      						<tr> 
	      							<td>${list.bno}</td> 
	      							<td><a href="${path}/board/detail?bno=${list.bno}">${list.title}</a></td> 
	      							<td>${list.writer}</td> 
	      							<td><fmt:formatDate value="${list.cre_date}" pattern="yyyy-MM-dd"/></td> 
	      							<td><span class="badge bg-red">${list.view_cnt}</span></td> 
	      						</tr> 
	      						</c:forEach> 
	      						</tbody> 
	      					</table> 
	      				</div> 
      			
		      			<div class="card-footer"> 
		      				<div id="paginationBox">
								<ul class="pagination">
									<c:if test="${pagination.prev}">
										<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', 
											'${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
									</c:if>
						
									<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
										<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" 
											onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
									</c:forEach>
						
									<c:if test="${pagination.next}">
										<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
											'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
									</c:if>
								</ul>
							</div>
      				
		      				<div class="form-group row justify-content-center">
								<div class="w100" style="padding-right:10px">
									<select class="form-control form-control-sm" name="searchType" id="searchType">
										<option value="title">제목</option>
										<option value="Content">본문</option>
										<option value="reg_id">ID</option>
									</select>
								</div>
								<div class="w300" style="padding-right:10px">
									<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
								</div>
								<div class="w300" style="padding-right:800px">
									<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
								</div>
								
								<div> 
			      					<button type="button" class="btn btn-success btn-flat" id="writeBtn" 
			      						onclick="location.href='${path}/board/create'"> 
			      						<i class="fa fa-pencil"></i>글쓰기
			      					</button> 
		      					</div>	
							</div>
							
	      				</div>	
	      			</div>      			 
	    		</div> 
			</div>
		</div>
	  <!-- Main Footer -->
	  <%@ include file = "../include/main_footer.jsp" %>
	</div>
<!-- ./wrapper -->
</div>
<!-- REQUIRED SCRIPTS -->
<%@ include file = "../include/plugin_js.jsp" %>

<script>
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
					
		var url = "${pageContext.request.contextPath}/board/list";
									
		url = url + "?page=" + page;			
		url = url + "&range=" + range;
							
		location.href = url;
	}

	function fn_pagination(page, range, rangeSize, searchType, keyword) {						
							
		var url = "${pageContext.request.contextPath}/board/list";												  	
						
		url = url + "?page=" + page;
		url = url + "&range=" + range;
							
		location.href = url;	
	}
								
	function fn_next(page, range, rangeSize) {
							
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;		
							
		var url = "${pageContext.request.contextPath}/board/list";
							
		url = url + "?page=" + page;
		url = url + "&range=" + range;
									
		location.href = url;
	}							
								
	$(document).on('click', '#btnSearch', function(e){
		e.preventDefault();
							
		var url = "${pageContext.request.contextPath}/board/list";
							
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
							
		location.href = url;
		console.log(url);
	});							
									
	var result = "${msg}";
	
	if (result == "regSuccess") { 
		alert("게시글 등록이 완료되었습니다."); 
	}	
	else if (result == "modSuccess") { 
		alert("게시글 수정이 완료되었습니다."); 
	} 
	else if (result == "delSuccess") { 
		alert("게시글 삭제가 완료되었습니다."); 
	}
</script>

</body>
</html>


