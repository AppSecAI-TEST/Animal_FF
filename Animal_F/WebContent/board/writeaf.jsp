
<%@page import="freeboard.freeboardDto"%>
<%@page import="freeboard.freeboardDao"%>
<%@page import="freeboard.ifreeboardDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<body>
	
<%

// 10Mbyte 제한
int maxSize  = 1024*1024*10;        

// 웹서버 컨테이너 경로
// String root = request.getSession().getServletContext().getRealPath("/");  // 톰캣경로
String root = "C:/Users/user1/git/Animal_FF/Animal_F/WebContent/board/"; // 프로젝트 폴더 경로
System.out.println(root);

// 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
String savePath = root + "uploadimg/";
System.out.println("저장되는 경로  : " + savePath);

// 업로드 파일명
String uploadFile = "";

String newFileName = "";
String sauth = "";
int auth=0;
String id = "";
String name = "";
String title ="";
String animalkind ="";
String content ="";
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
    sauth = multi.getParameter("auth"); 
    auth = Integer.parseInt(sauth.trim());
    id = multi.getParameter("id"); 
    name = multi.getParameter("name"); 
    title = multi.getParameter("title");
    animalkind = multi.getParameter("animalkind");
    content = multi.getParameter("content");
    
    System.out.println(title);
    System.out.println(animalkind);
    System.out.println(content);

    // 파일업로드
    uploadFile = multi.getFilesystemName("fileName");
    System.out.println(uploadFile);
    
    if(uploadFile != null){
	
	    // 실제 저장할 파일명(ex : 20170811112630.jpg)
	    newFileName = simDf.format(new Date(currentTime)) +"."+ uploadFile.substring(uploadFile.lastIndexOf(".")+1);
	
	     
	    // 업로드된 파일 객체 생성
	    File oldFile = new File(savePath + uploadFile);
	
	     
	    // 실제 저장될 파일 객체 생성
	    File newFile = new File(savePath + newFileName);
	     
	
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
	
	    System.out.println("newfile : " + newFile);
    }else{
   	 
    		// 파일이 없는 경우
    	    newFileName = empty_img_name;
    	
    	     
    	    // 업로드된 파일 객체 생성
    	    File oldFile = new File(savePath + newFileName);
    	
    	     
    	    // 실제 저장될 파일 객체 생성
    	    File newFile = new File(savePath + newFileName); //이미지가 없을때
    	     
    	
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
    	
    	    System.out.println("newFileName : " + newFileName);
     }
    
}catch(Exception e){
    e.printStackTrace();
}

    ifreeboardDao dao = freeboardDao.getInstance();
    boolean isS = dao.writefb(new freeboardDto(id, name, 0, auth, newFileName, title, content, animalkind));
    
%>


<%=title %>
<%=animalkind %>
<%=content %>
<%
if(isS){
%>
   <script type="text/javascript">
      alert("글 입력에 성공하셨습니다.");
   /*    location.href = "./saveboard.jsp"; */
      
      
   </script>
   <a href="./uploadimg/<%=newFileName %>">등록한 이미지 보러가기</a> 
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