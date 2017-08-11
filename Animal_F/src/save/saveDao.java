package save;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import paging.PagingBean;
import paging.PagingUtil;

public class saveDao implements isaveDao {

	private static saveDao saveDao = null;
	
	private saveDao() {}
	
	public static saveDao getInstance(){
		if(saveDao == null){
			saveDao = new saveDao();
		}
		return saveDao;
	}
	
	public Connection getConnection() throws SQLException{
		String url = "jdbc:oracle:thin:@192.168.10.22:1521:xe";
		String user = "hr";
		String pass = "hr";
		Connection conn = DriverManager.getConnection(url, user, pass);
		return conn;
	}
	
	public void close(Connection conn, PreparedStatement psmt, ResultSet rs){
		try {
			if(rs != null){
				rs.close();
			}
			if(conn != null){
				conn.close();
			}
			if(psmt != null){
				psmt.close();
			}			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Override // 게시글 쓰기
	public boolean writeBbs(saveDto bbs) {
	
		String sql = " INSERT INTO SAVEANIMAL "
				+ " (SEQ, USER_NAME, TITLE, FIND_PLEACE1, FIND_PLEACE2, "
				+ " USER_PH, ANIMAL_GENDER, ANIMAL_KIND, FIND_DATE, "
				+ " CONTENT, IMG_NAME, WDATE, READCOUNT, DEL, USER_ID) "
				+ " VALUES(SEQ_SAVEANIMAL.NEXTVAL, ?, ?, ?, ?, "
				+ " ?, ?, ?, ?, ?, ?, SYSDATE, 0, 0, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = getConnection();
			System.out.println("1/6 S writeBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bbs.getUser_name());
			psmt.setString(2, bbs.getTitle());
			psmt.setString(3, bbs.getFind_pleace1());
			psmt.setString(4, bbs.getFind_pleace2());
			psmt.setString(5, bbs.getUser_ph());
			psmt.setString(6, bbs.getAnimal_gender());
			psmt.setString(7, bbs.getAnimal_kind());
			psmt.setString(8, bbs.getFind_date());
			psmt.setString(9, bbs.getContent());
			psmt.setString(10, bbs.getImg_name());
			psmt.setString(11, bbs.getUser_id());
			System.out.println("2/6 S writeBbs");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 S writeBbs");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, null);
			System.out.println("6/6 S writeBbs");
		}
		
		return count>0?true:false;
	}

	@Override //게시글 보기(detail)
	public saveDto getBbs(int seq) {
		//등록인,발견날짜,연락처,성별,발견장소,글제목,내용,이미지
		String sql = " SELECT USER_NAME, FIND_DATE, USER_PH, ANIMAL_GENDER, "
				+ " FIND_PLEACE1, FIND_PLEACE2, TITLE, CONTENT, IMG_NAME, "
				+ " SEQ, DEL, USER_ID, READCOUNT, WDATE, ANIMAL_KIND "
				+ " FROM SAVEANIMAL "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		saveDto dto = null;
		
		try {
			conn = getConnection();
			System.out.println("1/6 S getBbs");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 S getBbs");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 S getBbs");
			
			if(rs.next()){
			 /*" SELECT USER_NAME 1, FIND_DATE 2, USER_PH 3, ANIMAL_GENDER 4 "
			 " FIND_PLEACE1 5, FIND_PLEACE2 6, TITLE 7, CONTENT 8, IMG_NAME 9 "
			 " SEQ 10, DEL 11, USER_ID 12, READCOUNT 13, WDATE 14, ANIMAL_KIND 15 "*/
				dto = new saveDto(rs.getString(1),	//user_name, 1
								rs.getString(12),	//user_id, 12
								rs.getString(3),	//user_ph, 3
								rs.getString(2),	//find_date, 2
								rs.getString(5),	//find_pleace1, 5
								rs.getString(6),	//find_pleace2, 6
								rs.getString(15),	//animal_kind, 15
								rs.getString(4),	//animal_gender, 4
								rs.getString(7),	//title, 7
								rs.getString(8),	//content, 8
								rs.getString(9),	//img_name, 9
								rs.getString(14),	//wdate, 14
								rs.getInt(13),	//readcount, 13 int
								rs.getInt(10),	//seq, 10 int
								rs.getInt(11)	//del 11 int
								);
			}
			System.out.println("4/6 S getBbs");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, rs);
			System.out.println("6/6 S getBbs");
		}
		
		return dto;
	}

	@Override
	public void readCount(int seq) {
		String sql = " UPDATE SAVEANIMAL "
				+ " SET READCOUNT=READCOUNT+1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			System.out.println("1/6 S readCount");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 S readCount");
			
			psmt.executeUpdate();
			System.out.println("3/6 S readCount");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, null);
			System.out.println("6/6 S readCount");
		}
	}

	@Override
	public List<saveDto> getBbsList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<saveDto> getBbsPagingList(PagingBean paging) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<saveDto> bbslist = new ArrayList<>();
		
		try {
			conn = getConnection();
			System.out.println("1/6 S getBbsPagingList");
			
			String totalSql = " SELECT COUNT(SEQ) FROM SAVEANIMAL ";
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);	// row의 총 갯수
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging);
			
			psmt.close();
			rs.close();
			
			String sql = "SELECT * FROM ( SELECT * FROM ( SELECT * FROM SAVEANIMAL ORDER BY SEQ)" 
					+ " WHERE ROWNUM <=" + paging.getStartNum() + "ORDER BY SEQ DESC)" 
					+ " WHERE ROWNUM <=" + paging.getCountPerPage(); 
			
			System.out.println("sql:" + sql);
			System.out.println("paging.getStartNum :" + paging.getStartNum());
			System.out.println("paging.getCountPerPage :" + paging.getCountPerPage());
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 S getBbsPagingList");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 S getBbsPagingList");
			
			while(rs.next()){
				
				saveDto dto = new saveDto(rs.getString(8),	//user_name, 
										rs.getString(9),		//user_id, 
										rs.getString(10),		//user_ph, 
										rs.getString(11),		//find_date, 
										rs.getString(12),		//find_pleace1, 
										rs.getString(13),		//find_pleace2, 
										rs.getString(14),		//animal_kind, 
										rs.getString(15),		//animal_gender, 
										rs.getString(4),		//title, 
										rs.getString(5),		//content, 
										rs.getString(6),		//img_name, 
										rs.getString(7),		//wdate, 
										rs.getInt(3),			//readcount, 
										rs.getInt(1),			//seq, 
										rs.getInt(2)			//del
										);
				bbslist.add(dto);
			}			
			System.out.println("4/6 S getBbsPagingList");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, rs);
			System.out.println("5/6 S getBbsPagingList");
		}
		
		return bbslist;
	}

}
