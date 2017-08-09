package freeboard;

import java.io.Serializable;

/*
 	// 테이블 삭제
 	DROP TABLE FBCOMMENT
 	CASCADE CONSTRAINTS;
 	
 	// 시퀀스 삭제
	DROP SEQUENCE SEQ_FBCOMMENT;

	// 외래키 삭제
	ALTER TABLE FBCOMMENT DROP CONSTRAINT FK_FBCOMMENT_PNUM;
 	
 	// 테이블 생성
	CREATE TABLE FBCOMMENT(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		FREECOMMENT VARCHAR2(2000) NOT NULL,
		PNUM NUMBER(8) NOT NULL
	)


	// 외래키 설정
	ALTER TABLE FBCOMMENT ADD CONSTRAINT FK_FBCOMMENT_PNUM
	FOREIGN KEY (PNUM) REFERENCES FREEBOARD (SEQ);
	
	
	// 시퀀스 생성
	CREATE SEQUENCE SEQ_FBCOMMENT
	START WITH 1 INCREMENT BY 1;
	
 */
public class fbcommentDto implements Serializable {
	
	
	private static final long serialVersionUID = 509709531537187187L;
	int seq;			// 댓글 고유번호
	String id;			// 작성자 아이디
	String name;		// 작성자 이름
	String comment;		// 작성된 댓글	
	int pnum;			// 해당하는 게시글 고유번호
	
	public fbcommentDto() {
	}


	public fbcommentDto(int seq, String id, String name, String comment, int pnum) {
		this.seq = seq;
		this.id = id;
		this.name = name;
		this.comment = comment;
		this.pnum = pnum;
	}
	
	public fbcommentDto(String id, String name, String comment, int pnum) {
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
		return "fbcommentDto [seq=" + seq + ", id=" + id + ", name=" + name + ", comment=" + comment + ", pnum=" + pnum
				+ "]";
	}
	
	
	
}
