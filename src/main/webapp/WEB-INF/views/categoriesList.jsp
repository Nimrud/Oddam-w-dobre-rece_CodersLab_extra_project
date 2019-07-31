<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Lista kategorii</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <%@include file="/WEB-INF/fragments/header.jspf" %>

    <section>
        <div class="container slogan container--70"><h2>Lista kategorii</h2>
            <br><br></div>
    </section>

    <section align="right">

        <ul class="help--slides-items container--90">
            <li>
                <div class="col">
                    <c:forEach items="${categories}" var="category">
                        <div class="title">${category.name}</div>
                        <br><br>
                        <hr style="height: 1px; width: 40%; background-color: #bcbcbc; border: 0px; align-items: center; float: right">
                        <br><br>
                    </c:forEach>
                </div>
            </li>
        </ul>
    </section>
    </div>

</header>

<footer>
    <%@include file="/WEB-INF/fragments/footer.jspf" %>
</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>