package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.accessibility.internal.resources.accessibility;

import entities.Account;
import helper.BCrypt;
import model.*;

/**
 * Servlet implementation class AccountController
 */
@WebServlet("/Account")
public class AccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if(action.equalsIgnoreCase("login")){
			request.getRequestDispatcher("Account/login.jsp").forward(request, response);
		}else{
			if(action.equalsIgnoreCase("signup")){
				request.getRequestDispatcher("Account/register.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("signup")) {
			doPostSignUp(request, response);
		}else if(action.equalsIgnoreCase("login")){
			doPostLogin(request, response);
		}
	}
	protected void doPostSignUp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account account = new Account();
		AccountModel accountModel = new AccountModel();
		account.setEmail(request.getParameter("email"));
		account.setFullname(request.getParameter("fullname"));
		account.setPassword(BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt()));
		account.setUsername(request.getParameter("username"));		
		accountModel.create(account);
		response.sendRedirect("Account?action=login");
		
	}
	protected void doPostLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountModel accountModel = new AccountModel();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Account account = accountModel.login(username, password);
		if(account == null){
			request.setAttribute("error", "invalid");
			request.getRequestDispatcher("Account/login.jsp").forward(request, response);
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			response.sendRedirect("Cart");
		}
		
	}
}
