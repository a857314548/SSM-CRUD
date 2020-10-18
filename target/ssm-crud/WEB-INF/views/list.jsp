<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
    <link href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>

    </div>
    <%--新增删除按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>lastName</th>
                    <th>email</th>
                    <th>gender</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="pageInfo">
                    <tr>
                        <td>${pageInfo.empId}</td>
                        <td>${pageInfo.empName}</td>
                        <td>${pageInfo.enail}</td>
                        <td>${pageInfo.gender == "m"?"男":"女"}</td>
                        <td>${pageInfo.departMent.deptName}</td>
                        <td>
                            <button class="btn btn-success btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑
                            </button>
                            <button class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <div class="col-md-12">
            当前第${pageInfo.pageNum}页,共有${pageInfo.pages}页,总页数为${pageInfo.total}条记录
        </div>
        <div>
            <div class="col-md-offset-8">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum -1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="currentPageNum">
                            <c:if test="${pageInfo.pageNum == currentPageNum}">
                                <li class="active"><a href="${APP_PATH}/emps?pn=${currentPageNum}">${currentPageNum}</a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum != currentPageNum}">
                                <li><a href="${APP_PATH}/emps?pn=${currentPageNum}">${currentPageNum}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

</body>
</html>
