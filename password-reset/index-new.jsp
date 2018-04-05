<%--
* object: Allow user to reset their password.
* @author: Justin McDowell
* @version: 1.0
* Date: 12/20/2006
*/
--%>
<%@ page language="java" import="edu.evergreen.caspassreset.*, java.util.*" %>
<jsp:useBean id="loginBean" scope="session" class="edu.evergreen.caspassreset.Controller"/>
<jsp:setProperty name="loginBean" property="*"/>  
<%
	loginBean.setContext(getServletConfig().getServletContext());
	String state = loginBean.getState();
	String message = loginBean.getLastError(); %>

<!DOCTYPE html>
<html>
<head>
	<title>Lost Password: CAS - Central Authentication Service</title>
	<meta charset="utf-8"/>
	<!--<link rel="stylesheet" href="css/simple.css" media="all"/>-->
	<link href="/cas/css/cas.css" media="all" rel="stylesheet"/>
	<link rel="icon" href="/cas/favicon.ico" type="image/x-icon" />
</head>
<%-- This uses structure set up by Jasig for the CAS login page. It's a
     poor structure indeed, but this at least allows us to use the same
     stylesheet for every page. --%>
<body id="cas" class="fl-theme-iphone">
	<div class="flc-screenNavigator-view-container">
		<div class="fl-screenNavigator-view">
			<div id="header" class="flc-screenNavigator-navbar fl-navbar fl-table">
				<h1 id="company-name">The Evergreen State College</h1>
				<h1 id="app-name" class="fl-table-cell">Central Authentication Service (CAS)</h1>
			</div>
			<div id="content" class="fl-screenNavigator-scroll-container">	
				<div class="box fl-panel" id="login">
	
	
					<main class="fm-v">
						<div id="content">
							
							<header>
								<h2>Reset Your Password</h2>
							</header>
							<div class="errors">
								<p>
									<%= message %>
								</p>
							</div><!-- /.message -->
							
							<form action="index-new.jsp" method="post">
								<% if (state.equals("displayID")) {%>
									<h3>Step 1 of 3: Identify yourself</h3>
									<input type="hidden" name ="disID" value="displayID"/>
									<ul class="element-list">
										<li>
											<label for="uname">User name:</label>
											<input type="text" id="uname" name="uname"/>
										</li>
										<li>
											<label for="sid">Student ID:</label>
											<input type="text" id="sid" name="sid"/>
										</li>
									</ul>
									<input class="prime" name="stuID" type="submit" value="Next"/>
								<%}%>
								<% if (state.equals("displayQuestion")) {%>
									<h3>Step 2 of 3: Answer your secret question</h3>
									<input type="hidden" name ="disQuestion" value="displayQuestion"/>
									<ul class="element-list">
										<li>
											Question:
											<%= loginBean.getQuestion()%>?
										</li>
										<li>
											<label for="answer">Answer:</label>
											<input type="text" id="answer" name="answer"/>
										</li>
									</ul>
									<input class="prime" name="pAnswer" type="submit" value="Next">
								<%}%>
								<% if (state.equals("displayPassword")) {%>
									<h3>Last step: Choose a new password</h3>
									<input type="hidden" name ="disPassword" value="displayPassword"/>
									<ul class="element-list">
										<li>
											<label for="password1">Choose your new password:</label>
											<input type="password" id="password1" name="password1"/>
										</li>
										<li>
											<label for="password2">Write your password again:</label>
											<input type="password" id="password2" name="password2"/>
										</li>
									</ul>
									<input class="prime" name="getPassword" type="submit" value="Finish"/>
								<%}%>
								<% if (state.equals("success")) {%>
									<h3>Success</h3>
									<p>
										Your password was reset. Try
										<a href="http://cas.evergreen.edu">logging in</a> again.
									</p>
								<% } %>
								<% if (state.equals("displayError")) {%>
									<h3>Error</h3>
									<p>Very sorry, but something isn’t right. Please contact Student Support at the Computer Center and they will help you out: (360)&nbsp;867-6231.</p>
								<% } %>
							</form>
						  
						</div><!-- /.content -->
					</main><!-- /.fm-v -->
					
					
				</div><!-- /.box.fl-panel -->
				<div id="sidebar">
				  <div class="sidebar-content">
				    <h2>Still Having Trouble?</h2>
				    <p>
							Visit
							<a href="http://help.evergreen.edu">Evergreen Technology Help</a> where you can request help, search the Help Wiki IT knowledgebase, or give us a call.
						</p>
				   </div><!-- /.sidebar-content -->
				</div><!-- /.sidebar -->
			</div><!-- /#content.fl-screenNavigator-scroll-container -->
			<div id="footer" class="fl-panel fl-note fl-bevel-white fl-font-size-80">
				<div id="copyright">
					<p><small>&copy; 2015, The Evergreen State College.</small></p>
				</div><!-- /.copyright -->
			</div><!-- /#footer.fl-panel.fl-note.fl-bevel-white.fl-font-size-80  -->
		</div><!-- /.fl-screenNavigator-view -->
	</div><!-- /.flc-screenNavigator-view-container -->
</body>
</html>