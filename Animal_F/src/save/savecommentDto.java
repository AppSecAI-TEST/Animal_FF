package save;

import java.io.Serializable;

/*
	// 테이블 삭제
	DROP TABLE SAVECOMMENT
	CASCADE CONSTRAINTS;
	
	// 시퀀스 삭제
	DROP SEQUENCE SEQ_SAVECOMMENT;
	
	// 외래키 삭제
	ALTER TABLE SAVECOMMENT DROP CONSTRAINT FK_SAVECOMMENT_PNUM;
	
	// 테이블 생성
	CREATE TABLE SAVECOMMENT(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		SAVECOMMENT VARCHAR2(2000) NOT NULL,
		PNUM NUMBER(8) NOT NULL
	)
	
	
	// 외래키 설정
	ALTER TABLE SAVECOMMENT ADD CONSTRAINT FK_SAVECOMMENT_PNUM
	FOREIGN KEY (PNUM) REFERENCES SAVEANIMAL (SEQ);
	
	
	// 시퀀스 생성
	CREATE SEQUENCE SEQ_SAVECOMMENT
	START WITH 1 INCREMENT BY 1;

*/

public class savecommentDto implements Serializable {

	int seq;			// 댓글 고유번호
	String id;			// 작성자 아이디
	String name;		// 작성자 이름
	String comment;		// 작성된 댓글	
	int pnum;			// 해당하는 게시글 고유번호
	
	public savecommentDto() {}

	public savecommentDto(int seq, String id, String name, String comment, int pnum) {
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.pnum = pnum;
	}
	
	public savecommentDto(String id, String name, String comment, int pnum) {
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
		return "savecommentDto [seq=" + seq + ", id=" + id + ", name=" + name + ", comment=" + comment + ", pnum="
				+ pnum + "]";
	}
	
	
	
	
	
	
}
