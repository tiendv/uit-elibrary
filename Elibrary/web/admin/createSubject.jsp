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
            <td><input type="text"/></td>
            <td>Mã Môn Học</td>
            <td><input type="text"/></td>
        </tr>
        <tr>
            <td>Số tiết lý thuyết</td>
            <td><input type="text"/></td>
            <td>Số tiết thực hành</td>
            <td><input type="text"/></td>
        </tr>
        <tr>
            <td>Giáo viên</td>
            <td><select>
                    <option></option>
                    <option></option>
                </select></td>
            <td>Trình độ</td>
            <td><select>
                    <option></option>
                    <option></option>
                </select></td>
        </tr>
        <tr>
            <td>Hình ảnh môn học</td>
            <td><input type="file"/></td>
            <td><input type="submit" value="Upload"/></td>
        </tr>

    </table>
    <hr>
    <h2>Giới thiệu về môn học(Tiếng Việt)</h2>
    <FCK:editor instanceName="fck" height="300px">
        <jsp:attribute name="value">
            This is some <strong>sample text</strong>.
            You are using <a href="http://www.fckeditor.net">FCKeditor</a>.
        </jsp:attribute>
    </FCK:editor>
    <hr>
    <h2>Giới thiệu về môn học(Tiếng Anh)</h2>
    <FCK:editor instanceName="fck" height="300px">
        <jsp:attribute name="value">
            This is some <strong>sample text</strong>.
            You are using <a href="http://www.fckeditor.net">FCKeditor</a>.
        </jsp:attribute>
    </FCK:editor>
    <div style="text-align: right">
        <input type="submit" value="Cancel"/>
        <input type="submit" value="Create"/>
    </div>
</div>