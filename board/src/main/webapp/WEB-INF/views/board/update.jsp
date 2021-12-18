<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
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
              <li class="breadcrumb-item"><a href="list">목록</a></li>
              <li class="breadcrumb-item active">no.${data.bno}</li>
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
	    		<form role="form" id="writeForm" method="post" action="${path}/board/update">
			        <div class="card">
			            <div class="card-header">
			                <h3 class="card-title">게시글 작성</h3>
			            </div>
			            <div class="card-body">
			                <input type="hidden" name="bno" value="${data.bno}">
			                <div class="form-group">
			                    <label for="title">제목</label>
			                    <input class="form-control" id="title" name="title" placeholder="제목을 입력해주세요" value="${data.title}">
			                </div>
			                <div class="form-group">
			                    <label for="content">내용</label>
			                    <textarea class="form-control" id="content" name="content" rows="30"
			                              placeholder="내용을 입력해주세요" style="resize: none;">${data.content}</textarea>
			                </div>
			                <div class="form-group">
			                    <label for="writer">작성자</label>
			                    <input class="form-control" id="writer" name="writer" value="${datae.writer}" readonly>
			                </div>
			            </div>
			            <div class="card-footer">
			                <button type="button" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
			                <div class="float-right">
			                    <button type="button" class="btn btn-warning cancelBtn"><i class="fa fa-trash"></i> 취소</button>
			                    <button type="submit" class="btn btn-success modBtn"><i class="fa fa-save"></i> 수정 저장</button>
			                </div>
			            </div>
			        </div>
	    		</form>
			</div>
		
		

        
         </div>
       </div>
      </div>
   
    

  	<%@ include file = "../include/main_footer.jsp" %>

	<%@ include file = "../include/plugin_js.jsp" %>
	
</div>
<script>
	$(document).ready(function () {
		var formObj = $("form[role='form']");
		console.log(formObj);
			
		$(".modBtn").on("click", function () {
			formObj.submit();
		});
				
		$(".cancelBtn").on("click", function () {
			history.go(-1);
		});
				
		$(".listBtn").on("click", function () {
			self.location = "${path}/board/list"
		});		
	});
</script>

</body>
</html>