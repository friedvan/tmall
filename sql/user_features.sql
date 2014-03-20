create table user_feature_longterm 
as
select a.uid, a.visittype, a.times / b.brandnums avgtimes
from

(select uid, visittype, count(*) as times

from longterm 
group by uid, bid, visittype
)a
left outer join

(
select uid, visittype, count(*) brandnums from (
select distinct uid, bid, visittype
from longterm)c group by c.uid,c.visittype) b

on a.uid = b.uid and a.visittype = b.visittype;




create table user_feature_midterm 
as
select a.uid, a.visittype, a.times / b.brandnums avgtimes
from

(select uid, visittype, count(*) as times

from midterm 
group by uid, bid, visittype
)a
left outer join

(
select uid, visittype, count(*) brandnums from (
select distinct uid, bid, visittype
from midterm)c group by c.uid,c.visittype) b

on a.uid = b.uid and a.visittype = b.visittype;



create table user_feature_shortterm 
as
select a.uid, a.visittype, a.times / b.brandnums avgtimes
from

(select uid, visittype, count(*) as times

from shortterm 
group by uid, bid, visittype
)a
left outer join

(
select uid, visittype, count(*) brandnums from (
select distinct uid, bid, visittype
from shortterm)c group by c.uid,c.visittype) b

on a.uid = b.uid and a.visittype = b.visittype;