create database project;
use project;
select * from finance_1;
select * from finance_2;
select issue_d as year ,sum(loan_amnt) as tot_loanamount
 from finance_1 group by issue_d;
#########################################################################
select date_format(str_to_date(concat('01-', issue_d), '%d-%b-%y'), '%Y') as loan_year, sum(loan_amnt) as total_loan_amnt
from finance_1 group by loan_year ;
#####################################################################################################################
select date_format(str_to_date(issue_d,'%mm-%YY'), '%YY') as loan_year, 
sum(loan_amnt) as total_loan_amount from finance_1 
group by loan_year order by loan_year;
###########################################################################################
SELECT DATE_FORMAT(issue_d, '%y') AS year, SUM(loan_amnt) AS total_loan_amount
FROM finance_1
GROUP BY DATE_FORMAT(issue_d, '%y');
###########################################################################
select finance_1.grade, finance_1.sub_grade, sum(finance_2.revol_bal) from 
finance_1 inner join finance_2 on finance_1.id= finance_2.id 
group by finance_1.grade, finance_1.sub_grade;
################################################
select finance_1.Verification_status,  sum(finance_2.total_pymnt) from 
finance_1 inner join finance_2 on finance_1.id= finance_2.id 
group by finance_1.verification_status;
#########################################################################
SELECT  addr_state,EXTRACT(YEAR FROM issue_d) AS year, EXTRACT(MONTH FROM issue_d) AS month,loan_status
from finance_1 group by addr_state, year, month, loan_status;
###################################################   or   #################################################################################
SELECT  addr_state,date_format(str_to_date(concat('01-', issue_d), '%d-%b-%y'), '%Y') as loan_year, date_format(str_to_date(concat('01-', issue_d), '%d-%b-%y'), '%m') as loan_month, loan_status
from finance_1 group by addr_state, loan_year, loan_month, loan_status;
##############################################################################################################################
SELECT home_ownership, COUNT(*) AS Count, MIN(last_pymnt_d) AS Min_Payment_Date, MAX(last_pymnt_d) AS Max_Payment_Date
    FROM finance_1
    JOIN finance_2 ON finance_1.id = finance_2.id
    GROUP BY home_ownership;
#######################################################################################
SELECT home_ownership,last_pymnt_d ,COUNT(*) AS Count
    FROM finance_1
    JOIN finance_2 ON finance_1.id = finance_2.id
    GROUP BY home_ownership,last_pymnt_d;
   ##### ################# project ########################################
 select date_format(str_to_date(concat('01-', issue_d), '%d-%b-%y'), '%Y') as loan_year, sum(loan_amnt) as total_loan_amnt
from finance_1 group by loan_year ; 
################################################################################################
select finance_1.grade, finance_1.sub_grade, sum(finance_2.revol_bal) from 
finance_1 inner join finance_2 on finance_1.id= finance_2.id 
group by finance_1.grade, finance_1.sub_grade;
#################################################################
select finance_1.Verification_status, sum(finance_2.total_pymnt) from 
finance_1 inner join finance_2 on finance_1.id= finance_2.id 
group by finance_1.verification_status;
 ################################################  
 SELECT  addr_state,date_format(str_to_date(concat('01-', issue_d), '%d-%b-%y'), '%Y') as loan_year, date_format(str_to_date(concat('01-', issue_d), '%d-%b-%y'), '%m') as loan_month, loan_status
from finance_1 group by addr_state, loan_year, loan_month, loan_status;
####################################################################
SELECT home_ownership,last_pymnt_d ,COUNT(*) AS Count
FROM finance_1
JOIN finance_2 ON finance_1.id = finance_2.id
GROUP BY home_ownership,last_pymnt_d;
##########################################################################
### kpi 4 ##############
SELECT addr_state AS state, DATE_FORMAT(STR_TO_DATE(CONCAT('01-', issue_d), '%d-%b-%y'), '%b')
 AS Month, loan_status
FROM Finance_1 GROUP BY addr_state, month, loan_status ORDER BY addr_state, month;
###############################  KPI 5  ####################
 select home_ownership,last_pymnt_d ,COUNT(home_ownership) AS Count
FROM finance_1
JOIN finance_2 ON finance_1.id = finance_2.id
GROUP BY home_ownership,last_pymnt_d;

