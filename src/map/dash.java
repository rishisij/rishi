package map;
import java.io.*;
import java.util.*;

public class dash {

	public static void main(String[] args) {
		try {
			PrintWriter writer = new PrintWriter("/home/gateway/Documents/191_data/workspace/hadmon/id.properties");
			for(int i=0;i<20000;i++)
			{
				writer.println(i+" "+"US@@AL@@HILLSBORO");
			}
			writer.close();
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
