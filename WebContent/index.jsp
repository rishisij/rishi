<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.mongodb.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>MongoMAP :)</title>
<link rel="stylesheet"
      href="./css/styles.css"
      type="text/css"/>
  <%
  Mongo mongo = new Mongo();
	DB db=mongo.getDB("test");
	DBCollection coll=db.getCollection("time");
	DBCollection coll1=db.getCollection("time1");
	DBCursor cursor = coll.find();
	DBCursor cursor1 = coll1.find();
	DBObject z,d;
	z=cursor.next();
	d=cursor1.next();
	//System.out.println(z+"  "+d);
	
	
  %>
</head>
<body>

<form action="submit.jsp" method = "POST">
<fieldset>
<legend>Form</legend>
<table>
<tr><td><b>City : </b><input type = "text" name = "city" size="20" tabindex = "1" /></td></tr>
<tr><td><b>                      Location  </b></td></tr>
<tr><td><b>Longitude : </b><input type = "text" name = "loc.lon" size="10" tabindex = "2" /></td>
<td><b>Latitude : </b><input type = "text" name = "loc.lat" size="10" tabindex = "3" /></td></tr>
<tr><td><b>Population : </b><input type = "text" name = "pop" size="5" tabindex = "4" /></td></tr>
<tr><td><b>State : </b><input type = "text" name = "state" size="2" tabindex = "5" /></td></tr>
<tr><td><b>Zipcode : </b><input type = "text" name = "_id" size="5" tabindex = "6" /></td></tr>
<tr><td><input type = "submit" value = "submit" tabindex = "7" /></td>


</tr>

</table>
</fieldset>
<p/>
</form>
<form action="view.jsp" method = "POST">
<fieldset>
<legend>View</legend>
<table><tr><td><input type = "submit" value = "Show_Data" tabindex = "8" /></td></tr></table>
</fieldset>
</form>
<form action="map.jsp" method = "POST">
<fieldset>
<legend>MapRed</legend>
<table><tr><td><input type = "submit" name = "action" value = "map_First_Time" tabindex = "9" /></td><td><input type = "submit" name = "action" value = "Delete_Map" tabindex = "10" /></td><td><b>Last Map : </b><%= z.get("last_map_time") %></td></tr></table>
</fieldset>
</form>
<form action="maprec.jsp" method = "POST">
<fieldset>
<legend>IncMapred</legend>
<table><tr><td><input type = "submit" value = "map_Red_Inc" tabindex = "11" /></td><td><b>Last Recursive Map : </b><%= d.get("last_maprecur_time") %></tr></table>
</fieldset>
</form>
<form action="inc.jsp" method = "POST">
<fieldset>
<legend>Increment</legend>
<table><tr><td><b>Inc_Id : </b><input type = "text" name = "str" size="20" tabindex = "12" /></td>
<td><b>Val : </b><input type = "text" name = "numb" size="5" tabindex = "13" /></td></tr>
<tr><td><input type = "submit" name = "submit" value = "inc" tabindex = "14" /></td></tr>
<tr><td><input type = "file" name = "browse" value ="browse" tabindex = "15" ></td>
<td><input type = "submit" name = "submit" value = "file" tabindex = "16" /></td>
</tr>

</table>
</fieldset>
</form>
<br/><br/><br/><br/><br/><br/>

</body></html>