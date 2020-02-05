package com.springboard.service;

import java.util.HashMap;
import java.util.List;

import com.springboard.vo.BoardVO;

public interface BoardService {

	// service에서는 업무에 관련된 용어를 사용함 , Dao에서는 DB용어를 사용함
	// service에서는 write , join 등을 사용하지만 , Dao에서는 insert등으로 사용을 함
	
	// 글(첨부파일) 등록 할때, insert 후 , number를 바로 select 해야하기때문에 int 를 사용하는 메소드 
	int writeBoard(BoardVO board);
	
	// 글 전체를 읽어오는 메소드 - List대신 ArrayList를 사용할수았는데, 
	// 가눙헌 interface구조로 사용하는게 좋기때문에 List를 사용하는게 좋음
	List<BoardVO> findBoard();

	List<BoardVO> findBoardWithPaging(HashMap<String, Object> params);

	BoardVO findBoardByBno(int bno);

	void deleteBoard(int bno);

	void updateBoard(BoardVO board);

	void increaseReadCount(int bno);

	int findBoardCount(HashMap<String, Object> params); 
	
}
