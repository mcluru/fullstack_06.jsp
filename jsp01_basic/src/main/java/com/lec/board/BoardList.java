package com.lec.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lec.ex03_connector.JDBCConnector;

public class BoardList {

	public ArrayList<Board> getBoardList() {
		
		ArrayList<Board> boards = new ArrayList<>();
		
		Connection conn = JDBCConnector.getConnection();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement("select * from board order by bno desc");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBno(rs.getInt("bno"));
				board.setSubject(rs.getString("subject"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setReadcnt(rs.getInt("readcnt"));
				board.setCrtdate(rs.getString("crtdate"));
				boards.add(board);
			}
		} catch (SQLException e) {
			System.out.println("SQL실행 실패!!!");
			e.printStackTrace();
		}
		return boards;
	}
}
