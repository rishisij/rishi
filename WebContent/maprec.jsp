<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "map.maprec" %>
<%@ page import ="com.mongodb.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	maprec ma=new maprec();
%>

<table border="1">
<tr><th><b>State</b></th><th><b>Value</b></th></tr>
<%
	Mongo mongo = new Mongo();
	DB db=mongo.getDB("test");
	DBCollection coll=db.getCollection("contact1");
	DBObject z;
	DBCursor cursor = coll.find();
		    try {
		       while(cursor.hasNext()) {
		       z=cursor.next();
		    	   %>
		           <tr><td><%= z.get("_id")%></td><td><%= z.get("value")%></td></tr>
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