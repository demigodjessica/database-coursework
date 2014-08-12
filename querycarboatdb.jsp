<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Project 1 Application</title>	
  </head>
  <body>
<% 
	String funcID = request.getParameter("funcID");

	String query = request.getParameter("query");
	
%>
<%
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	}
	catch(Exception e)
	{
		out.println("can't load mysql driver");
		out.println(e.toString());
	}	
%>

<center> <h1> Jessica Ju </h1>  <h3> EECS118</br> Project 1 </br> 46483660 </br> </h3> </center>

<center>
<b> Enter your query i.e "buy car which is new", "rent boat"</b>
<form method="post">
    		<input name="funcID" type="hidden" value="1">
    			 <input name="query" type="text">
    		<input type="submit" value="Search"/>
</form>
</center>


<% if(funcID!=null) {				
	try {

		String url="jdbc:mysql://108.61.20.3:3306/project1";
 		String id="project"; 
		String pwd="eecs118"; 
 		Connection con= DriverManager.getConnection(url,id,pwd);

		int func=Integer.valueOf(funcID);
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;

		switch(func) {

			// There is only one case maybe can add other features so I will leave this here 
			case 1:
			 	String str= query; 
				String[] words=str.split("\\s+");
				int size = words.length; 


				// sample buy car which is used 
				// sample rent boat which is new 
				// so this would be 5 words. 
				if (size == 5) { 

					pstmt = con.prepareStatement("SELECT * FROM service WHERE service.verb LIKE ? AND service.noun LIKE"
					+ "? AND service.condition LIKE ?");  
					pstmt.clearParameters(); 
					pstmt.setString(1, words[0]); 
					pstmt.setString(2, words[1]);
					pstmt.setString(3, words[4]); 
					rs = pstmt.executeQuery(); 
					

					out.println("<table border=\"1\">");
					out.println("<caption> Outputs </caption>");
					out.println("<tr>");
					out.println("<th>Name</th>");
					out.println("<th>URL</th>");
					out.println("</tr>");
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>"+rs.getString("name")+"</td>");
						out.println("<td>"+rs.getString("url")+"</td>");
						out.println("</tr>");
					}
					out.println("</table>"); 
					pstmt.close(); 
				} 

 				// two word case if it is only buy car | rent car 
				else if (size == 2)
				{ 
					pstmt = con.prepareStatement("SELECT * FROM service WHERE service.verb LIKE"
					+"? AND service.noun LIKE ?"); 
					pstmt.clearParameters(); 
					pstmt.setString(1, words[0]); 
					pstmt.setString(2, words[1]);
					rs = pstmt.executeQuery(); 

					out.println("<table border=\"1\">");
					out.println("<caption> Outputs </caption>");
					out.println("<tr>");
					out.println("<th>Name</th>");
					out.println("<th>URL</th>");
					out.println("</tr>");
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>"+rs.getString("name")+"</td>");
						out.println("<td>"+rs.getString("url")+"</td>");
						out.println("</tr>");
					}
					out.println("</table>"); 
					pstmt.close(); 
				}
				else 
				{ 
					out.println("You entered in an invalid query"); 
				} 

				
				break; 

			default: 
			break; 
		}
		con.close();
	}
	catch(Exception e)
	{
			out.println(e.toString());
	} 	
	
} %>


  
  </body>
</html>
