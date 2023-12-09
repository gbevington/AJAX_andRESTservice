<%@ page import="java.sql.*" %>
<jsp:include page="header.jsp" />
<body onload="showAgents('all')">

<div align="center">

	<div id="banner">
	
	
	</div>


	<div id="menu">
		
		<div align="right">
		
			<a href="index.jsp" onmouseover="mouseOver()" onmouseout="mouseOut()"><img src="images/homebut.gif" name="b1" border="0"></a>
			
			<a href="packages.jsp" onmouseover="mouseOver2()" onmouseout="mouseOut2()"><img src="images/packagebut.gif" name="b2" border="0"></a>

			<a href="register.jsp" onmouseover="mouseOver3()" onmouseout="mouseOut3()"><img src="images/registerbut.gif" name="b3" border="0"></a>
			
			<a href="contact.jsp" onmouseover="mouseOver4()" onmouseout="mouseOut4()"><img src="images/contactbut.gif" name="b4" border="0"></a>
			
			<a href="links.jsp" onmouseover="mouseOver5()" onmouseout="mouseOut5()"><img src="images/linksbut.gif" name="b5" border="0"></a>

		</div>
		
	</div>

	<div id="body">
		

		
<table align='center' border='0'><tr><td width='760'  align='center'>Contact Us</td></tr>
<tr><td align='left'><form> 
<select name="agencies" onchange="alert('functionality is under construction');">
<%
    try
    {
        //Class.forName("com.mysql.jdbc.Driver");
		//Class.forName("oracle.jdbc.driver.OracleDriver");
		Class.forName("org.mariadb.jdbc.Driver");
        //Connection dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts","root","password");
        //Connection dbConn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orant11g", "ictoosd", "ictoosd");
		Connection dbConn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "your-user", "your-password");

		Statement stmt = dbConn.createStatement();

        String strSQL = "Select * from agencies";

        ResultSet rs = stmt.executeQuery(strSQL);

        // (5) Process the result set.

        ResultSetMetaData rsmd = rs.getMetaData(); // get descriptive data about the result set

        int nCol = rsmd.getColumnCount();

    	out.print("<option value='all' selected='selected'>Select an agency location </option>");
        while (rs.next())
        {
    		out.print("<option value='" + rs.getString(1) + "'>" + rs.getString(3) + "</option>");
        }
    	out.print("<option value='all'> All </option>");

        rs.close();

        // Cleanup
        dbConn.close();  // close the connection
    }
    catch (Exception excp)
    {
        excp.printStackTrace();
    }
	%>
</select>
</form></td></tr>
</table>
<p><div id="agents"></div></p>
		
</div>
	

	<div id="footer">
	
		<span>[</span>
		
		<a href="index.jsp">Home</a>
		
		<span>||</span>
		
		<a href="packages.jsp">Packages</a>
		
		<span>||</span>
		
		<a href="register.jsp">Registration</a>
		
		<span>||</span>
		
		<a href="contact.jsp">Contact Us</a>
		
		<span>||</span>
		
		<a href="links.jsp">Links</a>
		
		<span>]</span><br />
		
		<span>Copyright &copy; 2008</span>
		
	
	</div>

</div>

</body>
</html>