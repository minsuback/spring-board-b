package com.goodibooks.service;

import com.goodibooks.vo.AnswerVO;
import com.goodibooks.vo.QnAVO;

public interface AnswerService {

	int answerWriteBoard(AnswerVO ans);

	AnswerVO getAnswerListByAskNo(int no);

	void updateAnsCheck(QnAVO qna);

//	void updateAnsCheck();

}
