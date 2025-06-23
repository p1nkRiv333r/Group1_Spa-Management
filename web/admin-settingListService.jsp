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
                Setting List
            </div>
           


            <%-- Service Table Section --%>

            <form method="get" action="/Spa/admin/setting/user-list" class="form-inline mb-3" id="searchFormService">
                <table>
                    <tr>
                        <td>
                            <div class="form-group">
                                <label for="searchNameSpa">Name</label>
                                <input type="text" id="searchNameSpa" name="searchNameSpa" class="form-control" value="${param.searchNameSpa}">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="searchPrice">Price</label>
                                <input type="text" id="searchPrice" name="searchPrice" class="form-control" value="${param.searchPrice}">
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="statusService">Status</label>
                                <select id="statusService" name="statusService" class="form-control">
                                    <option value="">All</option>
                                    <option value="show" ${param.statusService == 'show' ? 'selected' : ''}>Show</option>
                                    <option value="hide" ${param.statusService == 'hide' ? 'selected' : ''}>Hide</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="category">Category</label>
                                <select class="form-control" name="category" id="category">
                                    <option value="">Select Category</option>
                                    <option value="2" ${param.category == '2' ? 'selected' : ''}>Massage Therapy</option>
                                    <option value="3" ${param.category == '3' ? 'selected' : ''}>Facial Treatments</option>
                                    <option value="4" ${param.category == '4' ? 'selected' : ''}>Body Scrub</option>
                                    <option value="5" ${param.category == '5' ? 'selected' : ''}>Hair Removal</option>
                                    <option value="6" ${param.category == '6' ? 'selected' : ''}>Aromatherapy</option>
                                    <option value="7" ${param.category == '7' ? 'selected' : ''}>Manicure & Pedicure</option>
                                    <option value="8" ${param.category == '8' ? 'selected' : ''}>Hot Stone Therapy</option>
                                    <option value="9" ${param.category == '9' ? 'selected' : ''}>Sauna & Steam Bath</option>
                                    <option value="10" ${param.category == '10' ? 'selected' : ''}>Slimming Treatments</option>
                                    <option value="11" ${param.category == '11' ? 'selected' : ''}>Anti-Aging Treatments</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="sortByService">Sort</label>
                                <select id="sortByService" name="sortByService" class="form-control">
                                    <!-- Populated dynamically by JS -->
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="form-group">
                                <label for="sortOrderService">Order</label>
                                <select id="sortOrderService" name="sortOrderService" class="form-control">
                                    <option value="ASC" ${param.sortOrderService == 'ASC' ? 'selected' : ''}>Ascending</option>
                                    <option value="DESC" ${param.sortOrderService == 'DESC' ? 'selected' : ''}>Descending</option>
                                </select>
                            </div>
                        </td>
                        <td>
                            <div class="form-group" style="margin-left: 10px">
                                <label for="sortOrderService"></label><br>
                                <button type="button" class="btn btn-success"
                                        onclick="window.location.href = '/Spa/admin/addService'">
                                    Add New Service
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>

            <table class="table table-bordered table-striped" id="serviceTable">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Duration</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="table-content-body-service">
                    <c:forEach var="service" items="${Services}">
                        <tr>
                            <td>${service.id}</td>
                            <td>${service.name}</td>
                            <td>${service.durationMinutes}</td>
                            <td>${service.price}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${service.getCategoryId() eq 2}">Massage Therapy</c:when>
                                    <c:when test="${service.getCategoryId() eq 3}">Facial Treatments</c:when>
                                    <c:when test="${service.getCategoryId() eq 4}">Body Scrub</c:when>
                                    <c:when test="${service.getCategoryId() eq 5}">Hair Removal</c:when>
                                    <c:when test="${service.getCategoryId() eq 6}">Aromatherapy</c:when>
                                    <c:when test="${service.getCategoryId() eq 7}">Manicure & Pedicure</c:when>
                                    <c:when test="${service.getCategoryId() eq 8}">Hot Stone Therapy</c:when>
                                    <c:when test="${service.getCategoryId() eq 9}">Sauna & Steam Bath</c:when>
                                    <c:when test="${service.getCategoryId() eq 10}">Slimming Treatments</c:when>
                                    <c:when test="${service.getCategoryId() eq 11}">Anti-Aging Treatments</c:when>
                                    <c:otherwise>Danh mục không xác định</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a class="btn btn-info btn-sm" href="/Spa/admin/settingservice?id=${service.id}">Edit</a>
                                <c:if test="${service.isActive()}">
                                    <a href="/Spa/admin/servicestatus?id=${service.id}&isActive=1" class="btn btn-danger btn-sm">Hide</a>
                                </c:if>
                                <c:if test="${!service.isActive()}">
                                    <a href="/Spa/admin/servicestatus?id=${service.id}&isActive=0" class="btn btn-success btn-sm">Show</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <nav>
                <ul class="pagination">
                    <c:if test="${pageService > 1}">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/admin/settingService?pageService=${pageService - 1}&tab=service">Prev</a>
                        </li>
                    </c:if>
                    <c:forEach var="i" begin="1" end="${totalPagesService}">
                        <li class="page-item ${pageService == i ? 'active' : ''}">
                            <a class="page-link" href="${pageContext.request.contextPath}/admin/settingService?pageService=${i}&tab=service">${i}</a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageService < totalPagesService}">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/admin/settingService?pageService=${pageService + 1}&tab=service">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>









            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>


            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>

            <!-- Quill.js library -->
            <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

            <script>
                                            var quill = new Quill('#postContentEdit', {
                                                theme: 'snow',
                                                modules: {
                                                    toolbar: [
                                                        [{'header': [1, 2, 3, false]}],
                                                        ['bold', 'italic', 'underline', 'strike'],
                                                        [{'align': []}],
                                                        [{'list': 'ordered'}, {'list': 'bullet'}],
                                                        ['link', 'image'],
                                                        ['clean']
                                                    ]
                                                }
                                            });

                                            var form = document.getElementById('form');  // hoặc id form cụ thể
                                            var content = document.getElementById('contenttent');

                                            console.log(form)

                                            form.addEventListener('submit', function (event) {
                                                document.getElementById('editContent').value = quill.root.innerHTML;
                                            });
            </script>

            


            <script>
                // Lưu trữ dữ liệu gốc của bảng Service
                let originalServiceRows = [];

                // Hàm lấy và lưu dữ liệu gốc của bảng Service
                function storeOriginalServiceRows() {
                    const tbody = document.getElementById('table-content-body-service');
                    originalServiceRows = Array.from(tbody.querySelectorAll('tr'));
                }

                // Hàm điền danh sách sortBy cho bảng Service
                function populateSortByServiceDropdown() {
                    const sortBySelect = document.getElementById('sortByService');
                    const headers = document.querySelectorAll('#serviceTable thead th');
                    const columnsToSort = [];

                    // Lấy các cột, trừ cột "Action"
                    headers.forEach((header, index) => {
                        const headerText = header.textContent.trim();
                        if (headerText !== 'Action') {
                            columnsToSort.push({text: headerText, index: index});
                        }
                    });

                    // Xóa và thêm các tùy chọn mới
                    sortBySelect.innerHTML = '<option value="">Select Column to Sort</option>';
                    columnsToSort.forEach(column => {
                        const option = document.createElement('option');
                        option.value = column.index;
                        option.textContent = column.text;
                        sortBySelect.appendChild(option);
                    });
                }

                // Hàm lọc và sắp xếp bảng Service
                function filterAndSortServiceTable() {
                    const searchNameSpa = document.getElementById('searchNameSpa').value.toLowerCase().trim();
                    const searchPrice = document.getElementById('searchPrice').value.trim();
                    const statusService = document.getElementById('statusService').value;
                    const category = document.getElementById('category').value;
                    const sortByService = document.getElementById('sortByService').value;
                    const sortOrderService = document.getElementById('sortOrderService').value;
                    const tbody = document.getElementById('table-content-body-service');

                    // Lọc các hàng
                    let filteredRows = originalServiceRows.filter(row => {
                        const name = row.cells[1].textContent.toLowerCase().trim();
                        const price = row.cells[3].textContent.trim();
                        const isActive = row.cells[5].querySelector('.btn-danger') ? true : false; // Kiểm tra trạng thái
                        const categoryText = row.cells[4].textContent.trim();
                        const categoryMap = {
                            'Massage Therapy': '2',
                            'Facial Treatments': '3',
                            'Body Scrub': '4',
                            'Hair Removal': '5',
                            'Aromatherapy': '6',
                            'Manicure & Pedicure': '7',
                            'Hot Stone Therapy': '8',
                            'Sauna & Steam Bath': '9',
                            'Slimming Treatments': '10',
                            'Anti-Aging Treatments': '11',
                            'Danh mục không xác định': ''
                        };

                        // Lọc theo tên
                        const nameMatch = searchNameSpa === '' || name.includes(searchNameSpa);

                        // Lọc theo giá
                        const priceMatch = searchPrice === '' || price.includes(searchPrice);

                        // Lọc theo trạng thái
                        const statusMatch = statusService === '' ||
                                (statusService === 'show' && !isActive) ||
                                (statusService === 'hide' && isActive);

                        // Lọc theo danh mục
                        const categoryMatch = category === '' || categoryMap[categoryText] === category;

                        return nameMatch && priceMatch && statusMatch && categoryMatch;
                    });

                    // Sắp xếp các hàng đã lọc
                    if (sortByService !== '') {
                        filteredRows.sort((rowA, rowB) => {
                            const cellA = rowA.cells[sortByService].textContent.trim();
                            const cellB = rowB.cells[sortByService].textContent.trim();

                            // Sắp xếp cột ID (#) hoặc Duration, Price (số)
                            if (sortByService === '0' || sortByService === '2' || sortByService === '3') {
                                const numA = parseFloat(cellA) || 0;
                                const numB = parseFloat(cellB) || 0;
                                return sortOrderService === 'ASC' ? numA - numB : numB - numA;
                            }

                            // Sắp xếp cột Category
                            if (sortByService === '4') {
                                const categoryOrder = {
                                    'Massage Therapy': 1,
                                    'Facial Treatments': 2,
                                    'Body Scrub': 3,
                                    'Hair Removal': 4,
                                    'Aromatherapy': 5,
                                    'Manicure & Pedicure': 6,
                                    'Hot Stone Therapy': 7,
                                    'Sauna & Steam Bath': 8,
                                    'Slimming Treatments': 9,
                                    'Anti-Aging Treatments': 10,
                                    'Danh mục không xác định': 11
                                };
                                const valueA = categoryOrder[cellA] || 999;
                                const valueB = categoryOrder[cellB] || 999;
                                return sortOrderService === 'ASC' ? valueA - valueB : valueB - valueA;
                            }

                            // Sắp xếp các cột chuỗi khác (Name)
                            return sortOrderService === 'ASC'
                                    ? cellA.localeCompare(cellB)
                                    : cellB.localeCompare(cellA);
                        });
                    }

                    // Cập nhật bảng
                    tbody.innerHTML = '';
                    filteredRows.forEach(row => tbody.appendChild(row));
                }

                // Hàm debounce để giới hạn tần suất gọi hàm
                function debounce(func, wait) {
                    let timeout;
                    return function executedFunction(...args) {
                        const later = () => {
                            clearTimeout(timeout);
                            func(...args);
                        };
                        clearTimeout(timeout);
                        timeout = setTimeout(later, wait);
                    };
                }

                // Gắn sự kiện cho các trường của bảng Service
                window.addEventListener('load', () => {
                    storeOriginalServiceRows(); // Lưu dữ liệu gốc
                    populateSortByServiceDropdown(); // Điền sortBy dropdown

                    // Gắn sự kiện input/change cho các trường
                    const inputs = ['searchNameSpa', 'searchPrice', 'statusService', 'category', 'sortByService', 'sortOrderService'];
                    inputs.forEach(id => {
                        const element = document.getElementById(id);
                        if (element) {
                            const eventType = element.tagName === 'INPUT' ? 'input' : 'change';
                            element.addEventListener(eventType, debounce(filterAndSortServiceTable, 300));
                        }
                    });
                });
            </script>

    </body>

</html>
