<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Деталі вчителя</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .navbar {
            background-color: #2c3e50;
            color: white;
            padding: 15px 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .navbar-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }
        
        .navbar-nav {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }
        
        .nav-item {
            margin-left: 20px;
        }
        
        .nav-link {
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .nav-link:hover {
            color: #3498db;
        }
        
        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        
        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 25px;
            margin-bottom: 30px;
        }
        
        .teacher-details {
            max-width: 700px;
        }
        
        .detail-row {
            display: flex;
            margin-bottom: 15px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }
        
        .detail-label {
            font-weight: bold;
            width: 180px;
            color: #2c3e50;
        }
        
        .detail-value {
            flex: 1;
        }
        
        .actions {
            margin-top: 25px;
            display: flex;
            gap: 15px;
        }
        
        .btn {
            display: inline-flex;
            align-items: center;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            color: white;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.2s;
            border: none;
            cursor: pointer;
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .btn-edit {
            background-color: #2ecc71;
        }
        
        .btn-edit:hover {
            background-color: #27ae60;
        }
        
        .btn-delete {
            background-color: #e74c3c;
        }
        
        .btn-delete:hover {
            background-color: #c0392b;
        }
        
        .btn-back {
            background-color: #3498db;
        }
        
        .btn-back:hover {
            background-color: #2980b9;
        }
        
        .teacher-info-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .teacher-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #3498db;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            margin-right: 20px;
        }
        
        .teacher-name {
            font-size: 1.8rem;
            margin: 0;
            color: #2c3e50;
        }
        
        .teacher-position {
            color: #7f8c8d;
            margin: 5px 0 0 0;
        }
        
        footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 40px;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="navbar-content">
            <a href="${pageContext.request.contextPath}/" class="navbar-brand">Система управління школою</a>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/teachers" class="nav-link">Вчителі</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/students" class="nav-link">Учні</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/subjects" class="nav-link">Предмети</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <h1>Деталі вчителя</h1>
        
        <div class="card">
            <div class="teacher-info-header">
                <div class="teacher-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div>
                    <h2 class="teacher-name">${teacher.firstName} ${teacher.lastName}</h2>
                    <p class="teacher-position">Вчитель</p>
                </div>
            </div>
            
            <div class="teacher-details">
                <div class="detail-row">
                    <div class="detail-label">ID:</div>
                    <div class="detail-value">${teacher.id}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Ім'я:</div>
                    <div class="detail-value">${teacher.firstName}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Прізвище:</div>
                    <div class="detail-value">${teacher.lastName}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Email:</div>
                    <div class="detail-value">
                        <a href="mailto:${teacher.email}" style="color: #3498db; text-decoration: none;">
                            <i class="fas fa-envelope"></i> ${teacher.email}
                        </a>
                    </div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Телефон:</div>
                    <div class="detail-value">
                        <a href="tel:${teacher.phone}" style="color: #3498db; text-decoration: none;">
                            <i class="fas fa-phone"></i> ${teacher.phone}
                        </a>
                    </div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Рік народження:</div>
                    <div class="detail-value">${teacher.birthYear}</div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Вік:</div>
                    <div class="detail-value">${2023 - teacher.birthYear} років</div>
                </div>
            </div>
            
            <div class="actions">
                <a href="${pageContext.request.contextPath}/teachers/${teacher.id}/edit" class="btn btn-edit">
                    <i class="fas fa-edit"></i> Редагувати
                </a>
                <a href="${pageContext.request.contextPath}/teachers/${teacher.id}/delete" class="btn btn-delete">
                    <i class="fas fa-trash"></i> Видалити
                </a>
                <a href="${pageContext.request.contextPath}/teachers" class="btn btn-back">
                    <i class="fas fa-arrow-left"></i> Назад до списку
                </a>
            </div>
        </div>
    </div>
    
    <footer>
        <p>&copy; 2023 Система управління школою. Всі права захищені.</p>
    </footer>
</body>
</html>