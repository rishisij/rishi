package map;
import java.util.Date;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MapReduceCommand;
import com.mongodb.MapReduceOutput;
import com.mongodb.Mongo;

public class mapr {

	public mapr() {

		  Mongo mongo;
		  try 
		  {
			  mongo = new Mongo("localhost", 27017);
			  DB db = mongo.getDB("test");
			  DBCollection books = db.getCollection("contacts");
		      DBCollection time = db.getCollection("time");
		      time.drop();
			  Date dt=new Date();
			  BasicDBObject times = new BasicDBObject();
			  times.put("last_map_time", dt);
			  time.insert(times);
			  //BasicDBObject query = new BasicDBObject("pages", new BasicDBObject("$gt", 400));
		   
			  String map = "function(){emit(this.state,this.pop);}";
		   
			  String reduce = "function(key, values) { return Array.sum(values); } ";
			  
		   
			  MapReduceCommand cmd = new MapReduceCommand(books, map, reduce,
					  "contact1", MapReduceCommand.OutputType.MERGE, null);

			  MapReduceOutput out = books.mapReduce(cmd);

			  for (DBObject o : out.results()) {
				  System.out.println(o.toString());
			  }
		  	} catch (Exception e) {
		  		e.printStackTrace();
		  	}
	 }
}
