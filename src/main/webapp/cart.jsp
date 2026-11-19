<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<c:import url="/includes/header.jsp" />
<body>
<h1>Your cart</h1>

<c:choose>
    <c:when test="${empty cart}">
        <p>Your cart is empty.</p>
    </c:when>
    <c:otherwise>
        <table border="1">
            <tr>
                <th>Quantity</th>
                <th>Description</th>
                <th>Price</th>
                <th>Amount</th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${cart.items}">
                <tr>
                    <td>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productID" value="${item.product.id}">
                            <input type="text" size="2" name="quantity" value="${item.quantity}">
                            <input type="submit" value="Update">
                        </form>
                    </td>
                    <td>${item.product.description}</td>
                    <td>$${item.product.price}</td>
                    <td>$${item.total}</td>
                    <td>
                        <form action="cart" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="productID" value="${item.product.id}">
                            <input type="submit" value="Remove Item">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<p><b>To change the quantity</b>, enter the new quantity and click on the Update button.</p>

<form action="cart" method="post">
    <input type="hidden" name="action" value="shop">
    <input type="submit" value="Continue Shopping">
</form>
<form action="cart" method="post">
    <input type="hidden" name="action" value="checkout">
    <input type="submit" value="Checkout">
</form>

<c:import url="/includes/footer.jsp" />
</body>
</html>