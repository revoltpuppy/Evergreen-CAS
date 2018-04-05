<%--
* object: allow user to reset their password.
* @author: Jonahtan Zhang
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
  <head>
      <title>Evergreen: Lost Password</title>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <link rel="stylesheet" href="css/simple.css" type="text/css" media="all" />
      <link rel="icon" type="image/png" href="/favicon.png" />

  </head>
  <body>
    <div id="container">
    <div id="header">
      <a href="http://www.evergreen.edu"><img src="images/wordmark.gif" id="wordmark" alt="The Evergreen State College wordmark" /></a>
      <span class="title">Evergreen Web Services</span>
    </div>
     <div id="content">
           <h2>Lost password wizard</h2>
           <div class="message">
           <p>
           <%= message %>
           </p>
           </div>
           <form action="index.jsp" method="post">
            <% if (state.equals("displayID")) {%>
                 <h3>Identify yourself</h3>

                  <input type="hidden" name ="disID" value="displayID">
                  <label>User name :<input type="text" name="uname"></label>
                  <label>Student ID :<input type="text" name="sid"></label>
                  <label>
                  <input type="submit" name="stuID" value = "Next">
                  </label><%}%>
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
                 <h3> Please contact the Consultant's Desk at the Computer Center, 867-6231. </h3>
            <% } %>
            </form>
            <div class="information">
                 <p><strong>Still having trouble logging in?</strong> Go to the <a href="http://help.evergreen.edu">@evergreen.edu Login Help</a> page.</p>

            </div>
       </div>
    </div>
 </body>
</html>

