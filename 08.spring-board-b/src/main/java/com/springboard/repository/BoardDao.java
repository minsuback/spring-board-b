package com.springboard.repository;

import java.util.List;

import com.springboard.vo.BoardVO;

public interface BoardDao {

	int insertBoard(BoardVO borad);
	
	List<BoardVO> selectBoard();
	
}
