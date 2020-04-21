package com.everyfarm.letters.biz;

import java.util.List;

import com.everyfarm.letters.dao.LettersDao;
import com.everyfarm.letters.dao.LettersDaoImpl;
import com.everyfarm.letters.dto.LettersDto;
import com.everyfarm.memberMyPage.dto.PagingDto;

public class LettersBizImpl implements LettersBiz {
	
	private LettersDao dao  = new LettersDaoImpl();

	@Override
	public List<LettersDto> inboxLetters(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   
		int column = dto.getColumn();   
		
		int startseq = column * (currentpage - 1) + 1;  
		int endseq = column * currentpage;   
		
		return dao.inboxLetters(startseq, endseq, mem_id);
	}

	@Override
	public List<LettersDto> sentLetters(PagingDto dto, String mem_id) {
		int currentpage = dto.getCurrentpage();   
		int column = dto.getColumn();   
		
		int startseq = column * (currentpage - 1) + 1;  
		int endseq = column * currentpage;   
		
		return dao.sentLetters(startseq, endseq, mem_id);
	}

}
