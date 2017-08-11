<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="save.saveDto"%>
<%@page import="save.saveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>savewriteAf</title>
</head>
<body>

<!-- 
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
 --> 
<%

//10Mbyte 제한
int maxSize  = 1024*1024*10;        

//웹서버 컨테이너 경로
//String root = request.getSession().getServletContext().getRealPath("/");  // 톰캣경로

String root = "E:/Animal_F/Animal_F/WebContent/save/";
/* String root = "C:/Users/user1/git/Animal_FF/Animal_F/WebContent/board/"; // 프로젝트 폴더 경로 */
System.out.println(root);

//파일 저장 경로(ex : /home/tour/web/ROOT/upload) 
String savePath = root + "saveupimg/";
System.out.println("저장되는 경로  : " + savePath);

//업로드 파일명
String uploadFile = "";

String user_name = "";
String user_id = "";
String user_ph = ""; 
String find_date = "";
String find_pleace1 = "";
String find_pleace2 = "";
String animal_kind = "";
String animal_gender = "";
String title = "";
String content = "";
String img_name = "";
String empty_img_name = "x.png";

int read = 0;
byte[] buf = new byte[1024];
FileInputStream fin = null;
FileOutputStream fout = null;
long currentTime = System.currentTimeMillis();  
SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss");  

try{

 MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
  
 // 전송받은 parameter의 한글깨짐 방지

user_name = multi.getParameter("user_name");
user_id = multi.getParameter("user_id");
user_ph = multi.getParameter("user_ph1"); //010
user_ph = user_ph + "-" + multi.getParameter("user_ph2"); //-1234
user_ph = user_ph + "-" + multi.getParameter("user_ph3");//-4567
find_date = multi.getParameter("find_date");
find_pleace1 = multi.getParameter("find_pleace1");
find_pleace2 = multi.getParameter("find_pleace2");
animal_kind = multi.getParameter("animal_kind");
animal_gender = multi.getParameter("animal_gender");
title = multi.getParameter("title");
content = multi.getParameter("content");
img_name = multi.getParameter("img_name");
 


 // 파일업로드
 uploadFile = multi.getFilesystemName("img_name");
 System.out.println(uploadFile);
 
 if(uploadFile != null){
	
	    // 실제 저장할 파일명(ex : 20170811112630.jpg)
	    img_name = simDf.format(new Date(currentTime)) +"."+ uploadFile.substring(uploadFile.lastIndexOf(".")+1);
	
	     
	    // 업로드된 파일 객체 생성
	    File oldFile = new File(savePath + uploadFile);
	
	     
	    // 실제 저장될 파일 객체 생성
	    File newFile = new File(savePath + img_name);
	     
	
	    // 파일명 rename
	    if(!oldFile.renameTo(newFile)){
	
	        // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
	
	        buf = new byte[1024];
	        fin = new FileInputStream(oldFile);
	        fout = new FileOutputStream(newFile);
	        read = 0;
	        while((read=fin.read(buf,0,buf.length))!=-1){
	            fout.write(buf, 0, read);
	        }
	         
	        fin.close();
	        fout.close();
	        oldFile.delete();
	    }   
	
	    System.out.println("img_name : " + img_name);
 }else{
	 
	// 실제 저장할 파일명(ex : 20170811112630.jpg)
	    img_name = empty_img_name;
	
	     
	    // 업로드된 파일 객체 생성
	    File oldFile = new File(savePath + img_name);
	
	     
	    // 실제 저장될 파일 객체 생성
	    File newFile = new File(savePath + img_name); //이미지가 없을때
	     
	
	    // 파일명 rename
	    if(!oldFile.renameTo(newFile)){
	
	        // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
	
	        buf = new byte[1024];
	        fin = new FileInputStream(oldFile);
	        fout = new FileOutputStream(newFile);
	        read = 0;
	        while((read=fin.read(buf,0,buf.length))!=-1){
	            fout.write(buf, 0, read);
	        }
	         
	        fin.close();
	        fout.close();
	        oldFile.delete();
	    }   
	
	    System.out.println("img_name : " + img_name);
 }
 
}catch(Exception e){
 e.printStackTrace();
}

// DB 저장
saveDao dao = saveDao.getInstance();
boolean isS = dao.writeBbs(new saveDto(user_name,user_id,user_ph,find_date,find_pleace1,find_pleace2,animal_kind,animal_gender,title,content,img_name));

// DB 저장후 결과
if(isS){
%>
	<script type="text/javascript">
		alert("글 입력에 성공하셨습니다.");
		location.href = "./saveboard.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
		alert("다시 입력해 주세용");
		location.href = "./savewrite.jsp";
	</script>
<%
}
%>

</body>
</html>