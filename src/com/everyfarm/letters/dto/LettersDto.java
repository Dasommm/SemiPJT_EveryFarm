package com.everyfarm.letters.dto;

import java.util.Date;

public class LettersDto {
   private int letter_id;
   private String mem_id;
   private String letter_sender;
   private String letter_title;
   private String letter_content;
   private Date letter_regdate;
   private int letter_status;
   
   //페이징
 	private int startseq;
 	private int endseq;
   
   public LettersDto() {
      
   }

   public LettersDto(int letter_id, String mem_id, String letter_sender, String letter_title, String letter_content,
         Date letter_regdate, int letter_status) {
      super();
      this.letter_id = letter_id;
      this.mem_id = mem_id;
      this.letter_sender = letter_sender;
      this.letter_title = letter_title;
      this.letter_content = letter_content;
      this.letter_regdate = letter_regdate;
      this.letter_status = letter_status;
   }

   public int getLetter_id() {
      return letter_id;
   }

   public void setLetter_id(int letter_id) {
      this.letter_id = letter_id;
   }

   public String getMem_id() {
      return mem_id;
   }

   public void setMem_id(String mem_id) {
      this.mem_id = mem_id;
   }

   public String getLetter_sender() {
      return letter_sender;
   }

   public void setLetter_sender(String letter_sender) {
      this.letter_sender = letter_sender;
   }

   public String getLetter_title() {
      return letter_title;
   }

   public void setLetter_title(String letter_title) {
      this.letter_title = letter_title;
   }

   public String getLetter_content() {
      return letter_content;
   }

   public void setLetter_content(String letter_content) {
      this.letter_content = letter_content;
   }

   public Date getLetter_regdate() {
      return letter_regdate;
   }

   public void setLetter_regdate(Date letter_regdate) {
      this.letter_regdate = letter_regdate;
   }

   public int getLetter_status() {
      return letter_status;
   }

   public void setLetter_status(int letter_status) {
      this.letter_status = letter_status;
   }

	public int getStartseq() {
		return startseq;
	}
	
	public void setStartseq(int startseq) {
		this.startseq = startseq;
	}
	
	public int getEndseq() {
		return endseq;
	}
	
	public void setEndseq(int endseq) {
		this.endseq = endseq;
	}
   
   
}