package com.aug.spring.member.service;

import com.aug.spring.member.domain.Member;

public interface MemberService {

	/**
	 * 회원 가입 Service
	 * @param member
	 * @return
	 */
	int insertMember(Member member);

	/**
	 * 정보수정 Service
	 * @param member
	 * @return
	 */
	int updateMember(Member member);

	/**
	 * 회원탈퇴 Service, update로 할 예정
	 * @param memberId
	 * @return
	 */
	int deleteMember(String memberId);

	/**
	 * 로그인 Service
	 * @param member
	 * @return
	 */
	Member checkMemberLogin(Member member);

	/**
	 * 마이페이지 Service
	 * @param memberId
	 * @return
	 */
	Member getMemberById(String memberId);


}
