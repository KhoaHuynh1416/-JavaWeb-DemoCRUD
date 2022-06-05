GitHub:
Mô tả chương trình: Demo CRUD sản phẩm điện thoại/phụ kiện
--Môi trường:
----Phiên bản Java: JRE 8
----Server: JBoss 7.1
----DBMS: MySQL, Connector 5
----IDE: Eclipse 2022
----OS: Windows 10
--Cấu trúc:
---BE: 3 package model, service, servlet
----com.demo.model
-----MyConnection: kết nối CSDL
-----SanPhamDAO: SQL Query
-----SanPhamDTO: trung chuyển dữ liệu
----com.demo.service
-----ProductList: chi tiết toàn bộ các hàm xử lý
-----ProductListLocal: các hàm quản lý/máy chủ có thể gọi
-----ProductListRemote: các hàm khách có thể gọi
----com.demo.servlet
-----Servlet: chuyển dữ liệu từ BE lên FE và ngược lại
---FE: 2 file jsp
-----ProductList: Xem, Xóa sản phẩm
-----ProductForm: Thêm, Sửa sản phẩm
Một số lưu ý:
--Nhiều trường chưa Validate
--Thêm thêm/sửa số lượng bằng số âm thì chương trình sẽ trả về 0 và lưu vào CSDL. Chương trình vẫn chạy bình thường dù Console có báo lỗi.