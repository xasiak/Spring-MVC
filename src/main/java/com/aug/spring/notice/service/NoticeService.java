package com.aug.spring.notice.service;

import java.util.List;
import java.util.Map;

import com.aug.spring.notice.domain.Notice;
import com.aug.spring.notice.domain.PageInfo;

public interface NoticeService {

	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);
	
	/**
	 * 공지사항 수정 Service
	 * @param notice
	 * @return
	 */
	int updateNotice(Notice notice);

	/**
	 * 공지사항 목록 조회 Service
	 * @param pInfo 
	 * @return
	 */
	List<Notice> selectNoticeList(PageInfo pInfo);

	/**
	 * 공지사항 전체 갯수 조회 Service
	 * @return
	 */
	int getListCount();

	/**
	 * 공지사항 전체조회 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> searchNoticeByAll(String searchKeyword);

	/**
	 * 공지사항 작성자로 조회 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> searchNoticeByWriter(String searchKeyword);

	/**
	 * 공지사항 제목으로 조회 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> searchNoticeByTitle(String searchKeyword);

	/**
	 * 공지사항 내용으로 조회 Service
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> searchNoticeByContent(String searchKeyword);

	/**
	 * 공지사항 조건에 따라 키워드로 검색 Service(동적쿼리)
	 * @param searchCondition
	 * @param searchKeyword
	 * @return
	 */
	List<Notice> searchNoticeByKeyword(PageInfo pInfo, Map<String, String> paramMap);
	
	/**
	 * 공지사항 검색 게시물 전체 갯수 Service
	 * @param paramMap
	 * @return
	 */
	int getListCount(Map<String, String> paramMap);

	/**
	 * 공지사항 번호로 조회 Service
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(Integer noticeNo);

}
