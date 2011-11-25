<%-- 
    Document   : createResource
    Created on : Nov 25, 2011, 3:24:32 PM
    Author     : tiendv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-bean-el" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div style="overflow: auto;height: 600px;">
    <form name="createResource" method="post" action="CreateSubject.do"  enctype="multipart/form-data">
        <jsp:useBean id="resourceTypeBO" class="uit.elib.bo.ResourceCategoryBO" scope="page">
            <jsp:useBean id="subjectBO" class="uit.elib.bo.SubjectBO" scope="page">
                <table width="100%" border="0" cellspacing="0" cellpadding="5">
                    <tr>
                        <td><bean:message key="text.resourceName"/></td>
                        <td><input name="txtResourceName" type="text"/></td>
                        <td><bean:message key="text.typeofResource"/></td>
                        <td>
                            <select id="dropResourceType"  name="dropResourceType">
                                <c:forEach items="${resourceTypeBO.allResourcecategory}" var="item">
                                    <option value="${item.resourceCategoryId}">${item.resourceCategoryName}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </table>
                <%-- Add resource with resource type is chapter (ID =7) --%>
                <div id="divChapter" class="chapter"  style="visibility:hidden">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td><bean:message key="text.nameChapterUS"/></td>
                            <td><input name="txtChapterUSName" type="text"/></td>
                            <td><bean:message key="text.oderChapter"/></td>
                            <td><input name="txtOderChapter" type="text"/></td>
                        </tr>
                        <tr>
                            <td><bean:message key="text.nameSubject"/></td>
                            <td>
                                <select  name="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <h2><bean:message key="text.chapterSummary"/></h2>
                    <FCK:editor  instanceName="fckChapterSummary" height="300px">
                        <jsp:attribute name="value">
                        </jsp:attribute>
                    </FCK:editor>
                    <hr>
                    <h2><bean:message key="text.chapterSummaryUS"/></h2>
                    <FCK:editor  instanceName="fckChapterSummaryUS" height="300px">
                        <jsp:attribute name="value">
                        </jsp:attribute>
                    </FCK:editor>
                    <bean:message key="text.uploadChapter"/><input type="file" name="fileChapter"/>
                </div>
                <%-- Add resource with resource type is project (ID =6) --%>

                <div id="divProject" class="project" style="visibility:hidden">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td><bean:message key="text.projectNameUS"/></td>
                            <td><input name="txtProjectUSName" type="text"/></td>
                            <td><bean:message key="text.projectAuthor"/></td>
                            <td><input name="txtAuthorProject" type="text"/></td>
                        </tr>
                        <tr>
                            <td><bean:message key="text.nameSubject"/></td>
                            <td>
                                <select  name="dropSubjectNameInProject">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <%-- Add resource with resource type is Pictuer, Reading (ID =8,9) --%>

                <div id="divPictureandReading" class="pictureandreading" style="visibility:hidden">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td><bean:message key="text.note"/></td>
                            <td><input name="txtNote" type="text"/></td>
                            <td><bean:message key="text.nameSubject"/></td>
                            <td>
                                <select  name="dropSubjectNameInReadingAndPicture">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>

                </div>
                <%-- Add resource with resource type is video,example,slide,pdf (ID =5,10,11) --%>
                <div id="divResourceChapter" class="resourceChapter" style="visibility:hidden">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>

                            <td><bean:message key="text.nameSubject"/></td>
                            <td>
                                <select  name="dropSubjectNameInResourceChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><bean:message key="text.orderchapter"/></td>
                            <td><input name="txtorderchapter" type="text"/></td>
                        </tr>
                    </table>

                </div>
            </jsp:useBean>
        </jsp:useBean>
    </form>
</div>     
<script type="text/javascript">

    var selectTypeResource=document.getElementById("dropResourceType");
    selectTypeResource.onchange=function(){ //run some code when "onchange" event fires
        alert("heelo");
        var chosenoption=this.options[this.selectedIndex]; //this refers to "selectmenu"
        if (chosenoption.value=="2"){
            document.getElementById("divChapter").style.visibility = 'visible';
        }
    }

</script>