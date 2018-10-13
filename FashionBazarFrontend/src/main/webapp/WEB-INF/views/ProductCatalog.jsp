<%@include file="Header.jsp"%>

<div class="container">

<div class="row">
<c:forEach items="${productList}" var="product"> 
		<div class="col-md-4 col-xs-12 col-sm-6">
			<div class="thumbnail">
			<h4>
			 <span data-toggle="tooltip" title="Bootstrap version">${product.productName} &nbsp; Rs.${product.price}/-</span> </span>
			</h4>
			<img src="<c:url value="/resources/images/${product.productId}.jpg"/>" width="100" height="100" alt="Image not Supported" /> 
			<a href="<c:url value="/productDisplay/${product.productId}"/>"	class="btn btn-primary col-xs-12" role="button">Click for Large</a>
			<div class="clearfix"></div>
			</div>
		</div>
</c:forEach>
</div>

</div>