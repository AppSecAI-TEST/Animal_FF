package freeboard;

import java.io.Serializable;

/*
 	// 테이블 삭제
 	DROP TABLE FREEBOARD
 	CASCADE CONSTRAINTS;
 	
 	// 시퀀스 삭제
	DROP SEQUENCE SEQ_FREEBOARD;

	// 외래키 삭제
	ALTER TABLE FREEBOARD DROP CONSTRAINT FK_FREEBOARD_ID;
	
	// 테이블 생성
	CREATE TABLE FREEBOARD(
		SEQ NUMBER(8) PRIMARY KEY,
		ID VARCHAR2(50) NOT NULL,
		NAME VARCHAR2(50) NOT NULL,
		REACOUNT NUMBER(8) NOT NULL,
		IMAGENAME VARCHAR2(50),
		WDATE DATE NOT NULL,
		TITLE VARCHAR2(200) NOT NULL,
		CONTENT VARCHAR2(4000) NOT NULL,
		ANIMAL_KIND VARCHAR2(200) NOT NULL
	);
	
	// 외래키 설정
	ALTER TABLE FREEBOARD ADD CONSTRAINT FK_FREEBOARD_ID
	FOREIGN KEY (ID) REFERENCES A_MEMBER (ID);
	
	
	// 시퀀스 생성
	CREATE SEQUENCE SEQ_FREEBOARD
	START WITH 1 INCREMENT BY 1;
	
	


 */

public class freeboardDto implements Serializable {
	
	
	private static final long serialVersionUID = 2788084424517880212L;
	String id;			// 작성자 아이디
	String name;		// 작성자 이름
	
	int seq;			// 글 고유번호
	String readcount;	// 조회수
	
	String imageName;	// 이미지 등록이름
	String wdate;		// 작성일
	String title;		// 글제목
	
	String content;		// 글 내용
	String animal_kind;	// 동물 종류
	
	public freeboardDto() {	}

	public freeboardDto(String id, String name, int seq, String readcount, String imageName, String wdate, String title,
			String content, String animal_kind) {
		this.id = id;
		this.name = name;
		this.seq = seq;
		this.readcount = readcount;
		this.imageName = imageName;
		this.wdate = wdate;
		this.title = title;
		this.content = content;
		this.animal_kind = animal_kind;
	}
	
	public freeboardDto(String id, String name, String imageName, String title, String content, String animal_kind) {
		this.id = id;
		this.name = name;
		this.imageName = imageName;
		this.title = title;
		this.content = content;
		this.animal_kind = animal_kind;
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

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
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

	public String getAnimal_kind() {
		return animal_kind;
	}

	public void setAnimal_kind(String animal_kind) {
		this.animal_kind = animal_kind;
	}

	@Override
	public String toString() {
		return "freeboardDto [id=" + id + ", name=" + name + ", seq=" + seq + ", readcount=" + readcount
				+ ", imageName=" + imageName + ", wdate=" + wdate + ", title=" + title + ", content=" + content
				+ ", animal_kind=" + animal_kind + "]";
	}
	
	
	
	

}
