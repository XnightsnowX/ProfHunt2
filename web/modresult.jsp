
<%@page import="src.model.ModuleFeedback"%>
<%@page import="src.model.DataManager"%>
<%@page import="src.model.ProfessorFeedback"%>
<%@page import="src.model.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="src.model.Module"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ProfHunt: Search Results</title>

        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>

        <script type="text/javascript" src="https://www.google.com/jsapi"></script>

        <script src="js/jquery.csv-0.71.min.js"></script>

    </head>
    <body background="crossword.png">
        <%@include file="header2.jsp"%>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="assets/js/bootstrap.min.js"></script>
        <br>
        <br>
        <div class="container">
            <%
                ArrayList<Module> modList = (ArrayList<Module>) session.getAttribute("modResultList");
                ArrayList<Professor> profList = (ArrayList<Professor>) session.getAttribute("profList");
                ArrayList<ModuleFeedback> modFeedback = (ArrayList<ModuleFeedback>) session.getAttribute("modFeedback");
            %>
            <!-- Start of module result-->
            <div class="row">
                <div class="col-md-12"><h3><br><br><%=modList.size()%> results found</h3></div>
            </div>
            <br>

            <ul class="nav nav-tabs">
                <li class="active"><a href="#">Module</a></li>
            </ul>                


            <table class="table table-bordered" width="100%">
                <tr>
                    <th width="25%"><center>Course</center></th>
                <th width="25%"><center>Rating</center></th>
                <th width="25%"><center>Professors</center></th>
                </tr>
                <%
                    for (int i = 0; i < modList.size(); i++) {
                        Module m = modList.get(i);
                        double overallRating = DataManager.modOverallRating(m.getCode(), modFeedback);
                        ArrayList<Professor> currProf = DataManager.modCurrProf(m.getCode(), profList);
                        ArrayList<Professor> prevProf = DataManager.modPrevProf(m.getCode(), profList);
                %>
                <!-- One example of search result -->
                <tr>
                    <td style="vertical-align:middle; text-align:center">
                        <a style="font-size:150%" href="profile.jsp?moduleName=<%=m.getCode()%>"><%=m.getCode()%> : <%=m.getName()%></a>
                    </td>
                    <td style="vertical-align:middle; text-align:center">
                        <h3><span class="label label-default">Overall Rating: <%=overallRating%></span></h3>
                    </td>

                    <td style="vertical-align:middle; text-align:center">
                        <h4>Current</h4>
                        <%for (Professor tempCurr : currProf) {%>
                        <a href="profprofile.jsp?profName=<%=tempCurr.getName()%>"><%=tempCurr.getName()%></a> &nbsp;&nbsp;&nbsp;
                        <%}%>
                        <h4>Previous</h4>
                        <%for (Professor tempPrev : prevProf) {%>
                        <a href="profprofile.jsp?profName=<%=tempPrev.getName()%>"><%=tempPrev.getName()%></a> &nbsp;&nbsp;&nbsp;
                        <%}%>
                    </td>
                </tr>
                <%}%>
                <!-- End of example of search result -->
            </table>      
        </div>
    </body>
</html>
