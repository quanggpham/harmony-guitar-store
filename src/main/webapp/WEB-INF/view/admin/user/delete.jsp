<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Xác nhận xoá người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet"/>
</head>
<body class="bg-light">

<div class="container py-5">

    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="<c:url value='/admin/user'/>">Quản trị người dùng</a></li>
            <li class="breadcrumb-item active" aria-current="page">Xác nhận xoá</li>
        </ol>
    </nav>

    <!-- Card -->
    <div class="row justify-content-center">
        <div class="col-lg-7">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-danger text-white">
                    <h5 class="mb-0">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        Xác nhận xoá người dùng
                    </h5>
                </div>

                <div class="card-body">

                    <!-- Cảnh báo -->
                    <div class="alert alert-warning d-flex align-items-start" role="alert">
                        <i class="bi bi-exclamation-circle-fill me-2"></i>
                        <div>
                            Hành động này <strong>không thể hoàn tác</strong>.
                            Vui lòng kiểm tra kỹ trước khi xoá.
                        </div>
                    </div>

                    <!-- Thông tin người dùng -->
                    <div class="mb-3">
                        <label class="form-label">ID</label>
                        <input type="text" class="form-control" value="${user.id}" readonly/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="text" class="form-control" value="${user.email}" readonly/>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Họ và tên</label>
                        <input type="text" class="form-control" value="${user.fullName}" readonly/>
                    </div>

                    <!-- Form xác nhận xoá -->
                    <form action="<c:url value='/admin/user/delete'/>" method="post" class="d-flex gap-2">
                        <!-- hidden id để POST -->
                        <input type="hidden" name="id" value="${user.id}"/>

                        <button type="submit" class="btn btn-danger">
                            <i class="bi bi-trash3 me-1"></i> Xoá người dùng
                        </button>
                        <a href="<c:url value='/admin/user'/>" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left"></i> Huỷ bỏ
                        </a>
                    </form>
                </div>

                <div class="card-footer text-muted small">
                    Thời gian: <span id="now"></span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("now").innerText = new Date().toLocaleString("vi-VN");
</script>

</body>
</html>
