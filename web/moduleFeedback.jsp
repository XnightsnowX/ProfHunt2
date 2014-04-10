<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"
	media="screen" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Module Feedback</title>
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
			<div class="span6">
				<form>
					<h2>Rate IS101</h2>

					<br> <bold>Term Taken: AY2013-2014 T2 </bold><br>
					<table class="table table-bordered" style="table-layout: fixed">
						<tr>
							<td>Usefulness:</td>
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