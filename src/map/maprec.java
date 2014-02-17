package map;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MapReduceCommand;
import com.mongodb.MapReduceOutput;
import com.mongodb.Mongo;
import com.mongodb.util.JSON;

public class maprec {

	


			public maprec() {
				  Object str;
				  Object str1;
				  String mon;

				  Mongo mongo;
				  try 
				  {
					  mongo = new Mongo("localhost", 27017);

					  DB db = mongo.getDB("test");
					  
					  DBCollection books = db.getCollection("contacts");
					  
					  DBCollection time = db.getCollection("time1");
					  
					  DBCursor curse = time.find();
					  
					  str = curse.next().get("last_maprecur_time");
				      
					  time.drop();
				      
					  DBCollection timed = db.getCollection("time1");
					  
					  TimeZone tz = TimeZone.getTimeZone("GMT");
				      
					  DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'hh:mm:ss.SSS'Z'");
				      
					  df.setTimeZone(tz);
				      
					  str1 = df.format(new Date());
					  
					  BasicDBObject times = new BasicDBObject();
					  
					  times.put("last_maprecur_time", str1);
					  
					  timed.insert(times);
					  
					  mon = (String) "{ 'dateandtime' : { '$gte' : { '$date' : '"+str+"'}}}";
					  
					  BasicDBObject query = (BasicDBObject) JSON.parse(mon);

					  String map = "function(){emit(this.state,this.pop);}";
					  
					  String reduce = "function(key, values) {return Array.sum(values);}";
					  
					  MapReduceCommand cmd = new MapReduceCommand(books, map, reduce,"contact1", MapReduceCommand.OutputType.REDUCE, query);

					  MapReduceOutput out = books.mapReduce(cmd);

					  for (DBObject o : out.results()) {
						  System.out.println(o.toString());
					  }
					  mongo.close();
				  	} catch (Exception e) {
				  		e.printStackTrace();
				  	}
				  
	}

}
