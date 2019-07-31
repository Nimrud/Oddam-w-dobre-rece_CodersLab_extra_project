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
    <title>Dodanie lub edycja instytucji</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <%@include file="/WEB-INF/fragments/header.jspf" %>

    <section>
    <div class="container slogan container--70"><h2>Podaj dane instytucji</h2>
        <br><br></div>
    </section>

    <section>
    <form:form method="post" modelAttribute="institution">

        <div class="form--steps-container" align="right">
        <div>
            <label for="NameId"><h1>Pełna nazwa: </h1></label>
            <form:input type="text" path="name" id="NameId" size="80%"/>
            <form:errors path="name" element="div"/>
        </div>

        <div>
            <label for="DescriptionId"><h1>Opis: </h1></label>
            <form:input type="text" path="description" id="DescriptionId" size="80%"/>
            <form:errors path="description" element="div"/>
        </div><br><br>

        <p><input type="submit" value="Dodaj"></p>
        </div>

    </form:form>

    </section>
    </div>

</header>

<footer>
    <%@include file="/WEB-INF/fragments/footer.jspf" %>
</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>