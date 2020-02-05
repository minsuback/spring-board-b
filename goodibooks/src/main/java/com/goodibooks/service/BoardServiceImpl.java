package com.goodibooks.service;


import java.util.List;

import com.goodibooks.mapper.BoardMapper;
import com.goodibooks.vo.BoardVO;

import lombok.Setter;

public class BoardServiceImpl implements BoardService {
	
	@Setter
	private BoardMapper boardMapper;

	@Override
	public List<BoardVO> findNotice() {
		return boardMapper.selectNotice();
	}

	@Override
	public int writeNotice(BoardVO board) {
		boardMapper.insertNotice(board);
		return board.getNo();
	}

	@Override
	public BoardVO findNoticeByNo(int no) {
		return boardMapper.selectNoticeByNo(no);
	}

	@Override
	public void deleteNotice(int no) {
		boardMapper.deleteNotice(no);
	}

	@Override
	public void updateNotice(BoardVO board) {
		boardMapper.updateNotice(board);
	}
	

}
