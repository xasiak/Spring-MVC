package com.aug.spring.board.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.aug.spring.board.domain.Board;
import com.aug.spring.board.domain.PageInfo;

public interface BoardStore {

	/**
	 * 게시물 등록 Store
	 * @param session
	 * @param board
	 * @return
	 */
	int insertBoard(SqlSession session, Board board);

	/**
	 * 게시물 전체 갯수 Store
	 * @param session
	 * @return
	 */
	int selectListCount(SqlSession session);

	/**
	 * 게시글 전체 조회 Store
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<Board> selectBoardList(SqlSession session, PageInfo pInfo);

	/**
	 * 게시글 상세조회 Store
	 * @param session
	 * @param boardNo
	 * @return
	 */
	Board selectBoardByNo(SqlSession session, Integer boardNo);

	/**
	 * 게시글 삭제 Store
	 * @param session
	 * @param board
	 * @return
	 */
	int deleteBoard(SqlSession session, Board board);

	/**
	 * 게시글 수정 Store
	 * @param session
	 * @param board
	 * @return
	 */
	int modifyBoard(SqlSession session, Board board);

}
