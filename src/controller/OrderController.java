package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Item;
import entities.Orders;
import entities.Ordersdetail;
import entities.OrdersdetailId;
import model.*;
import paypal.PayPalResult;
import paypal.PayPalSucess;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/Order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		OrdersModel ordersModel = new OrdersModel();
		OrdersDetailModel ordersDetailModel = new OrdersDetailModel();
		AccountModel accountModel = new AccountModel();
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		
		//Tao hoa don
		Orders orders = new Orders();
		orders.setAccount(accountModel.find(username));
		orders.setDatecreation(new Date());
		orders.setName("Order Name");
		orders.setStatus(false);
		int ordersId = ordersModel.create(orders).getId();
		System.out.println("Order Id: " + ordersId);
		
		//Luu chi tiet hoa don
		List<Item> cart = (List<Item>)session.getAttribute("cart");
		for(Item item : cart){
			Ordersdetail ordersdetail = new Ordersdetail();
			ordersdetail.setId(new OrdersdetailId(item.getProduct().getId(), ordersId));
			ordersdetail.setPrice(item.getProduct().getPrice());
			ordersdetail.setQuantity(item.getQuantity());
			ordersDetailModel.create(ordersdetail);
		}
		//Xoa gio hang
		session.removeAttribute("cart");
		
		//Lay thong tin giao dich tu PayPal
		PayPalSucess payPalSucess = new PayPalSucess();
		PayPalResult payPalResult = payPalSucess.getPayPal(request);
		request.setAttribute("payPalResult", payPalResult);
		
		request.getRequestDispatcher("Orders/success.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
