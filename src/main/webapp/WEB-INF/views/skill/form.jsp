<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>${skill.id == null ? 'Створення нової навички' : 'Редагування навички'}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>${skill.id == null ? 'Створення нової навички' : 'Редагування навички'}</h1>
        
        <div class="row">
            <div class="col-md-6">
                <form:form action="/skills" method="post" modelAttribute="skill">
                    <form:hidden path="id" />
                    
                    <div class="mb-3">
                        <label for="name" class="form-label">Назва:</label>
                        <form:input path="name" cssClass="form-control" />
                        <form:errors path="name" cssClass="text-danger" />
                    </div>
                    
                    <div class="mb-3">
                        <label for="description" class="form-label">Опис:</label>
                        <form:textarea path="description" cssClass="form-control" rows="4" />
                        <form:errors path="description" cssClass="text-danger" />
                    </div>
                    
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Зберегти</button>
                        <a href="<c:url value='/skills'/>" class="btn btn-secondary">Скасувати</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
