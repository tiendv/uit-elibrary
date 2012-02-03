<%-- 
    Document   : subjectIntroduction
    Created on : Dec 1, 2011, 5:29:55 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.Subject"%>
<%@page import="org.apache.struts.Globals"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // get image
    String imageLink="./image/default.jpg";
    if(request.getAttribute("imageLink")!=null)
        imageLink =(String)request.getAttribute("imageLink");
    Subject subject =  (Subject)request.getAttribute("subject");
    // get current language
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language=2; // VietNamese            
%>
<div class="hyperlink_title_subject">
    <a href= "LoadSubject.do"><bean:message key="text.subject"/></a> > <a href="SubjectIntroduction.do?subjectID=<%=subject.getSubjectId()%>">
<%if(language==1) {%>
    <%=subject.getSubjectNameEn()%>
<%}%>
<%if(language==2) {%>
    <%=subject.getSubjectNameVn()%>
<%}%>
</a>
> <bean:message key="text.subjectintroduction"/>
</div>
<table>
    <tr>
        <td rowspan="7"><img src="<%=imageLink%>" width="<bean:message key="image.subject.width"/>" height="<bean:message key="image.subject.height"/>"/></td>
    </tr>
    <tr>
        <td><b><bean:message key="text.creditnumber"/>:</b> <%=subject.getNumberOfCredit()%></td>
    </tr>
    <%if(subject.getPeriodOfPractice()!=0 || subject.getPeriodOfTheory()!=0){%>
        <tr>
            <td><b><bean:message key="text.periodoftheory"/>:</b> <%=subject.getPeriodOfTheory()%></td>
        </tr>
        <tr>
            <td><b><bean:message key="text.periodofpractice"/>:</b> <%=subject.getPeriodOfPractice()%></td>
        </tr>
    <%}else{%>
        <tr>
            <td><b><bean:message key="text.periodoftheory"/>:</b> <bean:message key="text.updating"/></td>
        </tr>
        <tr>
            <td><b><bean:message key="text.periodofpractice"/>:</b> <bean:message key="text.updating"/></td>
        </tr>
    <%}%>
    <tr>
        <td><b><bean:message key="text.courcecode"/>:</b> <%=subject.getCourseCode()%></td>
    </tr>
    <tr>
        <td><b><bean:message key="text.teacher"/>:</b> <%=subject.getTeacher()%></td>
    </tr>
    <tr>
        <td><b><bean:message key="text.level"/>:</b> <%=subject.getLevel()%></td> 
    </tr>
</table>
<%if(language==1) {%>
    <div class="subjectintroduction_title"><bean:message key="text.subjectintroduction"/>:</div> <div class="subjectintroduction"><%=subject.getSubjectIntroduceEn()%></div>
<%}%>    
<%if(language==2) {%>
    <div class="subjectintroduction_title"><bean:message key="text.subjectintroduction"/>:</div> <div class="subjectintroduction"><%=subject.getSubjectIntroduceVn()%></div>
<%}%> 
