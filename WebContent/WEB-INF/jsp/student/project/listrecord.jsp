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
</jsp:attribute>
	<jsp:body>
	<ol class="breadcrumb">
	  <li><a href="">主页</a></li>
	  <li><a href="student/project/projectmanagement/${type }">${typeZH }信息</a></li>
	  <li class="active">${typeZH }指导记录</li>
	</ol>
	<c:if test="${guideRecords==null ||guideRecords.size()==0 }">
		<div class="alert alert-warning" role="alert">
			<strong>当前无任何记录！</strong>
		</div>
	</c:if>
	<div class="table-responsive">
		<table class="table table-condensed">
			<tbody>
				<c:if test="${guideRecords!=null && guideRecords.size()>0}">
					<c:forEach items="${guideRecords }" var="g" varStatus="s">
						<tr>
							<td>#${s.count }</td>
							<td>
								<div class="table-responsive">
									<table class="table table-striped table-condensed">
										<tbody>
											<tr>
												<td style="width: 6em;">题目</td>
												<td>${g.projectFileDetail.title.name }</td>
											</tr>
											<tr>
												<td style="width: 6em;">指导时间</td>
												<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${g.insertTime }"/></td>
											</tr>
											<c:if test="${g.fileName!=null }">
												<tr>
													<td style="width: 6em;">修改文档</td>
													<td><a href="download/${g.directory }/${g.fileName}/">${g.fileName }</a></td>
												</tr>
											</c:if>
											<tr>
												<td style="width: 6em;">指导内容</td>
												<td>${g.comment }</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
				</c:forEach>
			</c:if>
			</tbody>
	</table>
	</div>
    </jsp:body>
</myTemplate:template>