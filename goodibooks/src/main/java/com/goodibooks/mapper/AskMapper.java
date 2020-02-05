package com.goodibooks.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goodibooks.vo.QnAVO;

@Mapper
public interface AskMapper {

	void askWriteBoard(QnAVO qna);

	List<QnAVO> selectQnaList();

	QnAVO selectAskDetailByNo(int no);

	void deleteAsk(int no);

	QnAVO selectAskUpdateByNo(int no);

	void updateAsk(QnAVO ask);

	List<QnAVO> selectAskList(String id);

//	void updateAsk(QnAVO ask);

}
