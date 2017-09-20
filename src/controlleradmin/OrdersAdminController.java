package controlleradmin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Orders;
import model.OrdersModel;

/**
 * Servlet implementation class OrdersAdminController
 */
@WebServlet("/admin/Orders")
public class OrdersAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersAdminController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action == null){
			doGetFindAll(request, response);
		}else{
			if(action.equalsIgnoreCase("detail")){
				doGetDetail(request, response);
			} else if (action.equalsIgnoreCase("update")) {
				doGetUpdate(request, response);
			}
		}
	}
	protected void doGetFindAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		OrdersModel ordersModel = new OrdersModel();
		request.setAttribute("orders", ordersModel.findAll());
		request.getRequestDispatcher("Orders/index.jsp").forward(request, response);
	}
	protected void doGetDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		OrdersModel ordersModel = new OrdersModel();
		request.setAttribute("order", ordersModel.find(id));
		request.getRequestDispatcher("Orders/detail.jsp").forward(request, response);
	}
	protected void doGetUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		OrdersModel ordersModel = new OrdersModel();
		Orders orders = ordersModel.find(id);
		orders.setStatus(true);
		ordersModel.update(orders);
		response.sendRedirect("Orders");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
