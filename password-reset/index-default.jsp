<!DOCTYPE html>
<html>
<head>
	<title>Lost Password: CAS - Central Authentication Service</title>
	<meta charset="utf-8"/>
	<!--<link rel="stylesheet" href="css/simple.css" media="all"/>-->
	<link href="../styles.css" media="all" rel="stylesheet"/>
	<link rel="icon" type="image/png" href="/favicon.png" />
</head>
<body id="cas" class="fl-theme-iphone">
	<div class="flc-screenNavigator-view-container">
		<div class="fl-screenNavigator-view">
			<div id="header" class="flc-screenNavigator-navbar fl-navbar fl-table">
				<h1 id="company-name">Jasig</h1>
				<h1 id="app-name" class="fl-table-cell">Central Authentication Service (CAS)</h1>
			</div>
			<div id="content" class="fl-screenNavigator-scroll-container">	
				<div class="box fl-panel" id="login">
	
	
					<div id="container">
						<div id="header">
							<a href="http://www.evergreen.edu">
								<img src="images/wordmark.gif" id="wordmark" alt="The Evergreen State College wordmark" />
							</a>
							<span class="title">Evergreen Web Services</span>
						</div><!-- /.header -->
						<div id="content">
							<h2>Lost password wizard</h2>
							<div class="message">
								<p>
									<%= message %>
								</p>
							</div><!-- /.message -->
							<form action="index.jsp" method="post">
								<% if (state.equals("displayID")) {%>
									<h3>Identify yourself</h3>
									<input type="hidden" name ="disID" value="displayID">
									<label>User name :<input type="text" name="uname"></label>
									<label>Student ID :<input type="text" name="sid"></label>
									<label>
										<input type="submit" name="stuID" value = "Next">
									</label>
								<%}%>
								<% if (state.equals("displayQuestion")) {%>
									<h3>Answer your secret question</h3>
									<input type="hidden" name ="disQuestion" value="displayQuestion">
									<label>
										Question :<%= loginBean.getQuestion()%>?
										Answer :<input type="text" name="answer">
									</label>
									<label>
										<input type="submit" name="pAnswer" value="Next">
									</label>
								<%}%>
								<% if (state.equals("displayPassword")) {%>
									<h3>Change your password</h3>
									<input type="hidden" name ="disPassword" value="displayPassword">
									<label>Please enter your password: <input type="password" name="password1" /></label>
									<label>Enter your password again:  <input type="password" name="password2" /></label>
									<label>
									<input type="submit" name="getPassword" value="Finish">
									</label>
								<%}%>
								<% if (state.equals("success")) {%>
									<h3> Password Reset Is Successful </h3>
								<% } %>
								<% if (state.equals("displayError")) {%>
									<h3>Please contact the Consultant’s Desk at the Computer Center, 867-6231.</h3>
								<% } %>
							</form>
							<div class="information">
								<p>
									<strong>Still having trouble logging in?</strong> Go to the
									<a href="http://help.evergreen.edu">@evergreen.edu Login Help</a> page.
								</p>
						  </div><!-- /.information -->
						</div><!-- /.content -->
					</div><!-- /.container -->
					
					
				</div><!-- /.box.fl-panel -->
				<div id="footer" class="fl-panel fl-note fl-bevel-white fl-font-size-80">
				<a id="jasig" href="http://www.jasig.org" title="go to Jasig home page"></a>
				<div id="copyright">
					<p>Copyright &copy; 2005 - 2012 Jasig, Inc. All rights reserved.</p>
					<p>
						Powered by
						<a href="http://www.jasig.org/cas">Jasig Central Authentication Service 3.5.2</a>
					</p>
				</div><!-- /.copyright -->
			</div><!-- /#footer.fl-panel.fl-note.fl-bevel-white.fl-font-size-80  -->
		</div><!-- /.fl-screenNavigator-view -->
	</div><!-- /.flc-screenNavigator-view-container -->
</body>
</html>