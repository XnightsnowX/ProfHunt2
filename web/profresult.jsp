
<%@page import="src.model.Module"%>
<%@page import="src.model.DataManager"%>
<%@page import="src.model.ProfessorFeedback"%>
<%@page import="src.model.Professor"%>
<%@page import="java.util.ArrayList"%>
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
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
        <br><br>
        <div class="container">
            <%
                ArrayList<Professor> profList = (ArrayList<Professor>) session.getAttribute("profResultList");
                ArrayList<ProfessorFeedback> profFeedback = (ArrayList<ProfessorFeedback>) session.getAttribute("profFeedback");
            %>
            <!-- Start of module result-->
            <div class="row">
                <div class="col-md-12"><h3><br><br><%=profList.size()%> results found</h3></div>
            </div>
            <br>

            <ul class="nav nav-tabs">
                <li class="active"><a href="#">Professor</a></li>
            </ul>              


            <table class="table table-bordered" width="100%">
                <tr>
                    <th width="25%"><center>Photo</center></th>
                <th width="25%"><center>Professor</center></th>
                <th width="25%"><center>Courses</center></th>
                <th width="25%"><center>Faculty</center></th>
                </tr>

                <!-- One example of search result -->
                <%
                    for (int i = 0; i < profList.size(); i++) {
                        Professor p = profList.get(i);
                        ArrayList<String> currMod = p.getCurrMod();
                        ArrayList<String> prevMod = p.gePrevMod();
                        double overallRating = DataManager.profOverallRating(p.getName(), profFeedback);
                        String photo="http://www.canxray.com/wp-content/uploads/2012/10/250X250-profile-coming-soon.jpg";
                        if(p.getName().equals("Richard Davis")){
                            photo = "http://www.mysmu.edu/faculty/rcdavis/images/2011-RCDavis-mugshot.jpg";
                        }
                %>
                <tr>
                    <td>
                        <div style="vertical-align:middle; text-align:center">
                            <img src="<%=photo%>" width="120">
                        </div>
                    </td>
                    <td style="vertical-align:middle; text-align:center">
                        <a style="font-size:200%" href="profprofile.jsp?profName=<%=p.getName()%>"><%=p.getName()%></a>
                        <h3><span class="label label-default">Overall Rating: <%=overallRating%></span></h3>
                    </td>

                    <td style="vertical-align:middle; text-align:center">
                        <h4>Current: <%=currMod.size()%></h4>
                        <%for (int j = 0; j < currMod.size(); j++) {
                                String m = currMod.get(j);
                        %>
                        <a href="profile.jsp?moduleName=<%=m%>"><%=m%></a>&nbsp&nbsp&nbsp&nbsp
                        <%}%>
                        <h4>Previous: <%=prevMod.size()%></h4>
                        <%for (int k = 0; k < prevMod.size(); k++) {
                                String m = prevMod.get(k);
                        %>
                        <a href="profile.jsp?moduleName=<%=m%>"><%=m%></a>&nbsp&nbsp&nbsp&nbsp
                        <%}%>
                    </td>
                    <td style="vertical-align:middle; text-align:center">
                        <div style="font-size:180%"><%=p.getFaculty()%></div>                        
                    </td>
                </tr>
                <!-- End of example of search result -->
                <%}//end of for loop%>

            </table>      
        </div>
    </div>    
</div>
</body>
</html>
