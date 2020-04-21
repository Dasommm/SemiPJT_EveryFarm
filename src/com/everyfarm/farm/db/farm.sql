DROP TABLE WEEKENDFARM;
DROP SEQUENCE WEEKENDFARMSEQ;

CREATE SEQUENCE WEEKENDFARMSEQ;

CREATE TABLE WEEKENDFARM(
	wfarm_key number(10) NOT NULL,   --주말농장키(시퀀스)
	mem_id VARCHAR2(30) NOT NULL,   --회원아이디(FK)
	wfarm_title VARCHAR2(200),     --주말농장 이름
	wfarm_zoneCode VARCHAR2(10),   --주말농장 우편번호
	wfarm_addr VARCHAR2(1000),       --주말농장 주소
	wfarm_totalArea NUMBER(5),     --총 평수
	wfarm_price NUMBER(20),        --평당 가격(1x1)
	wfarm_status VARCHAR2(3),      --주말농장 상태(1.승인대기 , 2.승인)
	wfarm_regDate DATE DEFAULT SYSDATE,        --등록일
	wfarm_image VARCHAR2(3000),             --주말농장 이미지 4개 /   (resources\images\farmimage\apple.png/ +...)
	wfarm_content VARCHAR2(3000),           --주말농장 소개
	CONSTRAINT WEEKENDFARM_PK_wfarm_key PRIMARY KEY(wfarm_key),
	CONSTRAINT WEEKENDFARM_FK_mem_id FOREIGN KEY(mem_id) REFERENCES MEMBER(mem_id) 
);

INSERT INTO WEEKENDFARM
VALUES(WEEKENDFARMSEQ.NEXTVAL,'FARMERKANG','에이작스팜','01234','경기도 용인시 가평군 23',25,1000,'2',SYSDATE,
'resources\images\farmimage\farm01-02.png/
resources\images\farmimage\farm01-01.png/
resources\images\farmimage\farm01-02.png/
resources\images\farmimage\farm01-03.png','토지좋은 주말농장입니다./우리농장최고/농장01전경/농장02전경');

select wfarm_key,mem_id,wfarm_title,wfarm_zoneCode,wfarm_addr,wfarm_totalArea,wfarm_price,
		wfarm_status,wfarm_image,wfarm_content,TO_DATE(wfarm_regDate,'RRRR-MM-DD') from WEEKENDFARM;

		
			select wfarm_key,mem_id,wfarm_title,wfarm_zoneCode,wfarm_addr,wfarm_totalArea,wfarm_price,
		wfarm_status,wfarm_image,wfarm_content,wfarm_regDate,TO_CHAR(wfarm_regDate,'RRRR/MM/DD') from WEEKENDFARM;
SELECT * FROM WEEKENDFARM;

SELECT wfarm_regDate,

TO_CHAR(wfarm_regDate, 'YYYY/MM/DD')

FROM WEEKENDFARM;

		SELECT COUNT(*) AS TOTALPAGE FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id;
        
SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16;  
		
	SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 16 AND 23;		
		
		SELECT *from WEEKENDFARM;
		
			SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_addr LIKE '%용인시%' ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16;
		
			SELECT COUNT(*) AS TOTALPAGE FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_addr LIKE '%용인시%';
        
      SELECT * FROM
        (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 23);
        
        
    SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16 AND wfarm_status = '2';
		
			SELECT COUNT(*) FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id AND wfarm_status = '2';
        
  SELECT B.* 
		FROM (SELECT A.*, ROWNUM AS RNUM
		FROM (SELECT * FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = Member.mem_id ORDER BY wfarm_regDate DESC) A) B
		WHERE RNUM BETWEEN 1 AND 16 AND wfarm_status = '2'  ;
        
        
		
select * from MEMFARM;
select * from weekendfarm;

INSERT INTO MEMFARM
		VALUES(MEMFARMSEQ.NEXTVAL,'GUEST',7,sysdate,12);
		

	SELECT * FROM 
        (SELECT wfarm_key FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 28)A
        	(SELECT wfarm_key FROM MEMJOIN WHERE wfarm_key = 28)B
 		WHERE A.wfarm_key = B.wfarm_key;
        
 SELECT * FROM
 		(SELECT * FROM (SELECT * FROM MEMJOIN INNER JOIN A
 		ON MEMJOIN.wfarm_key = A.wfarm_key)WEEKENDFARM INNER JOIN MEMBER
		ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 28)AS A
		);

SELECT memfarm.wfarm_key
FROM MEMFARM AS memfarm
WHERE wfarm_key =
(SELECT wfarm_key FROM WEEKENDFARM INNER JOIN MEMBER
        ON WEEKENDFARM.mem_id = MEMBER.mem_id WHERE wfarm_key = 28);

FROM WEEKENDFARM c JOIN MEMBER a

USING ( mem_id )  

JOIN MEMJOIN g

ON ( c.wfarm_key = g.wfarm_key );

select * From MEMFARM
WHERE wfarm_key = 28;
	
SELECT COUNT(*)FROM MEMFARM
WHERE wfarm_key = 28;
     
select * From WEEKENDFARM
WHERE wfarm_key = 28;

SELECT * FROM FUND, STOCK WHERE FUND.fund_no IN (
SELECT fund_no FROM FUND INNER JOIN STOCK ON FUND.stock_no = STOCK.stock_no WHERE MEM_ID = 'FARMERKANG');


SELECT B.* 
      FROM (SELECT A.*, ROWNUM AS RNUM
      FROM (SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE MEM_ID = 'FARMERKANG' ORDER BY auc_status DESC) A) B
        WHERE RNUM BETWEEN 1 AND 10;


SELECT B.* 
      FROM (SELECT A.*, ROWNUM AS RNUM
      FROM (SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE mem_id = 'FARMERKANG' AND auc_status = 3) A) B
      WHERE RNUM BETWEEN 1 AND 10;
	
      
      SELECT A.AUC_NO, A.auc_status, S.STOCK_NO, S.MEM_ID FROM AUCTION A INNER JOIN STOCK S ON A.STOCK_NO = S.STOCK_NO WHERE MEM_ID = 'FARMERKANG';
      
      UPDATE AUCTION SET auc_status = 3 WHERE auc_no = 64;
      
SELECT B.* 
      FROM (SELECT A.*, ROWNUM AS RNUM
      FROM (SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE MEM_ID = 'FARMERKANG' and auc_status = 1 OR auc_status = 2 ORDER BY auc_status DESC) A) B
        WHERE RNUM BETWEEN 1 AND 10;  

SELECT * FROM AUCTION INNER JOIN STOCK ON AUCTION.stock_no = STOCK.stock_no WHERE MEM_ID='FARMER';  

SELECT COUNT(*) AS TOTALPAGE FROM FUND INNER JOIN STOCK ON FUND.stock_no = STOCK.stock_no WHERE MEM_ID = 'FARMER';

SELECT * FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE auc_status=3 AND MEM_ID = 'FARMER';
        
SELECT COUNT(*) AS TOTALPAGE FROM AUCTION INNER JOIN STOCK
        ON AUCTION.stock_no = STOCK.stock_no WHERE auc_status=3 AND MEM_ID = 'FARMER';
        
SELECT * FROM MEMJOIN;


SELECT * FROM FUND INNER JOIN STOCK ON FUND.stock_no = STOCK.stock_no WHERE MEM_ID='FARMER';

UPDATE FUND SET fund_status=2 WHERE fund_no = 71;

SELECT order_no FROM ORDERINFO WHERE orderinfo_status=3;




SELECT * FROM BILL WHERE stock_no IN 
				(SELECT stock_no FROM FUND INNER JOIN STOCK ON FUND.stock_no = STOCK.stock_no WHERE mem_id='FARMER') 
			AND order_no IN (SELECT order_no FROM ORDERINFO WHERE orderinfo_status=3);

ORDERINFO.orderinfo_status=3




(SELECT * FROM FUND INNER JOIN STOCK ON FUND.stock_no = STOCK.stock_no WHERE mem_id = 'FARMER');

select * from ORDERINFO WHERE orderinfo_status = 3;
select* from ORDERINFO WHERE orderinfo_status=3;


SELECT B.mem_id,  S.stock_no, B.order_no, O.orderinfo_no, S.mem_id, O.orderinfo_kind, O.orderinfo_status 
FROM STOCK S, BILL B, ORDERINFO O
WHERE S.stock_no = B.stock_no
AND B.order_no = O.order_no
AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1;


SELECT B.mem_id,  S.stock_no, B.order_no, O.orderinfo_no, F.fund_no 
FROM STOCK S, BILL B, ORDERINFO O, FUND F
WHERE F.stock_no = S.stock_no
AND S.stock_no = B.stock_no
AND B.order_no = O.order_no
AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1;



SELECT B.mem_id, B.order_no, O.orderinfo_no, F.fund_no, O.orderinfo_date
	FROM STOCK S, BILL B, ORDERINFO O, FUND F
	WHERE F.stock_no = S.stock_no
	AND S.stock_no = B.stock_no
	AND B.order_no = O.order_no
	AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1 ORDER BY O.orderinfo_date DESC;
	
	
	
SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT B.mem_id, B.order_no, O.orderinfo_no, F.fund_no, O.orderinfo_date
	FROM STOCK S, BILL B, ORDERINFO O, FUND F
	WHERE F.stock_no = S.stock_no
	AND S.stock_no = B.stock_no
	AND B.order_no = O.order_no
	AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1 ORDER BY O.orderinfo_date DESC) A) B 
	WHERE RNUM BETWEEN 1 AND 10;
	
SELECT COUNT(B.order_no) AS TOTALPAGE 
		FROM STOCK S, BILL B, ORDERINFO O
		WHERE S.stock_no = B.stock_no
		AND B.order_no = O.order_no
		AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1;
		
SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT B.mem_id, B.order_no, O.orderinfo_no, F.fund_no, O.orderinfo_date, P.pay_price 
	FROM STOCK S, BILL B, ORDERINFO O, FUND F, PAY P
	WHERE F.stock_no = S.stock_no
	AND S.stock_no = B.stock_no
	AND B.order_no = O.order_no
	AND O.order_no = P.order_no 
	AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1 ORDER BY O.orderinfo_date DESC) A) B 
	WHERE RNUM BETWEEN 1 AND 10;

	
	
SELECT COUNT(B.order_no) AS TOTALPAGE 
		FROM STOCK S, BILL B, ORDERINFO O, PAY P
		WHERE S.stock_no = B.stock_no
		AND B.order_no = O.order_no
		AND O.order_no = P.order_no
		AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1;
		
		
SELECT COUNT(B.order_no) AS TOTALPAGE 
		FROM STOCK S, BILL B, ORDERINFO O, PAY P
		WHERE S.stock_no = B.stock_no
		AND B.order_no = O.order_no
		AND O.order_no = P.order_no
		AND S.mem_id = 'FARMER' AND O.orderinfo_kind = 1 AND O.orderinfo_status=3 OR O.orderinfo_status=4;
		
SELECT * FROM ORDERINFO O, STOCK S, BILL B 
WHERE O.order_no = B.order_no
AND B.stock_no = S.stock_no;

SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT B.mem_id, B.order_no, O.orderinfo_no, F.fund_no, O.orderinfo_date, P.pay_price 
	FROM STOCK S, BILL B, ORDERINFO O, FUND F, PAY P
	WHERE F.stock_no = S.stock_no
	AND S.stock_no = B.stock_no
	AND B.order_no = O.order_no
	AND O.order_no = P.order_no 
	AND S.mem_id = 'FARMER' AND O.orderinfo_status=3 AND O.orderinfo_kind = 1 ORDER BY O.orderinfo_date DESC) A) B 
	WHERE RNUM BETWEEN 1 AND 10;
		

SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT B.mem_id, B.order_no, O.orderinfo_no, O.orderinfo_status, F.fund_no, O.orderinfo_date, P.pay_price 
	FROM STOCK S, BILL B, ORDERINFO O, FUND F, PAY P
	WHERE F.stock_no = S.stock_no
	AND S.stock_no = B.stock_no
	AND B.order_no = O.order_no
	AND O.order_no = P.order_no 
	AND S.mem_id = 'FARMER' AND (O.orderinfo_status=4 or O.orderinfo_status=3) AND O.orderinfo_kind = 1 ORDER BY O.orderinfo_date DESC) A) B 
	WHERE RNUM BETWEEN 1 AND 10;
	
DELETE FROM ORDERINFO WHERE orderinfo_no = 37;

SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM 
(SELECT S.stock_name, B.mem_id, B.order_no, F.fund_no, O.orderinfo_date, O.orderinfo_status, P.pay_price, O.orderinfo_no 
	FROM STOCK S, BILL B, ORDERINFO O, FUND F, PAY P
	WHERE F.stock_no = S.stock_no
	AND S.stock_no = B.stock_no
	AND B.order_no = O.order_no
	AND O.order_no = P.order_no 
	AND S.mem_id = 'FARMER' AND (O.orderinfo_status=3 OR O.orderinfo_status=4) AND O.orderinfo_kind = 1 ORDER BY O.orderinfo_date DESC) A) B 
	WHERE RNUM BETWEEN 1 AND 10;
	
	SELECT COUNT(B.order_no) AS TOTALPAGE 
		FROM STOCK S, BILL B, ORDERINFO O, PAY P
		WHERE S.stock_no = B.stock_no
		AND B.order_no = O.order_no
		AND O.order_no = P.order_no
		AND S.mem_id = 'FARMER' AND O.orderinfo_kind = 1 AND (O.orderinfo_status=3 OR O.orderinfo_status=4);

DELETE FROM ORDERINFO WHERE orderinfo_no = 30;
UPDATE ORDERINFO SET orderinfo_status = 3 WHERE order_no = 40;

SELECT * FROM WEEKENDFARM W, MEMFARM M 
WHERE W.wfarm_key = M.wfarm_key 
AND W.mem_id = 'FARMER'
ORDER BY M.mf_key DESC;


SELECT A.* FROM (
SELECT * FROM WEEKENDFARM W, MEMFARM M 
WHERE W.wfarm_key = M.wfarm_key 
AND W.mem_id = 'FARMER'
ORDER BY M.mf_key DESC)A;

SELECT MEM_ID, WFARM_KEY, WFARM_TITLE, MF_REGDATE, COUNT(*) AS COUNT FROM (SELECT M.MEM_ID, M.MF_KEY, W.WFARM_KEY, W.WFARM_TITLE, SUBSTR(M.MF_REGDATE,1,8) AS MF_REGDATE 
FROM MEMFARM M, WEEKENDFARM W 
WHERE M.WFARM_KEY = W.WFARM_KEY AND W.MEM_ID='FARMER')A
GROUP BY A.MEM_ID, WFARM_KEY, WFARM_TITLE,MF_REGDATE ORDER BY MF_REGDATE DESC;


	

	SELECT MEM_ID, WFARM_KEY, WFARM_TITLE, MF_REGDATE, COUNT(*) AS COUNT FROM 
	(SELECT M.MEM_ID, M.MF_KEY, W.WFARM_KEY, W.WFARM_TITLE, SUBSTR(M.MF_REGDATE,1,8) AS MF_REGDATE 
	FROM MEMFARM M, WEEKENDFARM W 
	WHERE M.WFARM_KEY = W.WFARM_KEY AND W.MEM_ID='FARMER')A
	GROUP BY A.MEM_ID, WFARM_KEY, WFARM_TITLE,MF_REGDATE ORDER BY MF_REGDATE DESC;
	
	SELECT C.* FROM (
	SELECT B.*, ROWNUM AS RNUM FROM 
	(SELECT MEM_ID, WFARM_KEY, WFARM_TITLE, MF_REGDATE, COUNT(*) AS COUNT FROM (SELECT M.MEM_ID, M.MF_KEY, W.WFARM_KEY, W.WFARM_TITLE, SUBSTR(M.MF_REGDATE,1,8) AS MF_REGDATE 
	FROM MEMFARM M, WEEKENDFARM W 
	WHERE M.WFARM_KEY = W.WFARM_KEY AND W.MEM_ID='FARMER')A
	GROUP BY A.MEM_ID, WFARM_KEY, WFARM_TITLE,MF_REGDATE ORDER BY MF_REGDATE DESC)B)C
	WHERE RNUM BETWEEN 1 AND 3;
		
	
	SELECT C.* FROM (
	SELECT B.*, ROWNUM AS RNUM FROM 
	(SELECT MEM_ID, WFARM_KEY, WFARM_TITLE, MF_REGDATE, COUNT(*) AS COUNT FROM 
	(SELECT M.MEM_ID, M.MF_KEY, W.WFARM_KEY, W.WFARM_TITLE, M.MF_REGDATE
	FROM MEMFARM M, WEEKENDFARM W 
	WHERE M.WFARM_KEY = W.WFARM_KEY AND W.MEM_ID='FARMER')A
	GROUP BY A.MEM_ID, WFARM_KEY, WFARM_TITLE,MF_REGDATE ORDER BY MF_REGDATE DESC)B)C
	WHERE RNUM BETWEEN 1 AND 3;
	
	
SELECT O.orderinfo_kind, S.stock_name, B.mem_id, P.pay_price, O.orderinfo_date 
FROM STOCK S, BILL B, ORDERINFO O, PAY P
WHERE S.stock_no = B.stock_no AND B.order_no = O.order_no AND O.order_no = P.order_no 
AND S.stock_no IN(
SELECT stock_no FROM STOCK WHERE mem_id = 'FARMER')
ORDER BY B.order_no DESC;
	
	SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT O.orderinfo_kind, S.stock_name, B.mem_id, P.pay_price, O.orderinfo_date 
	FROM STOCK S, BILL B, ORDERINFO O, PAY P
	WHERE S.stock_no = B.stock_no AND B.order_no = O.order_no AND O.order_no = P.order_no 
	AND S.stock_no IN(
	SELECT stock_no FROM STOCK WHERE mem_id = 'FARMER')
	ORDER BY B.order_no DESC)A)B
	WHERE RNUM BETWEEN 1 AND 3;
	
	SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM 
	(SELECT S.stock_name, B.mem_id, B.order_no, O.orderinfo_date, P.pay_price 
	FROM STOCK S, BILL B, ORDERINFO O, PAY P
	WHERE AND S.stock_no = B.stock_no
	AND B.order_no = O.order_no
	AND O.order_no = P.order_no 
	AND S.mem_id = 'FARMER' AND O.orderinfo_status = 3 AND O.orderinfo_kind = 1 
	ORDER BY O.orderinfo_date DESC) A) B 
	WHERE RNUM BETWEEN 1 AND 3;
	
	SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT O.ORDER_NO, S.STOCK_NAME, P.PAY_PRICE, B.MEM_ID, O.ORDERINFO_DATE 
	FROM STOCK S, BILL B, ORDERINFO O, PAY P
	WHERE S.STOCK_NO = B.STOCK_NO
	AND B.ORDER_NO = O.ORDER_NO
	AND O.ORDER_NO = P.ORDER_NO
	AND B.STOCK_NO IN (SELECT STOCK_NO FROM STOCK WHERE MEM_ID = 'FARMER')
	AND O.ORDERINFO_STATUS = 3 AND O.ORDERINFO_KIND = 1
	ORDER BY O.ORDERINFO_DATE DESC)A)B
	WHERE RNUM BETWEEN 1 AND 3;
	
	SELECT * FROM FUND INNER JOIN STOCK ON FUND.STOCK_NO = STOCK.STOCK_NO
	WHERE STOCK.MEM_ID = 'FARMER' AND FUND.FUND_STATUS = 2;
	
	SELECT COUNT(*) AS RUNNINGFUND FROM FUND INNER JOIN STOCK ON FUND.STOCK_NO = STOCK.STOCK_NO
	WHERE STOCK.MEM_ID = 'FARMER' AND FUND.FUND_STATUS = 2;
	
	
	SELECT * FROM MEMFARM;
	
	
	SELECT * FROM WEEKENDFARM 
	WHERE MEM_ID = 'FARMER';
	
	SELECT WFARM_KEY, WFARM_TITLE, WFARM_TOTALAREA, WFARM_STATUS, WFARM_REGDATE, WFARM_ZONECODE, WFARM_ADDR FROM WEEKENDFARM
	WHERE MEM_ID = 'FARMER';
	
	SELECT B.* FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT WFARM_KEY, WFARM_TITLE, WFARM_TOTALAREA, WFARM_STATUS, WFARM_REGDATE, WFARM_ZONECODE, WFARM_ADDR 
	FROM WEEKENDFARM 
	WHERE MEM_ID = 'FARMER'
	ORDER BY WFARM_KEY DESC)A) B
	WHERE RNUM BETWEEN 1 AND 10;
	
	SELECT * FROM
	(SELECT M.MEM_ID, W.WFARM_TITLE, M.MF_REGDATE, M.MF_AREA
	FROM WEEKENDFARM W, MEMFARM M
	WHERE M.wfarm_key = W.wfarm_key
	AND W.wfarm_key = 29)
	
	SELECT MEM_ID, MF_REGDATE, COUNT(MF_AREA) AS COUNT FROM 
	(SELECT MEM_ID, MF_AREA, SUBSTR(MF_REGDATE,1,8) AS MF_REGDATE 
	FROM MEMFARM
	WHERE WFARM_KEY = #{wfarm_key})A
	GROUP BY A.MEM_ID, MF_REGDATE ORDER BY MF_REGDATE DESC;
	
	SELECT COUNT(*) FROM (SELECT MEM_ID, MF_REGDATE, COUNT(MF_AREA) AS COUNT FROM 
		(SELECT MEM_ID, MF_AREA, SUBSTR(MF_REGDATE,1,8) AS MF_REGDATE 
		FROM MEMFARM
		WHERE WFARM_KEY = 29)A
		GROUP BY A.MEM_ID, MF_REGDATE ORDER BY MF_REGDATE DESC);
		
	
	SELECT A.WFARM_TITLE, A.MEM_ID, A.MF_REGDATE, COUNT(MF_AREA) AS COUNT FROM 
	(SELECT W.wfarm_title, M.MEM_ID, M.MF_AREA, SUBSTR(M.MF_REGDATE,1,8) AS MF_REGDATE
	FROM MEMFARM M, WEEKENDFARM W
	WHERE M.WFARM_KEY = W.WFARM_KEY AND M.WFARM_KEY = 29)A
	GROUP BY A.MEM_ID, A.MF_REGDATE, A.WFARM_TITLE ORDER BY A.MF_REGDATE DESC;
		
	SELECT W.wfarm_title, M.MEM_ID, M.MF_AREA, SUBSTR(M.MF_REGDATE,1,8) AS MF_REGDATE
	FROM MEMFARM M, WEEKENDFARM W
	WHERE M.WFARM_KEY = W.WFARM_KEY 
	AND M.WFARM_KEY = 29;
	
	SELECT A.WFARM_TITLE, A.MEM_ID, A.MF_REGDATE, COUNT(MF_AREA) AS COUNT FROM 
	(SELECT W.wfarm_title, M.MEM_ID, M.MF_AREA, SUBSTR(M.MF_REGDATE,1,8) AS MF_REGDATE
	FROM MEMFARM M, WEEKENDFARM W
	WHERE M.WFARM_KEY = W.WFARM_KEY AND M.WFARM_KEY = 29)A
	GROUP BY A.MEM_ID, A.MF_REGDATE, A.WFARM_TITLE ORDER BY A.MF_REGDATE DESC;
	
	
	SELECT * FROM AUCTION, STOCK WHERE AUCTION.STOCK_NO = STOCK.STOCK_NO;
	
	SELECT * FROM MEMBER;
	DELETE FROM MEMBER WHERE MEM_NAME='서채원';
	
	