<%-- 
    Document   : post-detail
    Created on : Jun 6, 2024, 2:32:16 PM
    Author     : Legion
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${post.title}</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <style>
            #product:hover, #product *:hover {
                background-color: #e6e6e6;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Header-->
            <header class="py-5 mb-3" style="background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(https://w0.peakpx.com/wallpaper/752/914/HD-wallpaper-sabito-s-haori-kimetsu-no-yaiba-pattern.jpg);">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">Shop in style</h1>
                        <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                    </div>
                </div>
            </header>
            <div class="container-fluid">
                <div class="row p-3">
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
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <header class="py-5" style="background-image: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(${post.imgURL});">
                        <div class="container px-4 px-lg-5 my-5">
                            <div class="text-center text-white">
                                <h1 class="display-4 fw-bolder">${post.title}</h1>
                                <p class="lead fw-normal text-white-50 mb-0">By ${post.authorName}</p>
                            </div>
                        </div>
                    </header>
                    <div>
                        <p><strong>Author:</strong> ${post.authorName}</p>
                        <p><strong>Updated on:</strong> ${post.createdAt}</p>
                        <p>${post.content}</p>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>


