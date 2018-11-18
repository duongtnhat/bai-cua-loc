<%@page import="java.util.HashMap"%>
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
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">Shopping Card</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="./cart">
                                <%
                                    HashMap<Integer, Integer> hash = (HashMap<Integer, Integer>) request    
                                            .getSession().getAttribute("cart");
                                %>
                                Cart(<%= hash.size()%>)
                            </a>
                        </li>
                        <li class="nav-item" >
                            <% if (request.getSession().getAttribute("username") == null) { %>
                            <a class="nav-link" href="./login">
                                Login
                            </a>
                            <% } else { %>
                            <a class="nav-link" href="./bill">
                                Admin
                            </a>
                            <% } %>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container" style="margin-top: 60px">
            <%
                Model.DBConnection();
                ResultSet rs = Model.getData("Select * from sc_product");
                while (rs.next()) {
            %>
            <div class="row">
                <div class="col-md-2">
                    <a href="#">
                        <img class="img-fluid rounded mb-3 mb-md-0" src="<%= rs.getString("image")%>" alt="">
                    </a>
                </div>
                <div class="col-md-10">
                    <h3><%= rs.getString("name")%></h3>
                    <a class="btn btn-primary" href="./home?product=<%= rs.getString("id")%>" >
                        Add card
                    </a>
                </div>
            </div>    
            <hr>
            <% }%>  
        </div>
    </body>

</html>
