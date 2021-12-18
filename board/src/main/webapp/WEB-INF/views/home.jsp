<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file = "include/head.jsp" %>

<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <%@ include file = "include/main_header.jsp" %>
  
  <%@ include file = "include/left_column.jsp" %>


  <div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Main</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/">Home</a></li>
              <li class="breadcrumb-item active">Main</li>
            </ol>
          </div>
        </div>
      </div>
    </div>

    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title"></h5>

                <p class="card-text">
                  게시판을 만드는 중입니다<br>
                  구현된 기능 : 글쓰기, 수정, 삭제, 페이징, 검색, 댓글작성
                </p>

              </div>
            </div>

            <!-- <div class="card card-primary card-outline">
              <div class="card-body">
                <h5 class="card-title"></h5>

                <p class="card-text">
                  
                </p>
                <a href="#" class="card-link"></a>
                <a href="#" class="card-link"></a>
              </div>
            </div>
          </div>
          
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h5 class="m-0"></h5>
              </div>
              <div class="card-body">
                <h6 class="card-title"></h6>

                <p class="card-text"></p>
                <a href="#" class="btn btn-primary"></a>
              </div>
            </div>

            <div class="card card-primary card-outline">
              <div class="card-header">
                <h5 class="m-0"></h5>
              </div>
              <div class="card-body">
                <h6 class="card-title"></h6>

                <p class="card-text"></p>
                <a href="#" class="btn btn-primary"></a>
              </div>
            </div> -->
          </div>
          
        </div>
        
      </div>
    </div>
    
  </div>
  
  <!-- <aside class="control-sidebar control-sidebar-dark">
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside> -->
  
  <%@ include file = "include/main_footer.jsp" %>
</div>

<%@ include file = "include/plugin_js.jsp" %>

</body>
</html>
