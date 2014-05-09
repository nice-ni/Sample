<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String regid = request.getParameter("regid");
	
	try {
		String driverName = "";
		String url = "";
		ResultSet rs = null;
		Class.forName(driverName);
		Connection conn = DriverManager.getConnection(url ,"id","pw");
		
		Statement stmt = conn.createStatement();
		String sql = "insert into gcm_table_name (regid) values ('"+ regid +"')";
		rs = stmt.executeQuery(sql);
		out.print("sucess");
		conn.close();
		
	}catch (Exception e) {
		out.print("fail");
		e.printStackTrace();
	}
%>

