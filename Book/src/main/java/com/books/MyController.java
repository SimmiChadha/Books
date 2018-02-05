package com.books;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.books.cart.Cart;
import com.books.cart.CartDAO;
import com.books.category.Category;
import com.books.category.CategoryDAO;
import com.books.library.Library;
import com.books.library.LibraryDAO;
import com.books.signup.Signup;
import com.books.signup.SignupDAO;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

@Controller
public class MyController 
{
	@Autowired
	LibraryDAO ldao;
	@Autowired
	CategoryDAO cdao;
	@Autowired
	SignupDAO sdao;
	@Autowired
	CartDAO cartdao;
	
	public String test()
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null && !auth.getName().equals("anonymousUser"))
	    {    
	    	System.out.println(auth.getName());
	    	System.out.println("User present");
	    	return "loggedin";
	    }
	    else
	    {
	    	System.out.println("User not present");
	    	return "notloggedin";
	    }
	 }
	@RequestMapping("/")
	public ModelAndView index()
	{
		ModelAndView mv = new ModelAndView("index");
		return mv;

	
	}
	@RequestMapping("/Contactus")
	public ModelAndView contactus()
	{
		ModelAndView mv = new ModelAndView("Contactus");
		return mv;
	}
	@RequestMapping("/Aboutus")
	public ModelAndView aboutus()
	{
		ModelAndView mv = new ModelAndView("Aboutus");
		return mv;
	}
	@RequestMapping(value="/Login",method=RequestMethod.GET)
	public ModelAndView login()
	{
		ModelAndView mv = new ModelAndView("Login");
		return mv;
	}
	@RequestMapping("/AddLibrary")
	public ModelAndView AddLibrary()
	{
		ModelAndView mv = new ModelAndView("AddLibrary");
		Library l = new Library();
		mv.addObject("Library",l);
		return mv;
	}
	
	@RequestMapping(value="/AddLibraryToDB")
	public ModelAndView AddLibraryToDB( @ModelAttribute("Library")Library l , HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewLibrary");
		try
		{
			System.out.println(l.getF());
			
			byte bit[] = l.getF().getBytes();
			
			System.out.println( req.getRealPath("/") );
			
			File f1 = new File( req.getRealPath("/") +  "/image.jpg");
			
			 BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(f1));
	            stream.write(bit);
	            stream.close();
	            
	            Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
	            		  "cloud_name", "dlsgcnr5t",
	            		  "api_key", "991253741157831",
	            		  "api_secret", "X88OGaMMPG8SzZzGjAKYnYUM2rI"));
	            
	            Map uploadResult = cloudinary.uploader().upload(f1, ObjectUtils.emptyMap());
			
	            System.out.println( uploadResult.get("secure_url") );
	            l.setImagePath((String) uploadResult.get("secure_url"));
		}
		catch( Exception e )
		{
			e.printStackTrace();
		}
		
		ldao.insert(l);
		
		return mv;
	}
	
	@RequestMapping("/ViewLibrary")
	public ModelAndView ViewLibrary()
	{
		ModelAndView mv = new ModelAndView("ViewLibrary");
		mv.addObject("AllLibrary", ldao.getLibrary());
		return mv;
	}
	
	@RequestMapping("/UpdateLibrary/{id}")
	public ModelAndView UpdateLibrary(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("UpdateLibrary");
		
		System.out.println(id);
		
		mv.addObject("Library",  ldao.getLibrary(id));
		return mv;
	}
	
	@RequestMapping(value="/UpdateLibraryToDB",method=RequestMethod.POST)
	public ModelAndView UpdateLibraryToDB( @ModelAttribute("Library") Library l )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewLibrary");
		ldao.update(l);
		return mv; 
	}
	
	
	
	@RequestMapping("/DeleteLibraryFromDB/{id}")
	public ModelAndView DeleteLibraryFromDB( @PathVariable("id") int id )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewLibrary");
		
		ldao.delete(id);
		
		return mv;
	}
	@RequestMapping("/AddCategory")
	public ModelAndView AddCategory()
	{
		ModelAndView mv = new ModelAndView("AddCategory");
		mv.addObject("Category",new Category());
		return mv;
	}
	@RequestMapping("/ViewCategory")
	public ModelAndView ViewCategory()
	{
		ModelAndView mv = new ModelAndView("ViewCategory");
		mv.addObject("AllCategory",cdao.getCategory());
		return mv;
	}
	@RequestMapping("/DeleteCategoryFromDB/{id}")
	public ModelAndView DeleteCategoryFromDB( @PathVariable("id") int id )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		
		cdao.delete(id);
		
		return mv;
	}
	
	@RequestMapping(value="/AddCategoryToDB")
	public ModelAndView AddCategoryToDB( @ModelAttribute("Category") Category c )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		
		cdao.insert(c);
		
		return mv;
	}
	
	@RequestMapping("/UpdateCategory/{id}")
	public ModelAndView UpdateCategory( @PathVariable("id") int id )
	{
		ModelAndView mv = new ModelAndView("UpdateCategory");
	
		mv.addObject("Category",  cdao.getCategory(id));
		
		return mv;
	}
	
	@RequestMapping(value="/UpdateCategory/UpdateCategoryToDB",method=RequestMethod.POST)
	public ModelAndView UpdateCategoryToDB( @ModelAttribute("Category") Category c )
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewCategory");
		
		cdao.update(c);
		
		return mv;
	}
	
	@RequestMapping("/AddSignup")
	public ModelAndView AddSignup()
	
	{
		ModelAndView mv = new ModelAndView("AddSignup");
		mv.addObject("Signup",new Signup());
		return mv;
	}
	
	@RequestMapping(value="/AddSignupToDB")
	public ModelAndView AddSignupToDB(@Valid @ModelAttribute("Signup") Signup s, BindingResult bind)
	{
		ModelAndView mv = new ModelAndView("redirect:/AddSignup");
		if(bind.hasErrors())
		{
			mv = new ModelAndView("AddSignup");
			mv.addObject("Signup", s);
			return mv;
		}
		sdao.insert(s);
		return mv;
	}
	
	@RequestMapping("/ViewOneLibrary/{id}")
	public ModelAndView ViewOneLibrary(@PathVariable("id") int id)
	{
		ModelAndView mv = new ModelAndView("ViewOneLibrary");
		mv.addObject("Library",ldao.getLibrary(id));
		return mv;
	}
	
	@RequestMapping(value="/AddCartToDB",method=RequestMethod.POST)
	public ModelAndView AddCartToDB( @RequestParam("qty") int q, @RequestParam("id")int abc  )
	{
		ModelAndView mv = new ModelAndView("redirect:/cart");

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		 if (auth != null && !auth.getName().equals("anonymousUser"))
		 {
			 String currUser=auth.getName();
		
			 boolean found = false;
			 int id = -1;
		
		for( Cart c1 : cartdao.getLibrarybyName(currUser) )
		{
			if( c1.getUserid().equals(currUser) && c1.getLid()==abc  )
			{
				found = true;
				id = c1.getId();
				break;				
			}
		}
		
		if( found )
		{
			Cart c = cartdao.getCart(id);
			Library l = ldao.getLibrary(abc);
			String qty1 = l.getQty();
			int i=Integer.parseInt(qty1);
			int x = c.getQty();
			
			i=i+x-q;
		
			String qty = String.valueOf(i);
			l.setQty(qty);
		    this.ldao.update(l);
           
			c.setQty(q);
			this.cartdao.update(c);
			System.out.println("updated");
			return mv;

		}

		System.out.println(auth.getName());
		
    	Cart c = new Cart();
		
    	Library l = ldao.getLibrary(abc);
		String qty1 = l.getQty();
		int i=Integer.parseInt(qty1);
		i=i-q;
		System.out.println("i "+i);
		String qty = String.valueOf(i);
		l.setQty(qty);
		System.out.println(l.getQty());
		this.ldao.update(l);
	
		c.setUserid( auth.getName() );
		c.setLid(abc);
		c.setQty(q);
		
		this.cartdao.add(c);
		 }
		 return mv;
	}
	
	@RequestMapping("/DeleteOneLibrary/{id}")
	public ModelAndView DeleteOneLibrary(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("redirect:/ViewLibrary");
		
		ldao.delete(abc);
		
		return mv;
	}
	
	@RequestMapping("/UpdateOneLibrary/{id}")
	public ModelAndView UpdateOneLibrary(@PathVariable("id")int abc)
	{
		ModelAndView mv = new ModelAndView("updateLibrary");
	
		
		Library l = ldao.getLibrary(abc);
		mv.addObject("Library",l);
		mv.addObject("Category", cdao.getCategory());
		return mv;
	}

}
	


