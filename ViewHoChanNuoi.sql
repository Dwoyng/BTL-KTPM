--Alter table HoChanNuoi drop column KetQua;

--select * from HoChanNuoi

create view ThongKeHoChanNuoi as
select (case KQ when 1 then N'Đạt chuẩn' else N'Chưa đạt chuẩn' end) as KiemDinh, Count(*) as SL from HoChanNuoi group by KQ

select * from ThongKeHoChanNuoi