package com.everyfarm.homeletters.dao;

import com.everyfarm.letters.dto.LettersDto;

public interface HomeLettersDao {

	//홈화면 안읽음 쪽지 갯수 추출함수
	public int LettersCnt(LettersDto lettersdto);
}
