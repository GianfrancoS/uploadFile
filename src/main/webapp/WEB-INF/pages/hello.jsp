<%@taglib prefix="sec" 
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.ibm.web.controller.MainController"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	
<style>

#form {
	background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 55px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;



}
</style>







	<sec:authorize access="hasRole('ROLE_USER')">
		<!-- For login user -->
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2 ALIGN=right>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
		
		<form action="uploadFile?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data" id="form">
			File to upload: <input type="file" name="file"><br /> 
			<br /> 
			<input type="submit" value="Upload">${message}
		
		</form>
	
	</sec:authorize>
	
	
</body>
</html>