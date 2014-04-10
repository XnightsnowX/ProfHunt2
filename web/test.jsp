<%-- 
    Document   : test
    Created on : Apr 1, 2014, 4:51:30 PM
    Author     : leonard
--%>

<%@page import="src.model.ProfessorFeedback"%>
<%@page import="src.model.ModuleFeedback"%>
<%@page import="src.model.DataManager"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="src.model.Module"%>
<%@page import="src.model.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>



        <%
            ArrayList<Professor> profList = (ArrayList<Professor>) session.getAttribute("profList");
            ArrayList<Module> modList = (ArrayList<Module>) session.getAttribute("modList");
            ArrayList<ModuleFeedback> modFeedback = (ArrayList<ModuleFeedback>) session.getAttribute("modFeedback");
            ArrayList<ProfessorFeedback> profFeedback = (ArrayList<ProfessorFeedback>) session.getAttribute("profFeedback");
        %>

        <h1>Module: <%=modList.size()%></h1><br><br>
        <h1>Professor: <%=profList.size()%></h1>
        <h1>Module Feedback: <%=modFeedback.size()%></h1><br><br>
        <h1>Professor Feedback: <%=profFeedback.size()%></h1>


    </body>
</html>
