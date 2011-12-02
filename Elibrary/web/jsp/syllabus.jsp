<%-- 
    Document   : syllabus
    Created on : Dec 3, 2011, 12:09:23 AM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="org.apache.struts.Globals"%>
<%@page import="uit.elib.entities.Subject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            Subject subject =(Subject)request.getAttribute("subject");
            // get current language
            int language =1; // English
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language=2; // VietNamese            
        %>
        <div style="padding-left: 10px"><a href= "LoadSubject.do"><bean:message key="text.menu.subject"/></a> > 
        <%if(language==1) {%>
            <%=subject.getSubjectName()%> 
        <%}%>
        <%if(language==2) {%>
            <%=subject.getSubjectNameVn()%> 
        <%}%>
        > <bean:message key="text.menu.syllabus"/></div>
        
        <%if(language==1) {%>
            <div style="color:#680a12;font-size: 30px; padding-left: 10px "><%=subject.getSubjectName()%></div>
        <%}%>
        <%if(language==2) {%>
            <div style="color:#680a12;font-size: 30px; padding-left: 10px "><%=subject.getSubjectNameVn()%></div>
        <%}%></br>
        
        <div style="padding-left: 10px;padding-bottom: 5px "><b><bean:message key="text.timeTeaching"/> : </b>
             <%=subject.getTimeTeaching() %> <bean:message key="text.weeks"/></div>
        <div style="padding-left: 10px;padding-bottom: 5px "><b><bean:message key="text.periodOfTheory"/> : </b>
             <%=subject.getPeriodOfTheory() %></div>
        <div style="padding-left: 10px;padding-bottom: 5px "><b><bean:message key="text.periodOfPractice"/> : </b>
             <%=subject.getPeriodOfPractice() %></div>
        <div style="padding-left: 10px;padding-bottom: 5px "><b><bean:message key="text.prerequisiteSubject"/> : </b>
             <%=subject.getPrerequisiteSubject() %></div>
        <div style="font-weight: bold; padding-left: 10px;padding-bottom: 5px "><bean:message key="text.projectRequitement"/> : </div>
        <%if(language==1) {%>
            <div style="padding-left: 10px;padding-bottom: 5px"><%=subject.getProjectRequitementUs() %></div>   
        <%}%>
        <%if(language==2) {%>
            <div style="padding-left: 10px;padding-bottom: 5px"><%=subject.getProjectRequitement() %></div>
        <%}%>        
        <table cellspacing="0" style="border: 1px #B4B1A2 solid ;margin-left: 8px ">
        <thead>
            <tr style="background-color:#B4B1A2">
                <th ><bean:message key="text.time"/></th>
                <th><bean:message key="text.percent"/></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><bean:message key="text.midtermGrade"/></td>
                <td><%=subject.getMidtermGrade() %></td>
            </tr>
            <tr style="background-color:#E2E1D9">
                <td><bean:message key="text.finalmGrade"/></td>
                <td><%=subject.getFinalGrade() %></td>
            </tr>
        </tbody>
    </table>

    </body>
</html>
