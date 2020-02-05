package com.goodibooks.service;

import java.util.HashMap;
import java.util.List;

import com.goodibooks.mapper.AskMapper;
import com.goodibooks.vo.QnAVO;

import lombok.Setter;

public class AskServiceImpl implements AskService {
	
	@Setter
	private AskMapper askMapper;

	@Override
	public int askWriteBoard(QnAVO qna) {
		
		askMapper.askWriteBoard(qna);
		return qna.getNo();
		
	}

	@Override
	public List<QnAVO> showQnaList() {
		
		return askMapper.selectQnaList();
	}

	@Override
	public QnAVO findAskDetailByNo(int no) {
		
		return askMapper.selectAskDetailByNo(no);
	}

	@Override
	public void deleteAsk(int no) {
		
		askMapper.deleteAsk(no);
		
	}

	@Override
	public QnAVO updateAskByNo(int no) {
		
		return askMapper.selectAskUpdateByNo(no);
	}

	@Override
	public void updateAsk(QnAVO ask) {
		
		askMapper.updateAsk(ask);
		
	}

	@Override
	public List<QnAVO> showAskList(String id) {
		
		return askMapper.selectAskList(id);
	}

}
