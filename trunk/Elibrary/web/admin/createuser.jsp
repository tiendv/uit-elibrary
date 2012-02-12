<%-- 
    Document   : createuser
    Created on : Jan 30, 2012, 9:11:21 PM
    Author     : Nguyen Hoang Tan
--%>
<%
boolean allow=false;
if(session.getAttribute("username")!=null)
{    
    if((Integer)session.getAttribute("group") ==1)//admin
    {
        allow=true; 
%>
<%@page import="org.apache.struts.Globals"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%   
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
%>
<link href="./css/base/jquery.ui.datepicker.css" rel="stylesheet" type="text/css"/> 
<link href="./css/base/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
<script src="./js/jquery-1.7.1.min.js"></script> 
<script src="./js/jquery-ui-1.8.16.custom.min.js"></script> 
<h1><bean:message key="text.createuser"/></h1>
<html:form method="post" action="CreateUser" onsubmit="return validateCreateUserForm(this)">
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.status"/></div>
        <div class="resource_left">
            <html:select  property="dropStatus" styleClass="combobox" value="1" >
                <html:option value="1"><bean:message key="text.actived"/></html:option>
                <html:option value="0"><bean:message key="text.lock"/></html:option>
            </html:select>           
        </div>
        <div class="resource_left"><bean:message key="text.school"/></div>
        <div class="resource_left"><html:text property="txtSchool" styleClass="textbox" maxlength="255" value=""/></div>        
    </div>
    <div class="cleared"></div>          
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.username"/></div>
        <div class="resource_left"><html:text property="txtUserName" styleClass="textbox" maxlength="20" onchange="validateUserName()" value=""/></div>
        <div class="resource_left"><bean:message key="text.email"/></div>
        <div class="resource_left"><html:text property="txtEmail" styleClass="textbox" maxlength="45" value=""/></div>                                 
    </div>
    <div class="cleared"></div>  
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.password"/></div>
        <div class="resource_left"><html:password  property="txtPassword" styleClass="textbox" maxlength="45" value=""/></div>
        <div class="resource_left"><bean:message key="text.passwordconfirm"/></div>
        <div class="resource_left"><html:password property="txtRePassword" styleClass="textbox" maxlength="45" value=""/></div>                                 
    </div>
    <div class="cleared"></div>  
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.group"/></div>
        <div class="resource_left">
            <%if(language==1) {%>
            <html:select name="LoadCreateUserForm" property="dropGroup" styleClass="combobox">
                    <html:optionsCollection name="LoadCreateUserForm"  property="listDropGroup" value="groupId" label="groupNameEn"  ></html:optionsCollection>
                </html:select>
            <%}%>
            <%if(language==2) {%>
                <html:select name="LoadCreateUserForm"  property="dropGroup" styleClass="combobox" >
                    <html:optionsCollection name="LoadCreateUserForm"  property="listDropGroup" value="groupId" label="groupNameVn" ></html:optionsCollection>
                </html:select>
            <%}%>            
        </div> 
        <div class="resource_left"><bean:message key="text.level"/></div>
        <div class="resource_left">
            <%if(language==1) {%>
                <html:select name="LoadCreateUserForm" property="dropLevel" styleClass="combobox" >
                    <html:optionsCollection name="LoadCreateUserForm"  property="listDropLevel" value="levelId" label="levelNameEn"  ></html:optionsCollection>
                </html:select>
            <%}%>
            <%if(language==2) {%>
                <html:select name="LoadCreateUserForm" property="dropLevel" styleClass="combobox" >
                    <html:optionsCollection name="LoadCreateUserForm"  property="listDropLevel" value="levelId" label="levelNameVn" ></html:optionsCollection>
                </html:select>
            <%}%>            
        </div>         
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.faculty"/></div>
        <div class="resource_left">
            <%if(language==1) {%>
                <html:select name="LoadCreateUserForm"  property="dropFaculty" styleClass="combobox" >
                    <html:optionsCollection name="LoadCreateUserForm"  property="listDropFaculty" value="facultyId" label="facultyNameEn"  ></html:optionsCollection>
                </html:select>
            <%}%>
            <%if(language==2) {%>
                <html:select name="LoadCreateUserForm"  property="dropFaculty" styleClass="combobox" >
                    <html:optionsCollection name="LoadCreateUserForm"  property="listDropFaculty" value="facultyId" label="facultyNameVn" ></html:optionsCollection>
                </html:select>
            <%}%>            
        </div>
        <div class="resource_left"><bean:message key="text.realname"/></div>
        <div class="resource_left"><html:text property="txtRealName" styleClass="textbox" maxlength="255" value=""/></div>          
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.class"/></div>
        <div class="resource_left"><html:text property="txtClass" styleClass="textbox" maxlength="45" value=""/></div>
        <div class="resource_left"><bean:message key="text.schoolyear"/></div>
        <div class="resource_left"><html:text property="txtSchoolYear" styleClass="textbox" maxlength="45" value=""/></div>                    
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.address"/></div>
        <div class="resource_left"><html:text property="txtAddress" styleClass="textbox" maxlength="255" value=""/></div>
        <div class="resource_left"><bean:message key="text.workplace"/></div>
        <div class="resource_left"><html:text property="txtWorkPlace" styleClass="textbox" maxlength="255" value=""/></div>                    
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.birthday"/></div>
        <div class="resource_left"><input class="textbox" type="text" id="birthday" name="birthday" value=""></div>         
        <div class="resource_left"><bean:message key="text.expiredday"/></div>
        <div class="resource_left"><input class="textbox" type="text" id="expiredDay" name="expiredDay" value=""/></div>                   
    </div>
    <div class="cleared"></div>
    <html:submit property="btnSubmit" onclick="return validate()" disabled="true"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
    <html:javascript formName="CreateUserForm"/>    
</html:form>
<script type="text/javascript">
    function init()
    {
        document.CreateUserForm.btnSubmit.disabled=false;
    }
    function validateUserName()
    {
        if(document.getElementsByName("txtUserName")[0].value != "") // check username
        {
            var username = document.getElementsByName("txtUserName")[0].value;
            $.ajax({
                type: "POST",
                url: "CheckUser.do",
                data: "username="+username
            }).done(function( msg ) {
                if(msg!="")
                {                  
                    var alertString = "";
                    alertString = "<bean:message key="text.username"/> <bean:message key="text.exist"/>";
                    alert(alertString);
                    document.CreateUserForm.btnSubmit.disabled=true;
                }
                else
                    document.CreateUserForm.btnSubmit.disabled=false;
            });            
        } 
    }
    function validate()
    {   
        if(document.getElementsByName("txtPassword")[0].value != "" && document.getElementsByName("txtRePassword")[0].value !="") // check password and password confirm              
            if(document.getElementsByName("txtPassword")[0].value != document.getElementsByName("txtRePassword")[0].value)
            {
                var alertString ="<bean:message key="text.password"/> <bean:message key="text.and"/> <bean:message key="text.passwordconfirm"/> <bean:message key="text.isnotsame"/>" 
                alert(alertString);
                return false;
            }    
    }     
    $(function() {
        $( "#expiredDay" ).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: "dd/mm/yy", 
            yearRange: "-0:+100" 
        });
        $( "#birthday" ).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: "dd/mm/yy", 
            yearRange: "-200:+0" 
        });
    }); 
</script>
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>
