USE gameDB;

select * from probabilityTbl order by probability asc;
select * from probabilityTbl order by probability desc;
select probabilityTbl.itemName,probability_ratio,probability,image from probabilityTbl inner join itemtbl on probabilityTbl.itemName = itemtbl.itemName order by probability asc;
DELETE FROM probabilityTbl WHERE itemName = "aa";

CREATE TABLE probabilityTbl -- 확률 테이블
(	itemName	CHAR(20) NOT NULL PRIMARY KEY, -- 아이템 이름(pk)
	probability_ratio int NOT NULL, -- 확률 비율
	probability float NOT NULL, -- 확률
	FOREIGN KEY (itemName) REFERENCES itemTbl(itemName)
);

insert into probabilityTbl values("test",1,1);
insert into probabilityTbl values("test1",1,0);
insert into probabilityTbl values("test2",1,0);
insert into probabilityTbl values("test3",1,0);

call insertProbability("test4",2);

drop procedure InsertProbability;
DELIMITER $$
create procedure InsertProbability(
	_itemName CHAR(40), -- 아이템 이름(pk)
	_ratio int
)
begin
    insert into probabilityTbl values (_itemName,_ratio,0);
    call UpdateProbability();
    SELECT * FROM probabilityTbl;
end;
End $$

drop procedure UpdateProbability;
DELIMITER $$
create procedure UpdateProbability()
begin
	declare _itemName char(40);
	declare _probability float;
    declare _probability_ratio float;
    declare total_ratio int default 0;	
    declare i int default 0;
	declare cur cursor for select itemName,probability_ratio,probability from probabilitytbl;
    
	set total_ratio = (select sum(probability_ratio) from probabilitytbl);
    
	open cur;    
	while i < (SELECT COUNT(*) FROM probabilitytbl) DO
		fetch next from cur into _itemName,_probability_ratio,_probability;
		set _probability = _probability_ratio/total_ratio;
		update probabilityTbl set probability = _probability where itemName = _itemName;
		set i = 1+i;
    end while;
    close cur;
    
    SELECT * FROM probabilityTbl;
end;
End $$


drop procedure SelectRandomItem;
DELIMITER $$
CREATE procedure SelectRandomItem()
Begin
	declare _itemName char(40);
	declare _probability float;
    declare sum_probability float default 0;
    declare random_num float;
	declare i int default 0;
	declare cur cursor for select itemName,probability from probabilitytbl;
    
    set random_num = rand();
    
    open cur;
    myloop: while i < (SELECT COUNT(*) FROM probabilitytbl) DO
		fetch next from cur into _itemName,_probability;
        
        if sum_probability <= random_num and random_num < sum_probability + _probability then
			SELECT _itemName;
            LEAVE myloop;
		else
			set sum_probability = sum_probability + _probability;
		end if;
        
        set i = i+1;
    end while myloop;
end;
End $$
