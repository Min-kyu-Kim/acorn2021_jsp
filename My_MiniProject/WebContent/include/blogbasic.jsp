<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/blog/">
<jsp:include page="blogcss.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
<style>
	.topfix{
		position:relative;
	}
</style>
<div class="bg-white fixed-top container mb-5">
	<header class="blog-header py-3">
	   	<div class="row flex-nowrap justify-content-between align-items-center">
	      	<div class="col-4 pt-1">
	        	<a class="text-muted" href="#"></a>
	      	</div>
	      	<div class="col-4 text-center">
	        	<a class="blog-header-logo text-dark" href="${pageContext.request.contextPath}/index.jsp">#HashTag</a>
	      	</div>
	      	<div class="col-4 d-flex justify-content-end align-items-center">
	        	<a class="text-muted" href="#" aria-label="Search">
	          		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
	        	</a>
				<c:choose>
					<c:when test="${not empty sessionScope.id }">
						<a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/users/private/info.jsp">개인정보</a>
						<a class="btn btn-sm btn-outline-danger ml-1" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
					</c:when>
					
					<c:otherwise>
						<a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원 가입</a>
	        			<a class="btn btn-sm btn-outline-success ml-1" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
					</c:otherwise>
				</c:choose>
		    </div>
	   	</div>
	</header>
	<div class="nav-scroller py-1 mb-2">
	    <nav class="nav d-flex justify-content-between">
	      <a class="p-2 text-muted" href="${pageContext.request.contextPath}/all/list.jsp">ALL</a>
	      <a class="p-2 text-muted" href="#">OUTER</a>
	      <a class="p-2 text-muted" href="#">TOP</a>
	      <a class="p-2 text-muted" href="#">BOTTOM</a>
	      <a class="p-2 text-muted" href="#">ESSENTIAL</a>
	      <a class="p-2 text-muted" href="#">LOOKBOOK</a>
	      <a class="p-2 text-muted" href="#">About</a>
	      <a class="p-2 text-muted" href="#">Review</a>
	      <a class="p-2 text-muted" href="${pageContext.request.contextPath}/file/list.jsp">Files</a>
	      <a class="p-2 text-muted" href="${pageContext.request.contextPath}/qa/list.jsp">Q&A</a>
	      <a class="p-2 text-muted" href="#">주문조회</a>
	    </nav>
	</div>
</div>
	