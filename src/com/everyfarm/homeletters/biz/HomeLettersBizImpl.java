package com.everyfarm.homeletters.biz;

import com.everyfarm.homeletters.dao.HomeLettersDao;
import com.everyfarm.homeletters.dao.HomeLettersDaoImpl;
import com.everyfarm.letters.dto.LettersDto;

public class HomeLettersBizImpl implements HomeLettersBiz{

	private HomeLettersDao dao = new HomeLettersDaoImpl();
	
	@Override
	public int LettersCnt(LettersDto lettersdto) {
		
		return dao.LettersCnt(lettersdto);
	}

}
