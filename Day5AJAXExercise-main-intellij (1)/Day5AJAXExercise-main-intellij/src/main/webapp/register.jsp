<%--Travel Experts registration page, Greg Bevington, Fall 2023.
A script has been added to this code to take Country and Province data from a REST service, and use that data to populate two dropdown menus. --%>


<%@ page import="java.sql.*, java.io.*" %>
<%

%>
<%!
	String myForm = null;
	public PrintWriter getPrintWriter(HttpServletResponse response)
	{
		PrintWriter output;
		try {
			output = new PrintWriter(response.getWriter());
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return output;
	}
	public String createCustomer(String [] customerArray)
		{
			String sql = "INSERT INTO customers ("
				+ "CustomerID, CustFirstName, CustLastName, CustAddress, CustCity, CustProv, CustCountry, CustPostal, CustHomePhone, CustBusPhone, CustEmail, AgentID"
			    + ") values (S_101_1_CUSTOMERS.NEXTVAL, "
				+ "'" + customerArray[0] + "'," 
				+ " '" + customerArray[1] + "',"
				+ " '" + customerArray[2] + "',"
				+ " '" + customerArray[3] + "',"
				+ " '" + customerArray[4] + "',"
				+ " '" + customerArray[5] + "',"
				+ " '" + customerArray[6] + "',"
				+ " '" + customerArray[7] + "',"
				+ " '" + customerArray[8] + "',"
				+ " '" + customerArray[9] + "',"
				+ " " + customerArray[10] + ")";


		    try
		    {
				Class.forName("org.mysql.cj.jdbc.Driver");
				Connection dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts", "PC1", "password");

		        Statement stmt = dbConn.createStatement();

		        int rows = stmt.executeUpdate(sql);

		        // Cleanup
		        dbConn.close();  // close the connection
		        
				if (rows == 1)
				{
					return "Your registration was a success. Thank you for joining The Travel Experts.";
				}
				else
				{
					return "Insert was NOT successful";
				}
		    }
		    catch (Exception excp)
		    {
		        excp.printStackTrace();
		    }
			return "";
		}
		
		public String displayForm(String [] customerArray, PrintWriter output) throws IOException
		{
			StringBuilder sb = new StringBuilder();
			sb.append("<form name='form1' method='get' action=''>");
			sb.append("<table width='600' border='0' align='center' cellpadding='0' cellspacing='5'>");
			sb.append("<tr>");
			sb.append("<caption>Customer Registration</caption>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td colspan='2'><h6>Required fields indicated with a *</h6></td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td width='90'><div align='left'>*First Name:</div>");
			sb.append("</td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='CustFirstName' type='text' id='CustFirstName' value='" + customerArray[0] + "'></div>");
			sb.append("</td>");
			sb.append("<td width='110'><div align='left'>*Last Name:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='CustLastName' type='text' id='CustLastName' value='" + customerArray[1] + "'></div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td>&nbsp;</td><td>&nbsp;</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td><div align='left'>Address:</div></td>");
			sb.append("<td colspan='2'><div align='left'>");
			sb.append("<input name='CustAddress' type='text' id='CustAddress' value='" + customerArray[2] + "' maxlength='75' size='25'></div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td><div align='left'>*City:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='CustCity' type='text' id='Custcity' value='" + customerArray[3] + "'></div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td>");
			sb.append("<div align='left' id='label'>*Province:</div>");
			sb.append("</td>");
			sb.append("<td>");
			sb.append("<div align='left' id='region'>");
			sb.append("<select name='CustProv'  id='CustProv'>");
			sb.append("<option value=''>Select One...</option>");
			sb.append("</select>");
			sb.append("</div>");
			sb.append("</td>");
			sb.append("<td><div align='left'>*Country:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<select name='CustCountry' id='CustCountry'>");
			sb.append("<option value=''>Select One...</option>");
			sb.append("</select>");
			sb.append("</div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td><div align='left' id='zippostal'>*Postal Code:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='CustPostal' type='text' id='CustPostal' value='" + customerArray[6] + "'></div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td>&nbsp;</td><td>&nbsp;</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td><div align='left'>*Home Phone:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='CustHomePhone' type='text' id='CustHomePhone' value='" + customerArray[7] + "'></div>");
			sb.append("</td>");
			sb.append("<td><div align='left'>Business Phone:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='CustBusPhone' type='text' id='CustBusPhone' value='" + customerArray[8] + "'></div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td><div align='left'>Email:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='CustEmail' type='text' id='CustEmail' value='" + customerArray[9] + "' size='25'></div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td>&nbsp;</td><td>&nbsp;</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td><div align='left'>AgentID:</div></td>");
			sb.append("<td><div align='left'>");
			sb.append("<input name='AgentID' type='text' id='AgentID' value='" + customerArray[10] + "' size='25'></div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("<tr>");
			sb.append("<td>&nbsp;</td><td>&nbsp;</td>");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("<table width='200' border='0' align='center'>");
			sb.append("<tr>");
			sb.append("<td width='100'>");
			sb.append("<input type='submit'  name='submit' value='Register'>");
			sb.append("</td>");
			sb.append("<td width='100'>");
			sb.append("<div align='left'>");
			sb.append("<input name='reset' type='reset' id='reset' value='Reset' />");
			sb.append("</div>");
			sb.append("</td>");
			sb.append("</tr>");
			sb.append("</table>");
			sb.append("</form>");

			sb.append("<p><b>Privacy statement:</b> Any information entered in the above fields will be used for the purposes of Travel Experts alone. We will not share your information with anyone</p>");
			sb.append("<p>&nbsp;</p>");
			sb.append("<p>&nbsp;</p>");
			return sb.toString();
		}
		
		public String validate(String [] customerData)
		{
			for (int i=0; i<customerData.length; i++)
			{
				if (customerData[i].equals(""))
				{
					switch(i)
					{
						case 0:
							return "**First name must have a value!**";
						
						case 1:
							return "**Last name must have a value!**";
						
						case 2:
							break;						
						
						case 3:
							return "**You must include your city name!**";
							
						case 4:
							return "**You must include your province or state name!**";
							
						case 5:
							return "**You must include your country name!**";
							
						case 6:
							return "**You must include your postal or zip code!**";
							
						case 7:
							return "**Please provide your home phone number!**";
							
						case 8:
							break;
							
						case 9:

							break;
						
						default:
						return "field must have a value.";
					}
				}
			}
			return "";
		}
		
%>

<jsp:include page="header.jsp" />
<body>
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
		
		<%
			PrintWriter output = getPrintWriter(response);
			if (request.getParameter("submit") != null)
			{
				String [] customer = new String[11];
				customer[0] = (String)request.getParameter("CustFirstName");
				customer[1] = (String)request.getParameter("CustLastName");
				customer[2]= (String)request.getParameter("CustAddress");
				customer[3]= (String)request.getParameter("CustCity");
				customer[4] = (String)request.getParameter("CustProv");
				customer[5] = (String)request.getParameter("CustCountry");
				customer[6] = (String)request.getParameter("CustPostal");
				customer[7] = (String)request.getParameter("CustHomePhone");
				customer[8] = (String)request.getParameter("CustBusPhone");
				customer[9] = (String)request.getParameter("CustEmail");
				customer[10] = (String)request.getParameter("AgentID");
		
				//pass data to validation function
				String message = validate(customer);
				if (message.equals(""))
				{
					//if not valid set error message and redisplay form
					output.print("<h4 style='color:crimson'>" + createCustomer(customer) + "</h4>");
					
					//after writing customer data empty the array so form will be empty
					
						customer[0] = "";
						customer[1] = "";
						customer[2] = "";
						customer[3] = "";
						customer[4] = "";
						customer[5] = "";
						customer[6] = "";
						customer[7] = "";
						customer[8] = "";
						customer[9] = "";
						customer[10] = "";
				
					
					myForm = displayForm(customer, output);
				} else
				{
					output.print("<h4 style='color:crimson'>" + message + "</h4>");
					myForm = displayForm(customer, output);
			    }
			}
			else
			{
				//display form
				String [] customer = {"","","","","","","","","","",""};
				myForm = displayForm(customer, output);
			}
		%>
		<%= myForm %>
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
		
		<br />
	
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" type="text/javascript"></script>
	<script>
		function updateProvinces() {
			let countrySelect = document.getElementById("CustCountry");
			let selectedCountry = countrySelect.value;

			let xhr = new XMLHttpRequest();
			xhr.open("GET", "http://localhost:8080/RESTservice-1.0-SNAPSHOT/api/location/provinces/" + selectedCountry, true);

			// Request headers to handle CORS
			xhr.setRequestHeader("Content-Type", "application/json");

			xhr.onreadystatechange = function () {
				if (xhr.readyState === 4 && xhr.status === 200) {
					let response = JSON.parse(xhr.responseText);
					let provincesSelect = document.getElementById("CustProv");

					// Clear previous province choices
					provincesSelect.innerHTML = "";

					// Populate provinces menu
					for (let i = 0; i < response.length; i++) {
						let option = document.createElement("option");
						option.value = response[i].provinceCode;
						option.text = response[i].provinceName;
						provincesSelect.appendChild(option);
					}
				}
			};
			xhr.send();
		}

		function updateCountryOptions() {
			let countrySelect = document.getElementById("CustCountry");
			let xhr = new XMLHttpRequest();
			xhr.open("GET", "http://localhost:8080/RESTservice-1.0-SNAPSHOT/api/location/countries", true);

			// Request headers to handle CORS
			xhr.setRequestHeader("Content-Type", "application/json");

			xhr.onreadystatechange = function () {
				if (xhr.readyState === 4 && xhr.status === 200) {
					let response = JSON.parse(xhr.responseText);
					let countriesSelect = document.getElementById("CustCountry");

					// Clear previous country choices
					countriesSelect.innerHTML = "";

					// Populate country choices
					for (let i = 0; i < response.length; i++) {
						let option = document.createElement("option");
						option.value = response[i].countryCode;
						option.text = response[i].countryName;
						countriesSelect.appendChild(option);
					}
					// Update provinces with the selected country
					updateProvinces();
				}
			};
			xhr.send();
		}

		let countrySelect = document.getElementById("CustCountry");
		countrySelect.onchange = updateProvinces;
		updateCountryOptions();
	</script>


</div>

</body>
</html>