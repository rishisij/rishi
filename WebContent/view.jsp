<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.mongodb.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<tr><th><b>City</b></th><th><b>Location</b></th><th><b>Population</b></th><th><b>States</b></th><th><b>ZipCode</b></th><th><b>Date-Time</b></th></tr>
<%
	Mongo mongo = new Mongo();
	DB db=mongo.getDB("test");
	DBCollection coll=db.getCollection("contacts");
	
	DBCursor cursor = coll.find();
	DBObject d;
		    try {
		       while(cursor.hasNext()) {
		    	   d=cursor.next();
		           System.out.println(d);
		           %>
		           <tr><td><%= d.get("city")%></td><td><%= d.get("loc")%></td><td><%= d.get("pop")%></td><td><%= d.get("state")%></td><td><%= d.get("_id")%></td><td><%= d.get("dateandtime")%></td></tr>
<% 
		       }
		    } 
		    catch(Exception e){
		       cursor.close();
		    }
%>
</table>
</body>
</html>