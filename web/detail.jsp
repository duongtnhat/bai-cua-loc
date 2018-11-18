<%@page import="java.sql.ResultSet"%>
<%@page import="model.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shopping cart</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <body id="page-top" class="">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1" href="./home">Shopping cart</a>
            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item ">
                    <a class="nav-link" href="./bill" role="button" >
                        Manage Bill
                    </a>
                </li>
                <li class="nav-item ">
                    <a class="nav-link" href="./product" role="button" >
                        Manage Product
                    </a>
                </li>
            </ul>
        </nav>
        <div id="wrapper" style="margin-top: 30px">
            <ul class="sidebar navbar-nav">
            </ul>
            <div id="content-wrapper">
                <div class="container-fluid">

                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Bill</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <table class="table table-bordered dataTable table-striped" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                                <thead>
                                                    <tr>
                                                        <th rowspan="1" colspan="1">Product</th>
                                                        <th rowspan="1" colspan="1">Price</th>
                                                        <th rowspan="1" colspan="1">Quantity</th>
                                                        <th rowspan="1" colspan="1">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%
                                                        Model.DBConnection();
                                                        String bill = request.getAttribute("bill").toString();
                                                        ResultSet rs = Model.getData("select name, price, quatity from sc_bill_detail as b join sc_product as p on b.pid = p.id where b.bid = " + bill);                                                        
                                                        int total = 0;
                                                        while (rs.next()) {
                                                        total += rs.getInt("quatity") * rs.getInt("price");    
                                                    %>
                                                    <tr role="row">
                                                        <td><%= rs.getString("name")%></td>
                                                        <td><%= rs.getString("price")%></td>
                                                        <td><%= rs.getString("quatity")%></td>
                                                        <td><%= rs.getInt("quatity") * rs.getInt("price") %></td>
                                                    </tr>    
                                                    <% }%>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th rowspan="1" colspan="1"></th>
                                                        <th rowspan="1" colspan="1"></th>
                                                        <th rowspan="1" colspan="1">Total</th>
                                                        <th rowspan="1" colspan="1"><%= total %></th>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="sticky-footer">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright © Your Website 2018</span>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>        
</html>
