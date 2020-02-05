package com.springboard.service;

import java.util.HashMap;
import java.util.List;

import com.springboard.mapper.BoardMapper;
import com.springboard.repository.BoardDao;
import com.springboard.repository.RawJdbcBoardDao;
import com.springboard.vo.BoardVO;

import lombok.Setter;

public class BoardServiceImpl implements BoardService{

	// @data는 클래스 전체를 사용 , setter는 변수별로 사용하기에 환경에 따라 선택하면 됨( @Getter 사용 가능 - 근데 쓸일없음 )
	@Setter								// setBoardDao를 자동으로 포함하는 annotation(lombok) - rootContext의 10 line 으로 해결
	private BoardDao boardDao;			// BoardDao의 메소드를 사용 해야하기때문에, Setter를 사용하는것임
	
	@Setter								// 위는 BoardDao를 사용하는 변수 , 지금꺼는 BoardDao 대신 BoardMapper를 사용하는 변수
	private BoardMapper boardMapper;
	
	@Override
	public int writeBoard(BoardVO board) {
		
//		int newBno = boardDao.insertBoard(board);			// BoardDao 사용 코드
//		return newBno;
		
		boardMapper.insertBoard(board);
		return board.getBno();
		
	}

	@Override
	public List<BoardVO> findBoard() {
		
//		List<BoardVO> boards = boardDao.selectBoard();
		List<BoardVO> boards = boardMapper.selectBoard();
		
		return boards;
	}

	@Override
	public List<BoardVO> findBoardWithPaging(HashMap<String, Object> params) {
		
		return boardMapper.selectBoardWithPaging(params);
		
	}

	@Override
	public BoardVO findBoardByBno(int bno) {
		
		return boardMapper.selectByBno(bno);
		
	}

	@Override
	public void deleteBoard(int bno) {

		boardMapper.deleteBoard(bno);
		
	}

	@Override
	public void updateBoard(BoardVO board) {
		
		boardMapper.updateBoard(board);
		
	}

	@Override
	public void increaseReadCount(int bno) {

		boardMapper.updateReadCount(bno);
		
	}

	@Override
	public int findBoardCount(HashMap<String , Object> params) {
		
		return boardMapper.selectBoardCount(params);
		
	}

}
