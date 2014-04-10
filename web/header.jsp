<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
		
		<script type="text/javascript">
var _uxa = _uxa || [];
(function() {
   var uxa = document.createElement("script"); uxa.type = "text/javascript"; uxa.async = true;
   uxa.src = "//www.uxarmy.com/test/js";
   document.getElementsByTagName("head")[0].appendChild(uxa);
})();
</script>
		
		
    </head>
    <body>
        <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target=".navbar-collapse">
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp"><img src="logo222.png" class="img-responsive" height="210" width="100"></a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="allresult.jsp">Browse All</a></li>
                        <li><a href="contact.jsp">Contact</a></li>
                    </ul>

                    <%
                        String username = (String) session.getAttribute("username");
                        if (username == null) {
                    %>
                    <form class="navbar-form navbar-right" action="login" method="get">
                        <div class="form-group">
                            <input type="text" placeholder="Username" class="form-control"
                                   name="username">
                        </div>
                        <div class="form-group">
                            <input type="password" placeholder="Password" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-primary">Sign in</button>
                    </form>
                    <%                                } else {
                    %>

                    <form class="navbar-form navbar-right" action="logout" method="get"> <font color="white"><h7>Welcome <%=username%>!</h7></font>
                        <button type="submit" class="btn btn-primary">Logout</button>
                    </form>
                    <%                                    }
                    %>
                </div>
                <!-- /.nav-collapse -->
            </div>
            <!-- /.container -->
        </div>
        <!-- /.navbar -->
    </body>
</html>