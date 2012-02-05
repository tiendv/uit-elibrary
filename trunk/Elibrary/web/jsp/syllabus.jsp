<%-- 
    Document   : syllabus
    Created on : Dec 3, 2011, 12:09:23 AM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.util.List"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="uit.elib.dto.Subject"%>
<%@page import="uit.elib.dto.Resource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
    <%
        Subject subject =(Subject)request.getAttribute("subject");
        List<Resource> listResource = (List<Resource>)request.getAttribute("listResource");
        // get current language
        int language =1; // English
        if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
            language=2; // VietNamese            
    %>
    <div class="hyperlink_title_subject"><a href= "LoadSubject.do"><bean:message key="text.subject"/></a> ><a href="SubjectIntroduction.do?subjectID=<%=subject.getSubjectId()%>"> 
    <%if(language==1) {%>
        <%=subject.getSubjectNameEn()%> 
    <%}%>
    <%if(language==2) {%>
        <%=subject.getSubjectNameVn()%> 
    <%}%>
        </a>
    > <bean:message key="text.syllabus"/></div>
    <div class="syllabus_col"><b><bean:message key="text.timeteaching"/> : </b>
        <%if(subject.getTimeTeaching()==0){%>
            <bean:message key="text.updating"/>
        <%}else{%>
            <%=subject.getTimeTeaching() %> <bean:message key="text.weeks"/>
        <%}%>
    </div>
    <%if(subject.getPeriodOfTheory()!=0 || subject.getPeriodOfPractice()!=0){%>
        <div class="syllabus_col"><b><bean:message key="text.periodoftheory"/> : </b>
             <%=subject.getPeriodOfTheory() %></div>
        <div class="syllabus_col"><b><bean:message key="text.periodofpractice"/> : </b>
             <%=subject.getPeriodOfPractice() %></div>
    <%}else{%>
        <div class="syllabus_col"><b><bean:message key="text.periodoftheory"/> : </b>
             <bean:message key="text.updating"/></div>
        <div class="syllabus_col"><b><bean:message key="text.periodofpractice"/> : </b>
             <bean:message key="text.updating"/></div>
    <%}%>
    <% if(language==1){%>
        <div class="syllabus_col"><b><bean:message key="text.prerequisitesubject"/> : </b>
        <%=subject.getPrerequisiteSubjectEn() %></div>
    <%}%>
    <% if(language==2){%>
        <div class="syllabus_col"><b><bean:message key="text.prerequisitesubject"/> : </b>
            <%=subject.getPrerequisiteSubjectVn() %></div>
    <%}%>

    <%if(language==1) {%>
        <div class="syllabus_col"><b><bean:message key="text.projectrequirementtitle"/> : </b>
            <%=subject.getProjectRequirementEn() %></div>   
    <%}%>
    <%if(language==2) {%>
        <div class="syllabus_col"><b><bean:message key="text.projectrequirementtitle"/> : </b>
            <%=subject.getProjectRequirementVn() %></div>
    <%}%>
    <%if(subject.getMidtermGrade()!=0 || subject.getFinalGrade()!=0 ) {%>
        <table class="resource_table">
            <thead>
                <tr class="color_title_table">
                    <th class="syllabus_col_title"><bean:message key="text.grade"/></th>
                    <th class="syllabus_col_title"><bean:message key="text.percent"/></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="center"><bean:message key="text.midtermgrade"/></td>
                    <td class="center"><%=subject.getMidtermGrade() %> %</td>
                </tr>
                <tr class="syllabus_col_color">
                    <td class="center"><bean:message key="text.finalgrade"/></td>
                    <td class="center"><%=subject.getFinalGrade() %> %</td>
                </tr>
            </tbody>
        </table>
    <%}else{%>
        <table class="resource_table">
            <thead>
                <tr class="color_title_table">
                    <th class="syllabus_col_title"><bean:message key="text.grade"/></th>
                    <th class="syllabus_col_title"><bean:message key="text.percent"/></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="center"><bean:message key="text.midtermgrade"/></td>
                    <td class="center"><bean:message key="text.updating"/></td>
                </tr>
                <tr class="syllabus_col_color">
                    <td class="center"><bean:message key="text.finalgrade"/></td>
                    <td class="center"><bean:message key="text.updating"/></td>
                </tr>
            </tbody>
        </table>
    <%}%>
<%if(listResource.size()>0) {%>
   <div class="syllabus_download"><a href="./DownLoad.do?resourceID=<%=listResource.get(0).getResourceId() %>" style="color:#680a12;" ><bean:message key="text.downloadhere"/> </a></div>  
<%}%>