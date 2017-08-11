package freeboard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import paging.PagingBean;
import paging.PagingUtil;
import save.saveDto;

public class freeboardDao implements ifreeboardDao {
	
	private static freeboardDao fbDao = null;
	
	public freeboardDao() {	

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}
	
	public static freeboardDao getInstance(){
		if(fbDao == null){
			fbDao = new freeboardDao();
	      }
	      return fbDao;
	}


	
	@Override // 디테일 보기
	public freeboardDto getBbs(int seq) {
		//등록인,발견날짜,연락처,성별,발견장소,글제목,내용,이미지
				String sql = " SELECT SEQ, ID, NAME, READCOUNT, DEL, AUTH, IMAGENAME, "
						+ " WDATE, TITLE, CONTENT, ANIMAL_KIND "
						+ " FROM FREEBOARD "
						+ " WHERE SEQ=? ";
				
				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				
				freeboardDto dto = null;
				
				try {
					conn = getConnection();
					System.out.println("1/6 S getBbs");
					
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, seq);
					System.out.println("2/6 S getBbs");
					
					rs = psmt.executeQuery();
					System.out.println("3/6 S getBbs");
					
					if(rs.next()){
						/* String id, String name, int seq, int readcount, int del, int auth, String imageName,
							String wdate, String title, String content, String animal_kind */
						dto = new freeboardDto(rs.getString(2),       // id
											rs.getString(3),  		  // name
											rs.getInt(1), 			  // seq
											rs.getInt(4),		  	  // readcount
											rs.getInt(5), 			  // del
											rs.getInt(6),	  		  // auth
											rs.getString(7),  		  //imageName
											rs.getString(8),  		  //wdate
											rs.getString(9),  		  //title
											rs.getString(10), 		  //content
											rs.getString(11)  		  //animal_kind
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

	@Override // 조회수
	public void readCount(int seq) {
		String sql = " UPDATE FREEBOARD "
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

	@Override // 전체 글 목록
	public List<freeboardDto> getBbsPagingList(PagingBean paging) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<freeboardDto> fblist = new ArrayList<>();
		
		try {
			conn = getConnection();
			System.out.println("1/6 S getBbsPagingList");
			
			String totalSql = " SELECT COUNT(SEQ) FROM FREEBOARD ";
			psmt = conn.prepareStatement(totalSql);
			rs = psmt.executeQuery();
			
			int totalCount = 0;
			rs.next();
			totalCount = rs.getInt(1);	// row의 총 갯수
			paging.setTotalCount(totalCount);
			paging = PagingUtil.setPagingInfo(paging);
			
			
			psmt.close();
			rs.close();
			
			String sql = "SELECT * FROM ( SELECT * FROM ( SELECT * FROM FREEBOARD ORDER BY SEQ)" 
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
				
				freeboardDto dto = new freeboardDto(rs.getString(2),       // id
												rs.getString(3),  		  // name
												rs.getInt(1), 			  // seq
												rs.getInt(4),		  	  // readcount
												rs.getInt(5), 			  // del
												rs.getInt(6),	  		  // auth
												rs.getString(7),  		  //imageName
												rs.getString(8),  		  //wdate
												rs.getString(9),  		  //title
												rs.getString(10), 		  //content
												rs.getString(11)  		  //animal_kind
						);
				fblist.add(dto);
			}			
			System.out.println("4/6 S getBbsPagingList");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, psmt, rs);
			System.out.println("5/6 S getBbsPagingList");
		}
		
		return fblist;
	}

	@Override
	public boolean writefb(freeboardDto dto) {
		
		
		 String sql = " INSERT INTO FREEBOARD( "
		            + " SEQ, ID, NAME, READCOUNT, DEL, AUTH, IMAGENAME, WDATE, TITLE, CONTENT, ANIMAL_KIND ) "
		            + " VALUES(SEQ_FREEBOARD.NEXTVAL, ?, ?, 0, 0, ?, ?, SYSDATE, ?, ?, ? ) ";            
		      
		      Connection conn = null;
		      PreparedStatement psmt = null;
		      int count = 0;
		      
		      try {
		         conn = getConnection();
		         System.out.println("1/6 S writefb");
		         
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, dto.getId());
		         psmt.setString(2, dto.getName());
		         psmt.setInt(3, dto.getAuth());
		         psmt.setString(4, dto.getImageName());
		         psmt.setString(5, dto.getTitle()); 
		         psmt.setString(6, dto.getContent());
		         psmt.setString(7, dto.getAnimal_kind());
		         System.out.println("2/6 S writefb");
		         
		         count = psmt.executeUpdate();
		         System.out.println("3/6 S writefb");
		         
		         
		         
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally {
		         close(conn, psmt, null);
		         System.out.println("4/6 S writefb");
		      }
		      
		      return count>0?true:false;
	}
	

	public Connection getConnection() throws SQLException {
	      String url = "jdbc:oracle:thin:@192.168.10.22:1521:xe";
	      String user = "hr";
	      String pass = "hr";
	      Connection conn = DriverManager.getConnection(url, user, pass);
	      return conn;
	   }
	   
	   public void close(Connection conn, PreparedStatement psmt, ResultSet rs) {
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

}
