show tables;

## combine user features
desc user_feature_longterm;

select * from user_feature_longterm
where avgtimes <1;

select a.*, b.clickavg_midterm, b.buyavg_midterm, b.collectavg_midterm,
b.cartavg_midterm

##b.clickavg_shortterm, b.buyavg_shortterm, b.collectavg_shortterm,
#b.cartavg_shortterm
from

(
select uid, 
case when visittype =0 then avgtimes else 0 end as clickavg_longterm,
case when visittype =1 then avgtimes else 0 end as buyavg_longterm,
case when visittype =2 then avgtimes else 0 end as collectavg_longterm,
case when visittype =2 then avgtimes else 0 end as cartavg_longterm
from user_feature_longterm)a

left outer join 

(
select uid, 
case when visittype =0 then avgtimes else 0 end as clickavg_midterm,
case when visittype =1 then avgtimes else 0 end as buyavg_midterm,
case when visittype =2 then avgtimes else 0 end as collectavg_midterm,
case when visittype =2 then avgtimes else 0 end as cartavg_midterm
from user_feature_midterm
)b on a.uid = b.uid

left outer join

(
select uid, 
case when visittype =0 then avgtimes else 0 end as clickavg_shortterm,
case when visittype =1 then avgtimes else 0 end as buyavg_shortterm,
case when visittype =2 then avgtimes else 0 end as collectavg_shortterm,
case when visittype =2 then avgtimes else 0 end as cartavg_shortterm
from user_feature_shortterm
)c;


select distinct uid,iid as bid from t_alibaba
where visitdate>'2014-07-15'