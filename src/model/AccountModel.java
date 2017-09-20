package model;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.Account;
import helper.BCrypt;

public class AccountModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	public Account find(String username) {
		Account account = new Account();
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			account = (Account)session.createQuery("from Account "
					+ "where username = :username").setString("username", username).uniqueResult();		
			transaction.commit();
		} catch (Exception e) {
			account = null;
			if(transaction != null){
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return account;
	}
	public Account login(String username, String password) {
		try {
			Account account = this.find(username);
			if(account != null){
				if(BCrypt.checkpw(password, account.getPassword())){
					return account;
				}else{
					return null;
				}
			}
			return null;
		} catch (Exception e) {
			return null;
		}
	}
	
	public void save(Account account) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(account);	
			transaction.commit();
		} catch (Exception e) {
			account = null;
			if(transaction != null){
				transaction.rollback();
			}
		} finally {
			session.close();
		}
	}
	public boolean create(Account account) {
		boolean result = false;
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(account);
			result = true;
			transaction.commit();
		} catch (Exception e) {
			result = false;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}
}
