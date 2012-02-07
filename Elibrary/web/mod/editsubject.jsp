<%--
    Document   : editsubject
    Created on : December 20, 2011, 19:21:42 PM
    Author     : HERO
--%>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1||(Integer)session.getAttribute("group") ==3)//admin or mod
    {
        allow=true; 
%>
<%@page import="org.apache.struts.Globals"%>
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
<%@page import="uit.elib.dto.Subject" %>
<%@page import="uit.elib.dto.Faculty" %>
<%@page import="uit.elib.dto.Subjectcategory" %>
<%@page import="uit.elib.bo.SubjectBO" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <html:form  method="post" action="EditSubject" onsubmit="return validateEditSubjectForm(this)">
    <h1> <bean:message key="text.editsubject"/> </h1>    
     
        <%int language =1; // English
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
                    List<Subject> subjectInfo = (List<Subject>)request.getAttribute("subjectInfo");
                    List<Faculty> listFaculty = (List<Faculty>)request.getAttribute("listFaculty");
                    List<Subjectcategory> listSubjectCategory = (List<Subjectcategory>)request.getAttribute("listSubjectCategory");
                   
        %>
        <input id="hiddenSubjectCategoryID" name="hiddenSubjectCategoryID" type="hidden" value= "<%=request.getAttribute("hiddenSubjectCategoryID").toString()%>" />
        <input id="hiddenFacultyID" name="hiddenFacultyID" type="hidden" value= "<%=request.getAttribute("hiddenFacultyID").toString()%>"  />
        
        <input type="hidden" name="txtSubjectID" value="<%=subjectInfo.get(0).getSubjectId()%>" />
        <table class="table1">    
        <tr>

            <td><bean:message key="text.subjectnamevn"/></td>
            <td><input id="txtSubjectName" name="txtSubjectName" type="text" class="textbox" value="<%=subjectInfo.get(0).getSubjectNameVn()%>" maxlength="255"/></td>
            <td><bean:message key="text.subjectnameen"/></td>
            <td><input id="txtSubjectNameUS" name="txtSubjectNameUS" type="text" class="textbox" value="<%=subjectInfo.get(0).getSubjectNameEn()%>" maxlength="255"/></td>
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
             <td><bean:message key="text.creditnumber"/></td>
             <td><input id="txtCreditNumber" name="txtCreditNumber" type="text" class="textbox" value="<%=subjectInfo.get(0).getNumberOfCredit()%>" maxlength="2"/></td>
             <td><bean:message key="text.subjectcode"/></td>
             <td><input id="txtSubjectCode" name="txtSubjectCode" type="text" class="textbox" value="<%=subjectInfo.get(0).getCourseCode() %>" maxlength="45"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.periodoftheory"/></td>
            <td><input id="txtPeriodOfTheory" name="txtPeriodOfTheory" type="text" class="textbox" value="<%=subjectInfo.get(0).getPeriodOfTheory() %>" maxlength="3"/></td>
            <td><bean:message key="text.periodofpractice"/></td>
            <td><input id="txtPeriodOfPractice" name="txtPeriodOfPractice" type="text" class="textbox" value="<%=subjectInfo.get(0).getPeriodOfPractice() %>" maxlength="3"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.midtermgrade"/></td>
            <td><input id="txtMidtermGrade" name="txtMidtermGrade" type="text" class="textbox" value="<%=subjectInfo.get(0).getMidtermGrade() %>" maxlength="3"/></td>
            <td><bean:message key="text.finalgrade"/></td>
            <td><input id="txtFinalGrade" name="txtFinalGrade" type="text" class="textbox" value="<%=subjectInfo.get(0).getFinalGrade() %>" maxlength="3"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.prerequisitesubjectvn"/></td>
            <td><input id="txtPrerequisiteSubjectVN" name="txtPrerequisiteSubjectVN" type="text" class="textbox" value="<%=subjectInfo.get(0).getPrerequisiteSubjectVn() %>" maxlength="255"/></td>
            <td><bean:message key="text.prerequisitesubjecten"/></td>
            <td><input id="txtPrerequisiteSubject" name="txtPrerequisiteSubject" type="text" class="textbox" value="<%=subjectInfo.get(0).getProjectRequirementEn() %>" maxlength="255"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.timeteaching"/></td>
            <td><input id="txtTimeTeaching" name="txtTimeTeaching" type="text" class="textbox" value="<%=subjectInfo.get(0).getTimeTeaching() %>" maxlength="2"/></td>
            <td><bean:message key="text.teacher"/></td>
            <td><input id="txtTeacherName" name="txtTeacherName" type="text" class="textbox" value="<%=subjectInfo.get(0).getTeacher() %>" maxlength="255"/></td>
        </tr>
        <tr>
            <td><bean:message key="text.level"/></td>
            <td><input id="txtLevel" name="txtLevel" type="text" class="textbox" value="<%=subjectInfo.get(0).getLevel() %>" maxlength="45"/></td>
            <td><bean:message key="text.numberchapter"/></td>
            <td><input id="txtNumberChapter" name="txtNumberChapter" type="text" class="textbox" value="<%=subjectInfo.get(0).getNumberChapter() %>" maxlength="2"/></td>
        </tr>
    </table>
    
    <hr>
    <h2><bean:message key="text.subjectintroductionvn"/></h2>
   
        <FCK:editor  instanceName="fckIntroductionVN" height="300px" width="757px">
            <jsp:attribute name="value">
                <%=subjectInfo.get(0).getSubjectIntroduceVn() %>
            </jsp:attribute>
        </FCK:editor>
    <hr>
    
    <h2><bean:message key="text.subjectintroductionen"/></h2>
    <FCK:editor instanceName="fckIntroductionEN" height="300px" width="757px">
        <jsp:attribute name="value">
            <%=subjectInfo.get(0).getSubjectIntroduceEn() %>
        </jsp:attribute>
    </FCK:editor>
    <hr>
    <h2><bean:message key="text.projectrequirementvn"/></h2>
        <FCK:editor  instanceName="fckProjectRequitementVN" height="300px" width="757px">
            <jsp:attribute name="value">
                <%=subjectInfo.get(0).getProjectRequirementVn() %>
            </jsp:attribute>
        </FCK:editor>
    <hr>
    <h2><bean:message key="text.projectrequirementen"/></h2>
        <FCK:editor  instanceName="fckProjectRequitementEN" height="300px" width="757px">
            <jsp:attribute name="value">
                <%=subjectInfo.get(0).getProjectRequirementEn() %>
            </jsp:attribute>
        </FCK:editor>
    <hr>
    <div style="text-align: left">
        <html:submit property="btnSubmit" onclick="beforeValidation()"><bean:message key="text.buttonedit"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
    </div>
    <html:javascript formName="EditSubjectForm"/>
    </html:form>
<script type="text/javascript">
  
//    function init()
//    {
//        document.getElementById("btnSubmit")=false;
//        document.CreateSubjectForm.btnSubmit.disabled=false;
//        document.CreateSubjectForm.dropFaculty.disabled=true;
//        document.CreateSubjectForm.dropFaculty.selectedIndex=document.getElementById("hiddenFacultyID");
//        document.CreateSubjectForm.dropSubjectCategory.selectedIndex=document.getElementById("hiddenSubjectCategoryID");
//        document.getElementById("dropFaculty").disable=false;
//        document.getElementById("dropFaculty").selectedIndex=document.getElementById("hiddenFacultyID");
//        document.getElementById("dropSubjectCategory").selectedIndex=document.getElementById("hiddenSubjectCategoryID");
        function init()
    {
        document.EditSubjectForm.dropFaculty.disabled=true;
        document.EditSubjectForm.dropFaculty.selectedIndex=-1;
        document.EditSubjectForm.dropSubjectCategory.selectedIndex=0;
    }
    function check()
    { 
        document.EditSubjectForm.dropFaculty.disabled=false;
        document.EditSubjectForm.dropFaculty.selectedIndex=0;
        if(document.EditSubjectForm.dropSubjectCategory.value==1)
        {
            document.EditSubjectForm.dropFaculty.disabled=true;
            document.EditSubjectForm.dropFaculty.selectedIndex=-1;
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