create table Bait_Employees (
Employee_id number(10) constraint emp_employee_id_pk  Primary Key,
Dept_id number(10),
job_title varchar2(20),
First_name varchar2(20),
Last_name varchar2(20),
Employee_Type varchar(10)
);

Insert into Bait_employees values
(100,null,'General Manager','Abdul','Aziz','null');
Insert into Bait_employees values
(200,2,' Engg Manager','Nazeer','Rahman','Engineer');
Insert into Bait_employees values
(300,3,' PR Manager','David','Kharboush','PR');
Insert into Bait_employees values
(400,4,' ACCT Manager','Mohd','Zakaria','Accounts');
Insert into Bait_employees values
(201,2,' Senior Engineer','Salman','Thoppil','Engineer');
Insert into Bait_employees values
(202,2,' Junior Engineer','Aditi','Singhal','Engineer');
Insert into Bait_employees values
(301,3,' Senior PR officer','John','Doe','PR');
Insert into Bait_employees values
(302,3,' Junior PR officer','Mubarak','Rahman','PR');
Insert into Bait_employees values
(401,4,' Senoir Accountant','George','Bailey','Accounts');
Insert into Bait_employees values
(402,4,' Junior Accountant','Ashwin','Kumar','Accounts');
Insert into Bait_employees values
(203,2,' Senior Engineer','Favas','Varangot','Engineer');
Insert into Bait_employees values
(204,2,' Senior Engineer','Shejir','Pally','Engineer');
Insert into Bait_employees values
(205,2,' Senior Engineer','Rifuat','Razak','Engineer');
Insert into Bait_employees values
(206,2,' Senior Engineer','Sibu','Jacob','Engineer');
Insert into Bait_employees values
(207,2,' Senior Engineer','Raju','Pran','Engineer');
Insert into Bait_employees values
(208,2,' Senior Engineer','Nishat','Ashouri','Engineer');

create table Bait_Departments (
Dept_id number(10) constraint dep_dept_id_pk  Primary Key,
Manager_id number(10),
Dept_name Varchar2(20));

INSERT INTO Bait_Departments Values
(2,200,'Engineering');
INSERT INTO Bait_Departments Values
(3,300,'Pubic Relations');
INSERT INTO Bait_Departments Values
(4,400,'Accounts');

alter table Bait_employees
add foreign key (dept_id)
references bait_departments (Dept_id);

create table Engineer (
E_Employee_id number(10) constraint emp_e_employee_id_pk  Primary Key,
 constraint E_Bait_Employees_fk foreign key (E_Employee_id) references Bait_Employees(employee_id),
 specialization varchar2(50)
);

Insert into Engineer
values (200,'Electrial Engineering');
Insert into Engineer
values (201,'Mechanical Engineering');
Insert into Engineer
values (202,'Civil Engineering');
Insert into Engineer
values (204,'Instrumentation Engineering');
Insert into Engineer
values (206,'Electrical Engineering');

create table PR (
P_Employee_id number(10) constraint emp_p_employee_id_pk  Primary Key,
 constraint P_Bait_Employees_fk foreign key (P_Employee_id) references Bait_Employees(employee_id),
 Industry varchar2(50)
);
 
Insert into PR
values (300,'General');
Insert into PR
values (301,'Oil and Gas');
Insert into PR
values (302,'Electricity and Water'); 

create table Accounts (
A_Employee_id number(10) constraint emp_a_employee_id_pk  Primary Key,
 constraint A_Bait_Employees_fk foreign key (A_Employee_id) references Bait_Employees(employee_id),
 Category varchar2(50)
);

Insert into Accounts
values (400,'General');
Insert into Accounts
values (401,'Payments');
Insert into Accounts
values (402,'Receivables');

create table Tenders (
Tender_id varchar(10) constraint tend_tender_id  Primary Key,
Tender_Price  number(10),
Tender_name varchar2(50),
Tender_category varchar(30),
Submission_date Date
);

Insert into tenders values
('T_1001',300,'Supply of valves','KOC',to_date('Jun 05,2016','Mon DD, YYYY'));
Insert into tenders values
('T_1002',400,'Supply of Cables','MEW',to_date('Jan 05,2017','Mon DD, YYYY'));
Insert into tenders values
('T_1003',400,'Supply of Light fittings','MEW',to_date('Jan 05,2016','Mon DD, YYYY'));
Insert into tenders values
('T_1004',400,'Supply of Pipes','KNPC',to_date('Jan 05,2017','Mon DD, YYYY'));
Insert into tenders values
('T_1005',1000,'Supply of LSAW Pipes','KOC',to_date('Jan 05,2017','Mon DD, YYYY'), to_date('Jul 05,2016','Mon DD, YYYY'));
Insert into tenders values
('T_1006',1000,'Supply of Seamless Pipes','KOC',to_date('Jan 05,2016','Mon DD, YYYY'), to_date('Jul 05,2015','Mon DD, YYYY'));
Insert into tenders values
('T_1007',1000,'Supply of Seamless Pipes','KOC',to_date('Feb 05,2016','Mon DD, YYYY'), to_date('Jun 05,2015','Mon DD, YYYY'));
Insert into tenders values
('T_1008',500,'Supply of Gate Valves','KOC',to_date('Mar 05,2016','Mon DD, YYYY'), to_date('Jun 06,2015','Mon DD, YYYY'));
Insert into tenders values
('T_1009',400,'Supply of Gate Valves','KOC',to_date('Mar 05,2016','Mon DD, YYYY'), to_date('Jun 06,2015','Mon DD, YYYY'));
Insert into tenders values
('T_1010',400,'Supply of Globe Valves','KOC',to_date('Mar 05,2016','Mon DD, YYYY'), to_date('Jun 06,2015','Mon DD, YYYY'));

ALTER TABLE Tenders
ADD Opening_date Date ;

Update tenders
set Opening_date =to_date('FEB 05,2016','Mon DD, YYYY')
where TENDER_ID = 'T_1001';
Update tenders
set Opening_date =to_date('OCT 23,2016','Mon DD, YYYY')
where TENDER_ID = 'T_1002';
Update tenders
set Opening_date =to_date('OCT 2,2015','Mon DD, YYYY')
where TENDER_ID = 'T_1003';
Update tenders
set Opening_date =to_date('SEP 9,2016','Mon DD, YYYY')
where TENDER_ID = 'T_1004';

create table Bid_Bonds (
Bid_Bond_number varchar(10)constraint Bid_bond_num  Primary Key,
Bank_name  varchar(30),
Bid_creation_date date,
Bid_duration_days number(5)
);

Insert into Bid_bonds values
('B_1004','National Bank of Kuwait', to_date('Nov 05,2016','Mon DD, YYYY'),120);
Insert into Bid_bonds values
('B_1006','Gulf Bank', to_date('Dec 05,2016','Mon DD, YYYY'),90);
Insert into Bid_bonds values
('B_1005','KFH', to_date('Feb 06,2017','Mon DD, YYYY'),180);
Insert into Bid_bonds values
('B_1008','KFH', to_date('Jan 06,2017','Mon DD, YYYY'),180);
Insert into Bid_bonds values
('B_1009','KFH', to_date('Jan 06,2017','Mon DD, YYYY'),180);
Insert into Bid_bonds values
('B_1007','KFH', to_date('Jan 05,2017','Mon DD, YYYY'),90);
Insert into Bid_bonds values
('B_1017','KFH', to_date('Feb 05,2017','Mon DD, YYYY'),60);
Insert into Bid_bonds values
('B_1010','KFH', to_date('Jan 06,2017','Mon DD, YYYY'),180);

create table Manufacturer    (
Manf_id varchar(10)constraint man_manf_id Primary Key,
Manf_name  varchar(30),
manf_location varchar(30),
manf_contact_detail varchar(30)
);

Insert into Manufacturer values
('M_1001','Sufa Valves', 'China', 8608561454);
Insert into Manufacturer values
('M_1002','Prismian Cables', 'China', 8607861454);
Insert into Manufacturer values
('M_1003','Fagherhoult', 'Netherlands', 4607861454);
Insert into Manufacturer values
('M_1004','Shalimar', 'India', 91454545252);

create table Manf_Quotes   (
Quote_number varchar(10)constraint Manf_quote_num Primary Key,
Manf_id varchar(30),
Quote_revision_number varchar2(30),
Quote_date date
);

Insert into Manf_Quotes values
('Q_1001','M_1001', 'Rev A', to_date('Jan 05,2016','Mon DD, YYYY'));
Insert into Manf_Quotes values
('Q_1002','M_1001', 'Rev A', to_date('Dec 01,2016','Mon DD, YYYY'));
Insert into Manf_Quotes values
('Q_1003','M_1002', 'Rev B', to_date('Oct 01,2016','Mon DD, YYYY'));
Insert into Manf_Quotes values
('Q_1004','M_1003', 'Rev 6', to_date('Nov 01,2016','Mon DD, YYYY'));

ALTER TABLE Manf_Quotes
ADD Quoted_price number ;

Update Manf_Quotes
set Quoted_price = 100000
where Quote_number = 'Q_1001';
Update Manf_Quotes
set Quoted_price = 200000
where Quote_number = 'Q_1002';
Update Manf_Quotes
set Quoted_price = 300000
where Quote_number = 'Q_1003';
Update Manf_Quotes
set Quoted_price = 400000
where Quote_number = 'Q_1004';

Insert into Manf_Quotes values
('Q_1005','M_1001', 'Rev 6', to_date('Nov 01,2016','Mon DD, YYYY'),250000);
Insert into Manf_Quotes values
('Q_1006','M_1002', 'Rev 1', to_date('Nov 01,2016','Mon DD, YYYY'),350000);
Insert into Manf_Quotes values
('Q_1007','M_1002', 'Rev 1', to_date('June 01,2015','Mon DD, YYYY'),1050000);
Insert into Manf_Quotes values
('Q_1008','M_1003', 'Rev 1', to_date('June 01,2015','Mon DD, YYYY'),1250000);
Insert into Manf_Quotes values
('Q_1009','M_1003', 'Rev 0', to_date('June 01,2015','Mon DD, YYYY'),2250000);
Insert into Manf_Quotes values
('Q_1010','M_1001', 'Rev 0', to_date('May 01,2015','Mon DD, YYYY'),2250000);

alter table manf_quotes
add foreign key (manf_id) references manufacturer (manf_id);

create table Tender_Tracker (
Tracker_id Varchar2(10) constraint Tracker_id_PK  Primary Key,
Tender_id varchar2(10),
E_Employee_id number(10),
P_Employee_id number(10),
A_Employee_id number(10),
Bid_Bond_number varchar2(10),
Quote_number varchar2(10),
Tender_status varchar(20)
);

Insert into TENDER_TRACKER 
Values ('TR001','T_1001',201,302,401,'B_1004','Q_1001','closed');
Insert into TENDER_TRACKER 
Values ('TR002','T_1002',202,301,402,'B_1006','Q_1002','Quote awaiting');
Insert into TENDER_TRACKER 
Values ('TR003','T_1003',201,301,401,'B_1007','Q_1003','closed');
Insert into TENDER_TRACKER 
Values ('TR004','T_1004',202,302,402,'B_1017','Q_1004','Ongoing');
Insert into TENDER_TRACKER 
Values ('TR005','T_1005',203,302,402,'B_1005','Q_1005','closed win');
Insert into TENDER_TRACKER 
Values ('TR006','T_1006',204,301,402,'B_1006','Q_1006','closed win');
Insert into TENDER_TRACKER 
Values ('TR007','T_1007',204,301,402,'B_1007','Q_1007','closed win');
Insert into TENDER_TRACKER 
Values ('TR008','T_1008',204,301,402,'B_1008','Q_1008','closed win');
Insert into TENDER_TRACKER 
Values ('TR009','T_1009',200,302,402,'B_1009','Q_1009','closed win');
Insert into TENDER_TRACKER 
Values ('TR010','T_1010',200,302,402,'B_1010','Q_1010','closed');

alter table tender_tracker
add foreign key (tender_id) references Tenders (Tender_id);
alter table tender_tracker
add foreign key (e_Employee_id) references Engineer (E_Employee_id);
alter table tender_tracker
add foreign key (p_Employee_id) references PR (P_Employee_id);
alter table tender_tracker
add foreign key (a_Employee_id) references Accounts (A_Employee_id);
alter table tender_tracker
add foreign key (bid_bond_number) references Bid_Bonds (Bid_Bond_Number);
alter table tender_tracker
add foreign key (quote_number) references manf_quotes (Quote_number);

select * from tender_tracker;
select * from tenders;
select * from manf_quotes;
