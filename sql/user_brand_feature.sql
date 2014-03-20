create table user_brand_feature_longterm 
as
select uid, bid, visittype , count(*) times
from longterm
group by uid, bid, visittype;

create table user_brand_feature_midterm
as
select uid, bid, visittype , count(*) times
from midterm
group by uid, bid, visittype;

create table user_brand_feature_shortterm
as
select uid, bid, visittype , count(*) times
from shortterm
group by uid, bid, visittype;

