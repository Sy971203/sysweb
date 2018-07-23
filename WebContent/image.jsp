<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="conn4" class="com.conDBMS.Conn" scope="session" />
	<%
		request.setCharacterEncoding("utf-8");
		String content = request.getParameter("content");
		String filename = request.getParameter("image");
		System.out.println(filename);
		//ServletInputStream str=request.getInputStream();  
		InputStream str = new FileInputStream(filename);
		//byte b[]=new byte[str.available()];
		//str.read(b);x
		//ByteArrayInputStream bi=new ByteArrayInputStream(b);
		String sql1 = "select * from images";
		Statement stmt = conn4.getConnection().createStatement();
		System.out.println("连接成功");
		ResultSet rs = stmt.executeQuery(sql1);
		rs.last();
		int id = rs.getInt("id") + 1;
		String sql = "insert into images(id,content,image) values(" + id
				+ ",?,?)";
		PreparedStatement pstmt = conn4.getConnection().prepareStatement(
				sql);
		pstmt.setString(1, content);
		long l = (long) str.available();
		pstmt.setBinaryStream(2, str, l);
		//out.print(bi.available());
		try {
			pstmt.executeUpdate();
		} catch (Exception e) {
			//out.print(sql);
			out.print(e.getMessage());
		}
		out.println("Success,You Have Insert an Image Successfully");
	%>

</body>
</html>