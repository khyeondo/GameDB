
USE gameDB;

CREATE TABLE itemTbl -- 회원 구매 테이블
(	itemName	CHAR(8) NOT NULL PRIMARY KEY, -- 아이템 이름(pk)
	dps  		float NOT NULL, -- 공격력
    _str		int, -- 힘
    _int		int, -- 지능
    _dex		int, -- 민첩
    _vit 		int, -- 활력  
	image 		CHAR(10) NOT NULL, --  이미지
	probability_ratio int NOT NULL -- 확률 비율
);