<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contact Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            max-width: 500px;
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
        input[type="text"], input[type="email"], select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Contact Form</h1>
    <form:form action="saveContact" modelAttribute="contact">
        <form:hidden path="id"/>

        <div class="form-group">
            <label for="firstName">First Name:</label>
            <form:input path="firstName" id="firstName"/>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <form:input path="lastName" id="lastName"/>
        </div>

        <div class="form-group">
            <label for="phone">Phone:</label>
            <form:input path="phone" id="phone"/>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" id="email" type="email"/>
        </div>

        <div class="form-group">
            <label for="birthYear">Birth Year:</label>
            <form:select path="birthYear" id="birthYear">
                <form:option value="" label="-- Select Year --"/>
                <%
                    int currentYear = java.time.Year.now().getValue();
                    for (int year = currentYear; year >= 1900; year--) {
                %>
                <form:option value="<%= year %>"><%= year %></form:option>
                <% } %>
            </form:select>
        </div>

        <div class="form-group">
            <input type="submit" value="Save Contact">
        </div>
    </form:form>
</div>
</body>
</html>