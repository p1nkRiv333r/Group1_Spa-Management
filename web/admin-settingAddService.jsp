<%-- 
    Document   : list-post
    Created on : May 20, 2024, 4:20:58 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="../css/list-post.css">
        <!-- Font Awesome CSS for icons -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">

        <!-- Include Quill.js CSS -->
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

        <style>
            @media (min-width: 768px) {
                .modal-dialog {
                    max-width: 80%;
                }
            }
        </style>
    </head>

    <body>
        <%@ include file="admin-sidebar.jsp" %>



        <div class="mt-5 main-content">
            <c:if test="${isSuccess ne null && isSuccess}">
                <div class="alert alert-success alert-dismissible fade show mt-2" role="alert" id="mess">
                    <strong>Save success!</strong> 
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${isSuccess ne null && !isSuccess}">
                <div class="alert alert-danger alert-dismissible fade show mt-2" role="alert" id="mess">
                    <strong>Save failed!</strong> You should check your network.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <div class="card-header">
                Service Detail
            </div>

            <form method="post" action="/Spa/admin/addService" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="addServiceModalLabel">Add Service</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="serviceName">Name</label>
                        <input type="text" class="form-control" id="serviceName" name="name" required value="">
                    </div>
                    <div class="form-group">
                        <label for="serviceDescription">Description</label>
                        <textarea class="form-control" id="serviceDescription" name="description" required value=""></textarea>
                    </div>
                    <div class="form-group">
                        <label for="serviceDuration">Duration (Minutes)</label>
                        <input type="number" class="form-control" id="serviceDuration" name="durationMinutes" required value="">
                    </div>
                    <div class="form-group">
                        <label for="servicePrice">Price</label>
                        <input type="number" step="0.01" class="form-control" id="servicePrice" name="price" required value="">
                    </div>
                    <div class="form-group">
                        <label for="serviceCategory">Category</label>
                        <select class="form-control" id="serviceCategory" name="category" required>
                            <option value="" disabled selected>Select Category</option>

                            <option value="2">Massage Therapy</option>
                            <option value="3">Facial Treatments</option>
                            <option value="4">Body Scrub</option>
                            <option value="5">Hair Removal</option>
                            <option value="6">Aromatherapy</option>
                            <option value="7">Manicure & Pedicure</option>
                            <option value="8">Hot Stone Therapy</option>
                            <option value="9">Sauna & Steam Bath</option>
                            <option value="10">Slimming Treatments</option>
                            <option value="11">Anti-Aging Treatments</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="serviceImage">Upload Image</label>
                        <input type="file" class="form-control" id="serviceImage" name="file" accept="image/jpeg,image/jpg,image/png">
                    </div>
                </div>
                <br>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="window.location.href = '/Spa/admin/settingservice2'">Return</button>
                    <button type="submit" class="btn btn-primary">Save Service</button>
                </div>
            </form>
        </div>





        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
        

    </body>

</html>
