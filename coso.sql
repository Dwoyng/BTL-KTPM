create view ChiCucThuY as
select * from CoSo
where LoaiCoSoID = 5;

select * from ChiCucThuY

UPDATE CoSo
SET Loai = 0
WHERE LoaiCoSoID <> 1;

create view DaiLyBanThuoc as
select * from CoSo
where LoaiCoSoID = 6;

select * from DaiLyBanThuoc

create view KhuTamGiu as
select * from CoSo
where LoaiCoSoID = 7;

select * from KhuTamGiu