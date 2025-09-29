<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>User Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container py-4">
    <!-- Tiêu đề -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h1 class="h4 mb-0">
            <i class="bi bi-person-circle me-2"></i>User Detail
        </h1>
        <a href="/admin/user" class="btn btn-secondary">
            <i class="bi bi-arrow-left me-1"></i>Back to List
        </a>
    </div>

    <!-- Card -->
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">${user.fullName}</h5>
        </div>
        <div class="card-body">
            <table class="table table-borderless mb-0">
                <tbody>
                <tr>
                    <th style="width: 20%;">Email</th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>${user.password}</td>
                </tr>
                <tr>
                    <th>Full Name</th>
                    <td>${user.fullName}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${user.address}</td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td>${user.phone}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="card-footer text-end">
            <a href="/admin/user/edit/${user.id}" class="btn btn-primary">
                <i class="bi bi-pencil-square me-1"></i>Edit
            </a>
            <a href="/admin/user/delete/${user.id}" class="btn btn-danger"
               onclick="return confirm('Are you sure you want to delete this user?')">
                <i class="bi bi-trash me-1"></i>Delete
            </a>
        </div>
    </div>
</div>

</body>
</html>