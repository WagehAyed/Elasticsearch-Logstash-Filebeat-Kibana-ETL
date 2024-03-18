create DATABASE ElasticTest;
GO
use ElasticTest;
GO
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name nvarchar(500),
    Age INT
);
GO
INSERT INTO Employees (ID, Name, Age)
VALUES
    (1, 'John Doe', 30),
(2, 'Jane Smith', 25),
(3, 'Michael Johnson', 40),
(4, 'Emily Davis', 28),
(5, 'Robert Brown', 35),
(6, 'Jennifer Wilson', 32),
(7, 'William Taylor', 45),
(8, 'Jessica Anderson', 27),
(9, 'David Martinez', 31),
(10, 'Sarah Thompson', 29),
(11, 'Daniel Clark', 33),
(12, 'Olivia Harris', 26),
(13, 'James Turner', 38),
(14, 'Sophia White', 24),
(15, 'Benjamin Walker', 37),
(16, 'Ava Lewis', 23),
(17, 'Matthew Hall', 36),
(18, 'Chloe Young', 22),
(19, 'Andrew King', 34),
(20, 'Lily Green', 21),
(21, 'Joseph Miller', 39),
(22, 'Grace Adams', 20),
(23, 'Samuel Scott', 42),
(24, 'Mia Murphy', 19),
(25, 'Christopher Hill', 41),
(26, 'Ella Phillips', 18),
(27, 'Joshua Ross', 44),
(28, 'Victoria Evans', 17),
(29, 'Nicholas Bailey', 43),
(30, 'Hannah Foster', 16),
(31, 'Andrew Wilson', 29),
(32, 'Sophie Johnson', 26),
(33, 'Matthew Davis', 32),
(34, 'Chloe Thompson', 24),
(35, 'Benjamin Martinez', 31),
(36, 'Olivia Taylor', 27),
(37, 'Daniel Anderson', 30),
(38, 'Emily Smith', 25),
(39, 'Jacob Brown', 28),
(40, 'Grace Wilson', 23),
(41, 'Alexander Harris', 26),
(42, 'Ava Turner', 22),
(43, 'William Young', 25),
(44, 'Ella King', 21),
(45, 'James Murphy', 24),
(46, 'Mia Lewis', 20),
(47, 'Joseph Phillips', 23),
(48, 'Sophia Ross', 19),
(49, 'Christopher Adams', 22),
(50, 'Lily Scott', 18),
(51, 'Samuel Miller', 21),
(52, 'Victoria Green', 17),
(53, 'Nicholas Hall', 20),
(54, 'Hannah Young', 16),
(55, 'Andrew Turner', 19),
(56, 'Sophie Bailey', 15),
(57, 'Matthew Clark', 18),
(58, 'Chloe White', 14),
(59, 'Benjamin Walker', 17),
(60, 'Olivia Lewis', 13),
(61, 'Daniel Phillips', 16),
(62, 'Emily Ross', 12),
(63, 'James Adams', 15),
(64, 'Mia Scott', 11),
(65, 'Joseph Murphy', 14),
(66, 'Sophia Lewis', 10),
(67, 'William Turner', 13),
(68, 'Ava Green', 9),
(69, 'Alexander Hall', 12),
(70, 'Lily Young', 8),
(71, 'Samuel Bailey', 11),
(72, 'Victoria Clark', 7),
(73, 'Nicholas White', 10),
(74, 'Hannah Walker', 6),
(75, 'Andrew Lewis', 9),
(76, 'Sophie Phillips', 5),
(77, 'Matthew Adams', 8),
(78, 'Chloe Scott', 4),
(79, 'Benjamin Murphy', 7),
(80, 'Olivia Turner', 3),
(81, 'James Green', 6),
(82, 'Mia Young', 2),
(83, 'Joseph Turner', 5),
(84, 'Sophia Bailey', 1),
(85, 'William Clark', 4),
(86, 'Ava White', 30),
(87, 'Alexander Walker', 3),
(88, 'Lily Lewis', 29),
(89, 'Samuel Phillips', 2),
(90, 'Victoria Adams', 28),
(91, 'Nicholas Scott', 1),
(92, 'Hannah Murphy', 27),
(93, 'Andrew Turner', 30),
(94, 'Sophie Green', 26),
(95, 'Matthew Young', 25),
(96, 'Chloe Bailey', 24),
(97, 'Benjamin Clark', 23),
(98, 'Olivia White', 22),
(99, 'Daniel Walker', 21),
(100, 'Emily Lewis', 20)
Go

--  add mock data 
DECLARE @StartID INT = 121;
DECLARE @EndID INT = 130;

WITH emp AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY number) + @StartID - 1 AS ID,
        'Name' + CAST(ROW_NUMBER() OVER (ORDER BY number) + @StartID - 1 AS VARCHAR(10)) AS Name,
        20 + (ROW_NUMBER() OVER (ORDER BY number) % 10) AS Age
    FROM master..spt_values
)
INSERT INTO Employees (ID, Name, Age)
SELECT ID, cast(Name as varchar(50)), cast(Age as int)
FROM emp
WHERE ID <= @EndID;

Go  

-- select Data of emplyees
select * from Employees