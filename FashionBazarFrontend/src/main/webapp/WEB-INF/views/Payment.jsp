<%@include file="Header.jsp"%>

<br/><br/>

<form action="paymentprocess" method="post">
<table align="center" width="40%" class="table table-bordered">
	<tr bgcolor="orange"><td colspan="2">Payment Process </td></tr>
	
	<tr>
		<td>Payment Mode </td>
		<td>
		<input type="radio" name="pmode" value="CC">Credit Card
		<input type="radio" name="pmode" value="CD">Cash On Deliver
		</td>
	</tr>
	
	<tr bgcolor="orange">
		<td>Credit Card </td>
		<td><input type="text" name="ccard"/></td>
	</tr>
	
	<tr>
		<td>Validity <input type="text" name="validity"/></td>
		<td>CVV <input type="text" name="cvv"/></td>
	</tr>
	
	<tr bgcolor="orange">
		<td> Name on Card</td>
		<td> <input type="text" name="cname"/></td>
	</tr>
	<tr>
		<td colspan="2"><center><input type="submit" value="Payment Process"/></center></td>
	</tr>
	
</table>
</form>