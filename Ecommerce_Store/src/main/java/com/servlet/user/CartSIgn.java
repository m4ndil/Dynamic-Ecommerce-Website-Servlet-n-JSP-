package com.servlet.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CartDAO;
import com.util.DBConnect;
//maps the URL pattern "/cartin" to the servlet
@WebServlet("/cartin")

//handles HTTP GET requests and processes cart updates, either increasing or decreasing the quantity of an item in the cart or removing the item from the cart
public class CartSIgn extends HttpServlet {

	@Override
	// specifies the current quantity of the item in the cart
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String sign = req.getParameter("si");
			int cId = Integer.parseInt(req.getParameter("cid"));

			int qu = Integer.parseInt(req.getParameter("qu"));

			CartDAO dao = new CartDAO();
			HttpSession session = req.getSession();

			if ("plus".equals(sign) && qu >= 1) {
				int val = qu + 1;
				String sql = "update cart set quantity='" + val + "' where id='" + cId + "'";
				// System.out.println(sql);
				dao.updateQuantity(sql);
				resp.sendRedirect("cart.jsp");

			} else if ("neg".equals(sign) && qu >= 1) {
				int val = qu - 1;
				String sql = "update cart set quantity='" + val + "' where id='" + cId + "'";

				if (val == 0) {
					if (dao.deleteCart(cId)) {
						session.setAttribute("succMsg", "Item Removed from cart");
						resp.sendRedirect("cart.jsp");
					}
				} else {
					dao.updateQuantity(sql);
					resp.sendRedirect("cart.jsp");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
