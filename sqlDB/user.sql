use gamedb;

Select * from usertbl;

CREATE TABLE usertbl -- 회원 구매 테이블
(  userID  		CHAR(10) NOT NULL PRIMARY KEY, -- 아이디(FK)
   pw 				CHAR(10) NOT NULL, --  물품명
   userName 		CHAR(10) NOT NULL,
   userAddress	CHAR(20)  NOT NULL -- 단가
);

DELETE FROM usertbl
	WHERE userID = "zxcv";