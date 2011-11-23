<%-- 
    Document   : createSubject
    Created on : Nov 22, 2011, 11:12:12 AM
    Author     : tiendv
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-bean-el" prefix="bean" %>


<div style="overflow: auto;height: 600px;">
    <form name="createSubject" method="post" action="CreateSubject.do">
     <jsp:useBean id="subjectCategoryBO" class="uit.elib.bo.SubjectCategorytBO" scope="page">
         
     <jsp:useBean id="subjectSpecialityBO" class="uit.elib.bo.SpecialityBO" scope="page">
       
    <h1> <bean:message key="text.newSubject"/> </h1>
    <table>
        <tr>
            <td><bean:message key="text.nameSubject"/></td>
            <td><input name="txtSubjectName" type="text"/></td>
            <td><bean:message key="text.nameSubjectUS"/></td>
            <td><input name="txtSubjectNameUS" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.nameSubjectCategory"/></td>
            <td>
                <select  name="dropSubjectCategory">
 
                </select> 
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
            <td><bean:message key="text.finalmGrade"/></td>
            <td><input name="txtFinalGrade" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.prerequisiteSubject"/></td>
            <td><input name="txtPrerequisiteSubject" type="text"/></td>
            <td><bean:message key="text.timeTeaching"/></td>
            <td><input name="txtSubjectTime" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.teacher"/></td>
            <td><input name="txtTeacherName" type="text"/></td>
            <td><bean:message key="text.level"/></td>
            <td><input name="txtLevel" type="text"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.faculty"/></td>
            <td>
               <select  name="dropSubjectFaculty">
 
                </select> 
            </td>
        </tr>
    </table>
    
    <hr>
    <h2><bean:message key="text.introductionSubject"/></h2>
   
        <FCK:editor  instanceName="fckintroductionVN" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    
    <h2><bean:message key="text.introductionSubjectUS"/></h2>
    <FCK:editor instanceName="fckintroductionUS" height="300px">
        <jsp:attribute name="value">
            
        </jsp:attribute>
    </FCK:editor>
    <hr>
    <h2><bean:message key="text.projectRequitement"/></h2>
        <FCK:editor  instanceName="fckProjectRequitementVN" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    <h2><bean:message key="text.projectRequitementUS"/></h2>

        <FCK:editor  instanceName="fckProjectRequitementUS" height="300px">
            <jsp:attribute name="value">

            </jsp:attribute>
        </FCK:editor>
    <hr>
    <div style="text-align: right">
        <input type="submit" value=<bean:message key="text.buttonCancel"/>  />
        <input type="submit" value=<bean:message key="text.buttonCreate"/>  />
    </div>
    </jsp:useBean>
    </jsp:useBean>
    </form>>
</div>