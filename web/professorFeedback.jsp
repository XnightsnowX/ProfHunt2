<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"
	media="screen" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Professor Feedback</title>
</head>
<body background="crossword.png">
<%@include file="header.jsp"%>
	<div class="span9">
		<div style="height: 100px;">
			<form class="form-search">
				<fieldset>
					<input type="text" class="input-medium search-query">
					<button type="submit" class="btn">Submit</button>
					<br> <label class="radio"> <input type="radio"
						name="radio" id="radio1" value="prof" checked> Professor
					</label> <label class="radio"> <input type="radio" name="radio"
						id="radio2" value="mod"> Module
					</label> <br>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12">
				<form>
					<h2>Rate Harry B</h2>
					<br>
					Course:<select>
						<option>IS101</option>
						<option>IS102</option>
						<option>IS103</option>
						<option>IS104</option>
						<option>IS105</option>
					</select> 
					<br> 
						<br>Term Taken: AY2013-2014 T2<br>
					<br>
					<table class="table table-bordered" style="table-layout: fixed">
						<tr>
							<td>Helpfulness:</td>
							<td><input type="radio" name="helpfulness" value="1">
								1<br>Not helpful at all</td>
							<td><input type="radio" name="helpfulness" value="2">
								2</td>
							<td><input type="radio" name="helpfulness" value="3">
								3</td>
							<td><input type="radio" name="helpfulness" value="4">
								4</td>
							<td><input type="radio" name="helpfulness" value="5">
								5<br>Very helpful</td>
						</tr>
						<tr>
							<td>Clarity:</td>
							<td><input type="radio" name="clarity" value="1"> 1<br>Confusing</td>
							<td><input type="radio" name="clarity" value="2"> 2</td>
							<td><input type="radio" name="clarity" value="3"> 3</td>
							<td><input type="radio" name="clarity" value="4"> 4</td>
							<td><input type="radio" name="clarity" value="5"> 5<br>Crystal
								clear</td>
						</tr>
						<tr>
							<td>Easiness:</td>
							<td><input type="radio" name="easiness" value="1"> 1<br>Hard</td>
							<td><input type="radio" name="easiness" value="2"> 2</td>
							<td><input type="radio" name="easiness" value="3"> 3</td>
							<td><input type="radio" name="easiness" value="4"> 4</td>
							<td><input type="radio" name="easiness" value="5"> 5<br>Easy</td>
						</tr>
					</table>
					<br> Grades obtained: A <br> Comments:<input type="text"
						name="comments" maxlength="1000"> <br> <input
						type="submit">
				</form>
			</div>
		</div>
	</div>

</body>
</html>