<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Список вчителів</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .actions {
            display: flex;
            gap: 10px;
        }
        .actions a {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            color: white;
        }
        .edit {
            background-color: #4CAF50;
        }
        .delete {
            background-color: #f44336;
        }
        .view {
            background-color: #2196F3;
        }
        .add-new {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <h1>Список вчителів</h1>
    
    <a href="${pageContext.request.contextPath}/teachers/new" class="add-new">Додати нового вчителя</a>
    
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Ім'я</th>
                <th>Прізвище</th>
                <th>Email</th>
                <th>Телефон</th>
                <th>Дії</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="teacher" items="${teachers}">
                <tr>
                    <td>${teacher.id}</td>
                    <td>${teacher.firstName}</td>
                    <td>${teacher.lastName}</td>
                    <td>${teacher.email}</td>
                    <td>${teacher.phone}</td>
                    <td class="actions">
                        <a href="${pageContext.request.contextPath}/teachers/${teacher.id}" class="view">Перегляд</a>
                        <a href="${pageContext.request.contextPath}/teachers/${teacher.id}/edit" class="edit">Редагувати</a>
                        <a href="${pageContext.request.contextPath}/teachers/${teacher.id}/delete" class="delete">Видалити</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
