GitHub: https://github.com/KhoaHuynh1416/-JavaWeb-DemoCRUD
Mô tả chương trình: Demo CRUD sản phẩm điện thoại/phụ kiện
--Môi trường:
----Phiên bản Java: JRE 8
----Server: Wildfly 24+
----DBMS: MySQL, Connector 5
----IDE: Eclipse 2022
----OS: Windows 10
--Cấu trúc:
---BE: 3 package model, service, servlet
----com.demo.model
-----HiberConnection: Map to Database
-----SanPhamDAO: Transactions
-----SanPhamDTO: Map to Database, Data Transfer Object
-----TypeDTO: Map to Database, Data Transfer Object
----com.demo.servlet
-----Servlet: chuyển dữ liệu từ BE lên FE và ngược lại
---FE: 2 file jsp
-----ProductList: Xem, Xóa sản phẩm
-----ProductForm: Thêm, Sửa sản phẩm
Một số lưu ý:
--Nhiều trường chưa Validate
