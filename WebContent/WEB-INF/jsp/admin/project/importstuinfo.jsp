<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="myTemplate" tagdir="/WEB-INF/tags/"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<myTemplate:template>
<jsp:attribute name="header">
	<link href="resources/css/fileinput.min.css"  rel="stylesheet">
</jsp:attribute>
<jsp:attribute name="footer">
<script>
	$(function() {
		$('#file-1').fileinput({
			showPreview : false,
	        browseClass: "btn btn-primary",
			initialCaption: "上传学生信息文件",
		});
		
		$(".delbtn").click(function(){
			var current = $(this);
			$.post('admin/project/delstudent',{
				'studentId':current.attr('href')
			},function(){
				location.href = 'admin/project/studentmanagement';
			})
			return false;
		})
		if('${currentPage}'=='1'){
			$('#previous').addClass('disabled');
			$('#previous').click(function(){
				return false;
			})
		}else{
			$('#previous').removeClass('disabled');
		}
		if('${currentPage}'=='${countPage}'){
			$('#next').addClass('disabled');
			$('#next').click(function(){
				return false;
			})
		}else{
			$('#next').removeClass('disabled');
		}
	})
</script>
<script src="resources/js/fileinput.min.js"></script>
</jsp:attribute>

	<jsp:body>
	<ol class="breadcrumb">
	  <li><a href="">主页</a></li>
	  <li><a href="admin/project/projectmanagement">毕设管理</a></li>
	  <li class="active">导入学生信息</li>
	</ol>
	
	<c:if test="${exception != null}">
		&nbsp&nbsp
		<div class="alert alert-danger alert-dismissable" role="alert">
  			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
			</button><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  <strong>错误！</strong> ${exception }
</div>
</c:if>     
	
 	<form class="form-horizontal" enctype="multipart/form-data" action="admin/project/importstu" method="post">
		<div class="form-group">
			<div class="col-sm-10 col-md-8">
				<input id="file-1" type="file" name="uploadFile" multiple data-min-file-count="1" accept=".xls,.xlsx">
			</div>
		</div>
		<!-- <div class="form-group">
			<div class="col-sm-2 col-md-12">
				<p class="text-danger">说明: 
				表格第一行列名称学号、姓名，第二行开始为数据<br>
				<span class="label label-danger checkboxspan">
					<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						测试期内建议与上传文件比对，防止出错</span>
				</p>
				
			</div>
		</div> -->
	</form>
     <c:if test="${students != null }">
     	<br>
			<c:if test="${currentPage*15>=count }">
				(${(currentPage-1)*15+1 } &nbsp;-&nbsp;${count }&nbsp;/&nbsp;${count })
			</c:if>
			<c:if test="${currentPage*15<count }">
				(${(currentPage-1)*15+1 }&nbsp;-&nbsp;${currentPage*15 }&nbsp;/&nbsp;${count })
			</c:if>
		<br>
		 <div class="table-responsive">
		<table class="table table-striped table-condensed table-hover">
		<thead>
			<tr>
				 <th>#</th>
                  <th>学号</th>
                  <th>姓名</th>
                  <th>性别</th>
                  <th>班级</th>
                  <th>操作</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach items="${students }" var="i" varStatus="s">
				<tr>
				<td>${s.count + (currentPage-1)*15 }</td>
				<td>${i.studentId }</td>
				<td>${i.name }</td>
				<td>${i.sex }</td>
				<td>${i.classes.name }</td>
				<td><a class="btn btn-primary btn-wide delbtn" href="${i.id }">删除</a></td>
			</tr>
			</c:forEach>
			</tbody>
	</table>
	</div>
	<nav>
			  <ul class="pagination pagination-lg">
			    <li id="previous">
			      <a href="admin/project/importstuinfo/students/${currentPage-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="1" end="${countPage }" var="c">
			    	<c:if test="${c==currentPage }">
			    		<li class="active"><a href="admin/project/importstuinfo/students/${c }">${c }</a></li>
			    	</c:if>
			    	<c:if test="${c!=currentPage }">
			    		<li><a href="admin/project/importstuinfo/students/${c }">${c }</a></li>
			    	</c:if>
			    </c:forEach>
			    <li id="next">
			      <a href="admin/project/importstuinfo/students/${currentPage+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
		</nav>
	</c:if>
	  
    </jsp:body>
</myTemplate:template>