<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="/static/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <a href="/admin/admin.jsp">
            <div class="col-5">
                <button class="btn btn-primary">Create Test</button>
            </div>
        </a>
        <a href="/user/tests.jsp">
            <div class="col-5">
                <button class="btn btn-success">Start Test</button>
            </div>
        </a>
        <a href="/user/testReport.jsp">
            <div class="col-5">
                <button class="btn btn-success">My Test Reports</button>
            </div>
        </a>
    </div>
</div>
</body>
</html>