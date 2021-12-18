<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<%@ include file = "../include/head.jsp" %>

<meta charset="UTF-8">
<title>Create</title>

<body class="hold-transition sidebar-mini">
<div class="wrapper">

	<!-- Navbar -->
  <%@ include file = "../include/main_header.jsp" %>
  
  	<!-- Main Sidebar Container -->
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
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Starter Page</li>
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
	      		<form role="form" id="writeForm" method="post" action="${path}/board/create"> 
	      			<div class="card"> 
	      				<div class="card-header with-border"> 
	      					<h3 class="card-title">게시글 작성</h3> 
	      				</div> 
	      				<div class="card-body"> 
	      					<div class="form-group"> 
	      						<label for="title">제목</label> 
	      						<input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요"> 
	      					</div> 
	      					<div class="form-group"> 
	      						<label for="writer">ID</label> 
	      						<input class="form-control" id="writer" name="writer" placeholder="ID를 입력해주세요"> 
	      					</div> 
	      					<div class="form-group"> 
	      						<label for="content">내용</label> 
	      						<textarea class="form-control" id="content" name="content" rows="30" placeholder="내용을 입력해주세요" style="resize: none;"></textarea> 
	      					</div> 
	      				</div> 
	      				<div class="card-footer"> 
	      					<button type="button" class="btn btn-primary"><i class="fa fa-list"></i> 목록</button> 
	      					<div class="float-right"> 
	      						<button type="reset" class="btn btn-warning"><i class="fa fa-reply"></i> 초기화</button> 
	      						<button type="submit" class="btn btn-success"><i class="fa fa-save"></i> 저장</button> 
	      					</div> 
	      				</div> 
	      			</div> 
	      		</form> 
	      	</div>
      
        </div>
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  
    <!-- Main Footer -->
  <%@ include file = "../include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<%@ include file = "../include/plugin_js.jsp" %>

<script>
	$(document).ready(function () {
		var formObj = $("form[role='form']");
		console.log(formObj);
				
		$(".listBtn").on("click", function () {
			self.location = "${path}/board/list"
		});		
	});
</script>
</body>
</html>