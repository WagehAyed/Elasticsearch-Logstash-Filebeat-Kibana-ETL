IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ElasticTest')
BEGIN
    -- Database does not exist
    PRINT 'Database does not exist.'
create DATABASE ElasticTest;
END
ELSE
BEGIN
    -- Database already exists
    PRINT 'Database exists.'
END

GO
use ElasticTest;
Go
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Employees')
BEGIN
    -- Table does not exist
    PRINT 'Table does not exist.'
    
    CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name nvarchar(500),
    Age INT
);
END
ELSE
BEGIN
    -- Table already exists
    PRINT 'Table exists.'
END

GO 

--  add mock data 
 
DECLARE @StartID INT = 101;
DECLARE @EndID INT = 300;
WITH emp AS (
SELECT
ROW_NUMBER() OVER (ORDER BY number) + @StartID - 1 AS ID,
'Name' + CAST(ROW_NUMBER() OVER (ORDER BY number) + @StartID - 1 AS VARCHAR(10)) AS Name,
20 + (ROW_NUMBER() OVER (ORDER BY number) % 10) AS Age
FROM master..spt_values
)

--  add mock data 
 Merge into Employees as target
 using(


-- INSERT INTO Employees (ID, Name, Age)
select 1, 'John Doe', 30
union select 
2, 'Jane Smith', 25 union select 
3, 'Michael Johnson', 40 union select 
4, 'Emily Davis', 28 union select 
5, 'Robert Brown', 35 union select 
6, 'Jennifer Wilson', 32 union select 
7, 'William Taylor', 45 union select 
8, 'Jessica Anderson', 27 union select 
9, 'David Martinez', 31 union select 
10, 'Sarah Thompson', 29 union select 
11, 'Daniel Clark', 33 union select 
12, 'Olivia Harris', 26 union select 
13, 'James Turner', 38 union select 
14, 'Sophia White', 24 union select 
15, 'Benjamin Walker', 37 union select 
16, 'Ava Lewis', 23 union select 
17, 'Matthew Hall', 36 union select 
18, 'Chloe Young', 22 union select 
19, 'Andrew King', 34 union select 
20, 'Lily Green', 21 union select 
21, 'Joseph Miller', 39 union select 
22, 'Grace Adams', 20 union select 
23, 'Samuel Scott', 42 union select 
24, 'Mia Murphy', 19 union select 
25, 'Christopher Hill', 41 union select 
26, 'Ella Phillips', 18 union select 
27, 'Joshua Ross', 44 union select 
28, 'Victoria Evans', 17 union select 
29, 'Nicholas Bailey', 43 union select 
30, 'Hannah Foster', 16 union select 
31, 'Andrew Wilson', 29 union select 
32, 'Sophie Johnson', 26 union select 
33, 'Matthew Davis', 32 union select 
34, 'Chloe Thompson', 24 union select 
35, 'Benjamin Martinez', 31 union select 
36, 'Olivia Taylor', 27 union select 
37, 'Daniel Anderson', 30 union select 
38, 'Emily Smith', 25 union select 
39, 'Jacob Brown', 28 union select 
40, 'Grace Wilson', 23 union select 
41, 'Alexander Harris', 26 union select 
42, 'Ava Turner', 22 union select 
43, 'William Young', 25 union select 
44, 'Ella King', 21 union select 
45, 'James Murphy', 24 union select 
46, 'Mia Lewis', 20 union select 
47, 'Joseph Phillips', 23 union select 
48, 'Sophia Ross', 19 union select 
49, 'Christopher Adams', 22 union select 
50, 'Lily Scott', 18 union select 
51, 'Samuel Miller', 21 union select 
52, 'Victoria Green', 17 union select 
53, 'Nicholas Hall', 20 union select 
54, 'Hannah Young', 16 union select 
55, 'Andrew Turner', 19 union select 
56, 'Sophie Bailey', 15 union select 
57, 'Matthew Clark', 18 union select 
58, 'Chloe White', 14 union select 
59, 'Benjamin Walker', 17 union select 
60, 'Olivia Lewis', 13 union select 
61, 'Daniel Phillips', 16 union select 
62, 'Emily Ross', 12 union select 
63, 'James Adams', 15 union select 
64, 'Mia Scott', 11 union select 
65, 'Joseph Murphy', 14 union select 
66, 'Sophia Lewis', 10 union select 
67, 'William Turner', 13 union select 
68, 'Ava Green', 9 union select 
69, 'Alexander Hall', 12 union select 
70, 'Lily Young', 8 union select 
71, 'Samuel Bailey', 11 union select 
72, 'Victoria Clark', 7 union select 
73, 'Nicholas White', 10 union select 
74, 'Hannah Walker', 6 union select 
75, 'Andrew Lewis', 9 union select 
76, 'Sophie Phillips', 5 union select 
77, 'Matthew Adams', 8 union select 
78, 'Chloe Scott', 4 union select 
79, 'Benjamin Murphy', 7 union select 
80, 'Olivia Turner', 3 union select 
81, 'James Green', 6 union select 
82, 'Mia Young', 2 union select 
83, 'Joseph Turner', 5 union select 
84, 'Sophia Bailey', 1 union select 
85, 'William Clark', 4 union select 
86, 'Ava White', 30 union select 
87, 'Alexander Walker', 3 union select 
88, 'Lily Lewis', 29 union select 
89, 'Samuel Phillips', 2 union select 
90, 'Victoria Adams', 28 union select 
91, 'Nicholas Scott', 1 union select 
92, 'Hannah Murphy', 27 union select 
93, 'Andrew Turner', 30 union select 
94, 'Sophie Green', 26 union select 
95, 'Matthew Young', 25 union select 
96, 'Chloe Bailey', 24 union select 
97, 'Benjamin Clark', 23 union select 
98, 'Olivia White', 22 union select 
99, 'Daniel Walker', 21 union select 
100, 'Emily Lewis', 20 
UNION ALL
SELECT ID, cast(Name as varchar(50)), cast(Age as int)
FROM emp
WHERE ID <= @EndID
 )as source(ID,Name,Age)
 on(target.ID= source.ID)
 when not MATCHED then
 INSERT (ID, Name, Age)
    VALUES (source.ID, source.Name, source.Age); 