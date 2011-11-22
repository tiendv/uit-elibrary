<%-- 
    Document   : createLecture
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
    <h1>Thêm mới một chương mới</h1>
    <table>
        <tr>
            <td>Tên chương</td>
            <td><input name="txtLectureName" type="text"/></td>
            <td>Tên môn học</td>
            <td><select>
              <option></option>
           </select></td>
        </tr>
        <tr>
            <td>Số thứ tự chương</td>
            <td><input type="text"/></td>
        </tr>
       
        <tr>
            <td> Tài nguyên</td>
            <td><input type="file"/></td>
            <td><select>
                <option></option>
                </select>
            </td>
            <td><input type="submit" value="Upload"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="New"/></td>
        </tr>

    </table>
    
    <hr>
    <h2>Tổng quan về chương(Tiếng Việt)</h2>
   
        <FCK:editor  instanceName="fck" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    
    <h2>Tổng quan về chương(Tiếng Anh)</h2>
    <FCK:editor instanceName="fck" height="300px">
        <jsp:attribute name="value">
            
        </jsp:attribute>
    </FCK:editor>
    
    <div style="text-align: right">
        <input type="submit" value="Cancel"/>
        <input type="submit" value="Create"/>
    </div>
</div>