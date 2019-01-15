package pkg;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "subscribe")
public class subscribe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static HashMap<String,LinkedList<String>> h=new HashMap<String,LinkedList<String>>();
       public static LinkedList<String> l1=new LinkedList<String>();
       public static LinkedList<String> l2=new LinkedList<String>();
       public static LinkedList<String> l3=new LinkedList<String>();


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("javascript").equals("true"))
			l1.add(request.getParameter("name"));
			h.put("javascript",l1);
		if(request.getParameter("java").equals("true"))
			l2.add(request.getParameter("name"));
		h.put("java",l2);
		if(request.getParameter("python").equals("true"))
			l3.add(request.getParameter("name"));
		h.put("python",l3);

		PrintWriter out=response.getWriter();
		out.print(request.getParameter("name")+" subscribed ");
		if(request.getParameter("javascript").equals("true"))
			out.print("javascript");
		if(request.getParameter("java").equals("true"))
			out.print("java");
		if(request.getParameter("python").equals("true"))
			out.print("python");
		System.out.println(h.get("javascript"));
		  } 
	public static void pr(HttpServletRequest request, HttpServletResponse response,PrintWriter out) {
		System.out.println("--Add--");
		if(h.containsKey(request.getParameter("topic")))
		out.print(h.get(request.getParameter("topic"))+" recieved message");
	}
	}


