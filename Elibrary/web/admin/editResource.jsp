<%-- 
    Document   : editResource
    Created on : Dec 14, 2011, 8:53:43 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="uit.elib.dto.Resource"%>
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
    <form name="EditResourceForm" method="post" action="EditResource.do"  enctype="multipart/form-data">
        <%
            int language =1; // English
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language = 2; // VietNamese
            String Kb=""; // size file (KB)
            String Mb=""; // size file (MB) 
            DecimalFormat dec = new DecimalFormat("#.##");            
            List listResourceCategory = (List)request.getAttribute("listResourceCategory");
            List listSubject = (List)request.getAttribute("listSubject");
            List<Resource> listResource = (List<Resource>)request.getAttribute("listResource");
            List listFaculty = (List)request.getAttribute("listFaculty");
            List listLevel = (List)request.getAttribute("listLevel");
        %>
        <input type="hidden" name="txtResourceID" value="<%=listResource.get(0).getResourceId()%>" />
        <h2> <bean:message key="text.editresource"/></h2>
        <table width="100%" border="0" cellspacing="0" cellpadding="5">
            <tr>
                <td><bean:message key="text.typeofresource"/></td>
                <td>
                    <select id="dropResourceCategory" name="dropResourceCategory" onchange="changeResourceCategory()" disabled="true">
                    <%if(language==1) {%>                        
                        <c:forEach items="${listResourceCategory}" var="item">
                            <c:if test="${item.resourceCategoryId!=listResource.get(0).getResourcecategory().getResourceCategoryId()}" >
                                <option value="${item.resourceCategoryId}">${item.resourceCategoryNameEn}</option>
                            </c:if>
                            <c:if test="${item.resourceCategoryId==listResource.get(0).getResourcecategory().getResourceCategoryId()}" >
                                <option value="${item.resourceCategoryId}" selected="selected">${item.resourceCategoryNameEn}</option>
                            </c:if>                                        
                        </c:forEach> 
                    <%}%>
                    <%if(language==2) {%>
                        <c:forEach items="${listResourceCategory}" var="item">
                            <c:if test="${item.resourceCategoryId!=listResource.get(0).getResourcecategory().getResourceCategoryId()}" >    
                                <option value="${item.resourceCategoryId}">${item.resourceCategoryNameVn}</option>
                            </c:if>
                            <c:if test="${item.resourceCategoryId==listResource.get(0).getResourcecategory().getResourceCategoryId()}" >
                                <option value="${item.resourceCategoryId}" selected="selected">${item.resourceCategoryNameVn}</option>
                            </c:if>                                         
                        </c:forEach>
                    <%}%>
                    </select> 
                </td>
            </tr>
         </table>
         <%-- Resource Name --%>           
         <div  id="divResourceName" class="resourceName"  style="display: none"> 
             <table width="100%" border="0" cellspacing="0" cellpadding="5">  
                <tr>
                    <td><bean:message key="text.resourcenameen" /></td>
                    <td><input id="txtResourceNameEN" name="txtResourceNameEN" type="text" value="<%=listResource.get(0).getResourceNameEn()%>"/></td>
                    <td><bean:message key="text.resourcenamevn"/></td>
                    <td><input id="txtResourceNameVN" name="txtResourceNameVN" type="text" value="<%=listResource.get(0).getResourceNameVn()%>"/></td>
                </tr>
            </table>
        </div>
        <%-- Add resource with resource category is thesis (ID =2) --%> 
        <div  id="divThesis" class="thesis"  style="display: none">
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td><bean:message key="text.level"/></td>
                    <td>
                        <select id="dropLevel" name="dropLevel" >
                            <%if(language==1) {%>
                                <c:forEach items="${listLevel}" var="item">
                                    <c:if test="${item.levelId!=listResource.get(0).getLevel().getLevelId()}">
                                        <option value="${item.levelId}">${item.levelNameEn}</option>
                                    </c:if> 
                                    <c:if test="${item.levelId==listResource.get(0).getLevel().getLevelId()}">
                                        <option value="${item.levelId}" selected="selected">${item.levelNameEn}</option>
                                    </c:if> 
                                </c:forEach>     
                            <%}%>
                            <%if(language==2) {%>
                                <c:forEach items="${listLevel}" var="item">
                                    <c:if test="${item.levelId!=listResource.get(0).getLevel().getLevelId()}">
                                        <option value="${item.levelId}">${item.levelNameVn}</option>
                                    </c:if> 
                                    <c:if test="${item.levelId==listResource.get(0).getLevel().getLevelId()}">
                                        <option value="${item.levelId}" selected="selected">${item.levelNameVn}</option>
                                    </c:if> 
                                </c:forEach>
                            <%}%>
                        </select>
                    </td>
                </tr>  
                <tr>
                    <td><bean:message key="text.faculty"/></td>
                    <td>
                        <select id="dropFaculty" name="dropFaculty" >
                            <%if(language==1) {%>
                                <c:forEach items="${listFaculty}" var="item">
                                    <c:if test="${item.facultyId!=listResource.get(0).getFaculty().getFacultyId()}">
                                        <option value="${item.facultyId}">${item.facultyNameEn}</option>
                                    </c:if> 
                                    <c:if test="${item.facultyId==listResource.get(0).getFaculty().getFacultyId()}">
                                        <option value="${item.facultyId}" selected="selected">${item.facultyNameEn}</option>
                                    </c:if> 
                                </c:forEach> 
                            <%}%>
                            <%if(language==2) {%>
                                <c:forEach items="${listFaculty}" var="item">
                                    <c:if test="${item.facultyId!=listResource.get(0).getFaculty().getFacultyId()}">
                                        <option value="${item.facultyId}">${item.facultyNameVn}</option>
                                    </c:if> 
                                    <c:if test="${item.facultyId==listResource.get(0).getFaculty().getFacultyId()}">
                                        <option value="${item.facultyId}" selected="selected">${item.facultyNameVn}</option>
                                    </c:if> 
                                </c:forEach>
                            <%}%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><bean:message key="text.author"/></td>
                    <td><input class="textbox" id="txtThesisAuthor" name="txtThesisAuthor" type="text" value="<%=listResource.get(0).getAuthor()%>"/></td>
                    <td><bean:message key="text.teacher"/></td>
                    <td><input class="textbox" id="txtTeacher" name="txtTeacher" type="text" value="<%=listResource.get(0).getTeacher()%>"/></td>                    
                </tr>
                <tr>
                    <td><bean:message key="text.class"/></td>
                    <td><input class="textbox" id="txtClass" name="txtClass" type="text" value="<%=listResource.get(0).getClass_()%>"/></td>
                    <td><bean:message key="text.school"/></td>
                    <td><input class="textbox" id="txtSchool" name="txtSchool" type="text" value="<%=listResource.get(0).getSchool()%>"/></td>                    
                </tr>
                <tr>
                    <td><bean:message key="text.year"/></td>
                    <td><input class="textbox" id="txtYear" name="txtYear" type="text" value="<%=listResource.get(0).getYear()%>"/></td>
                    <td><bean:message key="text.schoolyear"/></td>
                    <td><input class="textbox" id="txtSchoolYear" name="txtSchoolYear" type="text" value="<%=listResource.get(0).getSchoolYear()%>"/></td>                    
                </tr>
                <%if(listResource.get(0).getUploadName()!=null){%>
                    <tr>
                        <td>
                            <bean:message key="text.uploadname"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getUploadName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.downloadnumber"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getDownloadNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.size"/>
                        </td>
                        <td>
                            <% Kb=dec.format(listResource.get(0).getSize()/1000);
                               Mb=dec.format(listResource.get(0).getSize()/1000000);  
                            %>
                            <%=Mb%>Mb(<%=Kb%>Kb)     
                        </td>
                    </tr>                          
                    <tr>
                        <td>
                            <bean:message key="text.download"/>
                        </td>
                        <td>
                            <div class="displayIcon"><a href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                        </td>
                    </tr>
                <%}%>                    
                <tr>
                    <td class="label">
                        <bean:message key="text.uploadfile"/><input type="file" name="fileThesis"/>
                    </td>                 
                </tr>                
            </table>
            <h2><bean:message key="text.thesissummaryvn"/></h2>
            <FCK:editor  instanceName="fckThesisSummaryVN" height="300px">
                <jsp:attribute name="value">
                    <%=listResource.get(0).getSummaryVn()%>
                </jsp:attribute>
            </FCK:editor>
            <hr>
            <h2><bean:message key="text.thesissummaryen"/></h2>
            <FCK:editor  instanceName="fckThesisSummaryEN" height="300px">
                <jsp:attribute name="value">
                    <%=listResource.get(0).getSummaryEn()%>
                </jsp:attribute>
            </FCK:editor>                          
        </div>                 
        <%-- Add resource with resource type is chapter (ID =7) --%>
        <div  id="divChapter" class="chapter"  style="display: none">
            <table width="100%" border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td class="label"><bean:message key="text.orderchapter"/></td>
                    <td><input class="textbox" id="txtOrderChapter" name="txtOrderChapter" type="text" value="<%=listResource.get(0).getOrderChapter()%>"/></td>
                </tr>
                <tr>
                    <td><bean:message key="text.namesubject"/></td>
                    <td>
                        <select  id="dropSubjectInChapter" name="dropSubjectInChapter">
                        <%if(language==1) {%>
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameEn}</option>
                                </c:if>                                              
                            </c:forEach>
                        <%}%>
                        <%if(language==2) {%>
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameVn}</option>
                                </c:if> 
                            </c:forEach>                       
                        <%}%>
                        </select>
                    </td>
                </tr>
            </table>
            <h2><bean:message key="text.chaptersummaryvn"/></h2>
            <FCK:editor  instanceName="fckChapterSummaryVN" height="300px">
                <jsp:attribute name="value">
                    <%=listResource.get(0).getSummaryVn()%>
                </jsp:attribute>
            </FCK:editor>
            <hr>
            <h2><bean:message key="text.chaptersummaryen"/></h2>
            <FCK:editor  instanceName="fckChapterSummaryEN" height="300px">
                <jsp:attribute name="value">
                    <%=listResource.get(0).getSummaryEn()%>
                </jsp:attribute>
            </FCK:editor>
        </div>
        <%-- Add resource with resource type is project (ID =6) --%>

        <div id="divProject" class="project" style="display: none">
            <table  border="0" cellspacing="0" cellpadding="5">
                <tr>
                    <td class="label"><bean:message key="text.projectauthor"/></td>
                    <td><input id="txtProjectAuthor" name="txtProjectAuthor" type="text" value="<%=listResource.get(0).getAuthor()%>"/></td>
                </tr>
                <tr>
                    <td class="label" ><bean:message key="text.namesubject"/></td>
                    <td>
                        <%if(language==1) {%>
                        <select id="dropSubjectInProject" name="dropSubjectInProject" >
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameEn}</option>
                                </c:if>                                              
                            </c:forEach>
                        <%}%>
                         <%if(language==2) {%>
                        <select id="dropSubjectInProject" name="dropSubjectInProject" >
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameVn}</option>
                                </c:if> 
                            </c:forEach>
                        <%}%>
                    </td>
                </tr>
                <%if(listResource.get(0).getUploadName()!=null){%>
                    <tr>
                        <td>
                            <bean:message key="text.uploadname"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getUploadName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.downloadnumber"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getDownloadNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.size"/>
                        </td>
                        <td>
                            <% Kb=dec.format(listResource.get(0).getSize()/1000);
                               Mb=dec.format(listResource.get(0).getSize()/1000000);  
                            %>
                            <%=Mb%>Mb(<%=Kb%>Kb)     
                        </td>
                    </tr>                          
                    <tr>
                        <td>
                            <bean:message key="text.download"/>
                        </td>
                        <td>
                            <div class="displayIcon"><a href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                        </td>
                    </tr>
                <%}%>    
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
                        <%if(language==1) {%>
                        <select  id="dropSubjectInReadingAndPicture" name="dropSubjectInReadingAndPicture">
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameEn}</option>
                                </c:if>                                              
                            </c:forEach>                        
                        <%}%>
                        <%if(language==2) {%>
                        <select  id="dropSubjectInReadingAndPicture" name="dropSubjectInReadingAndPicture" >
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameVn}</option>
                                </c:if> 
                            </c:forEach>                       
                        <%}%>
                    </td>
                </tr>
                <%if(listResource.get(0).getUploadName()!=null && listResource.get(0).getResourcecategory().getResourceCategoryId()==9){ %>
                    <tr>
                        <td>
                            <bean:message key="text.uploadname"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getUploadName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.downloadnumber"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getDownloadNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.size"/>
                        </td>
                        <td>
                            <%=Mb%>Mb(<%=Kb%>Kb)       
                        </td>
                    </tr>                          
                    <tr>
                        <td>
                            <bean:message key="text.download"/>
                        </td>
                        <td>
                            <div class="displayIcon"><a class="onlineTextBooks" href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                        </td>
                    </tr>
                    <%if(listResource.get(0).getUploadName()!=null){ 
                        String imageLink = "./upload/"+listResource.get(0).getServerName().toString();
                    %>
                    <tr>
                        <td ><img src="<%=imageLink%>" width="300" height="300"/></td>
                    </tr>
                    <%}%>                            
                <%}%>

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
                        <select id="dropSubjectInResourceChapter" name="dropSubjectInResourceChapter" onchange="changeSubject(this.value)" >
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameEn}</option>
                                </c:if>                                              
                            </c:forEach>   
                        <%}%>
                         <%if(language==2) {%>
                        <select id="dropSubjectInResourceChapter" name="dropSubjectInResourceChapter" onchange="changeSubject(this.value)">
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameVn}</option>
                                </c:if> 
                            </c:forEach>  
                        <%}%>
                    </td>
                    <td class="label"><bean:message key="text.orderchapter"/></td>
                    <td>
                        <div id ="chapter"></div>            
                    </td>
                </tr>
                <%if(listResource.get(0).getUploadName()!=null){ %>
                    <tr>
                        <td>
                            <bean:message key="text.uploadname"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getUploadName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.downloadnumber"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getDownloadNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.size"/>
                        </td>
                        <td>
                            <%=Mb%>Mb(<%=Kb%>Kb)       
                        </td>
                    </tr>                          
                    <tr>
                        <td>
                            <bean:message key="text.download"/>
                        </td>
                        <%if(listResource.get(0).getResourcecategory().getResourceCategoryId()==4){%>
                            <td>
                                <div class="displayIcon"><a class="assignmentsSolutions" href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                            </td>
                        <%}%> 
                        <%if(listResource.get(0).getResourcecategory().getResourceCategoryId()==5){%>
                            <td>
                                <div class="displayIcon"><a class="examsSolutions" href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                            </td>
                        <%}%>  
                        <%if(listResource.get(0).getResourcecategory().getResourceCategoryId()==10){%>
                            <td>
                                <div class="displayIcon"><a class="lectureNotes" href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                            </td>
                        <%}%> 
                        <%if(listResource.get(0).getResourcecategory().getResourceCategoryId()==11){%>
                            <td>
                                <div class="displayIcon"><a class="multimediaContent" href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                            </td>
                        <%}%>                                  
                    </tr>
                <%}%>                          
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
                        <select id="dropSubjectInSyllabus" name="dropSubjectInSyllabus" >
                        <%if(language==1) {%>
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameEn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameEn}</option>
                                </c:if>                                              
                            </c:forEach>  
                        <%}%>
                         <%if(language==2) {%>   
                            <c:forEach items="${listSubject}" var="item">
                                <c:if test="${item.subjectId!=listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}">${item.subjectNameVn}</option>
                                </c:if> 
                                <c:if test="${item.subjectId==listResource.get(0).getSubject().getSubjectId()}">
                                    <option value="${item.subjectId}" selected="selected">${item.subjectNameVn}</option>
                                </c:if> 
                            </c:forEach>  
                        <%}%>
                        </select>
                    </td>
                </tr>
                <%if(listResource.get(0).getUploadName()!=null){%>
                    <tr>
                        <td>
                            <bean:message key="text.uploadname"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getUploadName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.downloadnumber"/>
                        </td>
                        <td>
                            <%=listResource.get(0).getDownloadNumber()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <bean:message key="text.size"/>
                        </td>
                        <td>
                            <%=Mb%>Mb(<%=Kb%>Kb)     
                        </td>
                    </tr>                          
                    <tr>
                        <td>
                            <bean:message key="text.download"/>
                        </td>
                        <td>
                            <div class="displayIcon"><a href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"/></div>
                        </td>
                    </tr>
                <%}%>                         
                <tr>
                    <td class="label">
                        <bean:message key="text.uploadfile"/><input type="file" name="fileSyllabus"/>
                    </td>
                </tr>
            </table>
         </div>                            
         <div id="diveButtonCreate" class="buttonCreateResource" style="display: none">
            <input type="submit"  value=<bean:message key="text.buttoncreate" />  />
        </div>
    </form>
</div>     
<script type="text/javascript">
    function init(){
        changeResourceCategory();
    }
    function changeResourceCategory(){
        //run some code when "onchange" event fires
        document.getElementById("diveButtonCreate").style.display = "block";
        
        var chosenoption=document.getElementById("dropResourceCategory");
        if (chosenoption.value=="2"){
            document.getElementById("divThesis").style.display = "block";            
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
        }         
        if (chosenoption.value=="7"){
            document.getElementById("divChapter").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
        }
        if (chosenoption.value=="6"){
            document.getElementById("divProject").style.display = "block";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
        }
         if (chosenoption.value=="8"||chosenoption.value=="9"){
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "block";
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            if (chosenoption.value=="8")
                document.getElementById("divResourceName").style.display = "none";
            if (chosenoption.value=="9")
                document.getElementById("divResourceName").style.display = "block";           
        }
        if (chosenoption.value=="4"||chosenoption.value=="5"||chosenoption.value=="10"||chosenoption.value=="11"){
            document.getElementById("divResourceChapter").style.display = "block";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divResourceName").style.display = "block";
            var id = document.getElementById("dropSubjectInResourceChapter").value;
            $.ajax({
                type: "POST",
                url: "LoadChapter.do",
                data: "id="+id
            }).done(function( msg ) {
                document.getElementById("chapter").innerHTML = msg;
                document.getElementById("dropOrderChapterSubject").value=<%=listResource.get(0).getOrderChapter()%>;
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
        if (chosenoption.value=="1" || chosenoption.value=="3")
        {
            document.getElementById("divResourceChapter").style.display = "none";
            document.getElementById("divProject").style.display = "none";
            document.getElementById("divChapter").style.display = "none";
            document.getElementById("divPictureandReading").style.display = "none";
            document.getElementById("divResourceSyllabus").style.display = "none";
            document.getElementById("divResourceName").style.display = "none";
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