<%--
    Document   : createResource
    Created on : Nov 25, 2011, 3:24:32 PM
    Author     : tiendv
--%>


<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="uit.elib.dto.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uit.elib.bo.ResourceBO"%>
<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />

<div style="overflow: auto;height: 600px;">
    <form id="createResource" method="post" action="CreateResource.do"  enctype="multipart/form-data">
        <jsp:useBean id="resourceTypeBO" class="uit.elib.bo.ResourceCategoryBO" scope="page">
        <jsp:useBean id="subjectBO" class="uit.elib.bo.SubjectBO" scope="page">
        <jsp:useBean id="resourceBO" class="uit.elib.bo.ResourceBO" scope="page">
                <%int language =1; // English
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
                %>
                <h2> <bean:message key="text.chosetypeofresourced"/></h2>
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td><bean:message key="text.typeofresource"/></td>
                        <td>
                            <select id="dropResourceCategory" name="dropResourceCategory" onchange="changeResourceCategory()">
                                <%if(language==1) {%>
                                    <c:forEach items="${resourceTypeBO.allResourcecategory}" var="item">
                                        <option value="${item.resourceCategoryId}">${item.resourceCategoryNameEn}</option>
                                    </c:forEach> 
                                <%}%>
                                <%if(language==2) {%>
                                    <c:forEach items="${resourceTypeBO.allResourcecategory}" var="item">
                                        <option value="${item.resourceCategoryId}">${item.resourceCategoryNameVn}</option>
                                    </c:forEach>
                                <%}%>
                            </select>
                        </td>
                    </tr>                    
                </table>
                 <%-- Resource Name --%>           
                 <div  id="divResourceName" class="resourceName"  style="display: block"> 
                     <table width="100%" border="0" cellspacing="0" cellpadding="5">  
                        <tr>
                            <td><bean:message key="text.resourcenameen" /></td>
                            <td><input id="txtResourceNameEN" name="txtResourceNameEN" type="text"/></td>
                            <td><bean:message key="text.resourcenamevn"/></td>
                            <td><input id="txtResourceNameVN" name="txtResourceNameVN" type="text"/></td>
                        </tr>
                    </table>
                </div>                            
                <%-- Add resource with resource type is chapter (ID =7) --%>
                <div  id="divChapter" class="chapter"  style="display: none">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.orderchapter"/></td>
                            <td><input class="textbox" id="txtOrderChapter" name="txtOrderChapter" type="text"/></td>
                        </tr>
                        <tr>
                            <td><bean:message key="text.namesubject"/></td>
                            <td>
                                <select  id="dropSubjectInChapter" name="dropSubjectInChapter">
                                    <%if(language==1) {%>                               
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                        </c:forEach>
                                    <%}%>
                                    <%if(language==2) {%>
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                        </c:forEach>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <h2><bean:message key="text.chaptersummaryvn"/></h2>
                    <FCK:editor  instanceName="fckChapterSummaryVN" height="300px">
                        <jsp:attribute name="value">
                        </jsp:attribute>
                    </FCK:editor>
                    <hr>
                    <h2><bean:message key="text.chaptersummaryen"/></h2>
                    <FCK:editor  instanceName="fckChapterSummaryEN" height="300px">
                        <jsp:attribute name="value">
                        </jsp:attribute>
                    </FCK:editor>
                </div>
                <%-- Add resource with resource type is project (ID =6) --%>

                <div id="divProject" class="project" style="display: none">
                    <table  border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.projectauthor"/></td>
                            <td><input id="txtAuthorProject" name="txtAuthorProject" type="text"/></td>
                        </tr>
                        <tr>
                            <td class="label" ><bean:message key="text.namesubject"/></td>
                            <td>
                                <select id="dropSubjectInProject" name="dropSubjectInProject" >
                                    <%if(language==1) {%>     
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                        </c:forEach>                   
                                    <%}%>
                                     <%if(language==2) {%>
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                        </c:forEach>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                 <bean:message key="text.uploadfile"/><input type="file" name="fileProject"/>
                            </td>
                            
                        </tr>
                    </table>
                </div>
                <%-- Add resource with resource type is Picture, Reading (ID =8,9) --%>

                <div id="divPictureandReading"  class="pictureandreading" style="display: none">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label" ><bean:message key="text.namesubject"/></td>
                            <td>
                                <select  id="dropSubjectInReadingAndPicture" name="dropSubjectInReadingAndPicture">
                                    <%if(language==1) {%>
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                        </c:forEach>                           
                                    <%}%>
                                    <%if(language==2) {%>
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                        </c:forEach>                        
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <bean:message key="text.uploadfile"/><input type="file" name="filePictureReading"/>
                            </td>                         
                        </tr>                      
                    </table>
                </div>
                <%-- Add resource with resource type is assignments,video,example,slide,pdf (ID =4,5,10,11) --%>
                <div id="divResourceChapter" class="resourceChapter" style="display: none">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.namesubject"/></td>
                            <td>
                                <select id="dropSubjectInResourceChapter" name="dropSubjectInResourceChapter" onchange="changeSubject(this.value)" >
                                    <%if(language==1) {%>
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                        </c:forEach> 
                                    <%}%>
                                     <%if(language==2) {%>
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                        </c:forEach>
                                    <%}%>
                                </select>
                            </td>
                            <td class="label"><bean:message key="text.orderchapter"/></td>
                            <td>
                                <div id ="chapter"></div>            
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <bean:message key="text.uploadfile"/><input type="file" name="fileResourceChapter"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <%-- Add resource with resource type (ID =12) --%>
                <div id="divResourceSyllabus" class="resourceChapter" style="display: none">
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.namesubject"/></td>
                            <td>
                                <select id="dropSubjectInSysllabus" name="dropSubjectInSysllabus" >
                                    <%if(language==1) {%>
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                        </c:forEach>
                                    <%}%>
                                     <%if(language==2) {%>   
                                        <c:forEach items="${subjectBO.allSubject}" var="item">
                                            <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                        </c:forEach>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <bean:message key="text.uploadfile"/><input type="file" name="fileResourceSysllabus"/>
                            </td>
                        </tr>
                    </table>
                </div>                            
                 <div id="diveButtonCreate" class="buttonCreateResource" style="display: none">
                    <input type="submit"  value=<bean:message key="text.buttoncreate" />  />
                </div>
            </jsp:useBean>
        </jsp:useBean>
        </jsp:useBean>
    </form>
</div>     
<script type="text/javascript">
    function init(){
        changeResourceCategory();
    }
    function changeResourceCategory(){
        //run some code when "onchange" event fires
        document.getElementById("diveButtonCreate").style.display = "block";
        document.getElementById("divResourceName").style.display = "block";
        var chosenoption=document.getElementById("dropResourceCategory");
        if (chosenoption.value=="7"){
            document.getElementById("divChapter").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
        }
        if (chosenoption.value=="6"){
            document.getElementById("divProject").style.display = "block";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
        }
         if (chosenoption.value=="8"||chosenoption.value=="9"){
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "block";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
        }
        if (chosenoption.value=="4"||chosenoption.value=="5"||chosenoption.value=="10"||chosenoption.value=="11"){
            document.getElementById("divResourceChapter").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            var id = document.getElementById("dropSubjectInResourceChapter").value;
            $.ajax({
                type: "POST",
                url: "LoadChapter.do",
                data: "id="+id
            }).done(function( msg ) {
                document.getElementById("chapter").innerHTML = msg;
            });            
        }  
        if (chosenoption.value=="12"){
            document.getElementById("divResourceSyllabus").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceName").style.display = "none";
        }
        if (chosenoption.value=="1" || chosenoption.value=="2" ||chosenoption.value=="3")
        {
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none"; 
            document.getElementById("diveButtonCreate").style.display = "none";
        }
    }
        
    function changeSubject(subjectID){ //run some code when "onchange" event fires
    var id = subjectID;
    $.ajax({
        type: "POST",
        url: "LoadChapter.do",
        data: "id="+id
    }).done(function( msg ) {
        document.getElementById("chapter").innerHTML = msg;
    });
}
</script>