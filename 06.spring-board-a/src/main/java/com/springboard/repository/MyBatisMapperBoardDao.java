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

import com.springboard.mapper.BoardMapper;
import com.springboard.vo.BoardVO;

import lombok.Setter;

public class MyBatisMapperBoardDao implements BoardDao{
	
	@Setter
	private BoardMapper boardMapper;
	
	@Override
	public int insertBoard(BoardVO board) {
		
		boardMapper.insertBoard(board);
		return board.getBno();
	}

	@Override
	public List<BoardVO> selectBoard() {
		
		List<BoardVO> boards = boardMapper.selectBoard();
		
		return boards;
	}

}