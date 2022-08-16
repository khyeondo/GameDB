USE gameDB;

SELECT * FROM itemTbl;
select * from itemTbl order by grade asc;

DELETE FROM itemTbl WHERE itemName = "aa";

CREATE TABLE itemTbl -- 아이템 테이블
(	itemName	CHAR(40) NOT NULL PRIMARY KEY, -- 아이템 이름(pk)
	grade		int, -- 등급
	dps  		float NOT NULL, -- 공격력	
    _str		int, -- 힘
    _int		int, -- 지능
    _dex		int, -- 민첩
    _vit 		int, -- 활력  
	image 		CHAR(50) NOT NULL --  이미지
);

call insertItem("증오의 조각"	,1,100,40,0,0,40,"증오의 조각",1);
call insertItem("찬토도의 의지"	,1,100,0,40,0,20,"찬토도의 의지",1);
call insertItem("필멸의 연극"	,1,100,0,0,0,80,"필멸의 연극",1);
call insertItem("우레폭풍"	,1,70,20,20,20,20,"우레폭풍",2);
call insertItem("해일검"		,2,50,0,10,0,10,"해일검",3);
call insertItem("재국 검"		,2,50,0,0,0,5,"재국 검",4);
call insertItem("강검"		,3,30,0,5,0,0,"강검",4);
call insertItem("수습생의 비수",3,30,0,0,5,0,"수습생의 비수",4);

update itemTbl set image = itemName where itemName = "찬토도의 의지";
update itemTbl set image = itemName where itemName = "필멸의 연극";
update itemTbl set image = itemName where itemName = "우레폭풍";
update itemTbl set image = itemName where itemName = "해일검";
update itemTbl set image = itemName where itemName = "재국 검";
update itemTbl set image = itemName where itemName = "강검";
update itemTbl set image = itemName where itemName = "수습생의 비수";



drop procedure InsertItem;
DELIMITER $$
create procedure InsertItem(
	itemName	CHAR(40), -- 아이템 이름(pk)
    grade		int, -- 등급
	dps  		float, -- 공격력
    _str		int, -- 힘
    _int		int, -- 지능
    _dex		int, -- 민첩
    _vit 		int, -- 활력  
	image 		CHAR(50),--  이미지
    ratio 		int
)
begin
insert into itemTbl values(itemName,grade,dps,_str,_int,_dex,_vit,image);
call InsertProbability(itemName,ratio);
end;
End $$

delete itemtbl,probabilityTbl
from probabilityTbl
inner join itemtbl 
on itemtbl.itemName = probabilityTbl.itemName
where probabilityTbl.itemName = "화살 세례";
call UpdateProbability();


