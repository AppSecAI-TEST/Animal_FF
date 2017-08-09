package Member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Member.MemberDao;

public class MemberDao implements iMemberDao {

	private static MemberDao memberDao;
	private boolean isS = true;

	public static MemberDao getInstance() {
		if (memberDao == null) {
			memberDao = new MemberDao();
		}
		return memberDao;
	}

	public MemberDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean addMember(MemberDto dto) {
		String sql = " INSERT INTO A_MEMBER (SEQ,NAME,ID,PWD,PHONE,EMAIL,IMG,ADDRNUM,ADDR1,ADDR2,GENDER,AUTH) "
				   + " VALUES(SEQ_MEMBER.NEXTVAL,?,?,?,?,?,'IMG',?,?,?,?,3)";
		int count = 0;
		Connection conn = null;
		PreparedStatement psmt = null;

		try {
			conn = getConnection();
			System.out.println("addmember 1");

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getId());
			psmt.setString(3, dto.getPwd());
			psmt.setString(4, dto.getPhone());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getAddrNum());
			psmt.setString(7, dto.getAddr1());
			psmt.setString(8, dto.getAddr2());		
			psmt.setString(9, dto.getGender());
			System.out.println("addmember 2");

			System.out.println(dto.toString());
			
			count = psmt.executeUpdate();
			// update ½ÇÇà È½¼ö
			System.out.println("addmember 3");

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("addmember fail");
		} finally {
			close(conn, psmt, null);
			System.out.println("addmember 4");
		}

		return count > 0 ? true : false;
	}
	
	

	@Override
	public boolean check(String id) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sid = "";
		boolean chk = false;
		
		String sql =" SELECT ID FROM A_MEMBER WHERE ID=? ";
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("id check 1");
			psmt.setString(1, id);
			System.out.println("id check 2");
			rs =psmt.executeQuery();
			
			while(rs.next()){
				sid = rs.getString(1);
				
			}
				
			System.out.println("id check 3");
			System.out.println(sid);
		} catch (SQLException e) {
			System.out.println("id check fail");
			e.printStackTrace();
		}finally{
			close(conn, psmt, null);
			System.out.println("id check 4");
		}
		if(!sid.equals("")){
			chk=true;
			System.out.println(sid);
		}
		
		return chk;
	}

	public void log(String msg) {
		if (isS) {
			System.out.println(getClass() + ": " + msg);
		}
	}

	public void close(Connection conn, PreparedStatement psmt, ResultSet rs) {

		try {
			if (rs != null) {
				rs.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (psmt != null) {
				psmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Connection getConnection() throws SQLException {

		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pass = "hr";
		Connection conn = DriverManager.getConnection(url, user, pass);

		return conn;
	}
}