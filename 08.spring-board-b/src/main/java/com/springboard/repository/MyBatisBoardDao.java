package com.springboard.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;

import com.springboard.vo.BoardVO;

import lombok.Setter;

public class MyBatisBoardDao implements BoardDao{
	
	private final String MAPPER = "com.springboard.mapper.BoardMapper.";
	
	@Setter
	private SqlSessionTemplate sessionTemplate;
	
	@Override
	public int insertBoard(BoardVO board) {
		
		// board.getBno() -> 0
//		sessionTemplate.insert("com.springboard.mapper.BoardMapper.insertBoard", board);
		
		// board.getBno() -> 새로 생긴 글 번호
		sessionTemplate.insert( MAPPER+ "insertBoard", board);
		
		return board.getBno();
	}

	@Override
	public List<BoardVO> selectBoard() {
		
//		List<BoardVO> boards = sessionTemplate.selectList("com.springboard.mapper.BoardMapper.selectBoard");
		List<BoardVO> boards = sessionTemplate.selectList( MAPPER + "selectBoard");
		
		return boards;
	}

}