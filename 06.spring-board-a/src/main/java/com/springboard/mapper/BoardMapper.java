package com.springboard.mapper;

import java.util.HashMap;
import java.util.List;

import com.springboard.vo.BoardVO;

// 인터페이스의 패키지와 이름은 board-mapper.xml의 namespace와 일치하도록 작성

public interface BoardMapper {

	// 인터페이스의 메서드는 mapper.xml의 select ,insert 등의 요소 정의와 일치하도록 작성
	
	List<BoardVO> selectBoard();
	
	// key-value 형식으로 사용하기 위해 HashMap을 사
	List<BoardVO> selectBoardWithPaging(HashMap<String, Object> params);	

	int insertBoard(BoardVO board);

	BoardVO selectByBno(int bno);

	void deleteBoard(int bno);

	void updateBoard(BoardVO board);

	void updateReadCount(int bno);

	int selectBoardCount(HashMap<String, Object> params);
	
}
