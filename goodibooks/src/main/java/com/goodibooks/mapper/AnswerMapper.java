package com.goodibooks.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.AnswerVO;
import com.goodibooks.vo.QnAVO;

@Mapper
public interface AnswerMapper {

	void answerWriteBoard(AnswerVO ans);

	AnswerVO selectAnswerByAskNo(int no);

	void updateAnsCheck();

//	void updateAnsCheck();

}
