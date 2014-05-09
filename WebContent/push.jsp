<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.google.android.gcm.server.*" %>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");			
	String sSortDate = dateFormat.format(new Date());
	ArrayList<String> regid = new ArrayList<String>();	
	String MESSAGE_ID = String.valueOf(Math.random() % 100 + 1);	
	boolean SHOW_ON_IDLE = true;	
	int LIVE_TIME = 1;	
	int RETRY = 2;
	
	/* String p_code = request.getParameter("p_code");
	String p_cont = request.getParameter("p_cont");
	String p_seq = request.getParameter("p_seq"); */
	
	String simpleApiKey = "AIzaSyBfD05cQDt5b3ReDSfsKfQXxBpDMrL_Gec";	// ipin
	//String simpleApiKey = "AIzaSyAEoXSOo2P4gaq2ZMM6wORdduTnBUpV2Xs";	// 마이크레딧 스마트
	//String simpleApiKey = "AIzaSyBIZKBwRpJwXguxDJrt43Hzsolem9LAm4Q";	// gcmtest
	//String gcmURL = "https:\\android.googleapis.com/gcm/send";		
	try {
		
		/* String driverName = "oracle.jdbc.driver.OracleDriver";	
		String url = "jdbc:oracle:thin:@localhost:1521:XE";	
		ResultSet rs = null;
	
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url,"user_id","password");
	
		Statement stmt = con.createStatement();			
		String sql = "select * from gcm";
		rs = stmt.executeQuery(sql);
		
		//��� ���ID�� ����Ʈ�� ����
		while(rs.next()){
			regid.add(rs.getString("regid"));
		}
		con.close(); */
		
		
		// IPIN
		regid.add("APA91bFdV_RfCg_5dUFAdFtBRnJkR6DtK1MIhDhs3d1jCp85wB6RgMEqi5m-KIARyeX2OQt6Hsxl9lxEe6Enk15Wa1A9SFVCX4p_68XDUFE3n25445ODDR9m0pI9UgzBVtBsdc-n8jZHBjaiV4NmI9taQDfh3pA0Dg");
		// 알리미
		//regid = "APA91bEOHJs0Omajbr3BDNEoeWb5wLVtnLW8qeBdUJl1NcgsgGDPNzkFhVzt4Au4FtDQAH-AKCs614187nDz6vnUPW1T1jdfKHmazcOcWqQ-hn1mKjdPlUKFaa0z_HdoEtdEX9fRPqjQcK_4iOFArRqRWK_pg8UzeJKheZiJpcSo_yQmKXfkrcw";
		// 마이크레딧 스마트
		//regid = "APA91bHrTsBqa6j41IKsJAeHoVky8VmYSWWVjUCPMBFQSKTrcj3koG1FWWcXujD0Vj7dm_TSeiY_kZANF3Bwm6WnYcCKExdqQucgT9uaeqFsVezYGG3AAQDT9BMj19gJYgcAKxIIlBIk9vME2CntDZSm-DiYvUfDz9cC2UDXYzh2QYKCpGNnD4Y";
		// gcmtest
		//regid = "APA91bHDLdz8MKwX95gVwSyHiCBY7s4i3H_gtXQwkNx9CBmDp2SjQLjBmGJEdfIf1Z29WRcNq8Eb2mFt3nLnTTHyZOon5lEMkue1aqKnarumP5flBnZhPTZ4by0JRKx48LBFEhNZvh74Jsqv2Zf3NQuR8L_5XHNAqQ";
		
		Sender sender = new Sender(simpleApiKey);
		Message message = new Message.Builder()
		.collapseKey(MESSAGE_ID)
		.delayWhileIdle(SHOW_ON_IDLE)
		.timeToLive(LIVE_TIME)
		.addData("p_code", "P003")
		.addData("p_cont","아이핀 인증이력 발생 알림")
		.addData("p_seq","PQ20140430150700")
		.build();
		MulticastResult result = sender.send(message, regid, RETRY);
		System.out.println("Hello"+sSortDate);
		
		
	}catch (Exception e) {
		e.printStackTrace();
	}
%>


Hello_<%=sSortDate %>
