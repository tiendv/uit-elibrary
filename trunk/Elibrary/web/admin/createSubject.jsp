<%-- 
    Document   : createSubject
    Created on : December 10, 2011, 10:29:19 AM
    Author     : Nguyen Hoang Tan
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
    <html:form  method="post" action="CreateSubject" onsubmit="return validateCreateSubjectForm(this)">
    <h1> <bean:message key="text.newSubject"/> </h1>
    <table width="100%">
        <%int language =1; // English
                    Locale locale = request.getLocale();
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
        %>
        <tr>

            <td><bean:message key="text.SubjectNameVN"/></td>
            <td><html:text property="txtSubjectName"/></td>
            <td><bean:message key="text.SubjectNameEN"/></td>
            <td><html:text property="txtSubjectNameUS" /></td>
        </tr> 
        <tr>
            <td><bean:message key="text.SubjectCategory"/></td>
            <td>
                <%if(language==1) {%>
                <html:select  property="dropSubjectCategory" onchange="check()" styleClass="combobox" > 
                        <html:optionsCollection name="LoadCreateSubjectForm"  property="listDropSubjectCategory" value="subjectCategoryId" label="subjectCategoryNameEn"  ></html:optionsCollection>
                    </html:select> 
                <%}%>
                <%if(language==2) {%>
                <html:select  property="dropSubjectCategory" onchange="check()" styleClass="combobox" > 
                        <html:optionsCollection name="LoadCreateSubjectForm"  property="listDropSubjectCategory" value="subjectCategoryId" label="subjectCategoryNameVn" ></html:optionsCollection>
                    </html:select> 
                <%}%>
            </td>
            <td><bean:message key="text.faculty"/></td>
            <td>
                <% if(language==1) {%>
                    <html:select  property="dropFaculty" styleClass="combobox" > 
                        <html:optionsCollection name="LoadCreateSubjectForm"  property="listDropFaculty" value="facultyId" label="facultyNameEn"></html:optionsCollection>
                    </html:select>
                <%}%>
                <% if(language==2) {%>
                    <html:select  property="dropFaculty" styleClass="combobox" > 
                        <html:optionsCollection name="LoadCreateSubjectForm"  property="listDropFaculty" value="facultyId" label="facultyNameVn"></html:optionsCollection>
                    </html:select>
                <%}%>
             </td>            

        </tr>
        <tr>
             <td><bean:message key="text.creditNumber"/></td>
             <td><html:text property="txtCreditNumber" /></td>
             <td><bean:message key="text.SubjectCode"/></td>
             <td><html:text property="txtSubjectCode" /></td>           
        </tr>
        <tr>
            <td><bean:message key="text.periodOfTheory"/></td>
            <td><html:text property="txtPeriodOfTheory" /></td>
            <td><bean:message key="text.periodOfPractice"/></td>
            <td><html:text property="txtPeriodOfPractice" /></td>
        </tr>
        <tr>
            <td><bean:message key="text.midtermGrade"/></td>
            <td><html:text property="txtMidtermGrade" /></td>
            <td><bean:message key="text.finalGrade"/></td>
            <td><html:text property="txtFinalGrade" /></td>
        </tr>
        <tr>
            <td><bean:message key="text.prerequisiteSubjectVN"/></td>
            <td><html:text property="txtPrerequisiteSubjectVN" /></td>
            <td><bean:message key="text.prerequisiteSubjectEN"/></td>
            <td><html:text property="txtPrerequisiteSubject" /></td>
        </tr>
        <tr>
            <td><bean:message key="text.timeTeaching"/></td>
            <td><html:text property="txtTimeTeaching" /></td>
            <td><bean:message key="text.teacher"/></td>
            <td><html:text property="txtTeacherName" /></td>
        </tr>
        <tr>
            <td><bean:message key="text.level"/></td>
            <td><html:text property="txtLevel" /></td>
            <td><bean:message key="text.numberchapter"/></td>
            <td><html:text property="txtNumberChapter" /></td>
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
        <html:submit property="btnSubmit" disabled="true"><bean:message key="text.buttonCreate"/></html:submit><noscript><bean:message key="text.noScript"/></noscript> 
    </div>
    <html:javascript formName="CreateSubjectForm"/>
    </html:form>
</div>
<script type="text/javascript">
    function init()
    {
        document.CreateSubjectForm.btnSubmit.disabled=false;
        document.CreateSubjectForm.dropFaculty.disabled=true;
        document.CreateSubjectForm.dropFaculty.selectedIndex=-1;
        document.CreateSubjectForm.dropSubjectCategory.selectedIndex=0;
    }
    function check()
    { 
        document.CreateSubjectForm.dropFaculty.disabled=false;
        document.CreateSubjectForm.dropFaculty.selectedIndex=0;
        if(document.CreateSubjectForm.dropSubjectCategory.value==1)
        {
            document.CreateSubjectForm.dropFaculty.disabled=true;
            document.CreateSubjectForm.dropFaculty.selectedIndex=-1;
        }          
 
    } 
  
</script>