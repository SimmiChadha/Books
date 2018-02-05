package com.books.library;

import java.util.List;

public interface LibraryDAO 
{
	void insert (Library l);
	void update (Library l);
	void delete (int lid);
	
	Library getLibrary(int lid);
	List<Library> getLibrary();

}
