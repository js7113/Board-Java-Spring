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


	<div class="content-wrapper">
    	<div class="content-header">
      		<div class="container-fluid">
        		<div class="row mb-2">
          			<div class="col-sm-6">
            			<h1 class="m-0">Starter Page</h1>
          			</div>
          			<div class="col-sm-6">
            			<ol class="breadcrumb float-sm-right">
			            <li class="breadcrumb-item"><a href="/">Home</a></li>
			            <li class="breadcrumb-item"><a href="list">목록</a></li>
			            <li class="breadcrumb-item active">no.${data.bno}</li>
            			</ol>
          			</div>
        		</div>
      		</div>
    	</div>
    
    	<div class="content">
      		<div class="container-fluid">
      
 				<div class="col-lg-12">
    				<div class="card">
        				<div class="card-header"><h3 class="card-title">글제목 : ${data.title}</h3></div>
		        		<div class="card-body" style="height: 700px">${data.content}</div>
		        		<div class="card-footer">
		            		<div class="user-block">
		                		<img class="img-circle img-bordered-sm" src="${path}/dist/img/user1-128x128.jpg" alt="user image">
		                		<span class="username"><a href="#">${data.writer}</a></span>
		                		<span class="description"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.cre_date}"/></span>
		            		</div>
		        		</div>
		        		<div class="card-footer">
				            <form role="form" method="post">
				                <input type="hidden" name="bno" value="${data.bno}">
				            </form>
		            
				            <button type="submit" class="btn btn-primary listBtn"><i class="fa fa-list"></i> 목록</button>
				            
				            <div class="float-right">
				                <button type="submit" class="btn btn-warning modBtn"><i class="fa fa-edit"></i> 수정</button>
				                <button type="submit" class="btn btn-danger delBtn"><i class="fa fa-trash"></i> 삭제</button>
				            </div>
		        		</div>
			
						<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
							<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
							<div id="reply">
  								<ul class="rList">
    								<c:forEach items="${rList}" var="rList">
      									<li>
									        <p>
									        작성자 : ${rList.writer}<br/>
									        작성 날짜 :  <fmt:formatDate value="${rList.cre_date}" pattern="yyyy-MM-dd" />
									        </p>
								        	<p>${rList.content}</p>
								        	<div>
											  <button type="button" class="replyUpdateBtn" data-rno="${rList.rno}">수정</button>
											  <button type="button" class="replyDeleteBtn" data-rno="${rList.rno}">삭제</button>
											</div>
								      	</li>
								    </c:forEach>   
  								</ul>
							</div>
							
							<div>

								<form method="post" action="/reply/create">
									<p>
										<label>댓글 작성자</label> <input type="text" name="writer">
									</p>
									<p>
										<textarea rows="5" cols="50" name="content"></textarea>
									</p>
									<p>
										<input type="hidden" name="bno" value="${data.bno}">
										<button type="submit">댓글 작성</button>
									</p>
								</form>
								
							</div>
							 
						</div>
						
					</div>	        
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
			formObj.attr("action", "${path}/board/update");
		    formObj.attr("method", "get");
		    formObj.submit();
		});
	
		$(".delBtn").on("click", function () {
		    formObj.attr("action", "${path}/board/delete");
		    formObj.submit();
		});
		
		$(".listBtn").on("click", function () {
			self.location = "${path}/board/list"
		});
		
		$(".replyWriteBtn").on("click", function(){
		  	  var formObj = $("form[name='replyForm']");
		  	  formObj.attr("action", "${path}/board/replyCreate");
		  	  formObj.submit();
		});
		
		$(".replyUpdateBtn").on("click", function(){
			location.href = "/board/replyUpdateView?bno=${data.bno}"
							+ "&rno="+$(this).attr("data-rno");
		});
		
		$(".replyDeleteBtn").on("click", function(){
			location.href = "/board/replyDeleteView?bno=${data.bno}"
							+ "&rno="+$(this).attr("data-rno");
		});
	});
</script>  	
</body>
</html>