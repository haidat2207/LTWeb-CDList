<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<c:import url="/includes/header.jsp" />
<body>
<h1>CD list</h1>

<table border="1">
    <tr>
        <th>Description</th>
        <th>Price</th>
        <th></th>
    </tr>

    <tr>
        <td>86 (the band) - True Life Songs and Pictures</td>
        <td>$14.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="productID" value="pid01">
                <input type="hidden" name="productName" value="86 (the band) - True Life Songs and Pictures">
                <input type="hidden" name="productPrice" value="14.95">
                <input type="submit" value="Add To Cart">
            </form>
        </td>
    </tr>

    <tr>
        <td>Paddlefoot - The first CD</td>
        <td>$12.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="productID" value="pid02">
                <input type="hidden" name="productName" value="Paddlefoot - The first CD">
                <input type="hidden" name="productPrice" value="12.95">
                <input type="submit" value="Add To Cart">
            </form>
        </td>
    </tr>

    <tr>
        <td>Paddlefoot - The second CD</td>
        <td class>$14.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="productID" value="pid03">
                <input type="hidden" name="productName" value="Paddlefoot - The second CD">
                <input type="hidden" name="productPrice" value="14.95">
                <input type="submit" value="Add To Cart">
            </form>
        </td>
    </tr>

    <tr>
        <td>Joe Rut - Genuine Wood Grained Finish</td>
        <td class="right">$14.95</td>
        <td>
            <form action="cart" method="post">
                <input type="hidden" name="productID" value="pid04">
                <input type="hidden" name="productName" value="Joe Rut - Genuine Wood Grained Finish">
                <input type="hidden" name="productPrice" value="14.95">
                <input type="submit" value="Add To Cart">
            </form>
        </td>
    </tr>
</table>

<c:import url="/includes/footer.jsp" />
</body>
</html>