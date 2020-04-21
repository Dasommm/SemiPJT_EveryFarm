DROP TABLE MEMBER;
CREATE TABLE MEMBER(
	mem_id VARCHAR2(50) NOT NULL,
	mem_pw VARCHAR2(50) NOT NULL,
	mem_name VARCHAR2(30) NOT NULL,
	mem_phone VARCHAR2(20) NOT NULL,
	mem_zonecode VARCHAR2(10) NOT NULL,
	mem_addr VARCHAR2(100) NOT NULL,
	mem_addrEtc VARCHAR2(100) NOT NULL,
	mem_email VARCHAR2(100) NOT NULL,
	mem_grade NUMBER(2) NOT NULL, --1(회원),2(농부),3(관리자)
	mem_regdate DATE DEFAULT SYSDATE NOT NULL,  
	mem_drop VARCHAR2(2) NOT NULL,   --탈퇴여부: y(가입),n(탈퇴)
	CONSTRAINT MEMBER_PK_mem_id PRIMARY KEY(mem_id)
);

	DELETE FROM MEMBER;
    SELECT * FROM MEMBER;
commit;
   INSERT INTO MEMBER
<<<<<<< HEAD
   VALUES('GUEST','1234','회원','01012341234','01111','서울시 강남구 도곡동','롯데캐슬201동','kdy41000@naver.com',1,sysdate,'y');
    
   INSERT INTO MEMBER
   VALUES('FARMERKANG','1234','농부','01012341234','01111','서울시 강남구 도곡동','롯데캐슬201동','kdy41000@naver.com',2,sysdate,'y');
=======
   VALUES('GUESTKANG','1234','김또깡','01012341234','01111','서울시 강남구 도곡동','롯데캐슬201동','kdy41000@naver.com',1,sysdate,'y');
    
   INSERT INTO MEMBER
   VALUES('FARMERKIM','1234','김농부','01012341234','01111','서울시 강남구 도곡동','롯데캐슬201동','kdy41000@naver.com',2,sysdate,'y');
>>>>>>> 27f0cc756e38972b7b100e2d7df4b3961c9ecc6e
	 
    INSERT INTO MEMBER
   VALUES('ADMIN','1234','관리자','01012341234','01111','서울시 강남구 도곡동','롯데캐슬201동','kdy41000@naver.com',3,sysdate,'y');
	     
   
   
   SELECT MEM_ID FROM MEMBER
		WHERE MEM_NAME='김동영' AND MEM_EMAIL='kdy41000@naver.com' AND MEM_PHONE = '01050543568';
		
		SELECT *
		FROM MEMBER 
		WHERE mem_id ='GUEST12' AND mem_pw = '1234' 
		AND mem_drop = 'y'; 
		
		SELECT *
		FROM MEMBER 
		WHERE mem_email='kdy41000@naver.com';
		
