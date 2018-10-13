<%@include file="Header.jsp"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${flag}">
	<form:form action="addProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
<table align="center">
	<tr>
		<td colspan="2"><center>Product Detail</center></td>
	</tr>
	<tr>
		<td>Product Name</td>
		<td><form:input path="productName" /></td>
	</tr>
	<tr bgcolor="pink">
		<td>Price</td>
		<td><form:input path="price" /></td>
	</tr>
	<tr>
		<td>Stock</td>
		<td><form:input path="quantity" /></td>
	</tr>
	<tr bgcolor="pink">
		<td>Category</td>
		<td><form:select path="categoryId">
				<form:option value="0" label="--Select List--" />
				<form:options items="${categoryList}" />
			</form:select></td>
	</tr>
	<tr>
		<td>Supplier</td>
		<td><form:input path="supplierId" /></td>
	</tr>
	<tr bgcolor="pink">
		<td>Product Description</td>
		<td><form:input path="productDesc" /></td>
	</tr>
	<tr>
		<td>Product Image</td>
		<td><form:input type="file" path="pimage"/></td>
	</tr>
	
	<tr>
		<td colspan="2"><center>
				<input type="submit" value="Insert Product" />
				<center>
		</td>
	</tr>
	
	

</table>
</form:form>
</c:if>
<c:if test="${!flag}">
	<form:form action="http://localhost:8083/FashionBazarFrontend/updateProduct" modelAttribute="product" method="post">
	<table align="center">
	<tr>
		<td colspan="2"><center>Product Detail</center></td>
	</tr>
	<tr>
		<td>Product Name</td>
		<td><form:input path="productName" /></td>
	</tr>
	<tr bgcolor="pink">
		<td>Price</td>
		<td><form:input path="price" /></td>
	</tr>
	<tr>
		<td>Stock</td>
		<td><form:input path="quantity" /></td>
	</tr>
	<tr bgcolor="pink">
		<td>Category</td>
		<td><form:select path="categoryId">
				<form:option value="0" label="--Select List--" />
				<form:options items="${categoryList}" />
			</form:select></td>
	</tr>
	<tr>
		<td>Supplier</td>
		<td><form:input path="supplierId" /></td>
	</tr>
	<tr bgcolor="pink">
		<td>Product Description</td>
		<td><form:input path="productDesc" /></td>
	</tr>
	<tr>
		<td colspan="2"><center>
				<input type="submit" value="Update Product" />
				<center>
		</td>
	</tr>

	</table>
	</form:form>
</c:if>


<table align="center" class="table">
<tr><td colspan="6"><center>Product Detail</center></td></tr>
<tr>
	<td> Product ID</td>
	<td> Product Name</td>
	<td> Price </td>
	<td> Stock</td>
	<td> Category</td>
	<td> Operation</td>
</tr>
<c:forEach items="${productList}" var="product">
<tr>
		<td>${product.productId}</td>
		<td>${product.productName}</td>
		<td>${product.price}</td>
		<td>${product.quantity}</td>
		<td>${product.categoryId}</td>
		<td>
		<a href="<c:url value="/deleteProduct/${product.productId}"/>">Delete</a>
		<a href="<c:url value="/editProduct/${product.productId}"/>">Edit</a>
		</td>
</tr>
</c:forEach>

</table>














