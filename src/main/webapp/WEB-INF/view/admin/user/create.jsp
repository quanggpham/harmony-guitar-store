<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create User</title>
    <link rel="stylesheet" href="/css/test.css">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <!-- Card -->
            <div class="card rounded-3">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">Create User</h3>
                </div>
                <div class="card-body p-4">
                    <form:form method="POST" action = "/admin/user/create" modelAttribute="newUser">
                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <form:input type="email" class="form-control" placeholder="Enter email" path="email"/>
                            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                        </div>

                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <form:input type="password" class="form-control" placeholder="Password" path="password"/>
                        </div>

                        <div class="mb-3">
                            <label for="fullname" class="form-label">Full Name</label>
                            <form:input type="text" class="form-control" placeholder="Full Name" path="fullName"/>
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <form:input type="text" class="form-control" placeholder="Address" path="address"/>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone number</label>
                            <form:input type="number" class="form-control" placeholder="Phone number" path="phone"/>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary btn-lg">Submit</button>
                        </div>
                    </form:form>
                </div>
                <div class="card-footer text-muted text-center">
                    &copy; 2025 Your Company
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
