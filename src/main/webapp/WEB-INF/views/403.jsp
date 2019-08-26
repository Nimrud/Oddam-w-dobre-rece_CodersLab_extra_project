<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Dostęp zabroniony</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>

<body>
<header>
    <%@include file="/WEB-INF/fragments/header_clean.jspf" %>
</header>

<section class="login-page">
    <h2>Nie masz uprawnień do tej strony</h2>
</section>

<footer>
    <%@include file="/WEB-INF/fragments/footer.jspf" %>
</footer>

</body>
</html>