DROP SEQUENCE WEEKENDFARMSEQ;
DROP TABLE WEEKENDFARM;

CREATE SEQUENCE WEEKENDFARMSEQ;
CREATE TABLE WEEKENDFARM (
	wfarm_key NUMBER(10) NOT NULL,
	mem_id VARCHAR2(30) NOT NULL,
	wfarm_title VARCHAR2(200),
	wfarm_zoneCode VARCHAR2(10),
	wfarm_addr VARCHAR2(20),
	wfarm_totalArea NUMBER(5),
	wfarm_price NUMBER(20),
	wfarm_status VARCHAR2(3),
	wfarm_regDate DATE DEFAULT SYSDATE,
	wfarm_image VARCHAR2(1000),
	wfarm_content VARCHAR2(1000),
	CONSTRAINT WEEKENDFARM_PK_wfarm_key PRIMARY KEY (wfarm_key),
	CONSTRAINT WEEKENDFARM_FK_mem_id FOREIGN KEY (mem_id) REFERENCES MEMBER(mem_id) ON DELETE CASCADE
);

INSERT INTO WEEKENDFARM VALUES(
WEEKENDFARMSEQ.NEXTVAL, 
'FARMERKANG',
'강의 주말농장',
'44547',
'경기',
30,
10000,
'1',
SYSDATE,
'fsdfsdf',
'신청하세여'
);

SELECT * FROM WEEKENDFARM WHERE mem_id=(SELECT mem_id FROM MEMBER WHERE mem_name='농부');

SELECT * FROM WEEKENDFARM;

SELECT * FROM AUCTION;

SELECT * FROM USER_SEQUENCES;
SELECT * FROM STOCK;

INSERT INTO STOCK VALUES(
	STOCKSEQ.NEXTVAL, 
	'FARMERKANG', 
	'경매로내놓은망고', 
	'존맛탱/노란망고/당도높음/후숙하면 더 맛있습니다', 
	100, 
	30000, 
	'../resources/images/productstorage/sweetemango.png', 
	'오산시', 
	1
);

INSERT INTO AUCTION (auc_no, stock_no, auc_startPrice, auc_status, auc_regDate) VALUES (
AUCTIONSEQ.NEXTVAL, 
(SELECT stock_no FROM (SELECT * FROM STOCK WHERE mem_id='FARMERKANG' ORDER BY stock_no DESC) WHERE ROWNUM=1), 
50000,
1,
SYSDATE
);

SELECT stock_no FROM STOCK ORDER BY stock_no DESC;

SELECT * FROM AUCTION;
SELECT * FROM STOCK;


SELECT stock_location FROM STOCK;

stock_no, mem_id, stock_name, stock_detail, stock_kg, stock_price, stock_image, 
stock_location, stock_kind
INSERT INTO STOCK VALUES(
	STOCKSEQ.NEXTVAL,
	'FARMERKANG',
	'펀드펀드',
	'도와주십시오',
	5,
	23900,
	'image',
	'강서구',
	1
);
fund_no, stock_no, fund_currentprice, fund_price, fund_status, 
fund_regDate, fund_endDate, fund_join
INSERT INTO FUND VALUES(
	FUNDSEQ.NEXTVAL,
	(SELECT stock_no FROM (SELECT * FROM STOCK WHERE mem_id='FARMERKANG' ORDER BY stock_no DESC) WHERE ROWNUM=1),
	0,
	1000000,
	1,
	SYSDATE,
	'2020-02-28',
	0
);

SELECT * FROM STOCK;
SELECT * FROM FUND;



