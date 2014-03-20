create database tmall;

drop table t_alibaba;
create table t_alibaba (
uid varchar(15),
iid varchar(15),
visittype integer,
visitdate date
);

load data local infile 'E:\\t_alibaba_data.csv' into table

t_alibaba 
fields terminated by ','
lines terminated by '\r\n';

select count(*) from t_alibaba;

select * from t_alibaba limit 10;

select distinct(visittype) from t_alibaba;