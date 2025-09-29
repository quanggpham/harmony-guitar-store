<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Update User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container py-4">
    <!-- Tiêu đề -->
    <div class="d-flex align-items-center justify-content-between mb-4">
        <h1 class="h4 mb-0"><i class="bi bi-pencil-square me-2"></i>Update User</h1>
        <a href="/admin/user" class="btn btn-secondary">
            <i class="bi bi-arrow-left me-1"></i>Back to List
        </a>
    </div>

    <!-- Card -->
    <div class="card shadow-sm">
        <div class="card-body">
            <form:form method="POST" modelAttribute="user" action="/admin/user/update">
                <!-- ID (readonly) -->
                <div class="mb-3" style="display: none">
                    <label class="form-label">ID</label>
                    <form:input path="id" class="form-control" readonly="true" />
                </div>

                <!-- Email -->
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <form:input path="email" type="email" class="form-control" disabled="true" />
                </div>

                <!-- Phone -->
                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <form:input path="phone" type="text" class="form-control"/>
                </div>

                <!-- Full Name -->
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <form:input path="fullName" type="text" class="form-control"/>
                </div>

                <!-- Address -->
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <form:input path="address" type="text" class="form-control"/>
                </div>

                <!-- Submit -->
                <div class="d-grid">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="bi bi-save me-1"></i>Save Changes
                    </button>
                </div>
            </form:form>
        </div>
    </div>
</div>

</body>
</html>
