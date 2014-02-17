<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "map.mapr" %>
<%@ page import ="com.mongodb.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Mongo mongo = new Mongo();
DB db=mongo.getDB("test");
DBCollection coll=db.getCollection("contact1");
DBCollection coll1=db.getCollection("time");
DBCollection coll2=db.getCollection("time1");
%>
<table border="1">
<tr><th><b>State</b></th><th><b>Value</b></th></tr>
<%	
	String action = request.getParameter("action");
	DBObject z;
	if("map_First_Time".equals(action))
	{
	mapr map=new mapr();
	
	
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
	}
	else if("Delete_Map".equals(action))
	{
		coll.drop();
		coll1.drop();
		coll2.drop();
		DBCollection coll3=db.getCollection("time");
		DBCollection coll4=db.getCollection("time1");
		BasicDBObject bdo = new BasicDBObject();
		bdo.put("last_map_time","0000-00-00T00:00:00.000Z" );
		BasicDBObject bdo1 = new BasicDBObject();
		coll3.insert(bdo);
		bdo1.put("last_maprecur_time","0000-00-00T00:00:00.000Z" );
		coll4.insert(bdo1);
	}
%>
</table>
</body>
</html>