<%@ page import="java.sql.*" %>

<%!
	public String createCustomer(String [] customerArray)
	{
		String sql = "INSERT INTO customers SET"
				+ " CustFirstName = '" + customerArray[0] + "',"
				+ " CustLastName = '" + customerArray[1] + "',"
				+ " CustAddress = '" + customerArray[2] + "',"
				+ " CustCity = '" + customerArray[3] + "',"
				+ " CustProv = '" + customerArray[4] + "',"
				+ " CustCountry = '" + customerArray[5] + "',"
				+ " CustPostal = '" + customerArray[6] + "',"
				+ " CustHomePhone = '" + customerArray[7] + "',"
				+ " CustBusPhone = '" + customerArray[8] + "',"
				+ " CustEmail = '" + customerArray[9] + "',"
				+ " UserName = '" + customerArray[10] + "',"
				+ " Password = '" + customerArray[11] + "'";

		try
		{
			//Class.forName("com.mysql.jdbc.Driver");
			Class.forName("org.mariadb.jdbc.Driver");
			//Connection dbConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/travelexperts","root","password");
			//Connection dbConn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orant11g", "ictoosd", "ictoosd");
			Connection dbConn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts", "your-user", "your-password");

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
	}

	public void displayForm(String [] customerArray)
	{
%>
<form name="form1" method="post" action="">
	<table width="600" border="0" align="center" cellpadding="0" cellspacing="5">
		<tr>
			<caption>Customer Registration</caption>
		</tr>
		<tr>
			<td colspan="2"><h6>Required fields indicated with a *</h6></td>
		</tr>
		<tr>
			<td width="90"><div align="left">*First Name:</div>
			</td>
			<td><div align="left">
				<input name="CustFirstName" type="text" id="CustFirstName" value="<%= customerArray[0] %>"></div>
			</td>
			<td width="110"><div align="left">*Last Name:</div></td>
			<td><div align="left">
				<input name="CustLastName" type="text" id="CustLastName" value="<%= customerArray[1] %>"></div>
			</td>
		</tr>
		<tr>
			</td>&nbsp;</td><td>&nbsp;</td>
		</tr>
		<tr>
			<td><div align="left">Address:</div></td>
			<td colspan="2"><div align="left">
				<input name="CustAddress" type="text" id="CustAddress" value="<%= customerArray[2] %>" maxlength="75" size="25"></div>
			</td>
		</tr>
		<tr>
			<td><div align="left">*City:</div></td>
			<td><div align="left">
				<input name="CustCity" type="text" id="Custcity" value="<%= customerArray[3] %>"></div>
			</td>
		</tr>
		<tr>
			<td>
				<div align="left" id="label">*Province:</div>
			</td>
			<td>
				<div align="left" id="region">
					<select name="CustProv"  id="CustProv">
						<option value="">Select One...</option>
						<option value="AB">AB</option>
						<option value="BC">BC</option>
						<option value="MB">MB</option>
						<option value="NB">NB</option>
						<option value="NF">NF</option>
						<option value="NT">NT</option>
						<option value="NS">NS</option>
						<option value="NU">NU</option>
						<option value="ON">ON</option>
						<option value="PE">PE</option>
						<option value="QC">QC</option>
						<option value="SK">SK</option>
						<option value="YT">YT</option>
					</select>


				</div>
			</td>
			<td><div align="left">*Country:</div></td>
			<td><div align="left">
				<select name="CustCountry" id="CustCountry">
					<option value="">Select One...</option>
					<option value="Canada">Canada</option>
					<option value="United States">United States</option>
				</select>
			</div>
			</td>
		</tr>
		<tr>
			<td><div align="left" id="zippostal">*Postal Code:</div></td>
			<td><div align="left">
				<input name="CustPostal" type="text" id="CustPostal" value="<%= customerArray[6] %>"></div>
			</td>
		</tr>
		<tr>
			</td>&nbsp;</td><td>&nbsp;</td>
		</tr>
		<tr>
			<td><div align="left">*Home Phone:</div></td>
			<td><div align="left">
				<input name="CustHomePhone" type="text" id="CustHomePhone" value="<%= customerArray[7] %>"></div>
			</td>
			<td><div align="left">Business Phone:</div></td>
			<td><div align="left">
				<input name="CustBusPhone" type="text" id="CustBusPhone" value="<%= customerArray[8] %>"></div>
			</td>
		</tr>
		<tr>
			<td><div align="left">Email:</div></td>
			<td><div align="left">
				<input name="CustEmail" type="text" id="CustEmail" value="<%= customerArray[9] %>" size="25"></div>
			</td>
		</tr>
		<tr>
			</td>&nbsp;</td><td>&nbsp;</td>
		</tr>
		<tr>
			<td><div align="left">*User Name:</div></td>
			<td><div align="left">
				<input name="UserName" type="text" id="UserName" value="<%= customerArray[10] %>" size="25"></div>
			</td>
		</tr>
		<tr>
			<td><div align="left">*Password:</div></td>
			<td><div align="left">
				<input name="Password" type="password" id="Password" value="<%= customerArray[11] %>" size="25"></div>
			</td>
			<td><div align="left">*Re-type Password:</div></td>
			<td><div align="left">
				<input name="Password2" type="password" id="Password2" size="25"></div>
			</td>
		</tr>
		<tr>
			</td>&nbsp;</td><td>&nbsp;</td>
		</tr>
	</table>
	<table width="200" border="0" align="center">
		<tr>
			<td width="100">
				<input type="submit"  name="submit" value="Register"> <!--onClick = "return validateCustomer(form1);"-->
			</td>
			<td width="100">
				<div align="left">
					<input name="reset" type="reset" id="reset" value="Reset">
				</div>
			</td>
		</tr>
	</table>
</form>

<p><b>Privacy statement:</b> Any information entered in the above fields will be used for the purposes of Travel Experts alone. We will not share your information with anyone</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<%
	}

	public String validate(String [] customerData)
	{
	for (int i=0; i<customerData.length; i++)
	{
	if (customerData[i].equals(""))
	{
	switch(i)
	{
	case 0;
	return "**First name must have a value!**";

	case 1;
	return "**Last name must have a value!**";

	case 2:
	break;

	case 3;
	return "**You must include your city name!**";

	case 4;
	return "**You must include your province or state name!**";

	case 5;
	return "**You must include your country name!**";

	case 6;
	return "**You must include your postal or zip code!**";

	case 7;
	return "**Please provide your home phone number!**";

	case 8:
	break;

	case 9:

	break;

	case 10:
	return "**Please enter a valid user name!**";

	case 11:
	return "**Please provide a valid password!**";

	default:
	return "field must have a value.";
	}
	}
	}
	}

%>