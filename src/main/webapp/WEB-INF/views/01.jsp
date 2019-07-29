<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<title>Form 1</title>

<body>

<form action="form-confirmation.html" method="post" modelAttribute="donation">

    <!-- STEP 1: class .active is switching steps -->
    <div data-step="1" class="active">
        <table>
            <tr>
                <td>
                    <form:label path="categories"><h3>Zaznacz, co chcesz oddać:</h3></form:label>
                </td>
            </tr>
            <tr>
                <td>
                    <div>
                        <form:checkboxes path="categories" items="${categories}" itemLabel="name"/>
                    </div>
                    <br>
                </td>
            </tr>
            <tr>
                <td>
                    <button type="button" class="btn next-step">Dalej</button>
                </td>
            </tr>
        </table>

    </div>
</form>

</body>
</html>