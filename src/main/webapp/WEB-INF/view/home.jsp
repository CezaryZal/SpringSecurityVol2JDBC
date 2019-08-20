<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>

<head>
    <title>Company Home Page</title>
</head>
    <body>
        <h2>Company Home Page</h2>
        <hr>

        <p>
            Welcome to company home page!
        </p>
        <hr>
        <p>
            User: <security:authentication property="principal.username" />
            <br><br>
            Role(s): <security:authentication property="principal.authorities" />
        </p>
        <hr>

        <security:authorize access="hasRole('MANAGER')">
        <%--        Add a link to point to/leaders... this is for the managers      --%>
            <p>
                <a href="${pageContext.request.contextPath}/leaders">Leader Ship Meeting</a>
                (Only for Manager peeps/people)
            </p>
        </security:authorize>


        <security:authorize access="hasRole('ADMIN')">
        <%--        Add a link to point to/system... this is for the admins      --%>
            <p>
                <a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
                (Only for Admin peeps)
            </p>
            <hr>
        </security:authorize>

        <form:form action="${pageContext.request.contextPath}/logout"
                   method="POST">
        <input type="submit" value="Logout" />

        </form:form>


    </body>
</html>