

<%@page import="src.model.ModuleFeedback"%>
<%@page import="src.model.Module"%>
<%@page import="src.model.DataManager"%>
<%@page import="src.model.ProfessorFeedback"%>
<%@page import="src.model.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<!doctype html>


<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ProfHunt</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/c3.css">
        <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script src="js/jquery.csv-0.71.min.js"></script>
        <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
        <script src="js/c3.min.js"></script>

        <!-- Obtaining Attributes-->

        <%            ArrayList<Professor> profList = (ArrayList<Professor>) session.getAttribute("profList");
            ArrayList<Module> modList = (ArrayList<Module>) session.getAttribute("modList");
            ArrayList<ProfessorFeedback> profFeedbackList = (ArrayList<ProfessorFeedback>) session.getAttribute("profFeedback");

            // Need implement in. Obtain from http request.
            String profName = (String) request.getParameter("profName");

            //*** IMPORTANT
            // moduleFeedbackList contains only the SPECIFIC feedback belonging to that specific module
            ArrayList<ModuleFeedback> moduleFeedbackList = new ArrayList<ModuleFeedback>();

            ArrayList<Professor> newList = new ArrayList<Professor>();

            for (int i = 0; i < profList.size(); i++) {
                Professor temp = profList.get(i);
                if (temp.getName().equals(profName)) {
                    newList.add(temp);
                    break;
                }
            }

            // ArrayList of all the modules belonging to this specific prof
            ArrayList<String> modsList = new ArrayList<String>();

            if (newList.isEmpty() == true || newList.size() == 0) {
            } else {
                for (int i = 0; i < newList.size(); i++) {
                    Professor temp = newList.get(i);
                    ArrayList<String> prev = temp.gePrevMod();
                    ArrayList<String> cur = temp.getCurrMod();

                    for (int y = 0; y < prev.size(); y++) {
                        String temp2 = prev.get(y);
                        modsList.add(temp2);
                    }

                    for (String item : prev) {
                        if (cur.contains(item)) {
                        } else {
                            modsList.add(item);

                        }
                    }
                }
            }

            ArrayList<ProfessorFeedback> profNewList = new ArrayList<ProfessorFeedback>();

            for (int i = 0; i < profFeedbackList.size(); i++) {
                ProfessorFeedback test = profFeedbackList.get(i);
                String tempName = test.getProf();

                if (tempName.equals(profName)) {
                    profNewList.add(test);
                }
            }

            String file = "data/";
            Random r = new Random();

            if (profName.equals("Richard Davis")) {
                file = file + "richardDavis.csv";
            } else {
                int Low = 1;
                int High = 4;
                int R = r.nextInt(High - Low) + Low;
                file = file + R + ".csv";
            }

        %>

        <script type="text/javascript">
            var chart = c3.generate({
                data: {
                    x: 'x',
                    url: '<%=file%>'
                },
                axis: {
                    x: {
                        type: 'timeseries',
                        tick: {
                            format: '%m-%Y'
                        }
                    },
                    y: {
                        max: 10,
                        min: 1,
                        // Range includes padding, set 0 if no padding needed
                        // padding: {top:0, bottom:0}
                    }
                },
                subchart: {
                    show: true
                },
                transition: {
                    duration: 200
                },
                color: {
                    pattern: ['#2980b9', '#27ae60', '#d35400', '#2c3e50']
                }
            });
        </script>

    </head>
    <body background="crossword.png">
        <%@include file="header2.jsp"%>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <!-- Include all compiled plugins (below), or include individual files as needed -->

        <div class="container">
            <div class="col-md-12">
                <!-- Start of module page -->
                <br>
                <br>
                <br> 
                <br>
                <div class="col-md-12">

                    <h1><center><%=profName%></center></h1>

                </div>


                <!-- Chart -->
                <div class="row">
                    <div class="col-md-2">
                        <div style="vertical-align:middle; text-align:center">
                            <img src="http://www.mysmu.edu/faculty/rcdavis/images/2011-RCDavis-mugshot.jpg" width="170">
                        </div>
                    </div>

                    <div id="dashboard_div" class="col-md-7">
                        <div id="chart"></div><br>
                        <center><b>Click and drag above to pan the data. Click on the attributes to remove it from chart.</b></center>
                    </div>
                    <!-- <div class="col-md-1"></div>   -->
                    <!-- Right side of chart-->

                    <div class="col-md-3">
                        <div class="col-md-2"></div>
                        <div class="col-md-10">
                            <br>
                            <br>
                            <!-- Button trigger modal -->
                            <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#ratingPolicy">
                                Rating Policy
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="ratingPolicy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel"><u>Rating Policy</u></h4><br>
                                            You are only allowed to rate this professor once and only after you have taken at least one of the modules taught by him/her. Your information, such as your grades obtained etc. will be drawn from the school database. 
                                        </div>
                                        <div class="modal-body">
                                            <u><h4>Rating Type</h4></u>
                                            <b>Helpfulness - </b> This represent the helpfulness of the professor. The higher the score, the more helpful he/she is found by the school community.<br> 
                                            <b>Clarity - </b> This represent the clarity level of the professor. The higher the score, the clearer the professor is in passing on her knowledge to the class.<br> 
                                            <b>Workload - </b> This represent the workload of the professor. The higher the score, the lighter the workload.<br> 
                                            <b>Overall - </b> This represent the overall rating based on all 3 attributes. This is calculated based on the average of the 3 attributes. You do not have to fill this in.<br> 
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>                                

                            <!-- After Rating Policy-->  
                            <br>
                            <br>
                            <b>No. of Ratings:   </b> <%=profNewList.size()%>
                            <br>
                            <br>
                            <b>Average Grade:   </b> B+
                            <br>
                            <br>

                            <!-- Rate Function -->

                            <!-- Button trigger modal -->
                            <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#rate">
                                Rate
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="rate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog" style="width:1000px">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Rate <%out.print(profName);%></h4>
                                        </div>
                                        <div class="modal-body">

                                            <form>


                                                <b>Term Taken: </b><input type="text" name="lname" disabled value="AY2013-2014 T2"><br>
                                                <br>
                                                <table class="table table-bordered" style="table-layout: fixed">
                                                    <tr>
                                                        <td><b>Helpfulness:</b></td>
                                                        <td><input type="radio" name="usefulness" value="1">
                                                            1<br>Extremely Not Helpful</td>
                                                        <td><input type="radio" name="usefulness" value="2">
                                                            2</td>
                                                        <td><input type="radio" name="usefulness" value="3">
                                                            3</td>
                                                        <td><input type="radio" name="usefulness" value="4">
                                                            4</td>
                                                        <td><input type="radio" name="usefulness" value="4">
                                                            5<br>Neutral</td>
                                                        <td><input type="radio" name="usefulness" value="4">
                                                            6</td>
                                                        <td><input type="radio" name="usefulness" value="4">
                                                            7</td>
                                                        <td><input type="radio" name="usefulness" value="4">
                                                            8</td>
                                                        <td><input type="radio" name="usefulness" value="4">
                                                            9</td>
                                                        <td><input type="radio" name="usefulness" value="5">
                                                            10<br>Extremely useful</td>
                                                    </tr>
                                                    <tr>
                                                        <td><b>Clarity:</b></td>
                                                        <td><input type="radio" name="easiness" value="1"> 1<br>Extremely Unclear</td>
                                                        <td><input type="radio" name="easiness" value="2"> 2</td>
                                                        <td><input type="radio" name="easiness" value="3"> 3</td>
                                                        <td><input type="radio" name="easiness" value="4"> 4</td>
                                                        <td><input type="radio" name="easiness" value="5"> 5<br>Neutral</td>
                                                        <td><input type="radio" name="easiness" value="4"> 6</td>
                                                        <td><input type="radio" name="easiness" value="4"> 7</td>
                                                        <td><input type="radio" name="easiness" value="4"> 8</td>
                                                        <td><input type="radio" name="easiness" value="4"> 9</td>
                                                        <td><input type="radio" name="easiness" value="4"> 10<br>Extremely Clear</td>
                                                    </tr>
                                                    <tr>
                                                        <td><b>Workload:</b></td>
                                                        <td><input type="radio" name="easiness" value="1"> 1<br>Extremely Heavy</td>
                                                        <td><input type="radio" name="easiness" value="2"> 2</td>
                                                        <td><input type="radio" name="easiness" value="3"> 3</td>
                                                        <td><input type="radio" name="easiness" value="4"> 4</td>
                                                        <td><input type="radio" name="easiness" value="5"> 5<br>Neutral</td>
                                                        <td><input type="radio" name="easiness" value="4"> 6</td>
                                                        <td><input type="radio" name="easiness" value="4"> 7</td>
                                                        <td><input type="radio" name="easiness" value="4"> 8</td>
                                                        <td><input type="radio" name="easiness" value="4"> 9</td>
                                                        <td><input type="radio" name="easiness" value="4"> 10<br>Extremely Slack</td>
                                                    </tr>                                                

                                                </table>
                                                <b>Grades obtained:</b> <input type="text" name="lname" disabled value="B+"> <br><br> <b>Comments:</b><br><textarea rows="4" cols="90" name="comment" maxlength="500" required>
                                                </textarea> <br> 
                                            </form>                            

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Submit</button>  
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button class="btn btn-default btn-sm" data-toggle="modal" data-target="#shoutout">
                                <img src="loudhailer.png" alt="Smiley face" width="25" height="25">
                            </button> 

                            <!-- Modal -->
                            <div class="modal fade" id="shoutout" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Shoutout</h4>
                                        </div>
                                        <div class="modal-body">

                                            An email has been broadcasted to the school.                     

                                        </div>
                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                                        </div>
                                    </div>
                                </div>
                            </div>                              

                        </div>
                    </div>
                </div>

                <br>

                <!-- Tabs-->

                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#professor" data-toggle="tab">Module</a></li>
                    <li><a href="#feedback" data-toggle="tab">Feedback</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">

                    <!-- Information for Professor tab-->  
                    <div class="tab-pane active" id="professor">


                        <table class="table table-bordered" width="100%">
                            <tr>
                                <th width="25%"><center>Module</center></th>
                            <th width="25%"><center>Ratings</center></th>
                            <th width="25%"><center>Grade Distribution</center></th>
                            <th width="25%"></th>
                            </tr>

                            <%
                                if (modsList.isEmpty() == true || modsList.size() == 0) {

                                    out.println("There are no professor currently taking this module. Information has not been uploaded");
                                } else {
                                    int size = modsList.size();

                                    for (int i = 0; i < size; i++) {

                                        String temp5 = modsList.get(i);


                            %>

                            <tr>
                                <td><br> <br> <font size="4"><center><% out.println(temp5);%></center></td>
                            <td>

                                <%

                                    int number = i;

                                    int grade1 = 1 + (int) (Math.random() * ((5 - 1) + 1));
                                    int grade2 = 3 + (int) (Math.random() * ((7 - 3) + 1));
                                    int grade3 = 3 + (int) (Math.random() * ((7 - 3) + 1));
                                    int grade4 = 5 + (int) (Math.random() * ((15 - 5) + 1));
                                    int grade5 = 5 + (int) (Math.random() * ((15 - 5) + 1));
                                    int grade6 = 3 + (int) (Math.random() * ((10 - 3) + 1));

                                    int grade7 = 2 + (int) (Math.random() * ((4 - 2) + 1));;
                                    int grade8 = 0 + (int) (Math.random() * ((2 - 0) + 1));;
                                    int grade9 = 0 + (int) (Math.random() * ((1 - 0) + 1));;
                                    int grade10 = 0;
                                    int grade11 = 0;
                                    int grade12 = 0;

                                    int attr1 = 6 + (int) (Math.random() * ((10 - 6) + 1));
                                    int attr2 = 6 + (int) (Math.random() * ((10 - 6) + 1));
                                    int attr3 = 6 + (int) (Math.random() * ((10 - 6) + 1));
                                    int attr4 = 6 + (int) (Math.random() * ((10 - 6) + 1));

                                %>

                                <!-- for Module tab -- Rating -->

                                <script type="text/javascript">
                                    google.load("visualization", "1", {packages: ["corechart"]});
                                    google.setOnLoadCallback(drawChart);
                                    function drawChart() {
                                        var data = google.visualization.arrayToDataTable([
                                            ['Type', 'Rating', {role: 'style'}],
                                            ['Workl..', <%=attr1%>, '#609FF7'], // RGB value
                                            ['Easi..', <%=attr2%>, '#F7607C'],
                                            ['Relev..', <%=attr3%>, '#FAA46B'],
                                            ['Overall', <%=attr4%>, '#5DDE70'],
                                        ]);

                                        var options = {
                                            title: 'Rating',
                                            legend: {position: "none"},
                                            'backgroundColor': 'transparent',
                                            hAxis: {title: 'Rating Type', textPosition: 'in', titeTextStyle: {color: 'black'}},
                                            vAxis: {minValue: 0, maxValue: 10, gridlines: {count: 6}}
                                        };

                                        var idnum2 = 'chart_professor_rating' + <%=number%>;

                                        var chart = new google.visualization.ColumnChart(document.getElementById(idnum2));
                                        chart.draw(data, options);
                                    }
                                </script>

                                <div id="chart_professor_rating<%=i%>" style="width: 250px; height: 150px;"></div>                         
                            </td>
                            <td>

                                <!-- For Professor Tab -- Grade Distribution -->
                                <script type="text/javascript">
                                    google.load("visualization", "1", {packages: ["corechart"]});
                                    google.setOnLoadCallback(drawChart);
                                    function drawChart() {
                                        var data = google.visualization.arrayToDataTable([
                                            ['Grade', 'Count', {role: 'style'}],
                                            ['A+', <%=grade1%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['A', <%=grade2%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['A-', <%=grade3%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['B+', <%=grade4%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['B', <%=grade5%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['B-', <%=grade6%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['C+', <%=grade7%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['C', <%=grade8%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['C-', <%=grade9%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['D+', <%=grade10%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['D', <%=grade11%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681'],
                                            ['F', <%=grade12%>, 'stroke-color: #000000; stroke-width: 0.7; fill-color: #F7E681']
                                        ]);

                                        var options = {
                                            legend: {position: "none"},
                                            'backgroundColor': 'transparent',
                                            bar: {groupWidth: '100%'},
                                            chartArea: {top: '5%', height: '80%'},
                                            vAxis: {title: 'Grade', showTextEvery: 2, titleTextStyle: {color: 'black'}}
                                        };

                                        var idnum3 = 'chart_professor_grade' + <%=number%>;

                                        var chart = new google.visualization.BarChart(document.getElementById(idnum3));
                                        chart.draw(data, options);
                                    }
                                </script>                            

                                <div id="chart_professor_grade<%=i%>" style="width: 250px; height: 150px;"></div>                         
                            </td>
                            <td>
                            <center>
                                <br>

                                <!-- Course Outline TAB-->
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal">
                                    Course Outline
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">Course Outline</h4>
                                            </div>
                                            <div class="modal-body">
                                                Overflowing text to show scroll behavior

                                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.

                                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.

                                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.

                                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.

                                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.

                                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.

                                                Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.

                                                Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.

                                                Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <br> <br>
                                <a href="profile.jsp?moduleName=<% out.println(temp5);%>"><button type="button" class="btn btn-default">Module Profile
                                    </button></a>
                                <br> <br>
                            </center>                            

                            </td>

                            <%

                                    }
                                }

                            %>


                        </table>
                        <!-- End of table -->                   
                    </div>

                    <!-- Information for feedback tab-->
                    <div class="tab-pane" id="feedback">

                        <table class="table table-bordered" width="100%">
                            <tr>
                                <th width="12.5%"><center>Date</center></th>
                            <th width="12.5"><center>Class</center></th>
                            <th width="18%"><center>User</center></th>
                            <th width="25%"><center>Rating</center></th>
                            <th width="32%"><center>Comment</center></th>
                            </tr>
                            <%                                if (profNewList.isEmpty() == true || profNewList.size() == 0) {
                                    out.println("There are no feedback available yet");
                                } else {
                                    int size = profNewList.size();

                                    for (int i = 0; i < profNewList.size(); i++) {
                                        ProfessorFeedback temp1 = profNewList.get(i);

                            %>
                            <tr>

                                <td height="167" valign="bottom"><center><% out.println(temp1.getDate());%></center></td>
                            <td height="167" valign="middle">

                            <center><% out.println(temp1.getYear());%></center>

                            <center><% out.println(temp1.getSemester());%></center>
                            </td>
                            <td height="167" valign="middle"><center><% out.println(temp1.getUser());%></center></td>
                            <td height="167" valign="middle"><%

                                int number = i;
                                double score1 = temp1.getAttr1();
                                double score2 = temp1.getAttr2();

                                double score3 = temp1.getAttr3();
                                double score4 = temp1.getAttr4();
                                %>

                                <script type="text/javascript">
                                    google.load("visualization", "1", {packages: ["corechart"]});
                                    google.setOnLoadCallback(drawChart);
                                    function drawChart() {
                                        var data = google.visualization.arrayToDataTable([
                                            ['Type', 'Rating', {role: 'style'}],
                                            ['Help..', <%=score1%>, '#609FF7'], // RGB value
                                            ['Clarity', <%=score2%>, '#F7607C'],
                                            ['Workl..', <%=score3%>, '#FAA46B'],
                                            ['Overall', <%=score4%>, '#5DDE70'],
                                        ]);

                                        var options = {
                                            title: 'Rating',
                                            legend: {position: "none"},
                                            'backgroundColor': 'transparent',
                                            hAxis: {title: 'Rating Type', textPosition: 'in', titleTextStyle: {color: 'black'}},
                                            width: 250,
                                            height: 150,
                                            vAxis: {minValue: 0, maxValue: 10, gridlines: {count: 6}}
                                        };

                                        var idnum = 'chart_feedback_rating' + <%=number%>;


                                        var chart = new google.visualization.ColumnChart(document.getElementById(idnum));
                                        chart.draw(data, options);
                                    }
                                </script>                                         

                                <div id="chart_feedback_rating<%=i%>" style="width: 200px; height: 150px;"> </div>
                            </td>
                            <td ><center><% out.println(temp1.getComment());%></center>

                            <script type="text/javascript">
                                function linkClick(clicked_id) {
                                    var lastChar = clicked_id.charAt(clicked_id.length - 1);
                                    var clicks = document.getElementById("clicked" + lastChar).value;

                                    document.getElementById("clicked" + lastChar).value = ++clicks;
                                    document.getElementById("plus" + lastChar).onclick = function() {
                                        //disable
                                        this.disabled = true;
                                    }
                                    document.getElementById("minus" + lastChar).onclick = function() {
                                        //disable
                                        this.disabled = true;
                                    }
                                    $("#plus" + lastChar).hide();
                                    $("#minus" + lastChar).hide();
                                }
                                function minusClick(clicked_id) {
                                    var lastChar = clicked_id.charAt(clicked_id.length - 1);
                                    var clicks = document.getElementById("clicked" + lastChar).value;
                                    document.getElementById("clicked" + lastChar).value = --clicks;
                                    document.getElementById("minus" + lastChar).onclick = function() {
                                        //disable
                                        this.disabled = true;
                                    }
                                    document.getElementById("plus" + lastChar).onclick = function() {
                                        //disable
                                        this.disabled = true;
                                    }
                                    $("#plus" + lastChar).hide();
                                    $("#minus" + lastChar).hide();
                                }
                            </script>
                            <br><center>

                                Comment Score: <input id="clicked<%=i%>" size="3" onfocus="this.blur();" value="<%out.println(temp1.getLikes());%>" >                                               
                                <button class="btn btn-default btn-sm" id="plus<%=i%>" href="#" onclick="linkClick(this.id)">
                                    <img src="thumbsup.png" alt="Smiley face" width="12" height="12">
                                </button> 
                                <button class="btn btn-default btn-sm" id="minus<%=i%>" href="#" onclick="minusClick(this.id)">
                                    <img src="thumbsdown.png" alt="Smiley face" width="12" height="12">
                                </button> 

                            </center>

                            </td>
                            </tr>

                            <%
                                    }
                                }
                            %>
                        </table>                              
                    </div>
                </div>

            </div>
        </div>

    </body>
</html>
