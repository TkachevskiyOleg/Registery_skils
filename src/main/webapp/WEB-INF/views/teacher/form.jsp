<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${teacher.id != null ? 'Редагувати' : 'Новий'} вчитель</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        .form-container {
            max-width: 600px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], 
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .error {
            color: red;
            font-size: 0.9em;
            margin-top: 5px;
        }
        .button-group {
            margin-top: 20px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .back-link {
            display: inline-block;
            margin-left: 10px;
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>${teacher.id != null ? 'Редагувати' : 'Додати нового'} вчителя</h1>

        <form:form action="${pageContext.request.contextPath}/teachers" method="post" modelAttribute="teacher">
            <form:hidden path="id" />

            <div class="form-group">
                <label for="name">Ім'я:</label>
                <form:input path="name" id="name" />
                <form:errors path="name" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="surname">Прізвище:</label>
                <form:input path="surname" id="surname" />
                <form:errors path="surname" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="birthDate">Дата народження:</label>
                <form:input path="birthDate" type="date" pattern="yyyy-MM-dd" />
                <form:errors path="birthDate" cssClass="error" />
            </div>

            <c:if test="${not empty skills}">
                <div class="form-group">
                    <label>Навички:</label>
                    <div class="skills-container">
                        <c:forEach var="skill" items="${skills}">
                            <div class="skill-item">
                                <input type="checkbox" name="selectedSkills" value="${skill.id}"
                                       <c:if test="${teacher.skills.contains(skill)}">checked</c:if> />
                                <span>${skill.name}</span>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

            <div class="button-group">
                <button type="submit">Зберегти</button>
                <a href="${pageContext.request.contextPath}/teachers" class="back-link">Скасувати</a>
            </div>
        </form:form>
    </div>
</body>
</html>