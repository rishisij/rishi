package map;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.mail.internet.MimeUtility;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
 
public class PdfToBase64 {
 
/**
* @param args
*/
public static void main(String[] args) {
try {
 Mongo mongo = new Mongo();
 DB db = mongo.getDB("twitt");
 DBCollection coll = db.getCollection("twitty");
InputStream inputStream = new FileInputStream("/home/gateway/Downloads/Tutorial.pdf");
ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
 
int data;
 
while ((data = inputStream.read()) >= 0) {
 
outputStream.write(data);
 
}
 
inputStream.close();
 
OutputStream base64OutputStream = MimeUtility.encode(outputStream,"base64");
 
base64OutputStream.write(outputStream.toByteArray());
BasicDBObject query = new BasicDBObject("name",outputStream.toByteArray());
 coll.insert(query);
base64OutputStream.close();
 
System.out.println("encoded String " + outputStream.toString());
 
FileOutputStream fop = null;
 
File file;
 
file = new File("/home/gateway/Downloads/Tutorial12.pdf");
 
fop = new FileOutputStream(file);
 
byte[] contentInBytes = outputStream.toByteArray();
 
fop.write(contentInBytes);
 
fop.flush();
 
fop.close();
 
System.out.println("Done");
 
} catch (Exception ex) {
 
System.out.println("Exception" + ex.getMessage());
 
}
 
}
 
}