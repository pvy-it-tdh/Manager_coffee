CREATE DATABASE Quanliquancafe
GO

USE Quanliquancafe
GO


-- food
-- table
-- Account
-- Bill
-- BillInfo

CREATE TABLE tablefood
(
	id INT IDENTITY PRIMARY KEY,
	name Nvarchar(100) NOT NULL default N'chưa đặt tên',
	status Nvarchar(100)  -- Trống hay có người

)
GO

CREATE TABLE Account 
(
	DisplayName NVARCHAR(100) not null,
	Username NVARCHAR(100)  PRIMARY KEY,
	PassWord NVARCHAR(1000) not null DEFAULT 0,
	type int not null DEFAULT 0 -- 0: user 1: admin 
)
GO
CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name Nvarchar(100) NOT NULL default N'chưa đặt tên'
)
go
CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name Nvarchar(100) NOT NULL default N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL default 0
	foreign key (idCategory) references dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL default getdate(),
	DateCheckOut DATE,
	idTable INT Not Null, 
	status INT Not Null default 0 -- 1 đã thanh toán 0: chưa thanh toán
	foreign key (idTable) references dbo.TableFood(id)
)
GO
CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL Default 0
	foreign key (idBill) references dbo.Bill(id),
	foreign key (idFood) references dbo.Food(id)

)
Go

INSERT	INTO dbo.Account
( 
Username,
DisplayName,
PassWord,
type
)
VALUES
(
N'Admin',-- Username
N'Phuc VY',--displayname
N'123',--password
1-- Type
)
INSERT	INTO dbo.Account
( 
Username,
DisplayName,
PassWord,
type
)
VALUES
(
N'staff',-- Username
N'staff',--displayname
N'1',--password
0-- Type
)
SELECT Username
FROM dbo.Account;


-- Create stored procedure
-- Create stored procedure
CREATE PROC USP_GetAccountByUserName 
@userName nvarchar(100)
AS
BEGIN
    SELECT * FROM dbo.Account WHERE Username = @userName
END
Go

-- Execute stored procedure with parameter 'Admin'
EXEC dbo.USP_GetAccountByUserName @userName = N'Admin'
CREATE PROC USP_Login
@userName nvarchar(100) , @passWord nvarchar(100)
AS
BEGIN
	SELECT  * FROM dbo.Account WHERE Username=@userName AND PassWord=@passWord
END
GO

INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 1',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 2',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 3',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 4',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 5',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 6',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 7',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 8',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 9',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 10',N'Trống')
GO
CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.tablefood
GO
UPDATE dbo.tablefood SET status=N'Có người' where id=69
GO

-- Thêm category
INSERT dbo.FoodCategory
(name)
VALUES (N'Hải sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Nông sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Lâm sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Sản sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Nước')


-- Thêm món ăn

INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Mực nướng sa tế',1,200000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Nghiêu hấp xả',1,100000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Nghiêu hấp thái',1,100000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Dú heo nướng sữa',2,60000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Heo rừng nướng',3,75000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Cơm chiên mushi',4,100000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'7Up',5,10000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Cafe',5,20000)


-- thêm Bill
INSERT dbo.Bill
(DateCheckIn,DateCheckOut,idTable,status)
VALUES
(
GETDATE(),
NULL,
69,
0
)
INSERT dbo.Bill
(DateCheckIn,DateCheckOut,idTable,status)
VALUES
(
GETDATE(),
GETDATE(),
71,
0
)

-- thêm Bill info

INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(1,1,2)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(1,3,4)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(2,4,5)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(2,6,3)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(3,1,4)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(3,5,3)

GO

SELECT f.name,b.count,f.price,f.price*b.count AS totalPrice FROM dbo.BillInfo AS b,dbo.Bill AS bi,dbo.Food AS f
WHERE b.idBill=bi.id AND b.idFood=f.id AND bi. AND bi.idTable=69

CREATE DATABASE Quanliquancafe
GO

USE Quanliquancafe
GO


-- food
-- table
-- Account
-- Bill
-- BillInfo

CREATE TABLE tablefood
(
	id INT IDENTITY PRIMARY KEY,
	name Nvarchar(100) NOT NULL default N'chưa đặt tên',
	status Nvarchar(100)  -- Trống hay có người

)
GO

CREATE TABLE Account 
(
	DisplayName NVARCHAR(100) not null,
	Username NVARCHAR(100)  PRIMARY KEY,
	PassWord NVARCHAR(1000) not null DEFAULT 0,
	type int not null DEFAULT 0 -- 0: user 1: admin 
)
GO
CREATE TABLE FoodCategory
(
	id INT IDENTITY PRIMARY KEY,
	name Nvarchar(100) NOT NULL default N'chưa đặt tên'
)
go
CREATE TABLE Food
(
	id INT IDENTITY PRIMARY KEY,
	name Nvarchar(100) NOT NULL default N'Chưa đặt tên',
	idCategory INT NOT NULL,
	price FLOAT NOT NULL default 0
	foreign key (idCategory) references dbo.FoodCategory(id)
)
GO

CREATE TABLE Bill
(
	id INT IDENTITY PRIMARY KEY,
	DateCheckIn DATE NOT NULL default getdate(),
	DateCheckOut DATE,
	idTable INT Not Null, 
	status INT Not Null default 0 -- 1 đã thanh toán 0: chưa thanh toán
	foreign key (idTable) references dbo.TableFood(id)
)
GO
CREATE TABLE BillInfo
(
	id INT IDENTITY PRIMARY KEY,
	idBill INT NOT NULL,
	idFood INT NOT NULL,
	count INT NOT NULL Default 0
	foreign key (idBill) references dbo.Bill(id),
	foreign key (idFood) references dbo.Food(id)

)
Go

INSERT	INTO dbo.Account
( 
Username,
DisplayName,
PassWord,
type
)
VALUES
(
N'Admin',-- Username
N'Phuc VY',--displayname
N'123',--password
1-- Type
)
INSERT	INTO dbo.Account
( 
Username,
DisplayName,
PassWord,
type
)
VALUES
(
N'staff',-- Username
N'staff',--displayname
N'1',--password
0-- Type
)
SELECT Username
FROM dbo.Account;


-- Create stored procedure
-- Create stored procedure
CREATE PROC USP_GetAccountByUserName 
@userName nvarchar(100)
AS
BEGIN
    SELECT * FROM dbo.Account WHERE Username = @userName
END
Go

-- Execute stored procedure with parameter 'Admin'
EXEC dbo.USP_GetAccountByUserName @userName = N'Admin'
CREATE PROC USP_Login
@userName nvarchar(100) , @passWord nvarchar(100)
AS
BEGIN
	SELECT  * FROM dbo.Account WHERE Username=@userName AND PassWord=@passWord
END
GO

INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 1',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 2',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 3',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 4',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 5',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 6',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 7',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 8',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 9',N'Trống')
INSERT dbo.tablefood
(name,status)
VALUES(N'Bàn 10',N'Trống')
GO
CREATE PROC USP_GetTableList
AS SELECT * FROM dbo.tablefood
GO
UPDATE dbo.tablefood SET status=N'Có người' where id=69
GO

-- Thêm category
INSERT dbo.FoodCategory
(name)
VALUES (N'Hải sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Nông sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Lâm sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Sản sản')
INSERT dbo.FoodCategory
(name)
VALUES (N'Nước')


-- Thêm món ăn

INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Mực nướng sa tế',1,200000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Nghiêu hấp xả',1,100000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Nghiêu hấp thái',1,100000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Dú heo nướng sữa',2,60000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Heo rừng nướng',3,75000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Cơm chiên mushi',4,100000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'7Up',5,10000)
INSERT dbo.Food
(name,idCategory,price)
VALUES(N'Cafe',5,20000)


-- thêm Bill
INSERT dbo.Bill
(DateCheckIn,DateCheckOut,idTable,status)
VALUES
(
GETDATE(),
NULL,
69,
0
)
INSERT dbo.Bill
(DateCheckIn,DateCheckOut,idTable,status)
VALUES
(
GETDATE(),
GETDATE(),
71,
0
)

-- thêm Bill info

INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(1,1,2)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(1,3,4)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(2,4,5)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(2,6,3)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(3,1,4)
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(3,5,3)

GO

SELECT f.name,b.count,f.price,f.price*b.count AS totalPrice FROM dbo.BillInfo AS b,dbo.Bill AS bi,dbo.Food AS f
WHERE b.idBill=bi.id AND b.idFood=f.id AND bi.idTable=69

SELECT f.name ,b.count, f.price,f.price*b.count AS totalPrice FROM dbo.BillInfo AS b,dbo.Bill AS bi,dbo.Food AS f WHERE b.idBill = bi.id AND b.idFood = f.id AND bi.idTable = 1

SELECT * FROM dbo.Bill
SELECT * FROM dbo.FoodCategory
SELECT * FROM dbo.Food
SELECT * FROM dbo.BillInfo
SELECT * FROM dbo.Bill WHERE idTable=69 AND status=1
SELECT * FROM dbo.BillInfo WHERE idBill=5




SELECT * FROM dbo.Bill
SELECT * FROM dbo.FoodCategory
SELECT * FROM dbo.Food
SELECT * FROM dbo.BillInfo
SELECT * FROM dbo.Bill WHERE idTable=69 AND status=1
SELECT * FROM dbo.BillInfo WHERE idBill=5
Go
ALTER PROC USP_InsertBill 
@idTable INT 
AS
BEGIN 
	INSERT dbo.Bill
	(
	DateCheckIn,
	DateCheckOut,
	idTable,
	status,
	discount
	)
	VAlUES
	( GETDATE() ,
		null,
		@idTable,
		0,
		0
	)
END
GO

DELETE dbo.BillInfo
DELETE dbo.Bill

CREATE PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT 
AS
BEGIN
INSERT dbo.BillInfo
(idBill,idFood,count)
VALUES
(@idBill,@idFood,@count)
END
GO
SELECT MAX (id) from dbo.Bill
go
alter PROC USP_InsertBillInfo
@idBill INT, @idFood INT, @count INT
AS
BEGIN
    DECLARE @isExitsBillInfo INT
    DECLARE @foodCount INT = 1

    SELECT @isExitsBillInfo = id, @foodCount = b.count
    FROM dbo.BillInfo AS b
    WHERE idBill = @idBill AND idFood = @idFood

    IF (@isExitsBillInfo > 0)
    BEGIN
        DECLARE @newCount INT = @foodCount + @count
        IF (@newCount > 0)
            UPDATE dbo.BillInfo SET count = @newCount WHERE idFood=@idFood
        ELSE
            DELETE dbo.BillInfo WHERE idBill = @idBill AND idFood = @idFood
    END
    ELSE
    BEGIN
        INSERT dbo.BillInfo
        (idBill, idFood, count)
        VALUES
        (@idBill, @idFood, @count)
    END
END
GO

ALTER TRIGGER UTG_UpdateBillInfo
ON dbo.BillInfo FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @idBill INT;

	SELECT @idBill = idBill FROM inserted
	
	DECLARE @idTable INT 

	SELECT @idTable = idTable FROM dbo.Bill WHERE id=@idBill AND status=0

	DECLARE @count INT
	SELECT @count=COUNT(*) FROM dbo.BillInfo WHERE idBill=@idBill
	IF(@count>0)
		UPDATE dbo.tablefood SET status=N'Trống' WHERE id=@idTable
	ELSE
		UPDATE dbo.tablefood SET status=N'Có người' WHERE id=@idTable
END
GO
CREATE TRIGGER UTG_UpdateBill
ON dbo.Bill FOR UPDATE
AS
BEGIN
	DECLARE @idBill INT 
	SELECT @idBill=id FROM inserted
	DECLARE @idTable INT 
	SELECT @idTable = idTable FROM dbo.Bill WHERE id=@idBill 
	DECLARE @count  INT =0
	SELECT @count=COUNT(*) FROM dbo.Bill WHERE idTable=@idTable AND status=0
	IF(@count = 0)
		UPDATE dbo.tablefood SET status=N'Trống' WHERE id=@idTable
END
GO
ALTER TABLE dbo.Bill
ADD discount INT 
go

alter PROC USP_SwitchTable1
@idTable1 INT, @idTable2 INT
AS BEGIN
	DECLARE @idFirstBill int
	DECLARE @idSeconrdBill int
	DECLARE @idFirstTabEmty int =1
	DECLARE @idSecondTabEmty int =1

	
	SELECT @idFirstBill=id FROM dbo.Bill WHERE idTable=@idTable1 and status=0
	SELECT @idSeconrdBill=id FROM dbo.Bill WHERE idTable=@idTable2 and status=0

	IF(@idFirstBill is NULL)
	BEGIN
		INSERT dbo.Bill
		(DateCheckIn,
		DateCheckOut,
		idTable,
		status
		)
		VALUES 
		( GETDATE(),
		NULL,
		@idTable1,
		0
		)
		SELECT @idFirstBill=MAX(id) FROM dbo.Bill WHERE idTable=@idTable1 and status=0
		
	END
	SELECT @idFirstTabEmty=COUNT(*) FROM dbo.BillInfo WHERE idBill=@idFirstBill

		IF(@idSeconrdBill is NULL)
	BEGIN
		INSERT dbo.Bill
		(DateCheckIn,
		DateCheckOut,
		idTable,
		status
		)
		VALUES 
		( GETDATE(),
		NULL,
		@idTable2,
		0
		)
		SELECT @idSeconrdBill=MAX(id) FROM dbo.Bill WHERE idTable=@idTable2 and status=0
		
	END
	SELECT @idSecondTabEmty= COUNT(*) FROM dbo.BillInfo WHERE idBill=@idSeconrdBill
	SELECT id INTO IDBillInfoTable FROM dbo.BillInfo WHERE idBill=@idSeconrdBill
	
	UPDATE dbo.BillInfo SET idBill = @idSeconrdBill WHERE idBill=@idFirstBill

	UPDATE dbo.BillInfo SET idBill =@idFirstBill WHERE id IN (	SELECT * FROM IDBillInfoTable)

	DROP TABLE IDBillInfoTable 
	IF (@idFirstTabEmty=0)
		UPDATE dbo.tablefood SET status=N'Trống' WHERE id=@idTable1
	IF (@idSecondTabEmty=0)
		UPDATE dbo.tablefood SET status=N'Trống' WHERE id=@idTable2
END 
GO
ALTER TABLE dbo.Bill ADD totalPrice float
go
CREATE PROC USP_GetListBillByDate
@checkIn date, @checkOut date
as
begin
SELECT t.name as[Tên bàn],b.totalPrice as [Tổng tiền], DateCheckIn as[Ngày vào], DateCheckOut as [Ngày ra] , discount as [Giảm giá]
froM dbo.Bill AS b,dbo.tablefood as t, dbo.BillInfo as bi, dbo.Food as f
WHERE DateCheckIn>=@checkIn and DateCheckOut<=@checkOut and b.status=1 
and t.id=b.idTable 
end 
go