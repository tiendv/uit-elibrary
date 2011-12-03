<%-- 
    Document   : createResource
    Created on : Nov 25, 2011, 3:24:32 PM
    Author     : tiendv
--%>


<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="uit.elib.entities.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uit.elib.bo.ResourceBO"%>
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
                        <td><bean:message key="text.resourceName"/></td>
                        <td><input name="txtResourceName" type="text"/></td>
                        <td><bean:message key="text.typeofResource"/></td>
                        <td>
                            <%if(language==1) {%>
                            <select id="dropResourceType"  name="dropResourceType">
                                <c:forEach items="${resourceTypeBO.allResourcecategory}" var="item">
                                    <option value="${item.resourceCategoryId}">${item.resourceCategoryName}</option>
                                </c:forEach>
                            </select>
                            <%}%>
                            <%if(language==2) {%>
                            <select id="dropResourceType"  name="dropResourceType">
                                <c:forEach items="${resourceTypeBO.allResourcecategory}" var="item">
                                    <option value="${item.resourceCategoryId}">${item.resourceCategoryNameVn}</option>
                                </c:forEach>
                            </select>
                            <%}%>
                        </td>
                    </tr>
                </table>
                <%-- Add resource with resource type is chapter (ID =7) --%>
                <div  id="divChapter" class="chapter"  style="display: none">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.nameChapterUS"/></td>
                            <td><input class="textbox" name="txtChapterUSName" type="text"/></td>
                            <td class="label"><bean:message key="text.oderChapter"/></td>
                            <td><input class="textbox" name="txtOderChapter" type="text"/></td>
                        </tr>
                        <tr>
                            <td><bean:message key="text.nameSubject"/></td>
                            <td>
                                <%if(language==1) {%>
                                <select  id="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
                                <%if(language==2) {%>
                                <select  id="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
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
                </div>
                <%-- Add resource with resource type is project (ID =6) --%>

                <div id="divProject" class="project" style="display: none">
                    <table  border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.projectNameUS"/></td>
                            <td><input class="textbox" name="txtProjectUSName" type="text"/></td>
                            <td class="label"><bean:message key="text.projectAuthor"/></td>
                            <td><input  name="txtAuthorProject" type="text"/></td>
                        </tr>
                        <tr>
                            <td class="label" ><bean:message key="text.nameSubject"/></td>
                            <td>
                                <%if(language==1) {%>
                                <select  name="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
                                <%if(language==2) {%>
                                <select  name="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                 <bean:message key="text.uploadFile"/><input type="file" name="fileProject"/>
                            </td>
                            
                        </tr>
                    </table>
                </div>
                <%-- Add resource with resource type is Pictuer, Reading (ID =8,9) --%>

                <div id="divPictureandReading"  class="pictureandreading" style="display: none">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.note"/></td>
                            <td><input name="txtNote" type="text"/></td>
                            <td class="label" ><bean:message key="text.nameSubject"/></td>
                            <td>
                                <%if(language==1) {%>
                                <select  name="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
                                <%if(language==2) {%>
                                <select  name="dropSubjectNameInChapter">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <bean:message key="text.uploadFile"/><input type="file" name="filePictureReading"/>
                            </td>
                            
                        </tr>
                        
                    </table>

                </div>
                <%-- Add resource with resource type is video,example,slide,pdf (ID =5,10,11) --%>
                <div id="divResourceChapter" class="resourceChapter" style="display: none">
                    <table width="100%" border="0" cellspacing="0" cellpadding="5">
                        <tr>
                            <td class="label"><bean:message key="text.nameSubject"/></td>
                            <td>
                                <%if(language==1) {%>
                                <select id="dropSubjectName" name="dropSubjectName">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectName}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
                                <%if(language==2) {%>
                                <select id="dropSubjectName"  name="dropSubjectName">
                                    <c:forEach items="${subjectBO.allSubject}" var="item">
                                        <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                    </c:forEach>
                                </select>
                                <%}%>
                            </td>
                            <td class="label"><bean:message key="text.orderchapter"/></td>
                            <td>
                                <select id ="txtNote" name="txtNote">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                <bean:message key="text.uploadFile"/><input type="file" name="fileResourceChapter"/>
                            </td>
                        </tr>
                    </table>

                </div>
                 <div id="diveButtonCreate" class="buttonCreateResource" style="display: none">
                    <input type="submit"  value=<bean:message key="text.buttonCreate" />  />
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
        }
        if (chosenoption.value=="6"){
            document.getElementById("divProject").style.display = "block";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
        }
         if (chosenoption.value=="8"||chosenoption.value=="9"){
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "block";
             document.getElementById("divResourceChapter").style.display = "none";
        }
        if (chosenoption.value=="5"||chosenoption.value=="10"||chosenoption.value=="11"){
            document.getElementById("divResourceChapter").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            var id = document.getElementById("dropSubjectName").value;
            $.ajax({
                type: "POST",
                url: "AjaxGetChapterBySubjectID.do",
                data: "id="+id
            }).done(function( msg ) {
                document.getElementById("txtNote").innerHTML = msg;
            });            
        }
        
        document.getElementById("hiddenResourceType").value=chosenoption.value;
    }
    
    var selectTypeResource=document.getElementById("dropSubjectName");
    selectTypeResource.onchange=function(){ //run some code when "onchange" event fires
        var id = document.getElementById("dropSubjectName").value;
        $.ajax({
            type: "POST",
            url: "AjaxGetChapterBySubjectID.do",
            data: "id="+id
        }).done(function( msg ) {
            document.getElementById("txtNote").innerHTML = msg;
        });

    }

</script>