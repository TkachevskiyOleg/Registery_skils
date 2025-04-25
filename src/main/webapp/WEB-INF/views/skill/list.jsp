<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Список навичок</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Список навичок</h1>
        
        <div class="mb-3">
            <a href="<c:url value='/skills/new'/>" class="btn btn-primary">Додати нову навичку</a>
            <a href="<c:url value='/teachers'/>" class="btn btn-secondary">Повернутися до вчителів</a>
        </div>
        
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Назва</th>
                    <th>Опис</th>
                    <th>Дії</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="skill" items="${skills}">
                    <tr>
                        <td>${skill.id}</td>
                        <td>${skill.name}</td>
                        <td>${skill.description}</td>
                        <td>
                            <a href="<c:url value='/skills/${skill.id}'/>" class="btn btn-info btn-sm">Деталі</a>
                            <a href="<c:url value='/skills/${skill.id}/edit'/>" class="btn btn-warning btn-sm">Редагувати</a>
                            <a href="<c:url value='/skills/${skill.id}/delete'/>" class="btn btn-danger btn-sm" 
                               onclick="return confirm('Ви впевнені, що хочете видалити цю навичку?')">Видалити</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
