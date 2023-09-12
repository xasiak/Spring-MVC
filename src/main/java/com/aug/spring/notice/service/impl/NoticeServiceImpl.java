package com.aug.spring.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aug.spring.notice.domain.Notice;
import com.aug.spring.notice.domain.PageInfo;
import com.aug.spring.notice.service.NoticeService;
import com.aug.spring.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSession session;
	
	@Autowired
	private NoticeStore nStore;

	@Override
	public int insertNotice(Notice notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}

	@Override
	public List<Notice> selectNoticeList(PageInfo pInfo) {
		List<Notice> nList = nStore.selectNoticeList(session, pInfo);
		return nList;
	}

	@Override
	public int getListCount() {
		int result = nStore.selectListCount(session);
		return result;
	}

	@Override
	public List<Notice> searchNoticeByAll(String searchKeyword) {
		List<Notice> searchList = nStore.searchNoticeByAll(session, searchKeyword);
		return searchList;
	}

	@Override
	public List<Notice> searchNoticeByWriter(String searchKeyword) {
		List<Notice> searchList = nStore.searchNoticeByWriter(session, searchKeyword);
		return searchList;
	}

	@Override
	public List<Notice> searchNoticeByTitle(String searchKeyword) {
		List<Notice> searchList = nStore.selectNoticeByTitle(session, searchKeyword);
		return searchList;
	}

	@Override
	public List<Notice> searchNoticeByContent(String searchKeyword) {
		List<Notice> searchList = nStore.searchNoticeByContent(session, searchKeyword);
		return searchList;
	}

	@Override
	public List<Notice> searchNoticeByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
		List<Notice> searchList = nStore.searchNoticeByKeyword(session, pInfo, paramMap);
		return searchList;
	}

	@Override
	public int getListCount(Map<String, String> paramMap) {
		int result = nStore.selectListCount(session, paramMap);
		return result;
	}

	@Override
	public Notice selectNoticeByNo(Integer noticeNo) {
		Notice noticeOne = nStore.selectNoticeByNo(session, noticeNo);
		return noticeOne;
	}
}
