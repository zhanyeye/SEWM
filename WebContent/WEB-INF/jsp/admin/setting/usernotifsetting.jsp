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
	<jsp:body>
	<ol class="breadcrumb">
  <li><a href="">主页</a></li>
  <li><a href="admin/setting/usersetting">用户管理</a></li>
  <li class="active">用户通知设置</li>
</ol>


	<form class="form-horizontal" action="admin/setting/usernotifsetting" method="POST">
	<div class="form-group">
			<label class="col-md-1 control-label">姓名</label>
			<label class="col-md-1 control-label">通知</label>
			</div>
		<c:forEach items="${notifusers }" var="u" varStatus="s">
		<div class="form-group">
			<label class="col-md-1 control-label">${u.name }</label>
			<div class="col-md-1">
				<input type="checkbox" data-toggle="switch" data-on-color="primary" data-off-color="default"
							<c:if test="${u.enabledMessage=='true' }">checked='checked'</c:if> name="checkeds"  value="${u.id }"/>
				</div>
		</div>
		</c:forEach>
		<div class="form-group">
						<div class="col-sm-2 col-md-1 control-label"><p class="text-danger">说明</p></div>
						<div class="col-sm-10 col-md-11">
							<p class="text-danger">
							该功能的关闭意味着教师无法接收任何专业通知，不会推荐监考分配<br>
							不存在正常参加监考分配，却无需接收专业通知的可能，因此，通知功能
							<span class="label label-warning">单向</span>自动关联监考推荐功能，
							即修改监考推荐<span class="label label-warning">不会</span>影响通知功能。<br>
							</p>
						</div>
					</div>
		<div class="form-group">
	<div class="col-md-1">
			<button type="submit" class="btn btn-primary btn-wide">提交</button>
		</div>
	</div>
	</form>
	


		
		
	
			
    </jsp:body>
</myTemplate:template>