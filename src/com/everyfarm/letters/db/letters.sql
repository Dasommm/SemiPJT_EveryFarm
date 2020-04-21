DROP SEQUENCE LETTERSSEQ;
CREATE SEQUENCE LETTERSSEQ;
DROP TABLE LETTERS;
CREATE TABLE LETTERS(
	letter_id NUMBER(5) NOT NULL,	--쪽지번호(시퀀스)
	mem_id VARCHAR2(30) NOT NULL,	--수신자
	letter_sender VARCHAR2(30) NOT NULL,	--발신자
	letter_title VARCHAR2(100) NOT NULL,	--쪽지제목
	letter_content VARCHAR2(500) NOT NULL,	--쪽지내용
	letter_regdate DATE NOT NULL,			--작성일
	letter_status number(2),          -- (0)안읽음 / (1)읽음
	CONSTRAINT LETTERS_PK_letter_id PRIMARY KEY(letter_id),
	CONSTRAINT LETTERS_FK_mem_id FOREIGN KEY(mem_id) REFERENCES MEMBER(mem_id)
);
INSERT INTO LETTERS VALUES(LETTERSSEQ.NEXTVAL,'GUEST','관리자','테스트용 쪽지','테스트입니다',SYSDATE);
select * from letters;

--쪽지 컬럼추가
ALTER TABLE LETTERS ADD(letter_status number(2));

update letters
set letter_status = 1
where letter_id = 23;

SELECT COUNT(*) FROM LETTERS
		WHERE mem_id = 'GUEST' AND letter_status = 0;
		
SELECT mem_id from
		(SELECT mem_id from )

		
select * from stock inner join (
select * from 
(select * from auction inner join memjoin on auction.auc_no = memjoin.auc_no 
   where memjoin_aucprice in(select auc_nowprice 
                     from auction inner join memjoin on auction.auc_no = memjoin.auc_no
                     where auc_status = 3)
                     )
where mem_id='GUEST') using(stock_no) ;						
										