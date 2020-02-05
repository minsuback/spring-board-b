package com.goodibooks.service;

import com.goodibooks.mapper.AnswerMapper;
import com.goodibooks.vo.AnswerVO;
import com.goodibooks.vo.QnAVO;

import lombok.Setter;

public class AnswerServiceImpl implements AnswerService {

	@Setter
	private AnswerMapper answerMapper;
	
	@Override
	public int answerWriteBoard(AnswerVO ans) {
		
		answerMapper.answerWriteBoard(ans);
		return ans.getAns_no();
	}

	@Override
	public AnswerVO getAnswerListByAskNo(int no) {
		
		return answerMapper.selectAnswerByAskNo(no);
	}

	@Override
	public void updateAnsCheck(QnAVO qna) {
		//return answerMapper.updateAnsCheck();
		answerMapper.updateAnsCheck();
	}

//	@Override
//	public void updateAnsCheck() {
//		answerMapper.updateAnsCheck();
//		
//	}

	
}
