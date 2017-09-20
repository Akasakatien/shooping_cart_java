package model;
import java.util.List;

import org.hibernate.*;
import entities.*;

public class OrdersModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
	
	public Orders create(Orders orders) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(orders);
			transaction.commit();
		} catch (Exception e) {
			orders = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return orders;
	}
	public void save(Orders orders) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.save(orders);	
			transaction.commit();
		} catch (Exception e) {
			orders = null;
			if(transaction != null){
				transaction.rollback();
			}
		} finally {
			session.close();
		}
	}
	public List<Orders> findAll() {
		List<Orders> orders = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			orders = session.createQuery("from Orders order by id desc").list();

			transaction.commit();
		} catch (Exception e) {
			orders = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}

		return orders;
	}
	public Orders find(int id) {
		Orders orders = null;
		Session session = sessionFactory.openSession(); // nam giu ket noi
		Transaction transaction = null; // thuc hien cac cau truy van
		try {
			transaction = session.beginTransaction();
			// thao tac co so du lieu o day
			Query query = session.createQuery("from Orders where id = :id");
			query.setInteger("id", id);
			orders = (Orders) query.uniqueResult();
			// ========
			transaction.commit();
		} catch (Exception e) {
			orders = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return orders;
	}
	public void update(Orders orders) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.update(orders);	
			transaction.commit();
		} catch (Exception e) {
			orders = null;
			if(transaction != null){
				transaction.rollback();
			}
		} finally {
			session.close();
		}
	}
}
