<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Lista instytucji</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <%@include file="/WEB-INF/fragments/header.jspf" %>

    <section>
        <div class="container slogan container--70"><h2>Lista instytucji</h2>
            <br><br></div>
    </section>

    <section align="right">

        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <c:forEach items="${institutions}"  begin="0" step="2" var="institution">
                        <div class="title">${institution.name}</div>
                        <div class="subtitle">${institution.description}</div>
                        <br><br>
                        <hr style="height: 1px; width: 70%; background-color: #bcbcbc; border-color: white; align-items: center; float: right">
                        <br>
                    </c:forEach>
                </div>
                <div class="col">
                    <c:forEach items="${institutions}" begin="1" step="2" var="institution">
                        <div class="title">${institution.name}</div>
                        <div class="subtitle">${institution.description}</div>
                        <br><br>
                        <hr style="height: 1px; width: 70%; background-color: #bcbcbc; border-color: white; align-items: center; float: right">
                        <br>
                    </c:forEach>
                </div>
            </li>
        </ul>

        <!--
        <ul class="help--slides-items">
            <c:forEach items="${institutions}" var="institution" varStatus="a">

                <li>

                    <div class="col">
                        <c:if test="${a.index%2==0}">
                            <div class="title">${institution.name}</div>
                            <div class="subtitle">${institution.description}</div>
                        </c:if>
                    </div>


                    <div class="col">
                        <c:if test="${a.index%2!=0}">
                            <div class="title">${institution.name}</div>
                            <div class="subtitle">${institution.description}</div>
                        </c:if>
                    </div>

                </li>
            </c:forEach>
        </ul>
 -->
    </section>
    </div>

</header>

<footer>
    <%@include file="/WEB-INF/fragments/footer.jspf" %>
</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>