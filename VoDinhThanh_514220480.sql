------------TẠO BẢNG-----------------
-----------BẢNG VẬT TƯ---------------
create database QL_Kho
use QL_Kho
go
CREATE TABLE VATTU (
    MaVTu VARCHAR(6) NOT NULL PRIMARY KEY,
    TenVTu NVARCHAR(50),
    DvTinh NVARCHAR(20),
    PhanTram DECIMAL(5, 2)
)
-----------BẢNG PHIẾU XUẤT---------------
CREATE TABLE PXUAT (
    SoPX VARCHAR(6) NOT NULL PRIMARY KEY,
    Ngayxuat DATE,
    TenKH NVARCHAR(50)
)
-----------BẢNG CHI TIẾT PHIẾU XUẤT---------------
CREATE TABLE CT_PXUAT (
    SoPX VARCHAR(6) NOT NULL,
    MaVTu VARCHAR(6) NOT NULL,
    SlXuat INT,
    DgXuat Money,
    CONSTRAINT PK_CTPXUAT PRIMARY KEY (SoPX, MaVTu),
    CONSTRAINT FK_CTPXUAT_PXUAT FOREIGN KEY (SoPX) REFERENCES PXUAT(SoPX),
    CONSTRAINT FK_CTPXUAT_VATTU FOREIGN KEY (MaVTu) REFERENCES VATTU(MaVTu)
)
----------------BẢNG TỒN KHO------------------------------------------------
CREATE TABLE TONKHO (
    MaVTu VARCHAR(6) NOT NULL,
    NgayNhap DATE,
    SlDau INT,
    TongSLN INT,
    TongSLX INT,
    SlCuoi INT,
    CONSTRAINT PK_TONKHO PRIMARY KEY (MaVTu, NgayNhap),
    CONSTRAINT FK_TONKHO_VATTU FOREIGN KEY (MaVTu) REFERENCES VATTU(MaVTu)
)
----------------------THÊM DỮ LIỆU----------------------------------------------------
INSERT INTO VATTU (MaVTu, TenVTu, DvTinh, PhanTram) VALUES
('SN0001', N'Sơn nước', N'Thùng', 10),
('TN0002', N'Tấm nhựa', N'Mét', 15),
('OT0003', N'Ống Thép', N'Mét', 20),
('MT0004', N'Máy khoan', N'Cái', 12),
('OV0005', N'Ốc vít', N'Hộp', 8),
('DD0006', N'Dây điện', N'Cuộn', 18),
('BL0007', N'Bulong', N'Thùng', 5),
('GT0008', N'Găng tay', N'Thùng', 10),
('CT0009', N'Chất tẩy', N'Hộp', 7),
('ON0010', N'Ống Nhựa', N'Mét', 25)
---------------------------------------------------------------------
INSERT INTO PXUAT (SoPX, Ngayxuat, TenKH) VALUES 
('PX0001', '2020-10-15', N'Lê Minh Hoàng'),
('PX0002', '2020-11-02', N'Nguyễn Minh Tâm'),
('PX0003', '2020-12-18', N'Hoàng Mạnh Đạt'),
('PX0004', '2020-01-05', N'Lê Minh Hoàng'),
('PX0005', '2020-02-21', N'Đào Ánh Tuyết'),
('PX0006', '2021-03-10', N'Nguyễn Thanh Tuyền'),
('PX0007', '2021-04-25', N'Lê Minh Hoàng'),
('PX0008', '2021-05-12', N'Hoàng Mạnh Đạt'),
('PX0009', '2021-06-29', N'Nguyễn Thanh Tuyền'),
('PX0010', '2022-07-17',N'Lê Minh Hoàng'),
('PX0011', '2022-08-03', N'Nguyễn Minh Tâm'),
('PX0012', '2022-09-20', N'Lê Hoàng Minh Thư'),
('PX0013', '2022-10-07', N'Đào Ánh Tuyết'),
('PX0014', '2022-11-24', N'Nguyễn Minh Tâm'),
('PX0015', '2022-12-11', N'Lê Hoàng Minh Thư'),
('PX0016', '2023-01-28', N'Nguyễn Thanh Toàn'),
('PX0017', '2023-02-14', N'Nguyễn Thanh Toàn'),
('PX0018', '2023-03-03', N'Lê Minh Hoàng'),
('PX0019', '2023-04-20', N'Nguyễn Minh Tâm'),
('PX0020', '2023-05-07', N'Nguyễn Thanh Tuyền')
-----------------------------------------------------------
INSERT INTO CT_PXUAT (SoPX, MaVTu, SlXuat, DgXuat) VALUES 
('PX0001', 'SN0001', 25, 501000),
('PX0001', 'GT0008', 10, 332000),
('PX0001', 'MT0004', 38, 937000),
('PX0002', 'SN0001', 15, 234680),
('PX0002', 'MT0004', 61, 145550),
('PX0003', 'ON0010', 22, 556400),
('PX0004', 'BL0007', 12, 566010),
('PX0004', 'SN0001', 10, 104091),
('PX0004', 'MT0004', 53, 120570),
('PX0004', 'DD0006', 41, 119430),
('PX0005', 'BL0007', 48, 101410),
('PX0005', 'DD0006', 25, 452130),
('PX0006', 'OV0005', 10, 672130),
('PX0006', 'CT0009', 52, 365020),
('PX0007', 'TN0002', 24, 646730),
('PX0007', 'SN0001', 36, 647420),
('PX0016', 'OV0005', 53, 125540),
('PX0018', 'MT0004', 25, 121140),
('PX0018', 'ON0010', 17, 94155),
('PX0018', 'DD0006', 11, 192150),
('PX0019', 'SN0001', 3, 100935),
('PX0008', 'GT0008', 6, 82361),
('PX0009', 'OT0003', 24, 62340),
('PX0011', 'DD0006', 4, 82342),
('PX0010', 'ON0010', 22, 69208),
('PX0010', 'MT0004', 5, 120127),
('PX0008', 'TN0002', 2, 114585),
('PX0011', 'OV0005', 22, 109065),
('PX0009', 'CT0009', 4, 67989),
('PX0012', 'DD0006', 8, 98468)
----------------------------------------------
INSERT INTO TONKHO (MaVTu, NgayNhap, SlDau, TongSLN, TongSLX, SlCuoi) VALUES 
('SN0001', '2019-09-11', 220, 100, 89, 320),
('TN0002', '2019-03-04', 242, 200, 26, 384),
('OT0003', '2019-12-01', 155, 150, 9, 771),
('MT0004', '2019-11-21', 450, 50, 191, 204),
('OV0005', '2019-01-05', 120, 120, 79, 299),
('DD0006', '2019-02-10', 780, 80, 89, 274),
('BL0007', '2019-08-12', 290, 90, 60, 296),
('GT0008', '2019-05-31', 110, 110, 16, 171),
('CT0009', '2019-10-15', 370, 70, 56, 231),
('ON0010', '2019-11-17', 260, 60, 61, 401)
go
--Tạo đường dẫn liên kết đến file dữ liệu từ QL_Kho
EXEC sp_attach_db @dbname = N'QL_Kho',
@filename1 = 'Desktop/Baithi_CSDL/QL_Kho/data.mdf',
@filename2 = 'Desktop/Baithi_CSDL/QL_Kho/log.ldf'
go
--Câu 1 : 
CREATE DATABASE QL_Kho 
ON PRIMARY 
  (NAME = QLKho_data, 
   FILENAME = @filename1, 
   SIZE = 10MB, 
   MAXSIZE = UNLIMITED, 
   FILEGROWTH = 10%), 
  (NAME = QLKho_log, 
   FILENAME = @filename2, 
   SIZE = 2MB, 
   MAXSIZE = UNLIMITED, 
   FILEGROWTH = 10%)
LOG ON 
  (NAME = QLKho_log, 
   FILENAME = @filename2,
   SIZE = 2MB, 
   MAXSIZE = UNLIMITED, 
   FILEGROWTH = 10%);
 go

 CREATE DATABASE QL_Kho 
ON PRIMARY 
  (NAME = QLKho_data, 
   FILENAME = @filename1,
   SIZE = 10MB, 
   MAXSIZE = UNLIMITED, 
   FILEGROWTH = 10%), 
  (NAME = QLKho_log, 
   FILENAME = @filename2, 
   SIZE = 2MB, 
   MAXSIZE = UNLIMITED, 
   FILEGROWTH = 10%)
LOG ON 
  (NAME = QLKho_log, 
   FILENAME = @filename2, 
   SIZE = 2MB, 
   MAXSIZE = UNLIMITED, 
   FILEGROWTH = 10%);
 go
--Câu 2 :
 CREATE VIEW VTU_MAX_XUAT_2022 AS
SELECT TOP 1 WITH TIES CT_PXUAT.MaVTu, SUM(CT_PXUAT.SlXuat) AS TongXuat
FROM CT_PXUAT
INNER JOIN PXUAT ON CT_PXUAT.SoPX = PXUAT.SoPX
WHERE YEAR(PXUAT.Ngayxuat) = 2022
GROUP BY CT_PXUAT.MaVTu
ORDER BY SUM(CT_PXUAT.SlXuat) DESC;
go
--Câu 3 :
CREATE PROCEDURE CAP_NHAT_TON_KHO
    @MaVTu VARCHAR(6),
    @NgayNhap DATE,
    @SlDau INT,
    @TongSLN INT,
    @TongSLX INT,
    @SlCuoi INT
AS
BEGIN
    IF (@SlDau > 0 AND @TongSLN > 0 AND @TongSLX > 0 AND @SlCuoi > 0)
    BEGIN
        IF EXISTS (SELECT * FROM TONKHO WHERE MaVTu = @MaVTu AND NgayNhap = @NgayNhap)
        BEGIN
            UPDATE TONKHO
            SET SlDau = @SlDau,
                TongSLN = @TongSLN,
                TongSLX = @TongSLX,
                SlCuoi = @SlCuoi
            WHERE MaVTu = @MaVTu AND NgayNhap = @NgayNhap;
        END
        ELSE
        BEGIN
        INSERT INTO TONKHO (MaVTu, NgayNhap, SlDau, TongSLN, TongSLX, SlCuoi)
            VALUES (@MaVTu, @NgayNhap, @SlDau, @TongSLN, @TongSLX, @SlCuoi);
        END
    END
END;
go
--Câu 4 :
CREATE FUNCTION SO_LAN_MUA_HANG(@TenKH NVARCHAR(50), @Nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @SoLanMua INT;
    SELECT @SoLanMua = COUNT(DISTINCT PXUAT.SoPX)
    FROM PXUAT
    WHERE YEAR(PXUAT.Ngayxuat) = @Nam AND PXUAT.TenKH = @TenKH;
    RETURN @SoLanMua;
END;
go
--Câu 5 :
INSERT INTO TONKHO (MaVTu, NgayNhap, SlDau, TongSLN, TongSLX, SlCuoi)
            VALUES (@MaVTu, @NgayNhap, @SlDau, @TongSLN, @TongSLX, @SlCuoi);
        END
    END
END;
go
--Câu 4 :
CREATE FUNCTION SO_LAN_MUA_HANG(@TenKH NVARCHAR(50), @Nam INT)
RETURNS INT
AS
BEGIN
    DECLARE @SoLanMua INT;
    SELECT @SoLanMua = COUNT(DISTINCT PXUAT.SoPX)
    FROM PXUAT
    WHERE YEAR(PXUAT.Ngayxuat) = @Nam AND PXUAT.TenKH = @TenKH;
    RETURN @SoLanMua;
END;
go
--Câu 5 : 
CREATE TRIGGER KIEM_TRA_CT_PXUAT
ON CT_PXUAT
FOR INSERT
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM VATTU WHERE MaVTu IN (SELECT MaVTu FROM INSERTED))
    BEGIN
        RAISERROR('Không tồn tại MaVTu này trong bảng VATTU', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    IF NOT EXISTS (SELECT * FROM PXUAT WHERE SoPX IN (SELECT SoPX FROM INSERTED))
    BEGIN
        RAISERROR('Không tồn tại SoPX này trong bảng PXUAT', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;