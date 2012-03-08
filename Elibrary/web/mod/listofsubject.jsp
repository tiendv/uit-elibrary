<%--
    Document   : listofsubject
    Created on : Dec 14, 2011, 7:40:22 PM
    Author     : HERO
--%>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1||(Integer)session.getAttribute("group") ==3)//admin or mod
    {
        allow=true; 
%>
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
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
        language = 2; // VietNamese
%>
<input id="hiddenlanguage" name="hiddenlanguage" value=<%=language%> type="hidden"/>
<!--Begin load dropdownlist Subjectcategory + Faculty -->
<div class="col1">
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
</div>
<!--End load dropdownlist Subjectcategory + Faculty -->
<div id="divResult"></div>
<div id="divspace" class="divdelete"><input class="btn" type="submit" value="<bean:message key="text.delete"/>" name="divdelete" onclick="deletesubject()"/></div>
        
<script type="text/javascript">
    var idCategory=0;
    var idFaculty=0;
    var language =document.getElementById("hiddenlanguage").value; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
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
    function deletesubject()
    {
        var listSize=document.getElementById("listSize").value;
        var subjectsID = "";
        for(var i = 0; i<listSize;i++)
            {
                if((document.getElementById(i).checked== true))
                    {
                    subjectsID= subjectsID + document.getElementById(i).value+",";
                }
            }
            $.ajax({
                type: "POST",
                url:"DeleteSubject.do",
                data: "subjectsID=" + subjectsID
            }).done(function(msg){
                window.location = "LoadListOfSubject.do";
            })
     }
     function editsubject(subjectID)
     {
         window.location = "LoadEditSubject.do?subjectID="+subjectID+"&facultyID="+idFaculty;
     }
</script>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>