package com.books.library;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.books.category.Category;
@Transactional
@Repository
public class LibraryDAOImpl implements LibraryDAO
{
	@Autowired
	SessionFactory sessionFactory;
	public void insert(Library l) 
	{
		sessionFactory.getCurrentSession().save(l);	
	}

	public void update(Library l)
	{
		this.sessionFactory.getCurrentSession().update(l);
		
	}

	public Library getLibrary(int id)
	{
		// TODO Auto-generated method stub
		return (Library) sessionFactory.getCurrentSession().get(Library.class, id);
	}

	public List<Library> getLibrary() 
	{
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Library").list();
	}

	public void delete(int lid) {
		// TODO Auto-generated method stub
		
			sessionFactory.getCurrentSession().createQuery("delete from Library where id = :somevalue").setInteger("somevalue",lid).executeUpdate();
		
	}

}
