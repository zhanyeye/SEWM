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
	<jsp:attribute name="footer">
		<script>
			$(function(){
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
	</jsp:attribute>
	<jsp:body>
	<ol class="breadcrumb">
	  <li><a href="">主页</a></li>
	  <li><a href="project/projectmanagement">毕设管理</a></li>
	  <li class="active">${typeZH }评审结果</li>
	</ol>
	<c:if test="${evaluations.size()!=0 }">
		<c:if test="${currentPage*15>=count }">
			(${(currentPage-1)*15+1 } &nbsp;-&nbsp;${count }&nbsp;/&nbsp;${count })
		</c:if>
		<c:if test="${currentPage*15<count }">
			(${(currentPage-1)*15+1 }&nbsp;-&nbsp;${currentPage*15 }&nbsp;/&nbsp;${count })
		</c:if>
		<div class="table-responsive">
			<table class="table table-striped table-condensed table-hover">
			<thead>
				<tr>
					 <th>#</th>
	                 <th>学号</th>
	                 <th>姓名</th>
                     <th>导师评审</th>
                     <th>专业评审</th>
				</tr>
				</thead>
				<tbody>
					<c:forEach items="${evaluations }" var="i" varStatus="s">
						<tr>
							<td>${s.count + (currentPage-1)*15 }</td>
							<td>${i.student.student.studentId }</td>
							<td>${i.student.student.name }</td>
							<td>
								<c:if test="${i.teacherEval == true }">
									<span class="label label-success">是</span>
								</c:if>
								<c:if test="${i.teacherEval == false }">
									<span class="label label-danger">否</span>
								</c:if>
							</td>
							<td>
								<c:if test="${i.managerEval == true }">
									<span class="label label-success">是</span>
								</c:if>
								<c:if test="${i.managerEval == false }">
									<span class="label label-danger">否</span>
								</c:if>
							</td>
						</tr>
				</c:forEach>
				</tbody>
		</table>
		</div>
		<c:if test="${evaluations.size()!=0 }">
			<nav>
			  <ul class="pagination pagination-lg">
			    <li id="previous">
			      <a href="project/listevaluation/${type }/${currentPage-1 }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="1" end="${countPage }" var="c">
			    	<c:if test="${c==currentPage }">
			    		<li class="active"><a href="project/listevaluation/${type }/${c }">${c }</a></li>
			    	</c:if>
			    	<c:if test="${c!=currentPage }">
			    		<li><a href="project/listevaluation/${type }/${c }">${c }</a></li>
			    	</c:if>
			    </c:forEach>
			    <li id="next">
			      <a href="project/listevaluation/${type }/${currentPage+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
		</nav>
		</c:if>
	</c:if>
    </jsp:body>
</myTemplate:template>