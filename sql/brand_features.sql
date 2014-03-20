drop table brand_features_total_users_longterm;
create table brand_features_total_users_longterm
as
select a.bid , a.visittype, times / users as avgtimes
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
##drop table longterm_buy;
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

##drop table brand_feature_purchased_user_longterm;
create table brand_feature_purchased_user_longterm
as
select a.bid , a.visittype, times / users as avgtimes
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


 



##短期
##drop table brand_features_total_users_shortterm;
create table brand_features_total_users_shortterm
as
select a.bid , a.visittype, times / users as avgtimes
from 

(select DISTINCT bid, visittype, count(*) times
from shortterm
group by bid,visittype) a

left outer join 

(
select  bid, visittype, count(distinct uid) users
from shortterm 
group by bid, visittype) b
on a.bid = b.bid and a.visittype = b.visittype;


##发生购买行为的用户对品牌的行为
##drop table shortterm_buy;
create table shortterm_buy as
select 
a.uid, a.bid, b.visittype, b.visitdate
from 
( 
select distinct uid,bid from shortterm where visittype = 1
limit 2000)a

left outer join

shortterm b
on a.uid = b.uid and a.bid = b.bid;

##drop table brand_feature_purchased_user_shortterm;
create table brand_feature_purchased_user_shortterm
as
select a.bid , a.visittype, times / users as avgtimes
from 

(select DISTINCT bid, visittype, count(*) times
from shortterm_buy
group by bid,visittype) a

left outer join 

(
select  bid, visittype, count(distinct uid) users
from shortterm_buy 
group by bid, visittype) b
on a.bid = b.bid and a.visittype = b.visittype;


 
#中期
create table brand_features_total_users_midterm
as
select a.bid , a.visittype, times / users as avgtimes
from 

(select DISTINCT bid, visittype, count(*) times
from midterm
group by bid,visittype) a

left outer join 

(
select  bid, visittype, count(distinct uid) users
from midterm 
group by bid, visittype) b
on a.bid = b.bid and a.visittype = b.visittype;


##发生购买行为的用户对品牌的行为
##drop table midterm_buy;
create table midterm_buy as
select 
a.uid, a.bid, b.visittype, b.visitdate
from 
( 
select distinct uid,bid from midterm where visittype = 1
limit 2000)a

left outer join

midterm b
on a.uid = b.uid and a.bid = b.bid;

##drop table brand_feature_purchased_user_midterm;
create table brand_feature_purchased_user_midterm
as
select a.bid , a.visittype, times / users as avgtimes
from 

(select DISTINCT bid, visittype, count(*) times
from midterm_buy
group by bid,visittype) a

left outer join 

(
select  bid, visittype, count(distinct uid) users
from midterm_buy 
group by bid, visittype) b
on a.bid = b.bid and a.visittype = b.visittype;