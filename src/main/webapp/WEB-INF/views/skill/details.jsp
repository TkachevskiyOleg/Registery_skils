<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Інформація про навичку</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Інформація про навичку</h1>
        
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h3 class="mb-0">${skill.name}</h3>
            </div>
            <div class="card-body">
                <p><strong>ID:</strong> ${skill.id}</p>
                <p><strong>Назва:</strong> ${skill.name}</p>
                <p><strong>Опис:</strong> ${skill.description}</p>
            </div>
        </div>
        
        <div class="card mb-4">
            <div class="card-header bg-success text-white">
                <h3 class="mb-0">Вчителі з цією навичкою</h3>
            </div>
            <div class="card-body">
                <c:choose>
                    <c:when test="${empty skill.teachers}">
                        <p>Немає вчителів з цією навичкою</p>
                    </c:when>
                    <c:otherwise>
                        <ul class="list-group">
                            <c:forEach var="teacher" items="${skill.teachers}">
                                <li class="list-group-item d-flex align-items-center">
                                    <span class="me-auto">${teacher.name} ${teacher.surname}</span>
                                    <a href="<c:url value='/teachers/${teacher.id}'/>" class="btn btn-sm btn-info ms-2">Деталі</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <div class="mt-3">
            <a href="<c:url value='/skills'/>" class="btn btn-secondary">Назад до списку</a>
            <a href="<c:url value='/skills/${skill.id}/edit'/>" class="btn btn-warning">Редагувати</a>
            <a href="<c:url value='/skills/${skill.id}/delete'/>" class="btn btn-danger"
               onclick="return confirm('Ви впевнені, що хочете видалити цю навичку?')">Видалити</a>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
