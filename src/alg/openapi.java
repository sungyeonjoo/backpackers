package alg;
/*
import java.io.IOException;

import java.io.InputStream;

import java.net.URL;

import java.util.Scanner;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;


public class openapi {
   
       public static void main(String[] args) throws IOException {

        URL url = new URL("http://api.openapi.io/traffic/appletree/v1/0/Path/PathSearch_Exit.asp?"

          + "SY="+ 37.505157232495456   // 온도 표시 C or F

          + "&SX="+ 127.05709893474192   // 국가 

          + "&EY="+ 37.551111761905204
          + "&EX=" + 126.98784838350313
          + "&changeCount=5&optCount=1&resultCount=10&OPT=0&encoding=utf-8&output=xml&radius=700:2000&weightTime=10:5:5:10:10:5&svcid=f78480bc1c06734607e4c7107d0642f3&x_api_key=MjQ1NS0xNDI4NjczNjg3ODI4LWQzYTE2ZDNlLWE0M2QtNDg0MS1hMTZkLTNlYTQzZDI4NDE4MA==");  // 도시

        

        InputStream is = url.openStream();

        

        Scanner sc = new Scanner(is);

        

        while(sc.hasNext()) {

         System.out.println(sc.nextLine());

        }

       }

      }*/



import java.io.IOException;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class openapi{
   /**
    * @param args
    * @throws IOException 
    * @throws SAXException 
    * @throws ParserConfigurationException 
    */
   
   public static void main(String[] args) throws SAXException, IOException, ParserConfigurationException {
      DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
      DocumentBuilder builder = factory.newDocumentBuilder();
      Document doc = builder.parse("http://api.openapi.io/traffic/appletree/v1/0/Path/PathSearch_Exit.asp?"

          + "SY="+ 37.505157232495456   // 온도 표시 C or F

          + "&SX="+ 127.05709893474192   // 국가 

          + "&EY="+ 37.551111761905204
          + "&EX=" + 126.98784838350313
          + "&changeCount=5&optCount=1&resultCount=10&OPT=0&encoding=utf-8&output=xml&radius=700:2000&weightTime=10:5:5:10:10:5&svcid=f78480bc1c06734607e4c7107d0642f3&x_api_key=MjQ1NS0xNDI4NjczNjg3ODI4LWQzYTE2ZDNlLWE0M2QtNDg0MS1hMTZkLTNlYTQzZDI4NDE4MA==");  // 도시

        
      //xml���ϰ��
      
      NodeList list = doc.getElementsByTagName("info");
        for(int i=0; i<list.getLength(); i++){
         for(Node node = list.item(i).getFirstChild(); node!=null; node=node.getNextSibling()){
            if (node.getNodeName().equals("totalTime")){
               System.out.println("===="+node.getTextContent()+"====");}
               if (node.getNodeName().equals("totalWalk")){
                  //System.out.println("----------");
                  System.out.println(node.getTextContent());
               }
            
            /*if(node.getNodeName().equals("totalWalk")){
               for(Node node2 = node.getFirstChild(); node2!=null; node2=node2.getNextSibling()){
                  
                  else if (node2.getNodeName().equals("totalTime")){
                     System.out.println(node2.getTextContent());
                  }
                  else if (node2.getNodeName().equals("totalTime")){
                     System.out.println(node2.getTextContent());
                  }
                  else if (node2.getNodeName().equals("totalTime")){
                     System.out.println(node2.getTextContent());
                  }
                  else if (node2.getNodeName().equals("totalTime")){
                     System.out.println(node2.getTextContent());
                     System.out.println("----------");
                  }
               }
            }*/
         }
        }
   }
   
}



 





      
