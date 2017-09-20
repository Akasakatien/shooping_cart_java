package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Item;
import entities.Product;
import model.ProductModel;

/**
 * Servlet implementation class CartController
 */
@WebServlet("/Cart")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartController() {
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
			request.getRequestDispatcher("Cart/index.jsp").forward(request, response);
		}else{
			if(action.equalsIgnoreCase("buy")){
				doGetBuy(request, response);
			}else if(action.equalsIgnoreCase("delete")){
				doGetDelete(request, response);
			}else if(action.equalsIgnoreCase("checkout")){
				doGetCheckout(request, response);
			}
		}
	}
	protected void doGetBuy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductModel productModel = new ProductModel();
		int id = Integer.parseInt(request.getParameter("id"));
		if(session.getAttribute("cart") == null){ //Mua Lan 1
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productModel.find(id), 1));
			session.setAttribute("cart", cart);
		}else{	//Mua lan 2
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			int index = Exits(id, cart);
			if(index == -1){
				cart.add(new Item(productModel.find(id), 1));
			}else{
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
			}
			session.setAttribute("cart", cart);
		}
		response.sendRedirect("Cart");
	}
	protected void doGetDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int index = Integer.parseInt(request.getParameter("index"));
		HttpSession session = request.getSession();
		List<Item> cart = (List<Item>) session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		response.sendRedirect("Cart");
	}
	protected void doGetCheckout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("username") == null){
			response.sendRedirect("Account?action=login");
		}
	}
	private int Exits(int id, List<Item> cart){
		for(int i = 0; i < cart.size(); i++){
			if(cart.get(i).getProduct().getId() == id){
				return i;
			}
		}
		return -1;
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
