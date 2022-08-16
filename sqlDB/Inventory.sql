
select id,inventoryTbl.itemName,image,grade from inventoryTbl inner join itemtbl on inventoryTbl.itemName = itemtbl.itemName where userId = "1088";

select * from inventoryTbl where userId = "1088";
select * from inventoryTbl;

CREATE TABLE inventoryTbl -- 확률 테이블
(	id 	INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	itemName CHAR (40),
	userID CHAR(10) NOT NULL, -- 확률
	FOREIGN KEY (userID) REFERENCES userTbl(userID),
    FOREIGN KEY (itemName) REFERENCES itemtbl(itemName)
);

INSERT INTO inventoryTbl (itemName,userID) VALUES("a","A");


DELETE FROM inventoryTbl
	WHERE id = 1;