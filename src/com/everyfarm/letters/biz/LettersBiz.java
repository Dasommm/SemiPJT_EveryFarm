package com.everyfarm.letters.biz;

import java.util.List;

import com.everyfarm.letters.dto.LettersDto;
import com.everyfarm.memberMyPage.dto.PagingDto;

public interface LettersBiz {
	//받은쪽지함 페이징 적용해서 가져오기
	public List<LettersDto> inboxLetters(PagingDto dto, String mem_id);
	//보낸쪽지함 페이징 적용해서 가져오기
	public List<LettersDto> sentLetters(PagingDto dto, String mem_id);
}
