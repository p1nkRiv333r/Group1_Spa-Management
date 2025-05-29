<%-- 
    Document   : list-blog
    Created on : Jun 4, 2024, 9:33:35 PM
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Blog</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            #product:hover, #product *:hover {
                background-color: #e6e6e6;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header-->
            <header class="py-5" style="background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(https://w0.peakpx.com/wallpaper/752/914/HD-wallpaper-sabito-s-haori-kimetsu-no-yaiba-pattern.jpg);">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">Shop in style</h1>
                        <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                    </div>
                </div>
            </header>
            <div class="col-md-12 d-flex justify-content-center p-3">
                <div id="sidebar" class="col-md-2 p-3" style="border: 1px solid rgb(144, 141, 141); height: 100vh;">
                    <form method="get" action="list-blog" class="mr-0">
                        <div id="product-search">
                            <h3>Search Blogs</h3>
                            <input type="text" id="search-box" name="searchQuery" placeholder="Search for blogs..." class="form-control" value="${param.searchQuery}">
                    </div>
                    <div class="form-group">
                        <label for="category">Category:</label>
                        <select id="category" name="category" class="form-control">
                            <option value="">All</option>
                            <c:forEach var="cat" items="${categories}">
                                <option value="${cat.categoryName}" ${param.category == cat.categoryName ? 'selected' : ''}>${cat.categoryName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Filter</button>
                </form>
                <div id="latest-products">
                    <h3>Latest Blogs</h3>
                    <table class="table">
                        <tbody id="table-content-body">
                            <c:forEach items="${latestPosts}" var="post">
                                <tr>
                                    <td><img src="${post.imgURL}" alt="alt" width="50px" height="50px"/></td>
                                    <td>${post.title}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="static-contacts" style="margin-top: 15px">
                    <h3>Contact Us</h3>
                    <p>Email: contact@example.com</p>
                    <p>Phone: 123-456-7890</p>
                </div>
            </div>
            <div class="col-md-10 p-3">
                <c:if test="${isSuccess ne null && isSuccess}">
                    <div class="alert alert-success alert-dismissible fade show mt-2" role="alert" id="mess">
                        <strong>Save success!</strong> You should check in on some of those fields below.   
                        <button type="button" class="btn-close"  onclick="document.getElementById('mess').style.display = 'none'"></button>
                    </div>
                </c:if>
                <c:if test="${isSuccess ne null && !isSuccess}">
                    <div class="alert alert-danger alert-dismissible fade show mt-2" role="alert" id="mess">
                        <strong>Save failed!</strong> You should check your network.
                        <button type="button" class="btn-close"  onclick="document.getElementById('mess').style.display = 'none'"></button>
                    </div>
                </c:if>
                <h2>Our Blogs</h2>
                <table class="table">
                    <tbody id="table-content-body">
                        <c:forEach var="post" items="${posts}">
                            <tr>
                                <td><img src="${post.imgURL}" alt="alt" width="200px" height="200px"/></td>
                                <td>${post.title}</td>
                                <td>${fn:substring(post.content, 0, 50)}...</td>
                                <td>
                                    <a class="btn btn-primary" href="post-detail?id=${post.id}">See more</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <nav>
                    <ul class="pagination">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item"><a class="page-link" href="list-blog?page=${currentPage - 1}&category=${param.category}&search=${param.search}">Previous</a></li>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="list-blog?page=${i}&category=${param.category}&search=${param.search}">${i}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item"><a class="page-link" href="list-blog?page=${currentPage + 1}&category=${param.category}&search=${param.search}">Next</a></li>
                            </c:if>
                    </ul>
                </nav>
            </div>

        </div>
    </body>
</html>
