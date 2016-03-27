use pythondb;
delete from t_truedelta;

 
drop table T_TRUEDELTA;

select * from T_TRUEDELTA;
where t_year = '2014'; 

delete from t_truedelta
where t_year = '2014'; 

insert into t_truedelta (T_YEAR, T_BRAND, T_MODEL, T_PR_AREA, T_CAR_NM, T_CAR_DTL, T_CAR_KM, T_CAR_CST, T_CAR_DESC) 
values ('2015', '33', '3', 'Outback', '2015 Subaru Outback 4dr Wagon', '130 kilowatts 2.5L H4 6-speed shiftable CVT AWD', '6300 km', null, 'ABS,traction control, Blind Spot Monitoring and Check Engine lights all suddently turned on during driving. Resolved itself during trip to dealer. Desler changed some fuses but had no idea why this happened.');

CREATE TABLE T_TRUEDELTA
(
  T_ROW_ID int primary key AUTO_INCREMENT,
  T_YEAR varchar(10) ,
  T_BRAND varchar(10) , 
  T_MODEL varchar(50) , 
  T_PR_AREA varchar(10),
  T_CAR_NM varchar(200),
  T_CAR_DTL varchar(400),
  T_CAR_KM varchar(30),
  T_CAR_CST varchar(30),
  T_CAR_DESC varchar(4000)
);

create table T_BRAND
(
  T_BRD_ID varchar(10) primary key,
  T_BRD_NM varchar(50)
);

create table T_PROB_AREA
(
  T_PRB_ID varchar(10) primary key,
  T_PRB_NM varchar(100)
);

select * from t_prob_area;
select * from t_brand;

CREATE table MAINTENENCE_HIST_TB
(
  HIST_SQ INT AUTO_INCREMENT PRIMARY KEY
  ,VHICHL_NM varchar(200)
  ,VHICHL_ASORT_CD varchar(400)
  ,VHICHL_DSTNC varchar(400)
  ,VHICHL_REG_DT varchar(50)
  ,VHICHL_REQ_DT varchar(50)
  ,VHICHL_CMP_DT varchar(50)
  ,VHICHL_UPD_CD varchar(100)
  ,VHICHL_WRK_ID varchar(4000)
  ,VHICHL_CMPNT_CD varchar(50)
);

ALTER TABLE MAINTENENCE_HIST_TB AUTO_INCREMENT=1 ;
delete from maintenence_hist_tb;
drop table maintenence_hist_tb;
insert into MAINTENENCE_HIST_TB (VHICHL_NM,VHICHL_ASORT_CD,VHICHL_DSTNC,VHICHL_REG_DT,VHICHL_REQ_DT,VHICHL_CMP_DT,VHICHL_UPD_CD,VHICHL_WRK_ID,VHICHL_CMPNT_CD)
SELECT 
  C.T_BRD_NM 
  ,T_CAR_NM
  ,T_CAR_DTL
  ,T_YEAR 
  ,T_CAR_KM
  ,T_MODEL 
  ,T_CAR_CST 
  ,T_CAR_DESC 
  , b.T_PRB_NM 
FROM T_TRUEDELTA a, T_PROB_AREA b, T_BRAND C
  where  a.t_pr_area = b.T_PRB_ID
    AND a.T_BRAND = C.T_BRD_ID
  order by T_YEAR desc ;  
  
  select * from t_truedelta2;
  select * from t_truedelta;
select DISTINCT(VHICHL_CMP_DT) from maintenence_hist_tb;
--		where
--		VHICHL_REG_DT = #year# and VHICHL_NM = #brand#
    
select * from maintenence_hist_tb;
select * from t_truedelta;

select VHICHL_CMPNT_CD , count(*) AS COUNT from
		MAINTENENCE_HIST_TB
		where VHICHL_NM = 'Acura' and VHICHL_REG_DT = '2007' and
		VHICHL_CMP_DT = 'MDX'
		group by VHICHL_CMPNT_CD