<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Bank Application</title>	
  </head>
  <body>
<% 
	String funcID = request.getParameter("funcID");

	String name = request.getParameter("name");
	String street = request.getParameter("street");
	String city = request.getParameter("city");
	
	String q6accountno = request.getParameter("q6accountno"); 
	String q6newbalance = request.getParameter("q6newbalance");

	String q7loanno = request.getParameter("q7loanno"); 
	String q7newamount = request.getParameter("q7newamount"); 

	String q8id = request.getParameter("q8id"); 
	String q8name = request.getParameter("q8name"); 
	String q8street = request.getParameter("q8street"); 
	String q8city = request.getParameter("q8city"); 
	
	String q9accountno = request.getParameter("q9accountno"); 
	
	String q10loanno = request.getParameter("q10loanno"); 

	String q11customerid = request.getParameter("q11customerid"); 

	String q12customername = request.getParameter("q12customername"); 

	String q13customerstreet = request.getParameter("q13customerstreet"); 

	String q14accountno = request.getParameter("q14accountno"); 

	String q15loanno = request.getParameter("q15loanno"); 


	//String q4customerid = request.getParameter("4_customer_id");
	//String q4accountno = request.getParameter("4_account_no");
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

<center> <h1> Jessica Ju </h1>  <h3> EECS116 </br> Project 2 </br> ID NUMBER </br> </h3> </center>
<b>1. List All the customer:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="1">
    		<input type="submit" value="GO!"/>
</form>

<!-- <b>2. Add a new customer:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="2">
		Customer name: <input name="name" type="text">
		Street: <input name="street" type="text">
		City: <input name="city" type="text">
    		<input type="submit" value="Add"/>
</form> -->

<b>2. List all the accounts:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="2">
    		<input type="submit" value="GO!"/>
</form>

<b>3. List all the loans:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="3">
    		<input type="submit" value="GO!"/>
</form>

<b>4. Add a new depositor:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="4">
    			name:  <input name="name" type="text">
				street: <input name="street" type="text">
				city: <input name="city" type="text">
    		<input type="submit" value="Add"/>
</form>

<b>5. Add a new borrower:</b>
<form method="post">
    		<input name="funcID" type="hidden" value="5">
    			name:  <input name="name" type="text">
				street: <input name="street" type="text">
				city: <input name="city" type="text">
    		<input type="submit" value="Add"/>
</form>

<b>6. Modify the balance of an account: </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="6">
    			Account number to modify:  <input name="q6accountno" type="number">
    			New balance:  <input name="q6newbalance" type="number"  pattern="[0-9]+([\.|,][0-9]+)?" step="0.01">
    		<input type="submit" value="Modify"/>
</form>

<b>7. Modify the amount of a loan: </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="7">
    			Loan number to modify:  <input name="q7loanno" type="number">
    			New loan amount:  <input name="q7newamount" type="number"  pattern="[0-9]+([\.|,][0-9]+)?" step="0.01">
    		<input type="submit" value="Modify"/>
</form>

<b>8. Modify the details of a customer: </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="8">
    			Customer_id:  <input name="q8id" type="number">
    			name:  <input name="q8name" type="text">
				street: <input name="q8street" type="text">
				city: <input name="q8city" type="text">
    		<input type="submit" value="Modify"/>
</form>

<b>9. Delete an account: </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="9">
    			Account number to delete:  <input name="q9accountno" type="number">
    		<input type="submit" value="Delete"/>
</form>

<b>10. Delete a loan: </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="10">
    			Loan number to delete:  <input name="q10loanno" type="number">
    		<input type="submit" value="Delete"/>
</form>

<b>11. All the accounts and loans related to a customer_id: </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="11">
    			Customer id  <input name="q11customerid" type="number">
    		<input type="submit" value="Show"/>
</form>

<b>12. Find customers by name </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="12">
    			Customer name <input name="q12customername" type="text">
    		<input type="submit" value="Find"/>
</form>

<b>13. Show all customers in a specific city: </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="13">
    			Customer city <input name="q13customerstreet" type="text">
    		<input type="submit" value="Find"/>
</form>

<b>14. Find owners of an account by using account_id (account_no) : </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="14">
    			Account no. <input name="q14accountno" type="number">
    		<input type="submit" value="Find"/>
</form>

<b>15. Find owners of a loan by using (loan_no) : </b> 
<form method="post">
    		<input name="funcID" type="hidden" value="15">
    			Loan no. <input name="q15loanno" type="number">
    		<input type="submit" value="Find"/>
</form>


<% if(funcID!=null) {				
	try {
		String url="jdbc:mysql://127.0.0.1:3306/bank";
		String id="root";
		String pwd="";
		Connection con= DriverManager.getConnection(url,id,pwd); 
	
		int func=Integer.valueOf(funcID);
		Statement stmt;
		PreparedStatement pstmt;
		ResultSet rs;
		switch(func) {

			// List all the customers - already given. 
			case 1:
				stmt = con.createStatement(); // Statements allow to issue SQL queries to the database
				String sql="SELECT * FROM customer";
				rs=stmt.executeQuery(sql); // Result set get the result of the SQL query
				out.println("<table border=\"1\">");
				out.println("<caption> Customer List </caption>");
				out.println("<tr>");
				out.println("<th>ID</th>");
				out.println("<th>Name</th>");
				out.println("<th>Street</th>");
				out.println("<th>City</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("<td>"+rs.getString("customer_street")+"</td>");
					out.println("<td>"+rs.getString("customer_city")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				break;

			// List all the accounts 
			case 2:
				stmt = con.createStatement();
				String sql2="SELECT * FROM account";
				rs=stmt.executeQuery(sql2);
				out.println("<table border=\"1\">");
				out.println("<caption> Account List </caption>");
				out.println("<tr>");
				out.println("<th>Account No.</th>");
				out.println("<th>Balance</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("account_no")+"</td>");
					out.println("<td>"+rs.getString("balance")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				break;

			// List all the loans
			case 3:
				stmt = con.createStatement();
				String sql3="SELECT * FROM loan";
				rs=stmt.executeQuery(sql3);
				out.println("<table border=\"1\">");
				out.println("<caption> Loan List </caption>");
				out.println("<tr>");
				out.println("<th>Loan No.</th>");
				out.println("<th>Amount </th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("loan_no")+"</td>");
					out.println("<td>"+rs.getString("amount")+"</td>");
					out.println("</tr>");
				}
				rs.close();
				stmt.close();
				out.println("</table>");
				break;

			// I create a new depositor by first creating a customer and an account (same methodology applied to next question)
			case 4:
				// PreparedStatements can use variables and are more efficient
				pstmt = con.prepareStatement("insert into customer values (default, ?,?,?)",Statement.RETURN_GENERATED_KEYS);
				
				// Use ? to represent the variables
				pstmt.clearParameters();
				
				// Parameters start with 1
				pstmt.setString(1, name);
				pstmt.setString(2, street);
				pstmt.setString(3, city); 
				pstmt.executeUpdate();
				
				rs=pstmt.getGeneratedKeys();
				int customerid = 0; 
				while (rs.next()) {
					customerid = rs.getInt(1);
				}

				pstmt = con.prepareStatement("insert into account values (default, default)",Statement.RETURN_GENERATED_KEYS);
				
				// Use ? to represent the variables
				pstmt.clearParameters(); 
				pstmt.executeUpdate();
				rs=pstmt.getGeneratedKeys();
				int accountno = 0; 
				while (rs.next()) {
					accountno = rs.getInt(1);
				}

				pstmt = con.prepareStatement("insert into depositor values (?, ?)",Statement.RETURN_GENERATED_KEYS);
				pstmt.clearParameters(); 
				pstmt.setInt(1, customerid);
				pstmt.setInt(2, accountno);
				// Use ? to represent the variables
				pstmt.executeUpdate();
				pstmt.getGeneratedKeys();

				rs.close();
				pstmt.close();
				break;

			// I create a new customer, loan, and then lastly borrower 
			case 5:
				// PreparedStatements can use variables and are more efficient
				pstmt = con.prepareStatement("insert into customer values (default, ?,?,?)",Statement.RETURN_GENERATED_KEYS);
				
				// Use ? to represent the variables
				pstmt.clearParameters();
				
				// Parameters start with 1
				pstmt.setString(1, name);
				pstmt.setString(2, street);
				pstmt.setString(3, city); 
				pstmt.executeUpdate();
				
				rs=pstmt.getGeneratedKeys();
				int q5customerid = 0; 
				while (rs.next()) {
					q5customerid = rs.getInt(1);
				}

				pstmt = con.prepareStatement("insert into loan values (default, default)",Statement.RETURN_GENERATED_KEYS);
				
				// Use ? to represent the variables
				pstmt.clearParameters(); 
				pstmt.executeUpdate();
				rs=pstmt.getGeneratedKeys();
				int loanno = 0; 
				while (rs.next()) {
					loanno = rs.getInt(1);
				}

				pstmt = con.prepareStatement("insert into borrower values (?, ?)",Statement.RETURN_GENERATED_KEYS);
				pstmt.clearParameters(); 
				pstmt.setInt(1, q5customerid);
				pstmt.setInt(2, loanno);
				// Use ? to represent the variables
				pstmt.executeUpdate();
				pstmt.getGeneratedKeys();

				rs.close();
				pstmt.close();
				break;

			// Question 6: Modify the balance of an account 
			case 6:
				pstmt = con.prepareStatement(" UPDATE account SET balance = ? WHERE account_no = ?"); 
				pstmt.clearParameters(); 
				int q6a = Integer.parseInt(q6accountno);
				float q6b = Float.parseFloat(q6newbalance);
				pstmt.setInt(2, q6a); 
				pstmt.setFloat(1, q6b);
				
				pstmt.executeUpdate(); 
				pstmt.close(); 
				break; 

			// Question 7: Modify the amount of a loan 
			case 7:
				pstmt = con.prepareStatement(" UPDATE loan SET amount = ? WHERE loan_no = ?"); 
				pstmt.clearParameters(); 
				int q7a = Integer.parseInt(q7loanno);
				float q7b = Float.parseFloat(q7newamount);
				pstmt.setInt(2, q7a); 
				pstmt.setFloat(1, q7b);
				
				pstmt.executeUpdate(); 
				pstmt.close(); 
				break; 

			// Question 8: Modify the personal data of a customer 	
			// customer(customer_id, customer_name, customer_street, customer_city)
			case 8:
				pstmt = con.prepareStatement(" UPDATE customer SET customer_name = ?, customer_street = ?, customer_city = ? WHERE customer_id = ?"); 
				pstmt.clearParameters(); 
				int tempq8id = Integer.parseInt(q8id);

				pstmt.setString(1, q8name); 
				pstmt.setString(2, q8street);
				pstmt.setString(3, q8city); 
				pstmt.setInt(4, tempq8id); 
				
				pstmt.executeUpdate(); 
				pstmt.close(); 
				break; 

			// I interpretted the question as deleting the account and depositor for this question 
			// I have depositor set on delete on cascade in my workbench so this sql command should delete both when 1 is deleted 
			case 9:
				pstmt = con.prepareStatement("delete from account where account_no = ?"); 
				pstmt.clearParameters(); 
				int q9a = Integer.parseInt(q9accountno);
				pstmt.setInt(1, q9a); 
				pstmt.executeUpdate(); 
				pstmt.close(); 
				break;

			// I interpretted the question as deleting the loan, and borrower for this question 
			// I have borrower set on delete on cascade so this sql command should delete both when 1 is deleted 
			case 10:
				pstmt = con.prepareStatement("delete from loan where loan_no = ?"); 
				pstmt.clearParameters(); 
				int q10l = Integer.parseInt(q10loanno);
				pstmt.setInt(1, q10l); 
				pstmt.executeUpdate(); 
				pstmt.close(); 
				break;

			// Given a customer_id show all the related accounts and loans 	
			case 11: 
				pstmt = con.prepareStatement("select account.account_no, account.balance from customer join depositor on depositor.customer_id = customer.customer_id join account on depositor.account_no = account.account_no where customer.customer_id = ?");
				pstmt.clearParameters(); 
				int tempq11customerid = Integer.parseInt(q11customerid); 
				pstmt.setInt(1, tempq11customerid); 
				rs = pstmt.executeQuery(); 

				out.println("<table border=\"1\">");
				out.println("<caption> Account List </caption>");
				out.println("<tr>");
				out.println("<th>Account No.</th>");
				out.println("<th>Balance</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("account_no")+"</td>");
					out.println("<td>"+rs.getString("balance")+"</td>");
					out.println("</tr>");
				}
				out.println("</table>"); 

				pstmt = con.prepareStatement("select * from customer join borrower on customer.customer_id = borrower.customer_id join loan on borrower.loan_no = loan.loan_no where customer.customer_id = ?");
				pstmt.clearParameters(); 
				//int tempq11customerid = Integer.parseInt(q11customerid); 
				pstmt.setInt(1, tempq11customerid); 
				rs = pstmt.executeQuery(); 

				out.println("<table border=\"1\">");
				out.println("<caption> Account List </caption>");
				out.println("<tr>");
				out.println("<th>Loan No.</th>");
				out.println("<th>Amount</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("loan_no")+"</td>");
					out.println("<td>"+rs.getString("amount")+"</td>");
					out.println("</tr>");
				}
				out.println("</table>"); 


				rs.close();
				pstmt.close();
				
				break;


			//Question 12. Find customers by name.
			case 12:  
				pstmt = con.prepareStatement("select customer.customer_id, customer.customer_name, customer.customer_street, customer.customer_city from customer where customer.customer_name = ?");
				pstmt.clearParameters(); 
				String tempq12customername = q12customername; 
				pstmt.setString(1, tempq12customername); 
				rs = pstmt.executeQuery(); 

				out.println("<table border=\"1\">");
				out.println("<caption> Found matching customer(s): </caption>");
				out.println("<tr>");
				out.println("<th>customer id</th>");
				out.println("<th>name</th>");
				out.println("<th>street</th>");
				out.println("<th>city</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("<td>"+rs.getString("customer_street")+"</td>");
					out.println("<td>"+rs.getString("customer_city")+"</td>");
					out.println("</tr>");
				}
				out.println("</table>"); 


				rs.close();
				pstmt.close();
			break; 

			// Question 13. Given a city, show all customers in that city.
			case 13: 
				pstmt = con.prepareStatement("select customer.customer_id, customer.customer_name, customer.customer_street, customer.customer_city from customer where customer.customer_city = ?");
				pstmt.clearParameters(); 
				String tempq13customerstreet = q13customerstreet; 
				pstmt.setString(1, tempq13customerstreet); 
				rs = pstmt.executeQuery(); 

				out.println("<table border=\"1\">");
				out.println("<caption> Found matching customer(s) in same city: </caption>");
				out.println("<tr>");
				out.println("<th>customer id</th>");
				out.println("<th>name</th>");
				out.println("<th>street</th>");
				out.println("<th>city</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_id")+"</td>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("<td>"+rs.getString("customer_street")+"</td>");
					out.println("<td>"+rs.getString("customer_city")+"</td>");
					out.println("</tr>");
				}
				out.println("</table>"); 


				rs.close();
				pstmt.close();
			break; 

			// Question 14. Find owners of an account by using account_id.
			case 14: 
				pstmt = con.prepareStatement("select customer.customer_name from account join depositor on account.account_no = depositor.account_no join customer on depositor.customer_id = customer.customer_id where account.account_no = ?");
				pstmt.clearParameters(); 
				int tempq14accountno = Integer.parseInt(q14accountno); 
				pstmt.setInt(1, tempq14accountno); 
				rs = pstmt.executeQuery(); 

				out.println("<table border=\"1\">");
				out.println("<caption> Found matching customer(s) by account_no: </caption>");
				out.println("<tr>");
				out.println("<th>customer name</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("</tr>");
				}
				out.println("</table>");
				rs.close();
			break; 

			// Question 15. Find owners of a loan by loan_id.
			case 15:
				pstmt = con.prepareStatement("select customer.customer_name from loan join borrower on loan.loan_no = borrower.loan_no join customer on borrower.customer_id = customer.customer_id where loan.loan_no = ?");
				pstmt.clearParameters(); 
				int tempq15loanno = Integer.parseInt(q15loanno); 
				pstmt.setInt(1, tempq15loanno); 
				rs = pstmt.executeQuery(); 

				out.println("<table border=\"1\">");
				out.println("<caption> Found matching customer(s) by loan_no: </caption>");
				out.println("<tr>");
				out.println("<th>customer name</th>");
				out.println("</tr>");
				while (rs.next()) {
					out.println("<tr>");
					out.println("<td>"+rs.getString("customer_name")+"</td>");
					out.println("</tr>");
				}
				out.println("</table>"); 
				rs.close();
			break; 


			case 50:
				// PreparedStatements can use variables and are more efficient
				pstmt = con.prepareStatement("insert into customer values (default,?,?,?)",Statement.RETURN_GENERATED_KEYS);

				// Use ? to represent the variables
				pstmt.clearParameters();
				// Parameters start with 1
				pstmt.setString(1, name);
				pstmt.setString(2, street);
				pstmt.setString(3, city);
				pstmt.executeUpdate();
				rs=pstmt.getGeneratedKeys();
				while (rs.next()) {
					out.println("Successfully added. Customer_ID:"+rs.getInt(1));
				}
				rs.close();
				pstmt.close();
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
