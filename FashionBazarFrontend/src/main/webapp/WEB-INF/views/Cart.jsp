<%@include file="Header.jsp"%>



<table align="center" width="80%" class="table table-bordered">
<tr>
	<td colspan="5"><h3 align="center">Your Cart</h3></td>
</tr>
<tr>
	<td>ProductName</td>
	<td>Price</td>
	<td>Quantity</td>
	<td>Total Price</td>
	<td>Operations</td>
</tr>
<c:forEach items="${cartItems}" var="cartItem">
<form action="<c:url value="/updateCartItem/${cartItem.cartItemId}"/>" method="get">
<tr>
	<td>${cartItem.productName}</td>
	<td>${cartItem.price}</td>
	<td><input type="text" value="${cartItem.quantity}" name="qty" required/></td>
	<td>${cartItem.quantity * cartItem.price}</td>
	<td>
		<input type="submit" value="UPDATE" class="btn btn-info">
		<a href="<c:url value="/deleteCartItem/${cartItem.cartItemId}"/>" class="btn btn-danger">DELETE</a>
	</td>
</tr>
</form>
</c:forEach>
<tr>
	<td colspan="3"> Grand Total </td>
	<td colspan="2"> ${grandTotal}</td>
</tr>
<tr>
	<td colspan="3"><a href="<c:url value="/productCatalog"/>" class="btn btn-info">Continue Shopping</a>
	<td colspan="2"><a href="<c:url value="/checkout"/>" class="btn btn-info">Checkout</a>
</tr>


</table>