package com.lec.board;

import java.io.FileReader;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

// DB에 연결하는 클래스
public class ConnectionFactory {
	
	// jdbc.properties 경로 가져와서 변수 path에 담음
	private String path = ConnectionFactory.class.getResource("jdbc.properties").getPath();
	
	private String DRV = null;
	private String URL = null;
	private String USR = null;
	private String PWD = null;

	private String insert = null;
	private String select = null;
	private String update = null;
	private String delete = null;
	
	public ConnectionFactory() {
		try {
			setUp();	// 위에 선언한 변수들에 값을 넣음
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// setUp메서드는 jdbc.properties파일에서 DB접속정보와 실행할 sql문을
	// 프로그램의 변수로 읽어오기 위한 사용자정의 메서드
	public void setUp() throws Exception {
		
		//Properties는 Hashtables의 하위클래스, Map속성임
		Properties p = new Properties();
		path = URLDecoder.decode(path, "utf-8");	//utf=8로 인코딩
		p.load(new FileReader(path));	//path파일 내용을 읽어서 키-값형태로 p라는 map에 보관
		
		// 1. DB접속정보
		DRV = p.getProperty("jdbc.drv");	//getProperty(String key) key값을 제공하면 해당하는 Value를 문자열로 반환
		URL = p.getProperty("jdbc.url");	//즉 path파일에서 jdbc.url을 키로, 해당하는 내용을 변수에 담음
		USR = p.getProperty("jdbc.usr");
		PWD = p.getProperty("jdbc.pwd");
		
		// 2. SQL정보
		insert = p.getProperty("insert");
		select = p.getProperty("select");
		update = p.getProperty("update");
		delete = p.getProperty("delete");
		
//		System.out.println(DRV);
//		System.out.println(URL);
//		System.out.println(USR);
//		System.out.println(PWD);
//		
//		System.out.println(insert);
//		System.out.println(select);
//		System.out.println(update);
//		System.out.println(delete);
		
		Class.forName(DRV);	//오라클Driver클래스가 로드되어 객체생성되고 DriverManager에 등록됨
		
	}
	
	public Connection getConnection() {
		try {
//			System.out.println("DB연결성공");
			return DriverManager.getConnection(URL, USR, PWD); //매개변수에 해당하는 connection객체 생성 = 연결성공
		} catch (SQLException e) {
			System.out.println("DB연결실패");
			e.printStackTrace();
			return null;
		}
	}

	public String getInsert() {
		return insert;
	}

	public String getSelect() {
		return select;
	}

	public String getUpdate() {
		return update;
	}

	public String getDelete() {
		return delete;
	}
	
	
	
}
