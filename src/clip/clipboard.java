package clip;

import java.util.ArrayList;

public class clipboard {

   public String contentID;
   public ArrayList<String> listContents = new ArrayList<String>(); 
   
   /*public void setClip(String s)
   {
      this.contentID = s;
   }
   
   public String getClip()
   {
      return contentID;
   }*/
   
   public void addClip(String s)
   {
      if(!listContents.contains(s))
      {
         listContents.add(s);
      }
   }
   public ArrayList<String> getList()
   {
      return listContents;
   }
   
   public void deleteClip(String s)
   {
      if(listContents.contains(s))
      {
         listContents.remove(s);
      }
   }
   
}