<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: askih
  Date: 12/16/2022
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="canonical" href="https://demo-basic.adminkit.io/"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

    <link href="<%=request.getContextPath()%>/views/admin/css/app.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <title>List Company</title>
    <style>
        .styled-table{
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            min-width: 400px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }
        .styled-table thead tr {
            background-color: #009879;
            color: #ffffff;
            text-align: center;
        }
        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }
        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<table id="example1" class="table table-bordered table-striped text-center styled-table">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Address</th>
        <th colspan="2">Action</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${listCompany}" var="company">
        <tr>
            <td>${company.id}</td>
            <td>${company.name}</td>
            <td>${company.address}</td>
            <td>
                <a type="button" id="update" class="btn btn-warning" href="<%=request.getContextPath()%>/company/edit?id=${company.id}"
                   data-bs-toggle="modal">Update</a>
                <a type="button" id="delete" class="btn btn-danger" href="<%=request.getContextPath()%>/company/delete?id=${company.id}"
                   data-bs-toggle="modal">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tr>
        <td colspan="6">
            <a href="<%=request.getContextPath()%>/company/create" class="btn btn-primary">Create</a>
        </td>
    </tr>

</table>
</body>
</html>
