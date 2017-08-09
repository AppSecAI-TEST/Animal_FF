/*drop table A_MEMBER
cascade constraint;

drop sequence SEQ_MEMBER;

create table A_MEMBER(
   SEQ NUMBER(8) PRIMARY KEY,
   NAME VARCHAR2(50) NOT NULL,
   ID VARCHAR2(50) NOT NULL,
   PWD VARCHAR2(50) NOT NULL,
   PHONE VARCHAR2(50) NOT NULL,
   EMAIL VARCHAR2(50) NOT NULL,
   IMG VARCHAR2(100) NOT NULL,
   ADDRNUM VARCHAR2(200) NOT NULL,
   ADDR1 VARCHAR2(200) NOT NULL,
   ADDR2 VARCHAR2(200) NOT NULL,
   GENDER VARCHAR2(3) NOT NULL,
   AUTH NUMBER(1) not null
);

create sequence SEQ_MEMBER
start with 1 increment by 1;*/

package Member;

import java.io.Serializable;

public class MemberDto implements Serializable {

	private int seq; // 회원번호
	private String name;
	private String id;
	private String pwd;
	private String phone;
	private String email;
	private String img; // 이미지 경로 (프로필사진)
	private String addrNum; // 우편번호
	private String addr1; // 주소 (우편번호와 주소는 나중에 넣을예정)
	private String addr2; // 상세 주소
	private String gender;
	private int auth; // 권한

	public MemberDto() {
	}

	public MemberDto(int seq, String name, String id, String pwd, String phone, String email, String img,
			String addrNum, String addr1, String addr2, String gender, int auth) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.img = img;
		this.addrNum = addrNum;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gender = gender;
		this.auth = auth;
	}

	

	public MemberDto(int seq, String name, String id, String pwd, String phone, String email, String addrNum,
			String addr1, String addr2, String gender, int auth) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.phone = phone;
		this.email = email;
		this.addrNum = addrNum;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.gender = gender;
		this.auth = auth;
	}

	public int getseq() {
		return seq;
	}

	public void setseq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(String addrNum) {
		this.addrNum = addrNum;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [seq=" + seq + ", name=" + name + ", id=" + id + ", pwd=" + pwd + ", phone=" + phone
				+ ", email=" + email + ", img=" + img + ", addrNum=" + addrNum + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", gender=" + gender + ", auth=" + auth + "]";
	}

}