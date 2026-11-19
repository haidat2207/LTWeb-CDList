<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<c:import url="/includes/header.jsp" />
<body>
<h1>Checkout</h1>
<c:choose>
    <c:when test="${empty cart.items}">
        <p>Your cart is empty.</p>
    </c:when>
    <c:otherwise>
        <p>Thank you for your order! Here is your summary:</p>

        <c:set var="grandTotal" value="0" />
        <table border="1">
            <tr>
                <th>Quantity</th>
                <th>Description</th>
                <th>Price</th>
                <th>Amount</th>
            </tr>
            <c:forEach var="item" items="${cart.items}">
                <c:set var="grandTotal" value="${grandTotal + item.total}" />
                <tr>
                    <td>${item.quantity}</td>
                    <td>${item.product.description}</td>
                    <td>$<fmt:formatNumber value="${item.product.price}" minFractionDigits="2" maxFractionDigits="2"/></td>
                    <td>$<fmt:formatNumber value="${item.total}" minFractionDigits="2" maxFractionDigits="2"/></td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="3"><b>Total</b></td>
                <td colspan="2"><b>$<fmt:formatNumber value="${cart.total}" minFractionDigits="2" maxFractionDigits="2"/></b></td>
            </tr>
        </table>
    </c:otherwise>
</c:choose>
<br>
<form action="cart" method="post">
    <input type="hidden" name="action" value="finish">
    <input type="submit" value="Finish &amp; Back to Home">
</form>
<form action="cart" method="get">
    <input type="submit" value="Back to Cart">
</form>
<c:import url="/includes/footer.jsp" />
</body>
</html>
