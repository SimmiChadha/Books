package com.books.signup;

import java.util.List;

public interface SignupDAO 
{
	void insert(Signup s);
	void update(Signup s);
	void delete(int sid);
	
	Signup getsignup(int sid);
	List<Signup> getsignup();
	List<Signup>getAll();

}
