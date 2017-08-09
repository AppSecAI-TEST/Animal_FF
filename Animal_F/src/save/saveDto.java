package save;

import java.io.Serializable;

/*
// 테이블 삭제
drop table saveanimal
cascade constraint;

// 시퀀스 삭제
drop sequence seq_saveanimal;

// 외래키 삭제
alter table saveanimal drop constraint fk_saveanimal_id

// 테이블 생성
create table saveanimal(
	seq number(8) primary key,
	del number(1) not null,
	readcount number(8) not null,
	title varchar2(200) not null,
	content varchar2(4000) not null,
	img_name varchar2(200),
	wdate date not null,
	user_name varchar2(50) not null,
	user_id varchar2(50) not null,
	user_ph varchar2(50) not null,
	find_date varchar2(50) not null,
	find_pleace1 varchar2(50) not null,
	find_pleace2 varchar2(50) not null,
	animal_kind varchar2(50) not null,
	animal_gender varchar2(50) not null
)

// 외래키 설정
alter table saveanimal add constraint fk_saveanimal_id
foreign key (id) references a_member (id);

// 시퀀스 생성
create sequence seq_saveanimal
start with 1 increment by 1;
*/

public class saveDto implements Serializable {

	  
	private static final long serialVersionUID = -1425159551295094841L;
	private String user_name;	// 등록 이름
	private String user_id;		// 등록 아이디
	private String user_ph;		// 등록 폰넘버

	private String find_date;	// 찾은날짜
	private String find_pleace1;// 찾은 지역 1(도 단위)
	private String find_pleace2;// 찾은 지역 2(상세)

	private String animal_kind;	// 찾은 동물 중류
	private String animal_gender;// 동물 성별

	private String title;		// 게시글 제목
	private String content;		// 게시글 내용
	private String img_name;	// 게시글 첨부이미지 이름
	private String wdate;		// 게시글 작성일
	private int readcount;		// 조회수
	private int seq;			// 게시글 고유번호
	private int del;			// 게시글 삭제 여부	
	
	public saveDto() {	}

	public saveDto(String user_name, String user_id, String user_ph, String find_date, String find_pleace1,
			String find_pleace2, String animal_kind, String animal_gender, String title, String content,
			String img_name, String wdate, int readcount, int seq, int del) {
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_ph = user_ph;
		this.find_date = find_date;
		this.find_pleace1 = find_pleace1;
		this.find_pleace2 = find_pleace2;
		this.animal_kind = animal_kind;
		this.animal_gender = animal_gender;
		this.title = title;
		this.content = content;
		this.img_name = img_name;
		this.wdate = wdate;
		this.readcount = readcount;
		this.seq = seq;
		this.del = del;
	}
	
	public saveDto(String user_name, String user_id, String user_ph, String find_date, String find_pleace1,
			String find_pleace2, String animal_kind, String animal_gender, String title, String content,
			String img_name) {
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_ph = user_ph;
		this.find_date = find_date;
		this.find_pleace1 = find_pleace1;
		this.find_pleace2 = find_pleace2;
		this.animal_kind = animal_kind;
		this.animal_gender = animal_gender;
		this.title = title;
		this.content = content;
		this.img_name = img_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_ph() {
		return user_ph;
	}

	public void setUser_ph(String user_ph) {
		this.user_ph = user_ph;
	}

	public String getFind_date() {
		return find_date;
	}

	public void setFind_date(String find_date) {
		this.find_date = find_date;
	}

	public String getFind_pleace1() {
		return find_pleace1;
	}

	public void setFind_pleace1(String find_pleace1) {
		this.find_pleace1 = find_pleace1;
	}

	public String getFind_pleace2() {
		return find_pleace2;
	}

	public void setFind_pleace2(String find_pleace2) {
		this.find_pleace2 = find_pleace2;
	}

	public String getAnimal_kind() {
		return animal_kind;
	}

	public void setAnimal_kind(String animal_kind) {
		this.animal_kind = animal_kind;
	}

	public String getAnimal_gender() {
		return animal_gender;
	}

	public void setAnimal_gender(String animal_gender) {
		this.animal_gender = animal_gender;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "saveDto [user_name=" + user_name + ", user_id=" + user_id + ", user_ph=" + user_ph + ", find_date="
				+ find_date + ", find_pleace1=" + find_pleace1 + ", find_pleace2=" + find_pleace2 + ", animal_kind="
				+ animal_kind + ", animal_gender=" + animal_gender + ", title=" + title + ", content=" + content
				+ ", img_name=" + img_name + ", wdate=" + wdate + ", readcount=" + readcount + ", seq=" + seq + ", del="
				+ del + "]";
	}
	
	
	
}
