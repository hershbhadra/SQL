select * from bait_employees;
select * from tenders;
select * from tender_tracker;

--Query 1
SELECT t.TENDER_CATEGORY, 
COUNT(*) AS NUM_TENDERS, 
round (AVG(t.TENDER_PRICE), 2) AS AVG_PRICE, 
SUM(t.TENDER_PRICE) AS SUM_PRICE 
FROM tender_tracker tt 
INNER JOIN tenders t ON tt.TENDER_ID = t.TENDER_ID 
GROUP BY t.TENDER_CATEGORY;

--Query 2
SELECT be.EMPLOYEE_ID, be.FIRST_NAME || ' ' || be.LAST_NAME as "Engineer Name", 
COUNT(t.TENDER_ID) AS NUM_TENDERS, 
NVL(SUM(t.TENDER_PRICE),0) AS SUM_PRICE 
FROM Engineer e 
INNER JOIN Bait_employees be ON e.E_EMPLOYEE_ID = be.EMPLOYEE_ID 
LEFT JOIN tender_tracker tt ON e.E_EMPLOYEE_ID = tt.E_EMPLOYEE_ID 
LEFT JOIN tenders t ON tt.TENDER_ID = t.TENDER_ID 
GROUP BY be.EMPLOYEE_ID, be.FIRST_NAME, be.LAST_NAME;

--Query 3
SELECT be.EMPLOYEE_ID, be.FIRST_NAME || ' ' || be.LAST_NAME as "Engineer Name", 
t.TENDER_ID, t.TENDER_NAME, t.SUBMISSION_DATE, t.OPENING_DATE, tt.tender_status, 
TO_date(t.SUBMISSION_DATE, 'dd/mm/yyyy') - TO_date(t.OPENING_DATE, 'dd/mm/yyyy') AS DAYS 
FROM Engineer e 
INNER JOIN Bait_employees be ON e.E_EMPLOYEE_ID = be.EMPLOYEE_ID 
LEFT JOIN tender_tracker tt ON e.E_EMPLOYEE_ID = tt.E_EMPLOYEE_ID 
LEFT JOIN tenders t ON tt.TENDER_ID = t.TENDER_ID 
WHERE tt.TENDER_STATUS = 'closed win';

--Query 4
SELECT t.Tender_ID, t.tender_name, m.Manf_Name, mq.Quoted_Price
, 1.25 * mq.Quoted_Price AS Tender_Quoted_Price
, (0.1 * 1.25 * mq.Quoted_Price) AS Bid_Bond_Value
, 0.25 * mq.Quoted_Price AS "GROSS_PROFIT" 
FROM tender_tracker tt 
INNER JOIN tenders t ON tt.TENDER_ID = t.TENDER_ID 
INNER JOIN Manf_Quotes mq ON mq.Quote_NUmber = tt.Quote_NUmber 
INNER JOIN Manufacturer m ON m.Manf_ID = mq.Manf_ID
WHERE tt.TENDER_STATUS = 'closed win';

--Query 5
--Enter values TR001, TR002, ... , TR010
SELECT tt.Tracker_ID, t.Tender_ID, tt.Tender_Status, t.Tender_Name
, t.Tender_Price, m.Manf_Name, t.Submission_Date, tt.P_Employee_ID 
, (be.FIRST_NAME || ' ' || be.LAST_NAME) AS Emp_Name
, 0.125 * mq.Quoted_Price AS Bid_Bond_Value 
FROM tender_tracker tt 
INNER JOIN tenders t ON tt.TENDER_ID = t.TENDER_ID 
INNER JOIN PR ON PR.P_Employee_ID = tt.P_Employee_ID 
INNER JOIN Bait_Employees be ON PR.P_EMPLOYEE_ID = be.EMPLOYEE_ID 
INNER JOIN Manf_Quotes mq ON mq.Quote_NUmber = tt.Quote_NUmber 
INNER JOIN Manufacturer m ON m.Manf_ID = mq.Manf_ID 
WHERE tt.tracker_ID = '&TRACKER_ID';

--Query 6
SELECT * FROM
      (SELECT 'TOTAL TENDER PRICE' AS "TENDER PRICE BY CATEGORY"
        , tender_category, tender_price FROM tenders)
PIVOT  (SUM(tender_price) FOR tender_category 
IN ('KOC' AS KOC ,'MEW' AS MEW, 'KNPC'AS KNPC));
