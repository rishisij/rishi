package map;

import java.net.UnknownHostException;

import com.mongodb.*;

import org.junit.*;
public class testdbref {
	public static void main(String[] args)
	{
		/*Mongo mongo = new Mongo();
		DB db=mongo.getDB("test");
		DBCollection coll = new DBCollection("places");
		BasicDBObject query =   new BasicDBObject("name","Broadway Center");
		DBObject db_object =  coll.findOne(coll,query);
		DBRef myDbRef = new DBRef(db,"collectionB",db_object); 
		DBObject doc = myDbRef.fetch(); 
		System.out.println(doc);*/
		Mongo mongo;
		try {
			mongo = new Mongo();
			DB db=mongo.getDB("test");
			DBCollection coll = db.getCollection("collectionss");
	        BasicDBObject obj = new BasicDBObject("_id", 321325243);
	        coll.save(obj);

	        DBRef ref = new DBRef(db, coll.getName(), 321325243);
	        System.out.println(ref);
	        DBObject deref = ref.fetch();
	        System.out.println(deref);
	        assertTrue(deref != null);
	        assertEquals(321325243, ((Number)deref.get("_id")).intValue());

	        DBObject refobj = BasicDBObjectBuilder.start().add("$ref", coll.getName()).add("$id", 321325243).get();
	        System.out.println(refobj);
	        deref = DBRef.fetch(db, refobj);
	        System.out.println(deref);
	        assertTrue(deref != null);
	        assertEquals(321325243, ((Number)deref.get("_id")).intValue());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		
	}

	private static void assertEquals(int i, int intValue) {
		
	}

	private static void assertTrue(boolean b){
		
	}
}
