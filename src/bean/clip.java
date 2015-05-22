package bean;

import java.io.Serializable;

/*public class clip {
	private String clip_code;
	private String mapx;
	private String mapy;
	
	public clip(String clip_code, String mapx, String mapy) {
		// TODO Auto-generated constructor stub
	}
	public String getClip_code() {
		return clip_code;
	}
	public void setClip_code(String clip_code) {
		this.clip_code = clip_code;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	
}
	*/
public class clip implements Serializable{
    String clip_code;
    String mapx;
    String mapy;
   
    public clip(){
    }
    public clip(String clip_code, String mapx, String mapy) 
    {
        this.clip_code = clip_code;
        this.mapx = mapx;
        this.mapy = mapy;
    }
    public void setClip_code(String clip_code){this.clip_code = clip_code;}
    public void setMapx(String mapx){this.mapx = mapx;}
    public void setMapy(String mapy){this.mapy = mapy;}
   
    public String getClip_code(){return clip_code;}
    public String getMapx(){return mapx;}
    public String getMapy(){return mapy;}
   }


