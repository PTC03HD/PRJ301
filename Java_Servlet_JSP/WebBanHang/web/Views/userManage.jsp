<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Dashboard</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/datepicker3.css" rel="stylesheet">
        <link href="css/styles.css" rel="stylesheet">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--Custom Font-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->
    </head>
    <c:if test="${sessionScope.acc==null||!sessionScope.acc.getIsAdmin()}">
        <c:redirect url="/loadDB"></c:redirect>
    </c:if>
    <h1>${uid}</h1>
    <body>
        <nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span></button>
                    <a class="navbar-brand" href="loadDB?page=index"><span>Lumino</span>Admin</a>
                </div>
            </div><!-- /.container-fluid -->
        </nav>
        <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
            <div class="profile-sidebar">
                <div class="profile-userpic">
                    <img src="http://placehold.it/50/30a5ff/fff" class="img-responsive" alt="">
                </div>
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name">${sessionScope.acc.username}</div>
                    <div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="divider"></div>
            <form role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
            </form>
            <ul class="nav menu">
                <li><a href="paging?page=dashboard&index=1">Products Manage</a></li>
                <li class="active"><a href="UserControl">Users Manage</a></li>
                <li><a href="logout?action=logout">Logout</a></li>
            </ul>
        </div><!--/.sidebar-->

        <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
            <div class="row">
                <ol class="breadcrumb">
                    <li><a href="loadDB?page=index">
                            <em class="fa fa-home"></em>
                        </a></li>
                    <li class="active">Dashboard</li>
                </ol>
            </div>
            <!--table-->
            <div class="container">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-6">
                                <h2>Manage <b>Users</b></h2>
                            </div>
                            <div class="col-sm-6">
                                <a href="#deleteProduct" style="margin-top: 15px" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll" onclick="toggle(this)">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>password</th>
                                <th>role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${dao.u}" var="user">
                                <c:if test="${true}">
                                    <tr>
                                        <td>
                                            <span class="custom-checkbox">
                                                <input type="checkbox" id="check_all" name="options" value="1">
                                                <label for="checkbox1"></label>
                                            </span>
                                        </td>
                                        <td>${user.uid}</td>
                                        <td>${user.username}</td>
                                        <td>${user.userPass}</td>
                                        <td>${user.isAdmin}</td>
                                        <td>
                                            <a href="UserControl?uid=${user.uid}" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--/table-->
            <!-- Edit Modal HTML -->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="add" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Add Product</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input name="proName" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input name="proImage" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="proDesc" class="form-control" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="number" name="proPrice" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="number" name="proQuantity" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Discount</label>
                                    <input type="number" name="proDis" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Hot</label>
                                    <input name="proHot" type="checkbox" value="1">
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="category" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${dao.c}" var="cate">
                                            <option value="${cate.id}">${cate.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="text" name="index" value="${index}" hidden="">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" name="btnInsert" class="btn btn-success" value="Add">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Delete Modal HTML -->
            <div id="deleteUser" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="UserControl" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Delete Users</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <p>Are you sure you want to delete these Records?</p>
                                <p class="text-warning"><small>This action cannot be undone.</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="text" name="delId" value="${deleteId}" hidden>
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" name="btnDelete" class="btn btn-danger" value="Delete">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>
        <script>
                                            window.onload = function () {
                                                var chart1 = document.getElementById("line-chart").getContext("2d");
                                                window.myLine = new Chart(chart1).Line(lineChartData, {
                                                    responsive: true,
                                                    scaleLineColor: "rgba(0,0,0,.2)",
                                                    scaleGridLineColor: "rgba(0,0,0,.05)",
                                                    scaleFontColor: "#c5c7cc"
                                                });
                                            };
        </script>

        <script language="javascript">

            function toggle(source) {
                checkboxes = document.getElementsByName('options');
                for (var i = 0, n = checkboxes.length; i < n; i++) {
                    checkboxes[i].checked = source.checked;
                }
            }
        </script>
        <c:if test="${uid!=null}">
            <script>
                $(window).load(function () {
                    $("#deleteUser").modal('show');;
                });
            </script>
        </c:if>
    </body>
</html>
