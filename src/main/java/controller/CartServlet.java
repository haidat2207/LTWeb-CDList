package controller;

import business.Cart;
import business.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }

        String action = request.getParameter("action");
        String productID = request.getParameter("productID");
        String url = "/cart.jsp";

        if (action == null || action.equals("add")) {
            String name = request.getParameter("productName");
            double price;
            try {
                price = Double.parseDouble(request.getParameter("productPrice"));
            } catch (Exception e) {
                price = -1;
            }
            if (productID != null && name != null && price >= 0) {
                cart.addItem(new Product(productID, name, price));
            }
        } else if (action.equals("update")) {
            int qty;
            try {
                qty = Integer.parseInt(request.getParameter("quantity"));
            } catch (NumberFormatException e) {
                qty = 1;
            }
            cart.updateItem(productID, qty);
        } else if (action.equals("remove")) {
            cart.removeItem(productID);
        } else if (action.equals("shop")) {
            url = "/index.jsp";
        } else if (action.equals("checkout")) {
            url = "/checkout.jsp";
        } else if (action.equals("finish")) {
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        session.setAttribute("cart", cart);
        getServletContext().getRequestDispatcher(url).forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart());
        }
        getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);
    }
}