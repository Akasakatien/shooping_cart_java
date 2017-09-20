package model;
import org.hibernate.*;
import entities.*;

public class OrdersDetailModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	public Ordersdetail create(Ordersdetail ordersDetail) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(ordersDetail);
			transaction.commit();
		} catch (Exception e) {
			ordersDetail = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return ordersDetail;
	}
	public void save(Ordersdetail ordersdetail) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(ordersdetail);	
			transaction.commit();
		} catch (Exception e) {
			ordersdetail = null;
			if(transaction != null){
				transaction.rollback();
			}
		} finally {
			session.close();
		}
	}
}
