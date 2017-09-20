package model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.Product;

public class ProductModel {
	private SessionFactory sessionFactory = HibernateUtil.getSessionFactory();

	public List<Product> findAll() {
		List<Product> products = null;
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			products = session.createQuery("from Product").list();

			transaction.commit();
		} catch (Exception e) {
			products = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}

		return products;
	}

	public Product find(int id) {
		Product product = null;
		Session session = sessionFactory.openSession(); // nam giu ket noi
		Transaction transaction = null; // thuc hien cac cau truy van
		try {
			transaction = session.beginTransaction();
			// thao tac co so du lieu o day
			Query query = session.createQuery("from Product where id = :id");
			query.setInteger("id", id);
			product = (Product) query.uniqueResult();
			// ========
			transaction.commit();
		} catch (Exception e) {
			product = null;
			if (transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return product;
	}
}
