

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
        <title>Bootstrap 101 Template</title>

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
        <link rel="stylesheet" type="text/css" href="css/style.css" /> 
        <!-- Obtaining Attributes-->

        <%    ArrayList<Professor> profList = (ArrayList<Professor>) session.getAttribute("profList");
            ArrayList<Module> modList = (ArrayList<Module>) session.getAttribute("modList");
            ArrayList<ModuleFeedback> modFeedbackList = (ArrayList<ModuleFeedback>) session.getAttribute("modFeedback");

            // Need implement in. Obtain from http request.
            String moduleName = (String) request.getParameter("moduleName");

            // contains all the profs that match the criteria
            ArrayList<Professor> newList = new ArrayList<Professor>();
            ArrayList<ModuleFeedback> modNewList = new ArrayList<ModuleFeedback>();

            if (profList.isEmpty() == true || profList.size() == 0) {
            } else {
                for (int i = 0; i < profList.size(); i++) {
                    Professor test = profList.get(i);
                    ArrayList<String> current = new ArrayList<String>();
                    ArrayList<String> prev = new ArrayList<String>();
                    current = test.getCurrMod();
                    prev = test.gePrevMod();

                    int counter = 0;

                    for (int j = 0; j < current.size(); j++) {
                        String test3 = current.get(j);
                        if (test3.equals(moduleName) && counter == 0) {
                            counter += 1;
                            newList.add(test);
                        }
                    }

                    if (counter == 0) {
                        for (int k = 0; k < prev.size(); k++) {
                            String test4 = prev.get(k);
                            if (test4.equals(moduleName) && counter == 0) {
                                counter += 1;
                                newList.add(test);
                            }
                        }
                    }
                }
            }

            for (int i = 0; i < modFeedbackList.size(); i++) {
                ModuleFeedback test = modFeedbackList.get(i);
                String tempName = test.getMod();

                if (tempName.equals(moduleName)) {
                    modNewList.add(test);
                }
            }

            String file = "data/";
            Random r = new Random();

            if (moduleName.equals("IS101")) {
                file = file + "is101.csv";
            } else if (moduleName.equals("IS102")) {
                file = file + "is102.csv";
            } else {
                int Low = 1;
                int High = 4;
                int R = r.nextInt(High - Low) + Low;
                file = file + R + ".csv";
            }

        %>



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

                    <h1><center><%=moduleName%></center></h1>

                </div>


                <!-- Chart -->
                <div class="row">
                    <div id="dashboard_div" class="col-md-7">
                        <div id="chart-container2">

                            <%
                                String d3file = "";
                                if(moduleName.equals("IS101")){
                                    d3file="data99.csv";
                                }else{
                                    d3file="data99_1.csv";
                                }    
                                
                            %>

                            <script type="text/javascript">
                                var margin = {top: 10, right: 40, bottom: 150, left: 60},
                                width = 700 - margin.left - margin.right,
                                        height = 400 - margin.top - margin.bottom,
                                        contextHeight = 50;
                                contextWidth = width * .5;

                                var svg = d3.select("#chart-container2").append("svg")
                                        .attr("width", width + margin.left + margin.right)
                                        .attr("height", (height + margin.top + margin.bottom));

                                d3.csv('<%=d3file%>', createChart);
                                
                                function createChart(data) {
                                    var countries = [];
                                    var charts = [];
                                    var maxDataPoint = 0;

                                    /* Loop through first row and get each country 
                                     and push it into an array to use later */
                                    for (var prop in data[0]) {
                                        if (data[0].hasOwnProperty(prop)) {
                                            if (prop != 'Year') {
                                                countries.push(prop);
                                            }
                                        }
                                    }
                                    ;

                                    var countriesCount = countries.length;
                                    var startYear = data[0].Year;
                                    var endYear = data[data.length - 1].Year;
                                    var chartHeight = height * (1 / countriesCount);

                                    /* Let's make sure these are all numbers, 
                                     we don't want javaScript thinking it's text 
                                     
                                     Let's also figure out the maximum data point
                                     We'll use this later to set the Y-Axis scale
                                     */
                                    data.forEach(function(d) {
                                        for (var prop in d) {
                                            if (d.hasOwnProperty(prop)) {
                                                d[prop] = parseFloat(d[prop]);

                                                if (d[prop] > maxDataPoint) {
                                                    maxDataPoint = d[prop];
                                                }
                                            }
                                        }

                                        // D3 needs a date object, let's convert it just one time
                                        d.Year = new Date(d.Year, 0, 1);
                                    });

                                    for (var i = 0; i < countriesCount; i++) {
                                        charts.push(new Chart({
                                            data: data.slice(),
                                            id: i,
                                            name: countries[i],
                                            width: width,
                                            height: height * (1 / countriesCount),
                                            maxDataPoint: maxDataPoint,
                                            svg: svg,
                                            margin: margin,
                                            showBottomAxis: (i == countries.length - 1)
                                        }));

                                    }

                                    /* Let's create the context brush that will 
                                     let us zoom and pan the chart */
                                    var contextXScale = d3.time.scale()
                                            .range([0, contextWidth])
                                            .domain(charts[0].xScale.domain());

                                    var contextAxis = d3.svg.axis()
                                            .scale(contextXScale)
                                            .tickSize(contextHeight)
                                            .tickPadding(-10)
                                            .orient("bottom");

                                    var contextArea = d3.svg.area()
                                            .interpolate("monotone")
                                            .x(function(d) {
                                                return contextXScale(d.date);
                                            })
                                            .y0(contextHeight)
                                            .y1(0);

                                    var brush = d3.svg.brush()
                                            .x(contextXScale)
                                            .on("brush", onBrush);

                                    var context = svg.append("g")
                                            .attr("class", "context")
                                            .attr("transform", "translate(" + (margin.left + width * .25) + "," + (height + margin.top + chartHeight) + ")");

                                    context.append("g")
                                            .attr("class", "x axis top")
                                            .attr("transform", "translate(0,0)")
                                            .call(contextAxis)

                                    context.append("g")
                                            .attr("class", "x brush")
                                            .call(brush)
                                            .selectAll("rect")
                                            .attr("y", 0)
                                            .attr("height", contextHeight);

                                    context.append("text")
                                            .attr("class", "instructions")
                                            .attr("transform", "translate(0," + (contextHeight + 20) + ")")
                                            .text('Click and drag above to zoom / pan the data');

                                    function onBrush() {
                                        /* this will return a date range to pass into the chart object */
                                        var b = brush.empty() ? contextXScale.domain() : brush.extent();
                                        for (var i = 0; i < countriesCount; i++) {
                                            charts[i].showOnly(b);
                                        }
                                    }
                                }

                                function Chart(options) {
                                    this.chartData = options.data;
                                    this.width = options.width;
                                    this.height = options.height;
                                    this.maxDataPoint = options.maxDataPoint;
                                    this.svg = options.svg;
                                    this.id = options.id;
                                    this.name = options.name;
                                    this.margin = options.margin;
                                    this.showBottomAxis = options.showBottomAxis;

                                    var localName = this.name;

                                    /* XScale is time based */
                                    this.xScale = d3.time.scale()
                                            .range([0, this.width])
                                            .domain(d3.extent(this.chartData.map(function(d) {
                                                return d.Year;
                                            })));

                                    /* YScale is linear based on the maxData Point we found earlier */
                                    this.yScale = d3.scale.linear()
                                            .range([this.height, 0])
                                            .domain([0, 10]);

                                    var xS = this.xScale;
                                    var yS = this.yScale;

                                    /* 
                                     This is what creates the chart.
                                     There are a number of interpolation options. 
                                     'basis' smooths it the most, however, when working with a lot of data, this will slow it down 
                                     */
                                    this.area = d3.svg.area()
                                            .interpolate("basis")
                                            .x(function(d) {
                                                return xS(d.Year);
                                            })
                                            .y0(this.height)
                                            .y1(function(d) {
                                                return yS(d[localName]);
                                            });
                                    /*
                                     This isn't required - it simply creates a mask. If this wasn't here,
                                     when we zoom/panned, we'd see the chart go off to the left under the y-axis 
                                     */
                                    this.svg.append("defs").append("clipPath")
                                            .attr("id", "clip-" + this.id)
                                            .append("rect")
                                            .attr("width", this.width)
                                            .attr("height", this.height);
                                    /*
                                     Assign it a class so we can assign a fill color
                                     And position it on the page
                                     */
                                    this.chartContainer = svg.append("g")
                                            .attr('class', this.name.toLowerCase())
                                            .attr("transform", "translate(" + this.margin.left + "," + (this.margin.top + (this.height * this.id) + (10 * this.id)) + ")");

                                    /* We've created everything, let's actually add it to the page */
                                    this.chartContainer.append("path")
                                            .data([this.chartData])
                                            .attr("class", "chart")
                                            .attr("clip-path", "url(#clip-" + this.id + ")")
                                            .attr("d", this.area);

                                    this.xAxisTop = d3.svg.axis().scale(this.xScale).orient("bottom");
                                    this.xAxisBottom = d3.svg.axis().scale(this.xScale).orient("top");
                                    /* We only want a top axis if it's the first country */
                                    if (this.id == 0) {
                                        this.chartContainer.append("g")
                                                .attr("class", "x axis top")
                                                .attr("transform", "translate(0,0)")
                                                .call(this.xAxisTop);
                                    }

                                    /* Only want a bottom axis on the last country */
                                    if (this.showBottomAxis) {
                                        this.chartContainer.append("g")
                                                .attr("class", "x axis bottom")
                                                .attr("transform", "translate(0," + this.height + ")")
                                                .call(this.xAxisBottom);
                                    }

                                    this.yAxis = d3.svg.axis().scale(this.yScale).orient("left").ticks(5);

                                    this.chartContainer.append("g")
                                            .attr("class", "y axis")
                                            .attr("transform", "translate(-15,0)")
                                            .call(this.yAxis);

                                    this.chartContainer.append("text")
                                            .attr("class", "country-title")
                                            .attr("transform", "translate(15,40)")
                                            .text(this.name);

                                }

                                Chart.prototype.showOnly = function(b) {
                                    this.xScale.domain(b);
                                    this.chartContainer.select("path").data([this.chartData]).attr("d", this.area);
                                    this.chartContainer.select(".x.axis.top").call(this.xAxisTop);
                                    this.chartContainer.select(".x.axis.bottom").call(this.xAxisBottom);
                                }
                            </script>
                        </div>
                    </div>
                    <div class="col-md-1"></div>   
                    <!-- Right side of chart-->    
                    <div class="col-md-4">
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
                                        You are only allowed to rate a module once and only after you have taken that specific module. Your information, such as your grades obtained etc. will be drawn from the school database. 

                                    </div>
                                    <div class="modal-body">
                                        <u><h4>Rating Type</h4></u>
                                        <b>Workload - </b> This represent the workload of the module. The higher the score, the lighter the workload.<br> 
                                        <b>Easiness - </b> This represent the easiness level of the module. The higher the score, the easier the module.<br> 
                                        <b>Relevance - </b> This represent how relevant you find this module in relations to the real world. The higher the score, the more relevance it is.<br> 
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
                        <b>Number of Ratings:   </b> 435
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
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">Rate <%out.print(moduleName);%></h4>
                                    </div>
                                    <div class="modal-body">

                                        <form>


                                            <b>Term Taken: </b>AY2013-2014 T2 <br>
                                            <br>
                                            <table class="table table-bordered" style="table-layout: fixed">
                                                <tr>
                                                    <td><b>Usefulness:</b></td>
                                                    <td><input type="radio" name="usefulness" value="1">
                                                        1<br>Not useful at all</td>
                                                    <td><input type="radio" name="usefulness" value="2">
                                                        2</td>
                                                    <td><input type="radio" name="usefulness" value="3">
                                                        3</td>
                                                    <td><input type="radio" name="usefulness" value="4">
                                                        4</td>
                                                    <td><input type="radio" name="usefulness" value="5">
                                                        5<br>Very useful</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Difficulty:</b></td>
                                                    <td><input type="radio" name="easiness" value="1"> 1<br>Hard</td>
                                                    <td><input type="radio" name="easiness" value="2"> 2</td>
                                                    <td><input type="radio" name="easiness" value="3"> 3</td>
                                                    <td><input type="radio" name="easiness" value="4"> 4</td>
                                                    <td><input type="radio" name="easiness" value="5"> 5<br>Easy</td>
                                                </tr>
                                                <tr>
                                                    <td><b>Relevance:</b></td>
                                                    <td><input type="radio" name="easiness" value="1"> 1<br>Not Relevant</td>
                                                    <td><input type="radio" name="easiness" value="2"> 2</td>
                                                    <td><input type="radio" name="easiness" value="3"> 3</td>
                                                    <td><input type="radio" name="easiness" value="4"> 4</td>
                                                    <td><input type="radio" name="easiness" value="5"> 5<br>Relevant</td>
                                                </tr>                                                

                                            </table>
                                            <b>Grades obtained:</b> A <br><br> <b>Comments:</b><br><textarea rows="4" cols="90" name="comment" maxlength="500" required>
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

                <br>

                <!-- Tabs-->

                <!-- Nav tabs -->
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#professor" data-toggle="tab">Professor</a></li>
                    <li><a href="#feedback" data-toggle="tab">Feedback</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">

                    <!-- Information for Professor tab-->  
                    <div class="tab-pane active" id="professor">


                        <table class="table table-bordered" width="100%">
                            <tr>
                                <th width="25%"><center>Professor</center></th>
                            <th width="25%"><center>Ratings</center></th>
                            <th width="25%"><center>Grade Distribution</center></th>
                            <th width="25%"></th>
                            </tr>

                            <%
                                if (newList.isEmpty() == true || newList.size() == 0) {
                                    out.println("There are no professor currently taking this module. Information has not been uploaded");
                                } else {
                                    int size = newList.size();

                                    for (int i = 0; i < size; i++) {
                                        Professor temp1 = newList.get(i);
                                        String tempName = temp1.getName();
                            %>

                            <tr>
                                <td><br> <br> <font size="4"><center><% out.println(tempName);%></center></td>
                            <td>

                                <%

                                    int number = i;

                                    int grade1 = 1 + (int) (Math.random() * ((5 - 1) + 1));
                                    int grade2 = 3 + (int) (Math.random() * ((7 - 3) + 1));
                                    int grade3 = 3 + (int) (Math.random() * ((7 - 3) + 1));
                                    int grade4 = 5 + (int) (Math.random() * ((15 - 5) + 1));
                                    int grade5 = 5 + (int) (Math.random() * ((15 - 5) + 1));
                                    int grade6 = 3 + (int) (Math.random() * ((10 - 3) + 1));

                                    int grade7 = 2 + (int) (Math.random() * ((4 - 2) + 1));
                                    int grade8 = 0 + (int) (Math.random() * ((2 - 0) + 1));
                                    int grade9 = 0 + (int) (Math.random() * ((1 - 0) + 1));
                                    int grade10 = 0;
                                    int grade11 = 0;
                                    int grade12 = 0;

                                    int attr1 = 6 + (int) (Math.random() * ((10 - 6) + 1));
                                    int attr2 = 6 + (int) (Math.random() * ((10 - 6) + 1));
                                    int attr3 = 6 + (int) (Math.random() * ((10 - 6) + 1));
                                    int attr4 = 6 + (int) (Math.random() * ((10 - 6) + 1));

                                %>

                                <!-- for Professor tab -- Rating -->

                                <script type="text/javascript">
                                    google.load("visualization", "1", {packages: ["corechart"]});
                                    google.setOnLoadCallback(drawChart);
                                    function drawChart() {
                                        var data = google.visualization.arrayToDataTable([
                                            ['Type', 'Rating', {role: 'style'}],
                                            ['Help..', <%=attr1%>, '#609FF7'], // RGB value
                                            ['Clarity', <%=attr2%>, '#F7607C'],
                                            ['Work', <%=attr3%>, '#FAA46B'],
                                            ['Overall', <%=attr4%>, '#5DDE70'],
                                        ]);

                                        var options = {
                                            title: 'Rating',
                                            legend: {position: "none"},
                                            'backgroundColor': 'transparent',
                                            hAxis: {title: 'Rating Type', textPosition: 'in', titeTextStyle: {color: 'black'}},
                                            vAxis: {minValue: 0, maxValue: 5, gridlines: {count: 6}}
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

                                <button type="button" onClick="location.href = 'profprofile.jsp?profName=<%=tempName%>'" class="btn btn-default">Professor
                                    Profile</button>

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
                            <%  if (modNewList.isEmpty() == true || modNewList.size() == 0) {
                                    out.println("There are no feedback available yet");
                                } else {
                                    int size = modNewList.size();

                                    for (int i = 0; i < modNewList.size(); i++) {
                                        ModuleFeedback temp1 = modNewList.get(i);

                            %>
                            <tr>
                                <td height="167" valign="bottom"><center><% out.println(temp1.getDate());%></center></td>
                            <td height="167" valign="middle"><center><% out.println(temp1.getYear());%></center>

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
                                            ['Workl..', <%=score1%>, '#609FF7'], // RGB value
                                            ['Easi..', <%=score2%>, '#F7607C'],
                                            ['Relev..', <%=score3%>, '#FAA46B'],
                                            ['Overall', <%=score4%>, '#5DDE70'],
                                        ]);

                                        var options = {
                                            title: 'Rating',
                                            legend: {position: "none"},
                                            'backgroundColor': 'transparent',
                                            hAxis: {title: 'Rating Type', textPosition: 'in', titleTextStyle: {color: 'black'}},
                                            width: 250,
                                            height: 150,
                                            vAxis: {minValue: 0, maxValue: 5, gridlines: {count: 6}}
                                        };

                                        var idnum = 'chart_feedback_rating' + <%=number%>;


                                        var chart = new google.visualization.ColumnChart(document.getElementById(idnum));
                                        chart.draw(data, options);
                                    }
                                </script>                                         

                                <div id="chart_feedback_rating<%=i%>" style="width: 200px; height: 150px;"> </div>
                            </td>
                            <td><center><% out.println(temp1.getComment());%></center>


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

                                Comment Score: <input id="clicked<%=i%>" size="3" onfocus="this.blur();" value="<% out.println(temp1.getLikes());%>" >                                               
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
