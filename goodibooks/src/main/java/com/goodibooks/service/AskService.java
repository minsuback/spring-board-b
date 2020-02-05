package com.goodibooks.service;

import java.util.List;

import com.goodibooks.vo.QnAVO;

public interface AskService {
	
	int askWriteBoard(QnAVO qna);

	List<QnAVO> showQnaList();

	QnAVO findAskDetailByNo(int no);

	void deleteAsk(int no);

	QnAVO updateAskByNo(int no);

	void updateAsk(QnAVO ask);

	List<QnAVO> showAskList(String id);

}
