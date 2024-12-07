SELECT * 
FROM data_cleaning.student_admission_record_dirty;


-- Data Cleaning

-- 1. Remove Dublicates
-- 2. Standardize the Data
-- 3. Null Values or Blank values
-- 4. Remove Any columns

create table dublicate_student_admission_record_dirty
like student_admission_record_dirty;

select*
from dublicate_student_admission_record_dirty;

insert dublicate_student_admission_record_dirty
select*
from student_admission_record_dirty;

select*
from dublicate_student_admission_record_dirty;

with duble_cte as (
	select *,
		row_number() over(partition by `Name`, age,gender,`Admission Test Score`,
        `High School Percentage`,City,`Admission Status`) as row_num
	from dublicate_student_admission_record_dirty
)

select*
from duble_cte
where row_num > 1;

CREATE TABLE `dublicate_student_admission_record_dirty_2` (
  `Name` text,
  `Age` double DEFAULT NULL,
  `Gender` text,
  `Admission Test Score` double DEFAULT NULL,
  `High School Percentage` text,
  `City` text,
  `Admission Status` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from dublicate_student_admission_record_dirty_2;

insert into dublicate_student_admission_record_dirty_2
	select *,
		row_number() over(partition by `Name`, age,gender,`Admission Test Score`,
        `High School Percentage`,City,`Admission Status`) as row_num
	from dublicate_student_admission_record_dirty;

select *
from dublicate_student_admission_record_dirty_2
where row_num > 1;

delete
from dublicate_student_admission_record_dirty_2
where row_num > 1;


-- Remove Null Values and blanks


select *
from dublicate_student_admission_record_dirty_2
;

update dublicate_student_admission_record_dirty_2
set `name` = 'Unknown'
where `name` = ''; -- for name changing

update dublicate_student_admission_record_dirty_2
set age = 19
where age < 0;


select *
from dublicate_student_admission_record_dirty_2
where gender = '';


UPDATE dublicate_student_admission_record_dirty_2
SET Gender = CASE 
    WHEN `Name` IN ('Unknown', 'Ali', 'Hassan', 'Qasim', 'Shafiq', 'Rohail') THEN 'Male'
    WHEN `Name` IN ('Afshan', 'Nida', 'Sara') THEN 'Female'
    ELSE 'Male'
END
WHERE Gender = '';

UPDATE dublicate_student_admission_record_dirty_2
SET Gender = CASE 
    WHEN Name IN ('Adeel', 'Ahmed', 'Asad', 'Bilal', 'Daniyal', 'Fahad', 'Farhan', 'Feroze', 'Hammad', 'Hamza', 'Imran', 'Junaid', 'Kamran', 'Kashif', 'Maaz', 'Muzammil', 'Nashit', 'Rehan', 'Saim', 'Shahzad', 'Shayan', 'Shehroz', 'Shoaib', 'Tariq', 'Umar', 'Waqar') THEN 'Male'
    WHEN Name IN ('Aliya', 'Anum', 'Asma', 'Ayesha', 'Bushra', 'Fareeha', 'Farzana', 'Fatima', 'Hafsa', 'Hania', 'Laiba', 'Lubna', 'Maham', 'Maryam', 'Mehwish', 'Muneera', 'Nimra', 'Rabia', 'Sana', 'Tuba', 'Uzma', 'Wajeeha', 'Zara', 'Zarina', 'Zunaira') THEN 'Female'
    ELSE Gender  -- If no match, leave the gender as it is
END;

update dublicate_student_admission_record_dirty_2
set Gender = case
	when `name` in ('Ali', 'Hassan') then 'Male'
    when `name` in ('Sara') then 'Female'
else Gender
end
where Gender = 'Female' or Gender = 'Male';

select*
from dublicate_student_admission_record_dirty_2
;

select *
from dublicate_student_admission_record_dirty_2
where `High School Percentage` = ''
;

select count(Gender)
from (select *
	  from dublicate_student_admission_record_dirty_2
      where city = '') as Blank_city
where Gender = 'male' 
;

UPDATE dublicate_student_admission_record_dirty_2
join (
    SELECT ROUND(AVG(`High School Percentage`), 2) as Avg_percentage
    FROM dublicate_student_admission_record_dirty_2
    WHERE `High School Percentage` > 0
) as avg_tab
set `High School Percentage` = avg_tab.Avg_percentage
WHERE `High School Percentage` <= 0 ;

 update dublicate_student_admission_record_dirty_2
 join (
	select round(avg(`Admission Test Score`),0)as avg_percentage
    from dublicate_student_admission_record_dirty_2
    where `Admission Test Score` > 0
 ) as avg_table
 set `Admission Test Score` = avg_table.avg_percentage
 where 	`Admission Test Score` <= 0;
 
 select *
 from (select *
from dublicate_student_admission_record_dirty_2
where `Admission Status` = 'accepted' 
order by `Admission Test Score` desc
limit 5) as most_got_score;



update dublicate_student_admission_record_dirty_2
set city = case
	when age <= 19 then 'Rawalpindi'
    when age between 20 and 21 then 'Islamabad'
    when gender = 'male' then 'Karachi'
    when gender = 'female' then 'Quetta'
    when age = 22 then 'Peshawar'
    when age = 23 then 'Lahore'
    when age = 24 then 'Multan'
end 
where city = '';


select `Admission Status`, min(`Admission Test Score`)
from dublicate_student_admission_record_dirty_2
group by `Admission Status`
;


update dublicate_student_admission_record_dirty_2
set `Admission Status` = 'Accepted'
where `Admission Test Score` >= 70;

update dublicate_student_admission_record_dirty_2
set `Admission Status` = 'Rejected'
where `Admission Test Score` <= 65 and `Admission Test Score` = 66;

update dublicate_student_admission_record_dirty_2
set `Admission Status` = 'Rejected'
where `Admission Test Score` = 66;


select*
from dublicate_student_admission_record_dirty_2
;


alter table dublicate_student_admission_record_dirty_2
drop column row_num;




















