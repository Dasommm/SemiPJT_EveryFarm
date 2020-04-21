DROP TABLE AUCTION;
CREATE SEQUENCE AUCTIONSEQ;

DROP SEQUENCE AUCTIONSEQ;
CREATE TABLE AUCTION(  --경매테이블
	auc_no NUMBER(15) NOT NULL,  --경매번호
	stock_no NUMBER(15) NOT NULL,  --상품번호
	auc_startPrice NUMBER(20),  --경매시작가
	auc_nowPrice NUMBER(20),    --현재경매가(회원이 경매참가한 순간,낙찰시 낙찰가)
	auc_status NUMBER(3),      --경매상태( (1)미등록 /(2)진행중/ (3)낙찰
	auc_regDate DATE DEFAULT SYSDATE,   --경매등록일
	auc_endDate DATE,    --경매 종료일     (남은시간계산 : 종료일-현재시간)
	auc_join NUMBER(10) DEFAULT 0, --경매 참여인원
	CONSTRAINT AUCTION_PK_auc_no PRIMARY KEY(auc_no),
	CONSTRAINT AUCTION_FK_stock_no FOREIGN KEY(stock_no) REFERENCES STOCK(stock_no) 
	
);
select*from auction order by auc_no desc;
--더미 데이터 입력--

INSERT INTO AUCTION
VALUES(AUCTIONSEQ.NEXTVAL,140,15000,0,3,sysdate,to_date('2020/02/17 00:00:00','YYYY/MM/DD HH24:MI:SS'),0);

ALTER TABLE AUCTION DROP CONSTRAINT AUCTION_FK_stock_no;

ALTER TABLE AUCTION ADD CONSTRAINT AUCTION_FK_stock_no FOREIGN KEY (stock_no)  
REFERENCES STOCK(stock_no) ON DELETE CASCADE;

--ajax테스트
update auction
set auc_nowPrice = 30000,auc_join=200
where auc_no = 111;

select auc_nowPrice,auc_join
from auction
where auc_no = 113;

commit
DELETE FROM AUCTION;

select * from auction order by auc_no desc;

--일반경매 상품 select문
SELECT * FROM AUCTION FULL OUTER JOIN STOCK
ON AUCTION.stock_no = STOCK.stock_no;

--best경매 상품 4개 select문
SELECT * FROM
(SELECT * FROM AUCTION FULL OUTER JOIN STOCK
ON AUCTION.stock_no = STOCK.stock_no
ORDER BY auc_join DESC)
WHERE ROWNUM <= 4;

DE
DELETE FROM AUCTION WHERE STOCK_NO = 18;
--참여회원테이블-----------------------------------------------
DROP SEQUENCE MEMJOINSEQ;
CREATE SEQUENCE MEMJOINSEQ;
DROP TABLE MEMJOIN;
CREATE TABLE MEMJOIN(
	memjoin_no number(10) NOT NULL,        --입찰시 시퀀스 테이블 사용
	mem_id VARCHAR2(30) NOT NULL,
	fund_no number(15),
	auc_no number(15),           --입찰시 where절에 사용될 FK
	memjoin_aucPrice number(20),     --입찰시 insert시킬 금액
	memjoin_fundPrice number(20),
	memjoin_regDate DATE DEFAULT SYSDATE,
	CONSTRAINT MEMJOIN_PK_memjoin_no PRIMARY KEY(memjoin_no),
	CONSTRAINT MEMJOIN_FK_mem_id FOREIGN KEY(mem_id) REFERENCES MEMBER(mem_id),
	CONSTRAINT MEMJOIN_FK_fund_no FOREIGN KEY(fund_no) REFERENCES FUND(fund_no),
	CONSTRAINT MEMJOIN_FK_auc_no FOREIGN KEY(auc_no) REFERENCES AUCTION(auc_no)
);

select*from AUCTION;
SELECT * FROM MEMJOIN;
INSERT INTO MEMJOIN
VALUES(MEMJOINSEQ.NEXTVAL,null,50,0,0,sysdate);    --더미데이터 40~50까지 insert되있음

--경매 구매시 변경할 사항(경매테이블)
  UPDATE AUCTION
        SET auc_nowPrice = 5000, auc_join = 1    --최고가update, 참여회원 select로 뽑은 후 +1    (최고가현재 : 4600 / 참여회원 현재: 12)
        WHERE auc_no = 107;    --해당 경매번호
        
--경매 구매시 변경할 사항(참여회원테이블)
	INSERT INTO MEMJOIN            --아이디,경매번호,입력받은 입찰가
	VALUES(MEMJOINSEQ.NEXTVAL,'GUEST',null,107,1000,null,sysdate);
---------------------------------------------------------------
        
        
        
        
--펀드 테이블----------------------------------
CREATE SEQUENCE FUNDSEQ;
CREATE TABLE FUND(
	fund_no number(15) NOT NULL,
	stock_no number(15) NOT NULL,
	fund_currentprice number(20),
	fund_price number(20) NOT NULL,
	fund_status number(3) NOT NULL,
	fund_regDate DATE DEFAULT SYSDATE NOT NULL,
	fund_endDate DATE DEFAULT SYSDATE NOT NULL,
	fund_join number(10),
	CONSTRAINT FUND_PK_fund_no PRIMARY KEY(fund_no),
	CONSTRAINT FUND_FK_stock_no FOREIGN KEY(stock_no) REFERENCES STOCK(stock_no)
);
SELECT * FROM FUND;
INSERT INTO FUND
VALUES(FUNDSEQ.NEXTVAL,1,0,0,0,sysdate,sysdate,0);
---------------------------------------------

select TO_DATE(A*.,'YYYY-MM-DD')FROM
(SELECT TO_DATE('2020-02-14','YYYY-MM-DD') -  sysdate FROM DUAL)A;

SELECT enddate,sysdate FROM(
SELECT TO_CHAR(
TO_DATE(auc_endDate,'YYYY-MM-DD'),
   'YY-MM-DD HH24:MI:SS')as enddate FROM AUCTION
   WHERE AUC_NO=13);

   
SELECT sysdate FROM auction;   

SELECT TO_CHAR(
TO_DATE(auc_endDate,'YYYY-MM-DD'),
'YY-MM-DD HH24:MI:SS') FROM AUCTION WHERE auc_no = 110;  --110번의 종료일

SELECT TO_CHAR(
TO_DATE(auc_endDate,'YYYY-MM-DD'),
'YY-MM-DD HH24:MI:SS')as ENDDATE,
TO_CHAR(sysdate,'YY-MM-DD HH24:MI:SS')as CURDATE,
FROM AUCTION WHERE AUC_NO = 110;

select TO_CHAR(sysdate,'YY-MM-DD HH24:MI:SS')from dual;

SELECT * FROM AUCTION;

select auc_endDate from auction where auc_no = 25;
--경매 실시간 시간---------------------------------------------------------------------------
SELECT 
       TRUNC(EndDate - StartDate) as "일", 
         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "시간", 
         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "분",
         FLOOR(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60)
         - TRUNC((((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60 * 60)%60) as "초"

       
  FROM (              
        SELECT sysdate as StartDate,  -- 시작일
                       TO_DATE(auc_endDate,'rrrr-mm-dd hh24:mi:ss') as EndDate    -- 종료일
             FROM AUCTION WHERE auc_no = 62
        )
        
   SELECT *FROM AUCTION WHERE AUC_NO = 113 ;     
---------------------------------------------------------------------------------------

-- 날짜의 차이를 알아내는 함수 MONTHS_BETWEEN(날짜, 날짜)
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2013-12-25')) FROM DUAL;

--현재 날짜로 부터 마지막 날짜 까지의 남은 일수를 조회
    SELECT last_day(sysdate)-sysdate FROM dual -- 21 

FLOOR((END_DATE - START_DATE)) 

SELECT * 
FROM(
		SELECT *  FROM AUCTION INNER JOIN STOCK ON AUCTION.stock_no = STOCK.stock_no WHERE auc_status = 2 ORDER BY auc_join DESC
		)
	WHERE ROWNUM = 1;

SELECT *
  FROM (
            select board_seq, board_name, insert_date
            from t_board
            order by insert_date desc
            )
   WHERE ROWNUM >= 1 AND ROWNUM <= 10

   
   select * from auction where auc_no = 113;