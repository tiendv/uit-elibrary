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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%

            Subject subject =(Subject)request.getAttribute("subject");
            List<Resource> listResource = (List<Resource>)request.getAttribute("listResource");
            // get current language
            int language =1; // English
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language=2; // VietNamese            
        %>
        <div class="hyperlink_title_subject"><a href= "LoadSubject.do"><bean:message key="text.menu.subject"/></a> ><a href="SubjectHome.do?subjectID=<%=subject.getSubjectId()%>"> 
        <%if(language==1) {%>
            <%=subject.getSubjectNameEn()%> 
        <%}%>
        <%if(language==2) {%>
            <%=subject.getSubjectNameVn()%> 
        <%}%>
            </a>
        > <bean:message key="text.menu.syllabus"/></div>
        
        <%if(language==1) {%>
            <div class="title_h1"><%=subject.getSubjectNameEn()%></div>
        <%}%>
        <%if(language==2) {%>
            <div class="title_h1"><%=subject.getSubjectNameVn()%></div>
        <%}%></br>
        
        <div style="padding-left: 17px;padding-bottom: 5px "><b><bean:message key="text.timeTeaching"/> : </b>
            <%if(Integer.parseInt(subject.getTimeTeaching())==0){%>
                <bean:message key="text.updating"/>
            <%}else{%>
                <%=subject.getTimeTeaching() %> <bean:message key="text.weeks"/>
            <%}%>
        </div>
        <%if(subject.getPeriodOfTheory()!=0 || subject.getPeriodOfPractice()!=0){%>
            <div style="padding-left: 17px;padding-bottom: 5px "><b><bean:message key="text.periodOfTheory"/> : </b>
                 <%=subject.getPeriodOfTheory() %></div>
            <div style="padding-left: 17px;padding-bottom: 5px "><b><bean:message key="text.periodOfPractice"/> : </b>
                 <%=subject.getPeriodOfPractice() %></div>
        <%}else{%>
            <div style="padding-left: 17px;padding-bottom: 5px "><b><bean:message key="text.periodOfTheory"/> : </b>
                 <bean:message key="text.updating"/></div>
            <div style="padding-left: 17px;padding-bottom: 5px "><b><bean:message key="text.periodOfPractice"/> : </b>
                 <bean:message key="text.updating"/></div>
        <%}%>
        <% if(language==1){%>
            <div style="padding-left: 17px;padding-bottom: 5px "><b><bean:message key="text.prerequisiteSubject"/> : </b>
            <%=subject.getPrerequisiteSubjectEn() %></div>
        <%}%>
        <% if(language==2){%>
            <div style="padding-left: 17px;padding-bottom: 5px "><b><bean:message key="text.prerequisiteSubject"/> : </b>
                <%=subject.getPrerequisiteSubjectVn() %></div>
        <%}%>
                
        <div style="font-weight: bold; padding-left: 17px;padding-bottom: 5px "><bean:message key="text.ProjectRequirementTitle"/> : </div>
        <%if(language==1) {%>
            <div style="padding-left: 17px;padding-bottom: 5px"><%=subject.getProjectRequirementEn() %></div>   
        <%}%>
        <%if(language==2) {%>
            <div style="padding-left: 17px;padding-bottom: 5px"><%=subject.getProjectRequirementVn() %></div>
        <%}%>
        <%if(subject.getMidtermGrade()>0 || subject.getFinalGrade()>0 ) {%>
        <table class="resource_table ">
        <thead>
            <tr class="color_title_table">
                <th style="height: 8px; text-align: center"><bean:message key="text.grade"/></th>
                <th style="height: 8px; text-align: center"><bean:message key="text.percent"/></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td style="text-align: center"><bean:message key="text.midtermGrade"/></td>
                <td style="text-align: center"><%=subject.getMidtermGrade() %> %</td>
            </tr>
            <tr style="background-color:#E2E1D9">
                <td style="text-align: center"><bean:message key="text.finalGrade"/></td>
                <td style="text-align: center"><%=subject.getFinalGrade() %> %</td>
            </tr>
        </tbody>
    </table>
    <%}%>        
    <%if(listResource.size()>0) {%>
       <div style="padding-left: 17px;padding-top: 5px"><a href="./DownLoad.do?resourceID=<%=listResource.get(0).getResourceId() %>" style="color:#680a12;" ><bean:message key="text.downloadhere"/></a></div>  
    <%}%>
    </body>
</html>
