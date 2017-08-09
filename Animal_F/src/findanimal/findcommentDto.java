package findanimal;

import java.io.Serializable;

/*
	// 테이블 삭제
	DROP TABLE FINDCOMMENT
	CASCADE CONSTRAINTS;
	
	// 시퀀스 삭제
	DROP SEQUENCE SEQ_FINDCOMMENT;
	
	// 외래키 삭제
	ALTER TABLE FINDCOMMENT DROP CONSTRAINT FK_FINDCOMMENT_PNUM;
	

	// 테이블 생성
	CREATE TABLE FINDCOMMENT(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		FINDCOMMENT VARCHAR2(2000) NOT NULL,
		WDATE DATE NOT NULL,
		PNUM NUMBER(8) NOT NULL
	);
	
	
	// 외래키 설정
	ALTER TABLE FINDCOMMENT ADD CONSTRAINT FK_FINDCOMMENT_PNUM
	FOREIGN KEY (PNUM) REFERENCES FINDANIMAL (SEQ);
	
	
	// 시퀀스 생성
	CREATE SEQUENCE SEQ_FINDCOMMENT
	START WITH 1 INCREMENT BY 1;

*/

public class findcommentDto implements Serializable {

	
	private static final long serialVersionUID = 3128058223610375373L;
	int seq;			// 댓글 고유번호
	String id;			// 작성자 아이디
	String name;		// 작성자 이름
	String comment;		// 작성된 댓글	
	int pnum;			// 해당하는 게시글 고유번호
	
	public findcommentDto() {}

	public findcommentDto(int seq, String id, String name, String comment, int pnum) {
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.pnum = pnum;
	}
	
	public findcommentDto(String id, String name, String comment, int pnum) {
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.pnum = pnum;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	@Override
	public String toString() {
		return "findcommentDto [seq=" + seq + ", id=" + id + ", name=" + name + ", comment=" + comment + ", pnum="
				+ pnum + "]";
	}
	
	
	
	
}
