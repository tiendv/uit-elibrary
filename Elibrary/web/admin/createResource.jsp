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
    <form name="createResource" method="post" action="CreateResource.do"  enctype="multipart/form-data">
        <jsp:useBean id="resourceTypeBO" class="uit.elib.bo.ResourceCategoryBO" scope="page">
        <jsp:useBean id="subjectBO" class="uit.elib.bo.SubjectBO" scope="page">
        <jsp:useBean id="resourceBO" class="uit.elib.bo.ResourceBO" scope="page">
                <%int language =1; // English
                    Locale locale = request.getLocale();
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
                %>
                <input id="hiddenResourceType" name="hiddenResourceType" type="hidden"/>
                <input id="hiddenSubjectSelectInResourceChapter" name="hiddenSubjectSelectInResourceChapter" type="hidden"/>
                <h2> <bean:message key="text.chosetypeofresourced"/></h2>
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td><bean:message key="text.typeofresource"/></td>
                        <td>
                            <%if(language==1) {%>
                            <select id="dropResourceType"  name="dropResourceType">
                                <c:forEach items="${resourceTypeBO.allResourcecategory}" var="item">
                                    <option value="${item.resourceCategoryId}">${item.resourceCategoryNameEn}</option>
                                </c:forEach> 
                            <%}%>
                            <%if(language==2) {%>
                            <select id="dropResourceType"  name="dropResourceType">
                                <c:forEach items="${resourceTypeBO.allResourcecategory}" var="item">
                                    <option value="${item.resourceCategoryId}">${item.resourceCategoryNameVn}</option>
                                </c:forEach>
                            <%}%>
                        </td>
                    </tr>                    
                    <tr>
                        <td><bean:message key="text.resourcenameen"/></td>
                        <td><input name="txtResourceNameEN" type="text"/></td>
                        <td><bean:message key="text.resourcenamevn"/></td>
                        <td><input name="txtResourceNameVN" type="text"/></td>
                    </tr>
                </table>
                <%-- Add resource with resource type is chapter (ID =7) --%>
                <div  id="divChapter" class="chapter"  style="display: none">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.namechapteren"/></td>
                            <td><input class="textbox" name="txtChapterUSName" type="text"/></td>
                            <td class="label"><bean:message key="text.orderchapter"/></td>
                            <td><input class="textbox" name="txtOrderChapter" type="text"/></td>
                        </tr>
                        <tr>
                            <td><bean:message key="text.namesubject"/></td>
                            <td>
                                <%if(language==1) {%>
                                <select  id="dropSubjectNameInChapter" name="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                    </c:forEach>
                                <%}%>
                                <%if(language==2) {%>
                                <select  id="dropSubjectNameInChapter" name="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>
                              
                                <%}%>
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
                            <td class="label"><bean:message key="text.projectnameen"/></td>
                            <td><input class="textbox" name="txtProjectNameEN" type="text"/></td>
                            <td class="label"><bean:message key="text.projectauthor"/></td>
                            <td><input  name="txtAuthorProject" type="text"/></td>
                        </tr>
                        <tr>
                            <td class="label" ><bean:message key="text.namesubject"/></td>
                            <td>
                                <%if(language==1) {%>
                                <select id="dropSubjectNameInProject"  name="dropsubjectnameinproject">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                    </c:forEach>
                                
                                <%}%>
                                 <%if(language==2) {%>
                                <select id="dropSubjectNameInProject"  name="dropsubjectnameinproject">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>
                                
                                <%}%>
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
                            <td class="label"><bean:message key="text.note"/></td>
                            <td><input name="txtNote" type="text"/></td>
                            <td class="label" ><bean:message key="text.namesubject"/></td>
                            <td>
                                <%if(language==1) {%>
                                <select  name="dropSubjectNameInReadingAndPicture">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                    </c:forEach>                           
                                <%}%>
                                <%if(language==2) {%>
                                <select  name="dropSubjectNameInReadingAndPicture">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>                        
                                <%}%>
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
                                <%if(language==1) {%>
                                <select id="dropSubjectName" name="dropSubjectNameInResourceChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                    </c:forEach> 
                                <%}%>
                                 <%if(language==2) {%>
                                <select id="dropSubjectName" name="dropSubjectNameInResourceChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>
                                <%}%>
                            </td>
                            <td class="label"><bean:message key="text.orderchapter"/></td>
                            <td>
                                <div id ="chapter" name="dropOrderChapterSubject"></div>            
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
                                <select id="dropSubjectName" name="dropSubjectNameInSysllabus">
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

    var selectTypeResource=document.getElementById("dropResourceType");
    selectTypeResource.onchange=function(){
        //run some code when "onchange" event fires
        document.getElementById("diveButtonCreate").style.display = "block";
        
        var chosenoption=this.options[this.selectedIndex]; //this refers to "selectmenu"
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
            var id = document.getElementById("dropSubjectName").value;
            $.ajax({
                type: "POST",
                url: "LoadChapterAction.do",
                data: "id="+id
            }).done(function( msg ) {
                document.getElementById("chapter").innerHTML = msg;
            });            
        }  
        if (chosenoption.value=="12"){
             document.getElementById("divResourceSyllabus").style.display = "block";
             document.getElementById("divProject").style.display = "none";
             document.getElementById("divPictureandReading").style.display = "none";
             document.getElementById("divResourceChapter").style.display = "none";
        }
        document.getElementById("hiddenResourceType").value=chosenoption.value;        
    }
        
        var selectTypeResource=document.getElementById("dropSubjectName");
        selectTypeResource.onchange=function(){ //run some code when "onchange" event fires
        var id = document.getElementById("dropSubjectName").value;
        $.ajax({
            type: "POST",
            url: "LoadChapterAction.do",
            data: "id="+id
        }).done(function( msg ) {
            document.getElementById("chapter").innerHTML = msg;
        });
    }
</script>