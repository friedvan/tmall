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


