<%-- 
    Document   : createSubject
    Created on : Nov 22, 2011, 11:12:12 AM
    Author     : tiendv
--%>


<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div style="overflow: auto;height: 600px;">
    <form name="createSubject" method="post" action="CreateSubject.do">
     <jsp:useBean id="subjectCategoryBO" class="uit.elib.bo.SubjectCategoryBO" scope="page">    
     <jsp:useBean id="subjectFacultyBO" class="uit.elib.bo.FacultyBO" scope="page">
    <h1> <bean:message key="text.newSubject"/> </h1>
    <table width="100%">
        <%int language =1; // English
                    Locale locale = request.getLocale();
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
        %>
        <tr>
            <td><bean:message key="text.nameSubjectVN"/></td>
            <td><input name="txtSubjectName" type="text"/></td>
            <td><bean:message key="text.nameSubjectEN"/></td>
            <td><input name="txtSubjectNameUS" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.nameSubjectCategory"/></td>
            <td>
                <%if(language==1) {%>
                    <select  name="dropSubjectCategory" class="cssdropbox">
                        <c:forEach items="${subjectCategoryBO.allSubjectCategory}" var="item">
                            <option value="${item.subjectCategoryId}">${item.subjectCategoryNameEn}</option>
                        </c:forEach>
                    </select> 
                <%}%>
                <%if(language==2) {%>
                    <select  name="dropSubjectCategory" class="cssdropbox">
                        <c:forEach items="${subjectCategoryBO.allSubjectCategory}" var="item">
                            <option value="${item.subjectCategoryId}">${item.subjectCategoryNameVn}</option>
                        </c:forEach>
                    </select> 
                <%}%>
            </td>
            <td><bean:message key="text.codeSubject"/></td>
            <td><input name="txtSubjectCode" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.periodOfTheory"/></td>
            <td><input name="txtPeriodOfTheory" type="text"/></td>
            <td><bean:message key="text.periodOfPractice"/></td>
            <td><input name="txtPeriodOfPractice" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.midtermGrade"/></td>
            <td><input name="txtMidtermGrade" type="text"/></td>
            <td><bean:message key="text.finalGrade"/></td>
            <td><input name="txtFinalGrade" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.prerequisiteSubjectEN"/></td>
            <td><input name="txtPrerequisiteSubject" type="text"/></td>
            <td><bean:message key="text.timeTeaching"/></td>
            <td><input name="txtSubjectTime" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.teacher"/></td>
            <td><input name="txtTeacherName" type="text" /></td>
            <td><bean:message key="text.level"/></td>
            <td><input name="txtLevel" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.faculty"/></td>
            <td>
                <% if(language==1) {%>
                    <select  name="dropSubjectFaculty" class="cssdropbox">
                        <c:forEach items="${subjectFacultyBO.allFaculty}" var="item">
                          <option value="${item.facultyId}">${item.facultyNameEn}</option>
                        </c:forEach>
                    </select> 
                <%}%>
                <% if(language==2) {%>
                    <select  name="dropSubjectFaculty" class="cssdropbox">
                        <c:forEach items="${subjectFacultyBO.allFaculty}" var="item">
                          <option value="${item.facultyId}">${item.facultyNameVn}</option>
                        </c:forEach>
                    </select> 
                <%}%>
            </td>
            <td>
            </td>
            <td>
                
            </td>
        </tr>
    </table>
    
    <hr>
    <h2><bean:message key="text.introductionSubjectVN"/></h2>
   
        <FCK:editor  instanceName="fckintroductionVN" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    
    <h2><bean:message key="text.introductionSubjectEN"/></h2>
    <FCK:editor instanceName="fckintroductionUS" height="300px">
        <jsp:attribute name="value">
            
        </jsp:attribute>
    </FCK:editor>
    <hr>
    <h2><bean:message key="text.projectRequirementVN"/></h2>
        <FCK:editor  instanceName="fckProjectRequitementVN" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    <h2><bean:message key="text.projectRequirementEN"/></h2>

        <FCK:editor  instanceName="fckProjectRequitementUS" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    <div style="text-align: left">
        <input type="submit" value=<bean:message key="text.buttonCancel"/>  />
        <input type="submit" value=<bean:message key="text.buttonCreate"/>  />
    </div>
    </jsp:useBean>
    </jsp:useBean>
    </form>
</div>