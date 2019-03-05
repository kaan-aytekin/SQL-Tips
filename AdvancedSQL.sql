select * from players where weight>100 and weight<200
select * from players where weight between 100 and 200
select * from players where bday not between '01/09/1994' and '01/01/2020'
select * from players where bday not in ('01/09.1994','01.01/2019')

select distinct bstates from db where 
bday < '01/01/2012' and bday is not null
order by bday

select * from players where bstates in 
(select distinct bstates from db where 
bday < '01/01/2012' and bday is not null)

select namelast,namefirst,weight,
case when weight<150 and height<70 then 'light'
	 when weight<200 and height<90 then 'Medium'
	 when weight<250 and height<120 then 'Large'
	 else 'Huge'
end as Build,
case when bats='L' then 'Left'
	 when bats='R' then 'Right'
	 when bats='B' then 'Both'
	 else 'Unknown'
end as NewBats
from players

select namelast,namefirst from players where
namelast like 'AY%' or like '%TEKIN%'
/* 
Wildcards
% is for anystring of 0 or more length
_ is for any single character
[a-f] for any single character within range
[^a-f] for any single character NOT within range
*/
select namefirst+' '+namelast as namefull from players

select a.playerID,a.namefirst, a.namelast,a.weight,b.yearID,b.teamID
from Master as a inner join Batting as b on a.playerID=b.playerID

select * into BattingBackup from Batting --Creating a spin-off table

select namelast,namefirst, --Takes a snapshot
case when bats='L' then 'Left'
	 when bats='R' then 'Right'
	 when bats='B' then 'Both'
	 else 'Unknown'
end as NewBats
into BattingBackup from players

create view vwWACustomers as select * from Customers where State='WA'
--Create a view once instead of filtering every time
select * from vwWACustomers

use BaseballDB --Use the database called BaseballDB

select 'My name is Kaan',6*6,7/6.0,7/(6*1.0) --Outputs, division is like python2

select 6/(7*1.0) as 'Divison'
select 6/(7*1.0) as Divison
select 6/(7*1.0) 'Divison'
select 6/(7*1.0) Divison --All valid
select 6/(7*1.0) [Divison] --Valid for some SQL versions

select 6/(7*1.0) 'Division', 'Kaan' 'name'
select 6/(7*1.0) as 'Division', 'Kaan' as 'name'


select namelast,namefirst,weight,height 
from Members where namelast in '[a-k]%'
order by namelast desc,namefirst asc

select namelast,namefirst,weight,height 
from Members where namelast in '[a-k]%'
order by 1 desc,2 asc --Same as above, not recommended

select namelast,namefirst,weight,height/12.0 as 'Height' 
from Members where namelast in '[a-k]%'
order by Height desc

select top 10 namelast,namefirst,weight from Members
 order by weight desc --If there are equalities in 10-11-12 returns 1

select namefirst,namelast from Members where IsSenior=1

select namefirst,namelast from Members where not IsSenior=0
select namefirst,namelast from Members where IsSenior!=0
select namefirst,namelast from Members where IsSenior<>0 --All the same

--NULL is not ''
--Anything+NULL=NULL
select * from Members where ((weight<70 and height>150) or (weight>70 and height>180))

select distinct State,bday from players
 where State is not null and bday is not null

select State, count(State) as 'Occurence' from players group by State

--count(ColumnName) DOES NOT include NULL
--count(*) includes NULL

select namelast,namefirst,sum(salary) from players group by namelast,namefirst


























