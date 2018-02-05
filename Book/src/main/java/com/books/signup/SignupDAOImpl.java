package com.books.signup;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Transactional
@Repository 

public class SignupDAOImpl implements SignupDAO
{
	@Autowired
	SessionFactory sessionFactory;
	public void insert(Signup s)
	{
		sessionFactory.getCurrentSession().save(s);
	}

	public void update(Signup s)
	{
		this.sessionFactory.getCurrentSession().update(s);
		
	}

	public void delete(int sid) 
	{
		this.sessionFactory.getCurrentSession().createQuery("delete from Profiles where id=:id").setInteger("id", sid).executeUpdate();
	}

	public Signup getsignup(int sid)
	{
		return (Signup)this.sessionFactory.getCurrentSession().createQuery("from Profiles where id=:id").setInteger("id", sid).list().get(0);
	}

	public List<Signup> getsignup() 
	{
		return null;
	}

	public List<Signup> getAll() {
		
		return (List<Signup>)this.sessionFactory.getCurrentSession().createQuery("from Signup").list();
		
	}
}
