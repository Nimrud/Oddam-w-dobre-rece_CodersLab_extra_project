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
    <title>Potwierdzenie przesłania formularza</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>

<body>
<header class="header--form-page">
    <%@include file="/WEB-INF/fragments/header_3.jspf" %>
</header>


<footer>
    <%@include file="/WEB-INF/fragments/footer.jspf" %>
</footer>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
