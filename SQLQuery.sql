select * from LoanData



select COUNT(id) as Total_Loan_Applications from LoanData 

select COUNT(id) as MTD_Total_Loan_Applications from LoanData 
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select COUNT(id) as PMTD_Total_Loan_Applications from LoanData 
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021




select SUM(loan_amount) as Total_Loan_Amount from LoanData

select SUM(loan_amount) as MTD_Total_Loan_Amount from LoanData
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select SUM(loan_amount) as PMTD_Total_Loan_Amount from LoanData
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021




select SUM(total_payment) as Total_Amount_Received from LoanData

select SUM(total_payment) as MTD_Total_Amount_Received from LoanData
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select SUM(total_payment) as PMTD_Total_Amount_Received from LoanData
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021




select ROUND(AVG(int_rate),4) * 100 as Avg_interest_Rate from LoanData

select ROUND(AVG(int_rate),4) * 100 as MTD_Avg_interest_Rate from LoanData
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select ROUND(AVG(int_rate),4) * 100 as PMTD_Total_Amount_Received from LoanData
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021



select ROUND(AVG(dti),4) * 100 as Avg_interest_Rate from LoanData

select ROUND(AVG(dti),4) * 100 as MTD_Avg_interest_Rate from LoanData
where MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

select ROUND(AVG(dti),4) * 100 as PMTD_Total_Amount_Received from LoanData
where MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021




#For Good Loan

select
	(COUNT ( case when loan_status = 'Fully Paid' or loan_status = 'Current' then id end) * 100)
	/
	COUNT(id) as Good_Loan_Percentage
from LoanData

select COUNT(id) as Good_Loan_Applications from LoanData
where  loan_status = 'Fully Paid' or loan_status = 'Current' 

select sum(loan_amount) as Good_Loan_Funded_Amount from LoanData
where  loan_status = 'Fully Paid' or loan_status = 'Current' 

select sum(total_payment) as Good_Loan_Received_Amount from LoanData
where  loan_status = 'Fully Paid' or loan_status = 'Current' 




#For Bad Loan

select
	(COUNT ( case when loan_status = 'Charged Off' then id end) * 100)
	/
	COUNT(id) as Bad_Loan_Percentage
from LoanData

select COUNT(id) as Bad_Loan_Applications from LoanData
where  loan_status = 'Charged Off' 

select sum(loan_amount) as Bad_Loan_Funded_Amount from LoanData
where  loan_status = 'Charged Off'

select sum(total_payment) as Bad_Loan_Received_Amount from LoanData
where  loan_status = 'Charged Off'




select
		loan_status,
		COUNT(id) as Total_Loan_Applications,
		SUM(total_payment) as Total_Amount_Received,
		SUM(loan_amount) as Total_Funded_Amount,
		avg(int_rate * 100) as Interest_Rate,
		avg(dti * 100) as DTI
	from
		LoanData
	group by
		loan_status




SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM LoanData
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status




select
	MONTH(issue_date)as Month_Number,
	DATENAME(MONTH, issue_date)as Month_Name,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from LoanData
group by MONTH(issue_date), DATENAME(MONTH, issue_date)
order by MONTH(issue_date) 





select
	address_state,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from LoanData
group by address_state
order by address_state





select
	term,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from LoanData
group by term
order by term





select
	emp_length,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from LoanData
group by emp_length
order by emp_length desc





select
	purpose,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from LoanData
group by purpose
order by COUNT(id) desc





select
	home_ownership,
	COUNT(id) as Total_Loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	sum(total_payment) as Total_Received_Amount
from LoanData
group by home_ownership
order by COUNT(id) desc