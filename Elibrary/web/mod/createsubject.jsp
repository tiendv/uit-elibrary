<%--
    Document   : createsubject
    Created on : December 10, 2011, 10:29:19 AM
    Author     : Nguyen Hoang Tan
--%>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1||(Integer)session.getAttribute("group") ==3)//admin or mod
    {
        allow=true; 
%>
<%@page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="java.util.List" %>
<%@page import="org.apache.struts.Globals"%>
<html:form  method="post" action="CreateSubject" onsubmit="return validateCreateSubjectForm(this)">
<h1> <bean:message key="text.newsubject"/> </h1>
<table class="table1">
    <%
        int language =1; // English
        if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
            language = 2; // VietNamese
    %>
    <tr>
        <td><bean:message key="text.subjectnamevn"/></td>
        <td><html:text styleClass="textbox" property="txtSubjectName" maxlength="255" value=""/></td>
        <td><bean:message key="text.subjectnameen"/></td>
        <td><html:text styleClass="textbox" property="txtSubjectNameUS" maxlength="255" value=""/></td>
    </tr>
    <tr>
        <td><bean:message key="text.subjectcategory"/></td>
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
                <html:select  property="dropFaculty" styleClass="combobox" multiple="true">
                    <html:optionsCollection name="LoadCreateSubjectForm"  property="listDropFaculty" value="facultyId" label="facultyNameEn"></html:optionsCollection>
                </html:select>
            <%}%>
            <% if(language==2) {%>
            <html:select  property="dropFaculty" styleClass="combobox" multiple="true">
                    <html:optionsCollection name="LoadCreateSubjectForm"  property="listDropFaculty" value="facultyId" label="facultyNameVn"></html:optionsCollection>
                </html:select>
            <%}%>
         </td>            
    </tr>
    <tr>
         <td><bean:message key="text.creditnumber"/></td>
         <td><html:text styleClass="textbox" property="txtCreditNumber" maxlength="2" value=""/></td>
         <td><bean:message key="text.subjectcode"/></td>
         <td><html:text styleClass="textbox" property="txtSubjectCode" maxlength="45" value=""/></td>           
    </tr>
    <tr>
        <td><bean:message key="text.periodoftheory"/></td>
        <td><html:text styleClass="textbox" property="txtPeriodOfTheory" maxlength="3" value=""/></td>
        <td><bean:message key="text.periodofpractice"/></td>
        <td><html:text styleClass="textbox" property="txtPeriodOfPractice" maxlength="3" value=""/></td>
    </tr>
    <tr>
        <td><bean:message key="text.midtermgrade"/></td>
        <td><html:text styleClass="textbox" property="txtMidtermGrade" maxlength="3" value=""/></td>
        <td><bean:message key="text.finalgrade"/></td>
        <td><html:text styleClass="textbox" property="txtFinalGrade" maxlength="3" value=""/></td>
    </tr>
    <tr>
        <td><bean:message key="text.prerequisitesubjectvn"/></td>
        <td><html:text styleClass="textbox" property="txtPrerequisiteSubjectVN" maxlength="255" value=""/></td>
        <td><bean:message key="text.prerequisitesubjecten"/></td>
        <td><html:text styleClass="textbox" property="txtPrerequisiteSubject" maxlength="255" value=""/></td>
    </tr>
    <tr>
        <td><bean:message key="text.timeteaching"/></td>
        <td><html:text styleClass="textbox" property="txtTimeTeaching" maxlength="2" value=""/></td>
        <td><bean:message key="text.teacher"/></td>
        <td><html:text styleClass="textbox" property="txtTeacherName" maxlength="255" value=""/></td>
    </tr>
    <tr>
        <td><bean:message key="text.level"/></td>
        <td><html:text styleClass="textbox" property="txtLevel" maxlength="45" value=""/></td>
        <td><bean:message key="text.numberchapter"/></td>
        <td><html:text styleClass="textbox" property="txtNumberChapter" maxlength="2" value=""/></td>
    </tr>
</table>   
<hr>
<h2><bean:message key="text.subjectintroductionvn"/></h2>
    <FCK:editor instanceName="fckIntroductionVN" height="300px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>
<hr>
<h2><bean:message key="text.subjectintroductionen"/></h2>
    <FCK:editor instanceName="fckIntroductionEN" height="300px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>
<hr>
<h2><bean:message key="text.projectrequirementvn"/></h2>
    <FCK:editor instanceName="fckProjectRequitementVN" height="300px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>
<hr>
<h2><bean:message key="text.projectrequirementen"/></h2>
    <FCK:editor instanceName="fckProjectRequitementEN" height="300px">
        <jsp:attribute name="value">
        </jsp:attribute>
    </FCK:editor>
<hr>
<div style="text-align: left">
    <html:submit property="btnSubmit" onclick="beforeValidation()"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
</div>
<html:javascript formName="CreateSubjectForm"/>
</html:form>
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
    function beforeValidation()
    {
       document.getElementById("fckIntroductionVN").value = FCKeditorAPI.GetInstance("fckIntroductionVN").GetXHTML();
       document.getElementById("fckIntroductionEN").value = FCKeditorAPI.GetInstance("fckIntroductionEN").GetXHTML();
       document.getElementById("fckProjectRequitementVN").value = FCKeditorAPI.GetInstance("fckProjectRequitementVN").GetXHTML();
       document.getElementById("fckProjectRequitementEN").value = FCKeditorAPI.GetInstance("fckProjectRequitementEN").GetXHTML();   
    }
</script>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>