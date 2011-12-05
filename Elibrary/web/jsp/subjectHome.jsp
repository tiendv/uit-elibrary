<%-- 
    Document   : introduceSubject
    Created on : Dec 1, 2011, 5:29:55 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="uit.elib.dto.Subject"%>
<%@page import="org.apache.struts.Globals"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
        
    </head>
    <body>
        <%
            // get image
            String imageLink="";
            if(request.getAttribute("imageLink")!=null)
                imageLink =(String)request.getAttribute("imageLink");
            Subject subject =(Subject)request.getAttribute("subject");
            // get current language
            int language =1; // English
            if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language=2; // VietNamese            
        %>
        <div class="hyperlink_title_subject">
            <a href= "LoadSubject.do"><bean:message key="text.menu.subject"/></a> > <a href="SubjectHome.do?subjectID=<%=subject.getSubjectId()%>">
        <%if(language==1) {%>
            <%=subject.getSubjectNameEn()%>
        <%}%>
        <%if(language==2) {%>
            <%=subject.getSubjectNameVn()%>
        <%}%>
        </a>
        > <bean:message key="text.menu.subjecthome"/>
        </div>
        <table>
            <thead>
                <tr>
                    <%if(language==1) {%>
                        <th colspan="2" style="color:#680a12;font-size: 30px "><%=subject.getSubjectNameEn()%></th>
                    <%}%>
                    <%if(language==2) {%>
                        <th colspan="2" style="color:#680a12;font-size: 30px "><%=subject.getSubjectNameVn()%></th>
                    <%}%>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="7"><%if(!imageLink.equals("")){ %><img src="<%=imageLink%>" width="<bean:message key="image.subject.width"/>" height="<bean:message key="image.subject.height"/>"/><%}%></td>
                </tr>
                <tr>
                    <td><b><bean:message key="text.creditNumber"/>:</b> <%=subject.getNumberOfCredit()%></td>
                </tr>
                <tr>
                    <td><b><bean:message key="text.periodOfTheory"/>:</b> <%=subject.getPeriodOfTheory()%></td>
                </tr>
                <tr>
                    <td><b><bean:message key="text.periodOfPractice"/>:</b> <%=subject.getPeriodOfPractice()%></td>
                </tr>
                <tr>
                    <td><b><bean:message key="text.courceCode"/>:</b> <%=subject.getNumberOfCredit()%></td>
                </tr>
                <tr>
                    <td><b><bean:message key="text.teacher"/>:</b> <%=subject.getTeacher()%></td>
                </tr>
                <tr>
                    <td><b><bean:message key="text.level"/>:</b> <%=subject.getLevel()%></td> 
                </tr>
            </tbody>
        </table>
        <%if(language==1) {%>
            <div style="padding-left: 8px;font-weight: bold"><bean:message key="text.introductionSubjectEN"/>:</div> <div style="padding-left: 8px"><%=subject.getSubjectIntroduceEn()%></div>
        <%}%>    
        <%if(language==2) {%>
            <div style="padding-left: 8px;font-weight: bold"><bean:message key="text.introductionSubjectVN"/>:</div> <div style="padding-left: 8px"><%=subject.getSubjectIntroduceVn()%></div>
        <%}%>   
    </body>
</html>
