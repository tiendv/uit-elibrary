<%-- 
    Document   : createSubject
    Created on : Nov 22, 2011, 11:12:12 AM
    Author     : tiendv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>

<div style="overflow: auto;height: 600px;">
    <h1>Thêm mới một môn học</h1>
    <table>
        <tr>
            <td>Tên Môn Học</td>
            <td><input name="txtSubjectName" type="text"/></td>
            <td>Mã Môn Học</td>
            <td><input name="txtSubjectCode" type="text"/></td>
        </tr>
        <tr>
            <td>Số tiết lý thuyết</td>
            <td><input name="txtPeriodOfTheory" type="text"/></td>
            <td>Số tiết thực hành</td>
            <td><input name="txtPeriodOfPractice" type="text"/></td>
        </tr>
        <tr>
            <td>Phần trăm điểm giữa kỳ</td>
            <td><input name="txtMidtermGrade" type="text"/></td>
            <td>Phần trăm điểm cuối kỳ</td>
            <td><input name="txtFinalGrade" type="text"/></td>
        </tr>
        <tr>
            <td>Môn học tiên quyết</td>
            <td><input name="txtPrerequisiteSubject" type="text"/></td>
            <td>Thời gian giảng dạy</td>
            <td><input name="txtSubjectTime" type="text"/></td>
        </tr>
        <tr>
            <td>Giáo viên</td>
            <td><input name="txtTeacherName" type="text"/></td>
            <td>Trình độ</td>
            <td><input name="txtLevel" type="text"/></td>
        </tr>
        
        <tr>
            <td>Hình ảnh môn học</td>
            <td><input name="imageSubject" type="file"/></td>
            <td><input type="submit" value="Upload"/></td>
        </tr>

    </table>
    
    <hr>
    <h2>Giới thiệu về môn học(Tiếng Việt)</h2>
   
        <FCK:editor  instanceName="fck" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    
    <h2>Giới thiệu về môn học(Tiếng Anh)</h2>
    <FCK:editor instanceName="fck" height="300px">
        <jsp:attribute name="value">
            
        </jsp:attribute>
    </FCK:editor>
    <hr>
    <h2>Yêu cầu đồ án/ thi cuối kì (Tiếng Việt)</h2>
        <FCK:editor  instanceName="fck" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    <h2>Yêu cầu đồ án/ thi cuối kì(Tiếng Anh)</h2>

        <FCK:editor  instanceName="fck" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    <div style="text-align: right">
        <input type="submit" value="Cancel"/>
        <input type="submit" value="Create"/>
    </div>
</div>