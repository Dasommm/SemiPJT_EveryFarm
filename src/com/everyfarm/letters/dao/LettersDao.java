package com.everyfarm.letters.dao;

import java.util.List;

import com.everyfarm.letters.dto.LettersDto;

public interface LettersDao {
   //받은쪽지함 총 페이지
   public int inboxTotalPage(int column, String mem_id);
   //보낸쪽지함 총 페이지
   public int sentTotalPage(int column, String mem_id);
   //받은쪽지함 inbox
   public List<LettersDto> inboxLetters(int startseq, int endseq, String mem_id);
   //보낸쪽지함 sent
   public List<LettersDto> sentLetters(int startseq, int endseq, String mem_id);
   //쪽지보내기 send
   public int sendLetters(LettersDto dto);
   //쪽지 삭제
   public int deleteLetters(String[] letter_id);
   //쪽지 상세
   public LettersDto LettersDetail(int letter_id);
   //쪽지 읽음처리
   public int updateStatus(int letter_id);
  
}