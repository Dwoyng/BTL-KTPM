

select * from SanPhamXuLyChatThai

create view SanPhamConHan as
SELECT * FROM SanPhamXuLyChatThai
WHERE CONVERT(DATE, NgayHetHan, 103) >= GETDATE();

select * from SanPhamConHan

