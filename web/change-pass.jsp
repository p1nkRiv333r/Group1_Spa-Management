<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Change Password</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">

            <div class="card">
                <div class="card-header">
                    Change password
                </div>
                <c:if test="${param.success ne null}">
                    <div class="alert alert-success" role="alert">
                        Success!
                    </div>
                </c:if>
                <c:if test="${param.fail ne null}">
                    <div class="alert alert-danger" role="alert">
                        Failed!
                    </div>
                </c:if>
                <div class="card-body">
                    <form id="profileForm" action="change-pass" method="post">
                        <!-- Hidden Fields -->
                        <input type="hidden" id="id" name="id" value="${user.id}">
                        <input type="hidden" id="password" name="check-password" value="${user.password}">

                        <div class="form-group">
                            <label for="email">Old password:</label>
                            <input type="password" class="form-control" name="oldpassword" value="" required>
                        </div>

                        <div class="form-group">
                            <label for="email">New password:</label>
                            <input type="password" class="form-control" name="password" value="" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Retype password:</label>
                            <input type="password" class="form-control" name="repassword" value="" required>
                        </div>
                        

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary">Submit</button>

                        <!-- Go Back Button -->
                        <a href="profile" class="btn btn-secondary">Go Back</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
