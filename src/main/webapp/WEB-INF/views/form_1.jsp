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
    <title>Formularz przekazywania darów</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>

<body>
<header class="header--form-page">
    <%@include file="/WEB-INF/fragments/header_2.jspf" %>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć, komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć, komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną organizację, do której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form action="donations/add" method="post" modelAttribute="donation">

            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">

                <form:label path="categories"><h3>Zaznacz, co chcesz oddać:</h3></form:label>

                <div class="form-group form-group--checkbox">

                    <c:forEach var="category" items="${categories}">
                        <label>
                            <input type="checkbox" name="categories" value="${category.name}" class="categ_val"/>
                            <span class="checkbox"></span>
                            <span class="description">${category.name}</span>
                        </label>
                        <br>
                    </c:forEach>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step" id="categories_next_btn">Dalej</button>
                </div>

            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <form:label path="quantity" for="bagsId" >Liczba 60l worków: </form:label>
                    <form:input path="quantity" id="bagsId"/> <span> &nbsp;(max 20)</span>
                    <form:errors path="quantity" element="div"/>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step" id="bags_next_btn">Dalej</button>
                </div>
            </div>


            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizację, której chcesz pomóc:</h3>

                <div class="form-group form-group--checkbox">

                    <c:forEach var="institution" items="${institutions}">
                        <label>
                            <input type="radio" name="institution" value="${institution.name}" class="instit_val"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                            <div class="title"> ${institution.name} </div>
                            <div class="subtitle">${institution.description}</div>
                            </span>
                        </label>
                        <br>
                    </c:forEach>


                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step" id="instit_next_btn">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <form:input path="street" id="street_val"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <form:input path="city" id="city_val"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <form:input path="zipCode" id="zip_val"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <form:input path="phoneNumber" id="phone_val"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <form:input type="date" path="pickUpDate" id="date_val"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <form:input type="time" path="pickUpTime" id="time_val"/> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea path="pickUpComment" id="comment_val"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step" id="address_next_btn">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text"
                                ><span id="sum_bags"> </span>, w których znajdują się <span id="sum_categories"> </span> dla dzieci</span>
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text" id="sum_instit"> </span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id="sum_street"> </li>
                                <li id="sum_zip"> </li>
                                <li id="sum_city"> </li>
                                <li id="sum_phone"> </li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="sum_date"> </li>
                                <li id="sum_time"> </li>
                                <li id="sum_comment"> </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form:form>
    </div>
</section>

<footer>
    <%@include file="/WEB-INF/fragments/footer.jspf" %>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>