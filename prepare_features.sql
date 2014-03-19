show tables;
describe  t_alibaba;

drop table longterm;
create table longterm as 
select
uid, iid as bid, visittype, visitdate
from t_alibaba
where visitdate>'2014-04-14' and visitdate< '2014-06-01';

drop table midterm;
create table midterm as 
select
uid, iid as bid, visittype, visitdate
from t_alibaba
where visitdate>'2014-05-31' and visitdate< '2014-07-01';

drop table shortterm;
create table shortterm as 
select
uid, iid as bid, visittype, visitdate
from t_alibaba
where visitdate>'2014-6-30' and visitdate< '2014-07-16';

select bid,
buyCount, clickCount, cartCount, collectCount;

select a.bid , a.visittype, times / users
from 

(select DISTINCT bid, visittype, count(*) times
from longterm
group by bid,visittype) a

left outer join 

(
select  bid, visittype, count(distinct uid) users
from longterm 
group by bid, visittype) b
on a.bid = b.bid and a.visittype = b.visittype;


##发生购买行为的用户对品牌的行为
create table longterm_buy as
select 
a.uid, a.bid, b.visittype, b.visitdate
from 
( 
select distinct uid,bid from longterm where visittype = 1
limit 2000)a

left outer join

longterm b
on a.uid = b.uid and a.bid = b.bid;


select a.bid , a.visittype, times / users
from 

(select DISTINCT bid, visittype, count(*) times
from longterm_buy
group by bid,visittype) a

left outer join 

(
select  bid, visittype, count(distinct uid) users
from longterm_buy 
group by bid, visittype) b
on a.bid = b.bid and a.visittype = b.visittype;

