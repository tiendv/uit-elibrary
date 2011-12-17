<%-- 
    Document   : listOfSubject
    Created on : Dec 14, 2011, 7:40:22 PM
    Author     : HERO
--%>

<%@page import="javax.mail.FetchProfile.Item"%>
<%@page import="org.apache.struts.Globals"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<jsp:useBean id="subjectCategoryBO" class="uit.elib.bo.SubjectCategoryBO" scope="page"/>
<jsp:useBean id="facultyBO" class="uit.elib.bo.FacultyBO" scope="page"/>
<jsp:useBean id="subjectBO" class="uit.elib.bo.SubjectBO" scope="page"/>
<link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
<%
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
%>
<input id="hiddenlanguage" name="hiddenlanguage" value=<%=language%> type="hidden"/>
        <!--Begin load dropdownlist Subjectcategory + Faculty -->
        <form method="POST" style="margin-left: 10px;">
        <%if(language==1){%>
            <bean:message key="text.subjectcategory"/> <!--EN title subjectcategory -->
            <select id="dropSubjectCategory"  name="dropSubjectCategory" onchange="check()">
                <c:forEach items="${subjectCategoryBO.allSubjectCategory}" var="item">
                    <option value="${item.subjectCategoryId}">${item.subjectCategoryNameEn}</option>
                </c:forEach>
            </select>
            <bean:message key="text.faculty"/> <!--EN title faculty -->
            <select id="dropFaculty"  name="dropFaculty" onchange="check_cbbfaculty()">
                <c:forEach items="${facultyBO.getAllFaculty()}" var="item">
                    <option value="${item.facultyId}">${item.facultyNameEn}</option>
                </c:forEach>
            </select>
        <%}%>
        <%if(language==2){%>
            <bean:message key="text.subjectcategory"/> <!--VI title subjectcategory -->
            <select id="dropSubjectCategory"  name="dropSubjectCategory" onchange="check()">
                <c:forEach items="${subjectCategoryBO.allSubjectCategory}" var="item">
                    <option value="${item.subjectCategoryId}">${item.subjectCategoryNameVn}</option>
                </c:forEach>
            </select>
            <bean:message key="text.faculty"/> <!--VI title faculty -->
            <select id="dropFaculty"  name="dropFaculty" onchange="check_cbbfaculty()">
                <c:forEach items="${facultyBO.getAllFaculty()}" var="item">
                    <option value="${item.facultyId}">${item.facultyNameVn}</option>
                </c:forEach>
            </select>
        <%}%>
        <!--End load dropdownlist Subjectcategory + Faculty -->
        <div id="divResult"></div>
        <div id="divspace" style="width: 90%;"></div><input style="margin-left: 90%;" type="submit" value="<bean:message key="text.delete"/>" name="btn_delete" />
        </form>
        <script type="text/javascript">
                var idCategory=0;
                var idFaculty=0;
                var language =document.getElementById("hiddenlanguage").value; // English
                if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                    language = 2; // VietNamese
                function init()
                {
                    document.getElementById("dropFaculty").disabled= true; // ẩn cbb faculty khi mới load
                    document.getElementById("dropFaculty").selectedIndex = -1;
                    idCategory=1; // mặc định là Cơ bản
                    idFaculty=-1; // mặc định là không được chọn
                    $.ajax({
                    type: "POST",
                    url: "LoadListSubjectOfCategory.do",
                    data: "subjectCategoryID=" + idCategory + "&facultyID=" + idFaculty+"&language="+language
                    }).done(function( msg ) {
                        document.getElementById("divResult").innerHTML=msg;
                    });
                }
                
                function check()
                {
                    
                    document.getElementById("dropFaculty").disabled= false; //hiện cbb faculty
                    document.getElementById("dropFaculty").selectedIndex = 0;
                    idCategory = document.getElementById("dropSubjectCategory").value;
                    idFaculty = document.getElementById("dropFaculty").value;
                    if(document.getElementById("dropSubjectCategory").value==1)
                    {
                        document.getElementById("dropFaculty").disabled=true; // ẩn cbb faculty nếu subject category dc chọn là 1 - cơ bản
                        document.getElementById("dropFaculty").selectedIndex = -1;
                        idFaculty =-1; // không được chọn khi cbb Category là Cơ bản
                    }
            
            
            $.ajax({
                type: "POST",
                url: "LoadListSubjectOfCategory.do",
                data: "subjectCategoryID=" + idCategory + "&facultyID=" + idFaculty+"&language="+language
            }).done(function( msg ) {
                document.getElementById("divResult").innerHTML=msg;
                
            });
            }
            function check_cbbfaculty()
                {
                    
                    //document.getElementById("dropFaculty").disabled= false; //hiện cbb faculty
                    //document.getElementById("dropFaculty").selectedIndex = 0;
                    idCategory = document.getElementById("dropSubjectCategory").value;
                    idFaculty = document.getElementById("dropFaculty").value;
//                    if(document.getElementById("dropSubjectCategory").value==1)
//                    {
//                        document.getElementById("dropFaculty").disabled=true; // ẩn cbb faculty nếu subject category dc chọn là 1 - cơ bản
//                        document.getElementById("dropFaculty").selectedIndex = -1;
//                        idFaculty =-1; // không được chọn khi cbb Category là Cơ bản
//                    }
            
            $.ajax({
                type: "POST",
                url: "LoadListSubjectOfCategory.do",
                data: "subjectCategoryID=" + idCategory + "&facultyID=" + idFaculty+"&language="+language
            }).done(function( msg ) {
                document.getElementById("divResult").innerHTML=msg;
                
            });
            }
                
        </script>