<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%@ page import ="map.*" %>
<%@ page import ="com.mongodb.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!String f,m,g; %>
<%!int h; %>
<% HttpServletRequest request2 = (HttpServletRequest) request ; %>
<% g= request2.getParameter("submit");%>
<%System.out.println(g) ;%>
<%System.out.println(new Date()); %>
<table border="1">
<tr><th><b>ID</b></th><th><b>Value</b></th></tr>
<%
try {
Mongo mongo = new Mongo();
DB db=mongo.getDB("test");
DBCollection coll=db.getCollection("burn");
//tetsing ts = new tetsing(f,h);
//response.sendRedirect("http://localhost:8080/hadmon/");
if("inc".equals(g))
{
	f= request2.getParameter("str");
	h= Integer.parseInt(request2.getParameter("numb"));
		String a=f;
		int k=h;
		DBObject x;
		String[] b=a.split("@@");
		String[] c =new String[b.length];
		c[0]=b[0];
		for(int i=0;i<b.length-1;i++)
		{
			c[i+1]=c[i]+"@@"+b[i+1]; 
		}
		c[0]=c[0]+"@@@@";
		c[1]=c[1]+"@@";
		System.out.println(c[0]+"  "+c[1]+"  "+c[2]+"  ");
		
			
			
			//coll.findAndModify(query, update);
		  for(int j=0;j<c.length;j++)
		  {
		    BasicDBObject query = new BasicDBObject("uniq",c[j]);
		    BasicDBObject update = new BasicDBObject().append("$inc", new BasicDBObject().append("pop", k)); 
		    coll.findAndModify(query, update);
		    DBCursor cursor = coll.find(query);
		    try {
		       while(cursor.hasNext()) {
		          // System.out.println(cursor.next());
		          	x=cursor.next();
		           %>
		           <tr><td><%= x.get("uniq")%></td><td><%= x.get("pop")%></td></tr>
		           <%
		       }
		    } 
		    catch(Exception e){
		       cursor.close();
		    }
		  }
		   //System.out.println(db.coll.find());
		
}
else if("file".equals(g))
{	
	m= request2.getParameter("browse");
	System.out.println(m);
	Properties myProps = new Properties();
	FileInputStream propInputStream;
	try {
		propInputStream = new FileInputStream("/home/gateway/Documents/191_data/workspace/hadmon/id.properties");
		myProps.load(propInputStream);  
	} catch (FileNotFoundException e1) {
		e1.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	
	Enumeration eProps = myProps.propertyNames();
    while (eProps.hasMoreElements()) {
    	String key = (String) eProps.nextElement();
        String value = myProps.getProperty(key);
		String a=value;
		int k=Integer.parseInt(key);
		DBObject x;
		String[] b=a.split("@@");
		String[] c =new String[b.length];
		c[0]=b[0];
		for(int i=0;i<b.length-1;i++)
		{
			c[i+1]=c[i]+"@@"+b[i+1]; 
		}
		c[0]=c[0]+"@@@@";
		c[1]=c[1]+"@@";
		//System.out.println(c[0]+"  "+c[1]+"  "+c[2]+"  ");
		
	
			//coll.findAndModify(query, update);
		  for(int j=0;j<c.length;j++)
		  {
		    BasicDBObject query = new BasicDBObject("uniq",c[j]);
		    BasicDBObject update = new BasicDBObject().append("$inc", new BasicDBObject().append("pop", k)); 
		    coll.findAndModify(query, update);
		    
		  
		  }
		  
		
    }
    System.gc();
	mongo.close();
    System.out.println(new Date());
}
}catch (Exception e) {
	System.out.println("UnKnown host Exception");
}


	
%>
</table>
</body>
</html>