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
                    <div class="container">
                        <div class="card card-login mx-auto mt-5 col-md-6">
                            <div class="card-header">Create Product</div>
                            <div class="card-body">
                                <form method="post" action="./create">
                                    <div class="form-group">
                                        <div class="form-label-group">
                                            <label for="inputEmail">Name</label>
                                            <input type="text" id="inputEmail" name="user" class="form-control" placeholder="Name" required="required" autofocus="autofocus">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-label-group">
                                            <label for="inputEmail">Image</label>
                                            <input type="text" id="inputEmail" name="image" class="form-control" placeholder="Image" required="required" autofocus="autofocus">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-label-group">
                                            <label for="inputEmail">Price</label>
                                            <input type="text" id="inputEmail" name="price" class="form-control" placeholder="Price" required="required" autofocus="autofocus">
                                        </div>
                                    </div>
                                    <input type="submit" class="btn btn-primary btn-block">
                                </form>
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
