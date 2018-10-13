<%@include file="Header.jsp"%>

<h2 align="center">Login Page</h2>


<form action="perform_login" method="post">
<table>
	<tr><td colspan="2"><center><b>${errorInfo}</b></center></td></tr>
	
	<tr><td colspan="2"><center>Login Credential</center></td></tr>
	
	<tr><td> User Name</td> <td> <input type="text" name="username"/></td></tr>
	
	<tr><td> Password </td> <td> <input type="password" name="password"/></td></tr>
	
	<tr><td colspan="2"><input type="submit" value="SUBMIT"/></td></tr>
	
</table>
</form>