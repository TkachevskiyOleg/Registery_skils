<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Contacts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="button"] {
            padding: 5px 10px;
            margin-right: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<h2>All contacts:</h2>
<table>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Birth Year</th>
        <th>Operations</th>
    </tr>

    <c:forEach var="contact" items="${contacts}">
        <c:url var="deleteButton" value="/deleteContact">
            <c:param name="contactId" value="${contact.id}"/>
        </c:url>
        <c:url var="updateButton" value="/updateContact">
            <c:param name="contactId" value="${contact.id}"/>
        </c:url>
        <tr>
            <td>${contact.firstName}</td>
            <td>${contact.lastName}</td>
            <td>${contact.phone}</td>
            <td>${contact.email}</td>
            <td>${contact.birthYear}</td>
            <td>
                <input type="button" value="Delete" onclick="window.location.href='${deleteButton}'"/>
                <input type="button" value="Update" onclick="window.location.href='${updateButton}'"/>
            </td>
        </tr>
    </c:forEach>
</table>

<input type="button" value="Create New Contact" onclick="window.location.href='createContact'"/>

</body>
</html>