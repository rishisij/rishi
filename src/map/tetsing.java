package map;
import java.net.UnknownHostException;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;


public class tetsing {

		
	public  tetsing(String z,int f) {
		
		String a=z;
		int k=f;
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
		
		try {
			Mongo mongo = new Mongo("127.0.0.1");
			DB db=mongo.getDB("test");
			DBCollection coll=db.getCollection("burn");
			
			//coll.findAndModify(query, update);
		  for(int j=0;j<c.length;j++)
		  {
		    BasicDBObject query = new BasicDBObject("uniq",c[j]);
		    BasicDBObject update = new BasicDBObject().append("$inc", new BasicDBObject().append("pop", k)); 
		    coll.findAndModify(query, update);
		    DBCursor cursor = coll.find(query);
		    try {
		       while(cursor.hasNext()) {
		           System.out.println(cursor.next());
		       }
		    } 
		    catch(Exception e){
		       cursor.close();
		    }
		  }
		   //System.out.println(db.coll.find());
		} catch (UnknownHostException e) {
			System.out.println("UnKnown host Exception");
		}
		

	}

}


/*BasicDBObject doc = new BasicDBObject("name", "Charlwq").
append("type", "villane").
append("count", 1).
append("info", new BasicDBObject("x", 20).append("y", 12));
*/
