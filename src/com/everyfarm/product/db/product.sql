SELECT*FROM MEMBER;

delete from member
where mem_id = '1268419765';

DROP TABLE STOCK;
CREATE SEQUENCE STOCKSEQ;
DROP SEQUENCE STOCKSEQ;
CREATE TABLE STOCK(    --상품테이블
	stock_no NUMBER(15) NOT NULL,  --상품번호(시퀀스)
	mem_id VARCHAR2(30) NOT NULL, --회원아이디
	stock_name VARCHAR2(100) NOT NULL,    --상품명
	stock_detail VARCHAR2(500) NOT NULL,  --상품특징
	stock_kg NUMBER(10) NOT NULL,  --무게(전체)
	stock_price NUMBER(10) NOT NULL,  --상품가격
	stock_image VARCHAR2(1000) NOT NULL,   --상품이미지(섬네일+내용) 총4개          / 로 구분
	stock_location VARCHAR2(30) NOT NULL,  --지역( ex.성동구,강남구.....)
	stock_kind NUMBER(5) NOT NULL, --품목( (1)과일 /(2)채소 / (3)곡류 / (4)견과류 / (5)약용작물 / (6)버섯류
	CONSTRAINT STOCK_PK_stock_no PRIMARY KEY(stock_no),
	CONSTRAINT STOCK_FK_mem_id FOREIGN KEY(mem_id) REFERENCES MEMBER(mem_id)
);

select *from stock order by stock_no desc;

DELETE FROM STOCK;
select * from member where mem_id = 'FARMERKIM';

select * from member;
-----------------------------------------------------------------------------------------------------
INSERT INTO STOCK
VALUES(STOCKSEQ.NEXTVAL,'FARMERKIM','싱싱사과','포천시 싱싱한 사과입니다./현재 시가보다 저렴하게 판매하고 있습니다./서둘러 입찰해 주세요./문의사항은 쪽지주세요.',
		50,0,'resources\images\productstorage\사과1.png/
					resources\images\productstorage\사과2.png/
					resources\images\productstorage\사과3.png/
					resources\images\productstorage\사과4.png',
		'포천시',1);
-----------------------------------------------------------------------------------------------------
select *from stock order by stock_no desc;

--더미 데이터 입력---------------------------------------------------

INSERT INTO AUCTION
VALUES(AUCTIONSEQ.NEXTVAL,311,1000,0,2,sysdate,to_date('2020/02/29 00:00:00','YYYY/MM/DD HH24:MI:SS'),0);

----------------------------------------------------------		

delete from auction where auc_no = 131;

SELECT COUNT(*) AS TOTALPAGE FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE mem_id = 'FARMER' AND auc_status = 1 OR auc_status = 2;		
		
		
		SELECT COUNT(*) AS TOTALPAGE FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no;
        
        --경매 전체출력
        SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no ORDER BY auc_regDate DESC) A) B;
		
		 T1 INNER JOIN T2 ON T1.A=T2.A
		DELETE FROM STOCK WHERE STOCK_NO = 18;
		
		--경매 지역별 출력
		SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE stock_location = '양주시' ORDER BY auc_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16;
		
		SELECT COUNT(*) AS TOTALPAGE FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE stock_location = '성동구';
        
        --경매detail출력
        SELECT * FROM
        (SELECT * FROM AUCTION FULL OUTER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE auc_no = 12);
        
        
 --쪽지 테이블---------------------------------------------------------
 SELECT * FROM LETTERS;
 select * from lettersseq;
 
INSERT INTO LETTERS
		VALUES(LETTERSSEQ.NEXTVAL,'GUESTKIM','FARMER','안녕','안녕',sysdate);
 
 ------------------------------------------------------------------       
      SELECT COUNT(*) AS TOTALPAGE FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE auc_status=1;
        
      SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no ORDER BY auc_status DESC) A) B;
        
        	SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no ORDER BY auc_status DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16;
		-----
		select * from auction;

		--일반리스트 시간 뽑기
SELECT * FROM		
	(SELECT A.*,ROWNUM AS RNUM
	FROM (SELECT 
       	TRUNC(EndDate - StartDate) as "day", 
         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "hours", 
         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "minutes" 
  FROM (SELECT sysdate as StartDate,
        TO_DATE('2020-02-14 00:00:00','rrrr-mm-dd hh24:mi:ss') as EndDate 
        FROM AUCTION WHERE auc_status=2 ORDER BY auc_regDate DESC)
        )A
        )
WHERE RNUM BETWEEN 1 AND 16;
---------------------------------------------------
  	SELECT * FROM
		(SELECT * FROM AUCTION INNER JOIN STOCK
		ON AUCTION.stock_no = STOCK.stock_no
		ORDER BY auc_join DESC)
		WHERE ROWNUM <= 4;  
 ---------------------------------------------------
 --best리스트 시간 계산
 SELECT * FROM		
	(SELECT *
	FROM (SELECT 
       	TRUNC(EndDate - StartDate) as "day", 
         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "hours", 
         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "minutes" 
  FROM (SELECT sysdate as StartDate,
        TO_DATE(auc_endDate,'rrrr-mm-dd hh24:mi:ss') as EndDate 
        FROM AUCTION WHERE auc_status=2 ORDER BY auc_join DESC)
        )
WHERE ROWNUM <= 4;  
        )
WHERE RNUM BETWEEN 1 AND 4;   
---------------------------------------------------
--품목별 시간계산
SELECT * FROM		
	(SELECT A.*,ROWNUM AS RNUM
	FROM (SELECT 
       	TRUNC(EndDate - StartDate) as "day", 
         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "hours", 
         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "minutes" 
  FROM (SELECT sysdate as StartDate,
        TO_DATE(auc_endDate,'rrrr-mm-dd hh24:mi:ss') as EndDate 
        FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE stock_kind = 1 AND auc_status=2 ORDER BY auc_regDate DESC)
        )A
        )
WHERE RNUM BETWEEN 1 AND 16;


-----------------------------------------------------------------------------
		
SELECT *FROM 
	(SELECT 
       	TRUNC(EndDate - StartDate) as "day", 
         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "hours", 
         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "minutes" 
  FROM (SELECT sysdate as StartDate,
        TO_DATE(auc_endDate,'rrrr-mm-dd hh24:mi:ss') as EndDate 
        FROM AUCTION WHERE auc_status=2)
        )

<update id="updateAuctioninfo" parameterType="productDto">
		UPDATE AUCTION
		SET auc_nowPrice=#{auc_nowPrice},auc_join=#{auc_join}
		WHERE auc_no=#{auc_no}
</update>
------------------------------------------------------------------
<update id="updateAucStatus">		
   UPDATE AUCTION
   		<if test="day <= 0 and hours <= 0 and minutes <= 0">
   			SET auc_status = 3
   		</if>
   			SET auc_status = 2
   where (
	   SELECT 
	       	TRUNC(EndDate - StartDate) as "day", 
	         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "hours", 
	         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
	         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "minutes" 
	  FROM (SELECT sysdate as StartDate,
	        TO_DATE(auc_endDate,'rrrr-mm-dd hh24:mi:ss') as EndDate 
	        FROM AUCTION WHERE auc_status=2)
   )
   </update>
   ---------------------------------------------
   
      UPDATE AUCTION
   			SET auc_status = 3
   where (SELECT 
	       	TRUNC(EndDate - StartDate) as "day", 
	         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "hours", 
	         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
	         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "minutes" 
	  FROM (SELECT sysdate as StartDate,
	        TO_DATE(auc_endDate,'rrrr-mm-dd hh24:mi:ss') as EndDate 
	        FROM AUCTION WHERE auc_status=2));
	        
	        -----------------------------------------
	       
	        select auc_no FRom AUCTION where auc_endDate <= sysdate and auc_status = 2;
	        --------------
    select * FRom dual
    WHERE TO_CHAR(REGDATE, 'YYYYMMDD') < sysdate;
    
    
    	SELECT *
	FROM (SELECT 
       	TRUNC(EndDate - StartDate) as "day", 
         TRUNC(((EndDate - StartDate) - TRUNC(EndDate - StartDate)) * 24) as "hours", 
         FLOOR(((((EndDate - StartDate) -TRUNC(EndDate - StartDate)) * 24) 
         - TRUNC(((EndDate - StartDate)-TRUNC(EndDate - StartDate)) * 24)) * 60) as "minutes" 
  FROM (SELECT sysdate as StartDate,
        TO_DATE(auc_endDate,'rrrr-mm-dd hh24:mi:ss') as EndDate 
        FROM AUCTION WHERE auc_status=2 ORDER BY auc_join DESC)
        )
WHERE ROWNUM <= 4;
-----------------
SELECT *

  FROM AUCTION

 WHERE auc_endDate <=  TO_CHAR(SYSDATE, 'YYYYMMDD') and auc_status = 2;
--------------------------------------------------
 update AUCTION
 set auc_status = 3
 where auc_no = (select auc_no from AUCTION where auc_endDate <= sysdate and auc_status = 2);
 
 select * from auction where auc_status = 3;
 
 select * from auction where auc_no = 1;
 
 
 --농부가 환불한 고객 조회--
 select * from (
 
 select * from stock
 where mem_id = 'FARMER'
 and stock_no in
 	(select stock_no from orderinfo inner join bill on orderinfo.order_no = bill.order_no
 	where orderinfo_status = 3 and orderinfo_kind = 1);
 	
 	
select * from orderinfo inner join 	
(select stock_no from stock
 where mem_id = 'FARMER'
 and stock_no in
 	(select stock_no from orderinfo inner join bill on orderinfo.order_no = bill.order_no
 	where orderinfo_status = 3 and orderinfo_kind = 1)
 	)using(stock_no); 	
 	
 	
 	
 	
 	B
 	)where stock.mem_id = 'FARMER' using(stock_no);
 	
 	)
 	where A.mem_id = 'FARMER';
 	
 	select * from(
 	select * from stock inner join bill on stock.stock_no = bill.stock_no inner join orderinfo
 	on bill.order_no = orderinfo.order_no)
 	where stock.mem_id = 'FARMER';

 	
 	select * from 
 	where mem_id = 'FARMER';
 	
----------------------------------------------- 	
 	select * from stock inner join (
select * from 
(select * from auction inner join memjoin on auction.auc_no = memjoin.auc_no 
   where memjoin_aucprice in(select auc_nowprice 
                     from auction inner join memjoin on auction.auc_no = memjoin.auc_no
                     where auc_status = 3)
                     )
where mem_id='GUEST') using(stock_no) ;