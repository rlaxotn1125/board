package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BoardDto;
import com.fastcampus.ch4.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface BoardDao {
    BoardDto select(Integer bno) throws Exception;
    int delete(Integer bno, String writer) throws Exception;
    int insert(BoardDto dto) throws Exception;
    int update(BoardDto dto) throws Exception;
    int increaseViewCnt(Integer bno) throws Exception;

    List<BoardDto> selectPage(Map map) throws Exception;
    List<BoardDto> selectAll() throws Exception;
    int deleteAll() throws Exception;
    int count() throws Exception;

    List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception; // List<E> selectList(String statement, Object parameter)

    int searchResultCnt(SearchCondition sc) throws Exception; // T selectOne(String statement, Object parameter)

    int updateCommentCnt(Integer bno, int cnt);

//    int searchResultCnt(SearchCondition sc) throws Exception;
//    List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception;
}
