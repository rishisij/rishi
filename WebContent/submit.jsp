<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.mongodb.*" %>
<%@ page import ="javax.servlet.http.HttpServletRequest" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!String f,h; %>
<%!String l1,l2,l; %>
<%!int g,i; %>


<% HttpServletRequest request1 = (HttpServletRequest) request ; %>
 <% f= request1.getParameter("city");%>
 <% l1 = request1.getParameter("loc.lon");%>
 <% l2= request1.getParameter("loc.lat");%>
 <% g= Integer.parseInt(request1.getParameter("pop"));%>
 <% h=  request1.getParameter("state");%>
 <% i= Integer.parseInt(request1.getParameter("_id"));%>
<%	
	l="["+l1+","+l2+"]";
	Mongo mongo = new Mongo();
	DB db=mongo.getDB("test");	
	DBCollection coll=db.getCollection("contacts");
	BasicDBObject submit = new BasicDBObject();
	Date dt = new Date();
	System.out.println(dt);
	submit.append("city",f).append("dateandtime", dt).append("loc",l).append("pop",g).append("state",h).append("ZipCode", i);
	System.out.println(submit);
	coll.insert(submit);
	coll.save(submit);
	response.sendRedirect("http://localhost:8080/hadmon/");
%>
</body>
</html>