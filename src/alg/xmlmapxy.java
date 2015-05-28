package alg;
import java.io.IOException;
//import java.io.ObjectInputStream.GetField;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.Stack;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import java.lang.NullPointerException;








import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException; 

import com.mysql.jdbc.PreparedStatement;

public class xmlmapxy {
   
   
   private int numberOfNodes;
   private Stack<Integer> stack;
   public int T, tnow;
   public int time_windows[][];
   public int stay_time[];
private boolean flag;
private Statement stmt;
private int[] uprowcounts;
private Statement stmt2;
   //public static int List[][];
   public xmlmapxy()
   {
       stack = new Stack<Integer>();
   }
   
   public static String plan_code;
      
      public static String getPlan_code() {
      return plan_code;
      }
     public static void setPlan_code(String plan_code) throws SQLException, SAXException, IOException, ParserConfigurationException {
         xmlmapxy.plan_code = plan_code;
         System.out.println(plan_code);
      //return plan_code;
         xmlmapxy.main(null, plan_code);
      }
   
   
   
   public static void main(String[] args, String plan_code) throws SQLException, SAXException, IOException, ParserConfigurationException {
      
      
       //String plancode = getPlan_code(plan_code);
      //System.out.println(plancode);
      
      
        ArrayList<clip> list = new ArrayList<clip>();
        //List<Person> personlist = new List<Person>();
        try {
            // Step 1: Load the JDBC driver. jdbc:mysql://localhost:3306/travel
            Class.forName("com.mysql.jdbc.Driver");
 
            // Step 2: Establish the connection to the database.
            String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";
            Connection conn = DriverManager.getConnection(url, "user2015", "!user2015");
            Statement st = conn.createStatement();
            //ResultSet srs = st.executeQuery("select * from clipboard where plan_code = '" + plan_code +"'");
            ResultSet srs = st.executeQuery("select * from clipboard");
            while (srs.next()) {
               clip place = new clip(null, null, null);
               place.setClip_code(srs.getString("clip_code"));
               place.setMapy(srs.getString("mapy"));
               place.setMapx(srs.getString("mapx"));
               place.setContentid(srs.getString("contentid"));
               place.setContenttypeid(srs.getInt("contenttypeid"));
               place.setClipstay(srs.getInt("clip_stay"));
                list.add(place);
            }
 
            System.out.println(list.size());
            
           /*for(int i=0;i<list.size();i++){
                //System.out.println(list.get(i)); // 이렇게 하니깐 위치값 출력
                

            System.out.println(list.get(i).getClip_code());
            System.out.println(list.get(i).getMapy());
            System.out.println(list.get(i).getMapx()); 
           
           // System.out.println(list.get(0));
            }*/
         
               
        //System.out.println(list.);
        } catch (Exception e) {
            System.err.println("Got an exception! ");
            System.err.println(e.getMessage());
        }
    //}
   
    //public void openapi(String[] args)throws SAXException, IOException, ParserConfigurationException {
        //String path = FileReaderTestgetPath();
        //FileReader file = new FileReader(path + "test.json");
       DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
         DocumentBuilder builder = factory.newDocumentBuilder();
         int adjacency_matrix[][] = new int[list.size()+1][list.size()+1];
         String timewindows[][]= new String[list.size()+1][2+1];
          int time_windows[][]= new int[list.size()+1][2+1];
          int time[][]= new int[list.size()+1][2+1];
         for(int s=1;s<=list.size();s++){
            for(int e=1;e<=list.size();e++){
               //String adjacency_matrix[][] = new String[list.size() + 1][list.size() + 1];
               
               //if(s==e){System.out.println(999);}
               if(s==e){adjacency_matrix[s][e] = 999;}
               else{
                  
         Document doc = builder.parse("C:/Users/Owner/workspace/backpackers/WebContent/apixml/"

 + "SY="+ list.get(s-1).getMapy()  
  //+ "SY="+ List[1][1]  

 + "&SX="+ list.get(s-1).getMapx()  

 + "&EY="+ list.get(e-1).getMapy()
 + "&EX=" + list.get(e-1).getMapx()
               //+ "SY="+ 37.505157232495456   // 온도 표시 C or F

                //+ "&SX="+ 127.05709893474192   // 국가 

                //+ "&EY="+ 37.551111761905204
                //+ "&EX=" + 126.98784838350313
          + ".xml");  // 도시
          
          
/*
         Document doc = builder.parse("http://api.openapi.io/traffic/appletree/v1/0/Path/PathSearch_Exit.asp?"

          + "SY="+ list.get(s-1).getMapy()    // 온도 표시 C or F

          + "&SX="+list.get(s-1).getMapx()    // 국가 

          + "&EY="+ list.get(e-1).getMapy()
          + "&EX=" + list.get(e-1).getMapx()
          + "&x_api_key=" + mapxy.get(s)
          //+ "SY="+ 37.505157232495456   // 온도 표시 C or
           //+ "&SX="+ 127.05709893474192   // 국가 

           //+ "&EY="+ 37.551111761905204
           //+ "&EX=" + 126.98784838350313
     + "&changeCount=5&optCount=1&resultCount=10&OPT=0&encoding=utf- 8&output=xml&radius=700:2000&weightTime=10:5:5:10:10:5&svcid=f78480bc1c06734607e4c7107d0642f3");  // 도시
          
          */
         //System.out.println(mapxy.get(s));
      //xml??????
      
      NodeList list1 = doc.getElementsByTagName("info");
        for(int j=0; j<list1.getLength(); j++){
         for(Node node = list1.item(j).getFirstChild(); node!=null; node=node.getNextSibling()){
            if (node.getNodeName().equals("totalTime")){
               
               
               adjacency_matrix[s][e] = Integer.valueOf(node.getTextContent());
               
               
               
               
               
               }
               /*if (node.getNodeName().equals("payment")){
                  //System.out.println("----------");
                  System.out.println(node.getTextContent());
               }*/
         }
         
         /*NodeList list2 = doc.getElementsByTagName("subPath");
                 for(int j=0; j<list2.getLength(); j++){
                  for(Node node2 = list2.item(j).getFirstChild(); node2!=null; 

node2=node2.getNextSibling()){
                     if (node2.getNodeName().equals("startX")){
                        System.out.println("===="+node2.getTextContent()+"====");}
                        if (node2.getNodeName().equals("startY")){
                           //System.out.println("----------");
                           System.out.println(node2.getTextContent());
                        }
                        if (node2.getNodeName().equals("endX")){
                           System.out.println("===="+node2.getTextContent

()+"====");}
                           if (node2.getNodeName().equals("endY")){
                              //System.out.println("----------");
                              System.out.println(node2.getTextContent());
                           }
                  }
                 }*/
            
            
            }
         }//else
               System.out.print (adjacency_matrix[s][e]+" ");
               
               
                      
             }//for문e
            System.out.println();
         }//for문s
   
//////////////////////////////////////////////
       //  System.out.println("Enter the time windows");
         for(int s=1;s<=list.size();s++){
            
            Document doc = builder.parse("http://api.visitkorea.or.kr/openapi/service/rest/EngService/detailIntro?ServiceKey=vs3Y%2Fm4qc9WmDzyaJyRtihhpYfhEAMtgaZHZPOt1quhUS27jSkmk%2FSIF7ZnAtfy6NqzC1Gvw7BiWxVbJgnQ%2Bvw%3D%3D"
                  +"&contentId="+ list.get(s-1).getContentid()
                  +"&contentTypeId="+list.get(s-1).getContenttypeid()
                  +"&introYN=Y&MobileOS=ETC&MobileApp=AppTesting");
            
                       
//xml??????

NodeList list1 = doc.getElementsByTagName("item");
for(int j=0; j<list1.getLength(); j++){
   for(Node node = list1.item(j).getFirstChild(); node!=null; node=node.getNextSibling()){
      if (node.getNodeName().equals("usetime")){
         timewindows[s][1] = String.valueOf(node.getTextContent());
         
         //System.out.print ("attractionusetime"+node.getTextContent()+" ");
         //System.out.print ("\n");
         //System.out.print ("------------------------");
         }
if (node.getNodeName().equals("opentimefood")){
timewindows[s][1] = String.valueOf(node.getTextContent());
         //System.out.print ("opentimefood"+node.getTextContent()+" ");
         //System.out.print ("\n");
         //System.out.print ("------------------------");
         }
if (node.getNodeName().equals("opentime")){
timewindows[s][1] = String.valueOf(node.getTextContent());
//System.out.print ("shoppingopentime"+node.getTextContent()+" ");
//System.out.print ("\n");
//System.out.print ("------------------------");
}
if (node.getNodeName().equals("checkintime")){
timewindows[s][1] = String.valueOf(node.getTextContent());
//System.out.print ("checkintime"+node.getTextContent()+" ");
//System.out.print ("\n");
//System.out.print ("------------------------");
}
if (node.getNodeName().equals("checkouttime")){
timewindows[s][2] = String.valueOf(node.getTextContent());
//System.out.print ("checkouttime"+node.getTextContent()+" ");
//System.out.print ("\n");
//System.out.print ("------------------------");
}
         /*if (node.getNodeName().equals("payment")){
            //System.out.println("----------");
            System.out.println(node.getTextContent());
         }*/
   }
   
   
      
      } //xml파서 j for문
// System.out.print (time_windows[s][1]+time_windows[s][2]+" ");
//      System.out.println();
      

      String str = timewindows[s][1]+timewindows[s][2];
      //xmlmapxy tw = new xmlmapxy();
      xmlmapxy.getOnlyDigit2(str);
      //System.out.println("원본 1: " + str);
      //System.out.println("방법 1 (정규표현식): " + getOnlyDigit1(str)); // 정규표현식을 이용한 형태
      //System.out.println("방법 2 (Character class 의 함수이용): " + getOnlyDigit2(str)); 
      //System.out.println(getOnlyDigit2(str).substring(0,4));
      
      //String b = getOnlyDigit2(str).substring(5,8);
      if(getOnlyDigit2(str) == "" ){
         int start = 0;
         //int start = Integer.valueOf(nostart);
         
         //System.out.println("nostart="+start);
         time[s][1]=start;
      }
      else{
         String start = getOnlyDigit2(str).substring(0,2);
         String startminutes = getOnlyDigit2(str).substring(2,4);
         //int start = Integer.valueOf(a);
         //System.out.println("start="+start);
         time[s][1]=Integer.valueOf(start)*60+Integer.valueOf(startminutes);
      }
      
      if(getOnlyDigit2(str) == "" ){
         String end = "1440";
         //int start = Integer.valueOf(nostart);
         
         //System.out.println("noend="+end);
         time[s][2]=Integer.valueOf(end);
      }
      else{
         String end = getOnlyDigit2(str).substring(4,6);
         String endminutes = getOnlyDigit2(str).substring(6,8);
         //int start = Integer.valueOf(a);
         //System.out.println("end="+end);
         time[s][2]=Integer.valueOf(end)*60+Integer.valueOf(endminutes);
      }
      /*
if(time[s][1]>time[s][2]&&time[s][2]<360){
time[s][2]=1440;
      }
else if(time[s][1]>time[s][2]&&time[s][2]>=360){
   time[s][1]=0;
}*/
      //System.out.println("start end ");
      System.out.println(time[s][1]+"\t");
      System.out.println(time[s][2]);
     // System.out.println("end="+time[s][2]);
      
      time_windows[s][1]= time[s][1];
      time_windows[s][2]= time[s][2];
       
            }//for문s
         
         
         
         
         
         
         
         
           //int number_of_nodes;
         //int number_of_nodes;
           Scanner scanner = null;
           try
           {
              // System.out.println("Enter the number of nodes in the graph");
               scanner = new Scanner(System.in);    // 노드 입력하려고 하는 것
               //number_of_nodes = scanner.nextInt(); 
               
              // int adjacency_matrix[][] = new int[number_of_nodes + 1][number_of_nodes + 1];
             //  System.out.println("Enter Departure Time in your schedule");
               int T = 540;
               int stay_time[]= new int[list.size()+1]; 
           //    System.out.println("Enter the stay time at nodes");
               for (int z = 1; z <=  list.size(); z++)
               {
                   //stay_time[z] = scanner.nextInt();
                   stay_time[z] = list.get(z-1).getClipstay();
                   System.out.println("stay time=");
                   System.out.println(stay_time[z]+ "\t" );
               }
               
             
              // int time_windows[][]= new int[list.size()+1][2+1];     // size...
               //System.out.println("Enter the time windows");
           
              // for (int x = 1; x <= list.size(); x++)
               //{
                     
                 //  for (int y = 1; y <= 2; y++)
                   //{
                      //checknumber tw = new checknumber();
                      //int listsize=list.size();
                      //String timewindows[][]= new String[list.size()+1][2+1];
                      //checknumber.main(args);
                      //timewindow.tw(timewindows, time_window, listsize);
                      
                       
                      //time_windows[x][y] =  ; 
                   //}
              
              // }   

               
            
               /*System.out.println("Enter the adjacency matrix");
               
               for (int i = 1; i <=list.size(); i++)
               {
                   for (int j = 1; j <= list.size(); j++)
                   {
                       adjacency_matrix[i][j] = scanner.nextInt();
                   }
               }
                  for (int i = 1; i <=list.size(); i++)
                 {
                   for (int j = 1; j <= list.size(); j++)
                   {
                       if (adjacency_matrix[i][j] == 1 && adjacency_matrix[j][i] == 0)
                       {
                           adjacency_matrix[j][i] = 1;          // 돌아가지 않기 위한 식.( 갔다가 돌아올 수도 있음)
                       }
                   }
               }                      // matrix 입력 값
               
               System.out.println("The citys are visited as follows");
              */
                             // size...
                         
                        
                       xmlmapxy travel = new xmlmapxy();
                       travel.tsp(adjacency_matrix, time_windows, T, stay_time);
         
               }
            catch (InputMismatchException inputMismatch)
            {
                System.out.println("Wrong Input format");   // 숫자가 아닌 다른 값을 입력하면, 프로그램이 정지 됨.
            }
           scanner.close();
       }             
   public static String getOnlyDigit2(String str) {

      if (str != null && str.length() != 0) {
         String tmpStr = ""; //
         char[] chArr = str.toCharArray();
         int cntcharrTelno = chArr.length;
         for (int i = 0; i < cntcharrTelno; i++) {
            if (Character.isDigit((chArr[i]))) {
               tmpStr += chArr[i];
            }
         }
         return tmpStr;
         
      } else {
         return "";
      }
      
   }
   
       public void tsp(int adjacencyMatrix[][], int timewindow[][], int tnow, int staytime[])
       {
           ArrayList<clip> list = new ArrayList<clip>();
            //List<Person> personlist = new List<Person>();
            try {
                // Step 1: Load the JDBC driver. jdbc:mysql://localhost:3306/travel
                Class.forName("com.mysql.jdbc.Driver");
     
                // Step 2: Establish the connection to the database.
                String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";
                Connection conn = DriverManager.getConnection(url, "user2015", "!user2015");
                Statement st = conn.createStatement();
                ResultSet srs = st.executeQuery("SELECT * FROM clipboard");
                while (srs.next()) {
                   clip place = new clip(null, null, null);
                   place.setClip_code(srs.getString("clip_code"));
                   place.setMapy(srs.getString("mapy"));
                   place.setMapx(srs.getString("mapx"));
                   place.setContentid(srs.getString("contentid"));
                   place.setContenttypeid(srs.getInt("contenttypeid"));
                   place.setClipstay(srs.getInt("clip_stay"));
                    list.add(place);
                    
                }
                
               // System.out.println(list.size());
                
               /*for(int i=0;i<list.size();i++){
                    //System.out.println(list.get(i)); // 이렇게 하니깐 위치값 출력
                    

                System.out.println(list.get(i).getClip_code());
                System.out.println(list.get(i).getMapy());
                System.out.println(list.get(i).getMapx()); 
               
               // System.out.println(list.get(0));
                }*/
             
                   
            //System.out.println(list.);
            } catch (Exception e) {
                System.err.println("Got an exception! ");
                System.err.println(e.getMessage());
            }
          
          
          
          this.time_windows = timewindow;
          this.tnow = tnow;
          this.stay_time=staytime;
          
           numberOfNodes = adjacencyMatrix[1].length - 1;
           int[] visited = new int[numberOfNodes + 1];
           int fgettime=0, fexcesstime=0;
           
           if(time_windows[1][1]< time_windows[1][2]){
               if (tnow>= (time_windows[1][1]/*-9999*/) 
               				&& tnow + staytime[1]<= time_windows[1][2]/*+9999*/ 
               						&& visited[1] == 0){
               visited[1] = 1;
               System.out.print(1 + "\t");
               	if(tnow<=time_windows[1][1]){
               	
               	fgettime=time_windows[1][1]-tnow;
               	
               }
               int outtime = tnow + staytime[1];
               if(outtime>time_windows[1][2]){
               	fexcesstime = time_windows[1][2]-outtime;
               	
               	
               }
               tnow=tnow+staytime[1]+fgettime-fexcesstime;
               
               stack.push(numberOfNodes);
               stack.push(1);
               }
               
               }
               else if((tnow>= (time_windows[1][1]/*-9999*/) 
               		&& visited[1] == 0)
           				|| (tnow + staytime[1]<= time_windows[1][2]/*+9999*/
           				&& visited[1] == 0)){
           visited[1] = 1;
           System.out.print(1 + "\t");
           if(tnow<=time_windows[1][1]
           		&&tnow>=time_windows[1][2]){
           	
           	fgettime=time_windows[1][1]-tnow;
           	System.out.println("fgettime"+fgettime);
           }
           int outtime = tnow + staytime[1];
           if(outtime>time_windows[1][2]
           		&&tnow<=time_windows[1][1]){
           	fexcesstime = time_windows[1][2]-outtime;
           	System.out.println("fexcesstime"+fexcesstime);
           	
           }
           tnow=tnow+staytime[1]+fgettime-fexcesstime;
           System.out.println("tnow"+tnow);
           stack.push(numberOfNodes);
           stack.push(1);
           } 
            
           int element, dst = 0, i;
           int min = Integer.MAX_VALUE;
           int Sum = staytime[1] , Sum_waiting = 0, Sum_excesstime=0, totalMin=0, t, S;
           boolean minFlag = false;
           
           //System.out.print(1 + "\t");
           //System.out.print(list.get(0).getMapy()+ "\t"); 
            //System.out.print(list.get(0).getMapx()+ "\t"); 
            //System.out.print(list.get(0).getContentid()+ "\n");
            flag = false;
            //PreparedStatement pstmt = null;
           try{
           String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";
           Connection conn = DriverManager.getConnection(url, "user2015", "!user2015");
            stmt = conn.createStatement();
            String sql = "insert into path(path_code, path_node, contentid, mapy, mapx) values(?,?,?,?,?)";
             java.sql.PreparedStatement pstmt = conn.prepareStatement(sql);
             pstmt.setString(1,list.get(0).getClip_code());
             pstmt.setInt(2,1);
             pstmt.setString(3,list.get(0).getContentid());
             pstmt.setString(4,list.get(0).getMapy());
             pstmt.setString(5,list.get(0).getMapx());
          
          int count = pstmt.executeUpdate(); //insert sql문은 결과값이 처리된 데이터 숫자이다.
         if(count >0){
            flag = true;
              }
       }catch (Exception e) {
           System.err.println("Got an exception! ");
           System.err.println(e.getMessage());
       }
            
            
           while (!stack.isEmpty() )
           {   
               element = stack.peek();
               min = Integer.MAX_VALUE;
               i = 1;
               while (i <= (numberOfNodes-1))
               {                       
                  /* System.out.println("adj : "+adjacencyMatrix[element][i]);
                   System.out.println("tnow : "+tnow);
                   System.out.println("timewindow1: "+time_windows[i][1]);
                   System.out.println("timewindow2: "+time_windows[i][2]); */
                  if(time_windows[i][1]< time_windows[i][2]){
                  if (adjacencyMatrix[element][i] > 1 
                         && tnow + adjacencyMatrix[element][i]>= (time_windows[i][1]/*-9999*/) 
                               && tnow + adjacencyMatrix[element][i] + staytime[i]<= time_windows[i][2]/*+9999*/ 
                                     && visited[i] == 0)
                   {
                      
                       if (min > (adjacencyMatrix[element][i]/*+adjacencyMatrix[i][numberOfNodes]*/))
                       {
                           min = (adjacencyMatrix[element][i]/*+adjacencyMatrix[i][numberOfNodes]*/);
                           dst = i;
                           minFlag = true;

                           
                       } 

                          

                   }       // 1번 노드로부터 7번 노드까지 갈 때, 가장 적은 값으로 적은 edge를 선택.
                  
                 
                  
               } 
               
              // if(time_windows[i][1]> time_windows[i][2]){
                  else if ((adjacencyMatrix[element][i] > 1 
                          && tnow + adjacencyMatrix[element][i]>= (time_windows[i][1]/*-9999*/) 	
                          		&& visited[i] == 0)
                                || (tnow + adjacencyMatrix[element][i] + staytime[i]<= time_windows[i][2]/*+9999*/ 
                              		  && visited[i] == 0
                              				  && adjacencyMatrix[element][i] > 1) 
                                      )
                    {
                       
                        if (min > (adjacencyMatrix[element][i]/*+adjacencyMatrix[i][numberOfNodes]*/))
                        {
                            min = (adjacencyMatrix[element][i]/*+adjacencyMatrix[i][numberOfNodes]*/);
                            dst = i;
                            minFlag = true;

                            
                        } 

                           

                    }       // 1번 노드로부터 7번 노드까지 갈 때, 가장 적은 값으로 적은 edge를 선택.
                   
                    i++;
                  
              } 
               if (minFlag)
               {   
                  int Min=min;
                        int semitime=tnow;
                            int   arrivaltime=semitime+adjacencyMatrix[element][dst];
                            int gettime=0, excesstime=0;
                            
                            if(time_windows[dst][1]< time_windows[dst][2]){
                            if(arrivaltime<=time_windows[dst][1]){
                              
                              gettime=time_windows[dst][1]-arrivaltime;
                           }
                            }
                            else{
                       		 if(arrivaltime<=time_windows[dst][1]
                       		    		&&arrivaltime>=time_windows[dst][2]){
                       		    	
                       			 gettime=time_windows[dst][1]-arrivaltime; 
                       		    	System.out.println("gettime"+gettime);
                       		    }
                            int outtime = arrivaltime + staytime[dst];
                            if(outtime>time_windows[dst][2]
                         			&&tnow<=time_windows[dst][1]){
                         		excesstime = time_windows[dst][2]-outtime;
                         		System.out.println("excesstime"+excesstime);
                         		
                         	}
                            }
                           
                   visited[dst] = 1;
                   stack.push(dst);

                   System.out.print(dst + "\t");
                  // System.out.print(dst + "\t");
                   //System.out.print(list.get(dst-1).getMapy()+ "\t"); 
                   //System.out.print(list.get(dst-1).getMapx()+ "\t");
                   //System.out.print(list.get(dst-1).getContentid()+ "\t"); 
                   
                   
                   
                   
                   
                   
                   ArrayList<String> list1 = new ArrayList<String>();
                  // clip student1;
                   
                   //a = new clip(list.get(dst-1).getMapy(),list.get(dst-1).getMapx(), null);   
                   

                   
                   
                          list1.add(list.get(dst-1).getClip_code());
                   list1.add(Integer.toString(stack.size()-1));
                           //list1.add(Integer.toString(dst));
                           list1.add(list.get(dst-1).getContentid());
                          list1.add(list.get(dst-1).getMapy());
                          list1.add(list.get(dst-1).getMapx());
                         
                          
                          
                          //System.out.print(list1.get(0).getMapx()+ "\t"); 
                          //System.out.print(list1.get(dst-1).getMapx()+ "\t"); 
            
                       //System.out.println(list1);
                         
                       
                       flag = false;
                       
                       //PreparedStatement pstmt = null;
                       try{
                       String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true&amp;relaxAutoCommit=true";
                       Connection conn = DriverManager.getConnection(url, "user2015", "!user2015");
                        stmt = conn.createStatement();
                        stmt2 = conn.createStatement();
                       // if(conn != null) conn.rollback();

                        conn.setAutoCommit(false);
                        String sql = "insert into path(path_code, path_node, contentid, mapy, mapx) values(?,?,?,?,?)";
                        String sql2 = "select count(*)+001 as COUNT from path"; 
                        java.sql.PreparedStatement pstmt = conn.prepareStatement(sql);
                         java.sql.PreparedStatement pstmt2 = conn.prepareStatement(sql2);
                         
                        // System.out.println(list1);
                       /*  for(int s=0;s<5;s++){
                            list1.get(s);
                            
                         pstmt.setString(s+1,list1.get(s));
                       */  
                         
                         pstmt.setString(1,list1.get(0));
                         pstmt.setString(2,list1.get(1));
                         pstmt.setString(3,list1.get(2));
                         pstmt.setString(4,list1.get(3));
                         pstmt.setString(5,list1.get(4));
                         pstmt.addBatch();
                        uprowcounts = pstmt.executeBatch();
                         conn.commit();
                       int count = pstmt.executeUpdate(); //insert sql문은 결과값이 처리된 데이터 숫자이다.
                  if(count >0){
                     flag = true;
                     }
                      
                            /*pstmt.setString(1, list.get(dst-1).getClip_code());
                            pstmt.setInt(2, dst);
                            pstmt.setString(3, list.get(dst-1).getContentid());
                            pstmt.setString(4, list.get(dst-1).getMapy());
                            pstmt.setString(5, list.get(dst-1).getMapx());
                            pstmt.addBatch(sql);
                            int [] uprowcount = stmt.executeBatch(); // SQL문장 실행
                            conn.commit();
                         */
                   }catch (Exception e) {
                       System.err.println("Got an exception! ");
                       System.err.println(e.getMessage());
                   }
                       
                       
                       
                       
                       
                       
                       
                       
                      /*for(int i=0;i<list.size();i++){
                           //System.out.println(list.get(i)); // 이렇게 하니깐 위치값 출력
                           

                       System.out.println(list.get(i).getClip_code());
                       System.out.println(list.get(i).getMapy());
                       System.out.println(list.get(i).getMapx()); 
                      
                      // System.out.println(list.get(0));
                       }*/
                    
                          
                   //System.out.println(list.);
                   
                 // + "&SX="+ list.get(s-1).getMapx()  

                  //+ "&EY="+ list.get(e-1).getMapy()
                  //+ "&EX=" + list.get(e-1).getMapx()
                   t= Min + tnow + staytime[dst]+gettime-excesstime;//(이동시간 최소+ 현재 시간+ 도착노드 staytime - 초과된 시간)
                   S = Min + Sum + staytime[dst];//(이동시간 최소+staytime)
                   Sum_waiting=Sum_waiting+gettime;
                   Sum_excesstime = Sum_excesstime+ excesstime;
                   totalMin=totalMin+adjacencyMatrix[element][dst];
                  // int M= Min;
                  // int totalMin = M+Min;
                   
                  
                  
                  tnow = t;
                   Sum = S;
                   //System.out.print(Sum+"\t");
                   //System.out.print(tnow+"\t");
                   minFlag = false;
                   continue;
                   // sum
                   
               } 
                       
                  
               
                 stack.pop(); //stack을 뽑기  System.out.print("\n");
             
           }
               int lgettime=0, lexcesstime=0;
               if(time_windows[numberOfNodes][1]< time_windows[numberOfNodes][2]){
                   if (adjacencyMatrix[dst][numberOfNodes] > 1 
                   		&& tnow + adjacencyMatrix[dst][numberOfNodes]>= (time_windows[numberOfNodes][1]/*-9999*/) 
                   				&& tnow + adjacencyMatrix[dst][numberOfNodes] + staytime[numberOfNodes]<= time_windows[numberOfNodes][2]/*+9999*/ 
                   						&& visited[numberOfNodes] == 0){
                   	if(tnow<=time_windows[numberOfNodes][1]){
                       	
                   		lgettime=time_windows[numberOfNodes][1]-tnow;
                       	
                       }
                       int outtime = tnow + staytime[numberOfNodes];
                       if(outtime>time_windows[numberOfNodes][2]){
                       	lexcesstime = time_windows[numberOfNodes][2]-outtime;
                       	
                       	
                       }
                       tnow=tnow+staytime[1]+lgettime-lexcesstime;
                   visited[numberOfNodes] = 1;
                   Sum=Sum+adjacencyMatrix[dst][numberOfNodes]+staytime[numberOfNodes];
                   tnow=tnow+adjacencyMatrix[dst][numberOfNodes]+staytime[numberOfNodes];
                   totalMin=totalMin+adjacencyMatrix[dst][numberOfNodes];
                   System.out.print(numberOfNodes+"\n");}
                   }
                   else  if ((adjacencyMatrix[dst][numberOfNodes] > 1 
                   		&& tnow + adjacencyMatrix[dst][numberOfNodes]>= (time_windows[numberOfNodes][1]/*-9999*/) 
                   		&& visited[numberOfNodes] == 0)
           				|| (adjacencyMatrix[dst][numberOfNodes] > 1
           						&&tnow + adjacencyMatrix[dst][numberOfNodes] + staytime[numberOfNodes]<= time_windows[numberOfNodes][2]/*+9999*/ 
           						&& visited[numberOfNodes] == 0))
           						{    
                   	
                   	if(tnow<=time_windows[numberOfNodes][1]
                       		&&tnow>=time_windows[numberOfNodes][2]){
                       	
                   		lgettime=time_windows[numberOfNodes][1]-tnow;
                       	System.out.println("lgettime"+lgettime);
                       }
                       int outtime = tnow + staytime[numberOfNodes];
                       if(outtime>time_windows[numberOfNodes][2]
                       		&&tnow<=time_windows[numberOfNodes][1]){
                       	lexcesstime = time_windows[numberOfNodes][2]-outtime;
                       	System.out.println("lexcesstime"+lexcesstime);
                       	
                       }
                       
                       tnow=tnow+staytime[1]+lgettime-lexcesstime;
           		visited[numberOfNodes] = 1;
           		Sum=Sum+adjacencyMatrix[dst][numberOfNodes]+staytime[numberOfNodes];
           		tnow=tnow+adjacencyMatrix[dst][numberOfNodes]+staytime[numberOfNodes];
           		totalMin=totalMin+adjacencyMatrix[dst][numberOfNodes];
           		System.out.print(numberOfNodes+"\n");}
           
           //System.out.print(numberOfNodes+ "\t");
           //System.out.print(list.get(numberOfNodes-1).getMapy()+ "\t"); 
            //System.out.print(list.get(numberOfNodes-1).getMapx()+ "\t"); 
           // System.out.print(list.get(numberOfNodes-1).getContentid()+ "\n");
            flag = false;
            //PreparedStatement pstmt = null;
           try{
           String url = "jdbc:mysql://203.253.70.34:3306/backpackers?autoReconnect=true";
           Connection conn = DriverManager.getConnection(url, "user2015", "!user2015");
            stmt = conn.createStatement();
            String sql = "insert into path(path_code, path_node, contentid, mapy, mapx) values(?,?,?,?,?)";
             java.sql.PreparedStatement pstmt = conn.prepareStatement(sql);
             
             pstmt.setString(1,list.get(numberOfNodes-1).getClip_code());
             pstmt.setInt(2,numberOfNodes);
             pstmt.setString(3,list.get(numberOfNodes-1).getContentid());
             pstmt.setString(4,list.get(numberOfNodes-1).getMapy());
             pstmt.setString(5,list.get(numberOfNodes-1).getMapx());
          
          int count = pstmt.executeUpdate(); //insert sql문은 결과값이 처리된 데이터 숫자이다.
         if(count >0){
            flag = true;
              }
       }catch (Exception e) {
           System.err.println("Got an exception! ");
           System.err.println(e.getMessage());
       }
            
  
            
           System.out.print("Total travel time is : ");//총 여행시간
           System.out.print(Sum);
           System.out.print("\n");
           System.out.print("Total transportation time is : ");//총 이동시간
           System.out.print(totalMin);
           System.out.print("\n");
           System.out.print("travel end time is : ");//총 여행 끝나는 시간
           System.out.print(tnow);
           System.out.print("\n");
           System.out.print("Total waiting time is : ");
           System.out.print(Sum_waiting);
           System.out.print("\n");
           System.out.print("Total excess time is : ");
           System.out.print(Sum_excesstime);
           System.out.print("\n");
           System.out.print("You can't go to : ");
           for(int a=1; a<=numberOfNodes; a++ ){
               if(visited[a] == 0){
                    System.out.print(a +"\t");
               }
           }
       }
}

        