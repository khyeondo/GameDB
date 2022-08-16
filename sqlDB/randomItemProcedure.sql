DELIMITER $$
CREATE procedure SelectRandomItem()
Begin

declare total_probability float;
declare random_num float;

set total_probability = 0;
set random_num = (RAND() * 100) + 1;


End $$