package dao;
import java.sql.*;
import connector.*;

public class LoginMgr {
	private DBConnectionMgr Connection = null;//DBConnector 연결객체생성
	
	public LoginMgr(){
		try{
			Connection = DBConnectionMgr.getInstance();
		}catch(Exception ex){
			System.out.println("error : db connector error. ");
		}
	}
	//비즈니스메서드
	public boolean PassCheck(String member_id, String member_pw){
		Connection con = null;
		PreparedStatement prstmt = null;
		ResultSet rs = null;		
		boolean result = false;
			
		try {
			con = Connection.getConnection(); //디비연결
			String query = "Select count(*) from members where member_id = ? and member_pw = ?"; //동적데이터 첨부시에는 ?로 둘것
			
			prstmt = con.prepareStatement(query); //prepareStatement(쿼리) 로 미리 쿼리가 들어감.
			
			prstmt.setString(1, member_id); //?자리 에들어갈 파라미터
			prstmt.setString(2, member_pw);//?자리 에들어갈 파라미터
			rs = prstmt.executeQuery(); //쿼리실행
			rs.next();
			if(rs.getInt(1) > 0) result = true;
			
			
		} catch (Exception e) {
			System.out.println("error:"+e);
			// TODO Auto-generated catch block
		}finally{
			Connection.freeConnection(con, prstmt, rs);
		}
		return result;	
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
