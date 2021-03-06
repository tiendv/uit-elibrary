<%-- 
    Document   : edituser
    Created on : Feb 2, 2012, 10:37:50 PM
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
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="uit.elib.dto.User"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.struts.Globals"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<% 
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
        language = 2; // VietNamese
    List<User> listUser = (List<User>)request.getAttribute("listUser");
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
    String birthday = simpleDateFormat.format(listUser.get(0).getBirthday());
    String expiredDay = simpleDateFormat.format(listUser.get(0).getExpiredDay());
%>
<link href="./css/base/jquery.ui.datepicker.css" rel="stylesheet" type="text/css"/> 
<link href="./css/base/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
<script src="./js/jquery-1.7.1.min.js"></script> 
<script src="./js/jquery-ui-1.8.16.custom.min.js"></script> 
<h1><bean:message key="text.edituser"/></h1>
<html:form method="post" action="EditUser" onsubmit="return validateEditUserForm(this)">
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.status"/></div>
        <div class="resource_left">
            <%if(listUser.get(0).getUserName().equals("admin")){%>
            <html:select  property="dropStatus" styleClass="combobox" disabled="true" >
                <html:option value="1"><bean:message key="text.actived"/></html:option>
                <html:option value="0"><bean:message key="text.lock"/></html:option>
            </html:select>             
            <%}%>
            <%if(listUser.get(0).getUserName().equals("admin")==false){%>
            <html:select  property="dropStatus" styleClass="combobox">  
                <html:option value="1"><bean:message key="text.actived"/></html:option>
                <html:option value="0"><bean:message key="text.lock"/></html:option>
            </html:select>
            <%}%>
        </div>
        <div class="resource_left"><bean:message key="text.school"/></div>
        <div class="resource_left"><html:text property="txtSchool" styleClass="textbox" maxlength="255"/></div>         
    </div>
    <div class="cleared"></div>          
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.username"/></div>
        <div class="resource_left"><html:text property="txtUserName" styleClass="textbox" maxlength="20" disabled="true"/></div>
        <div class="resource_left"><bean:message key="text.email"/></div>
        <div class="resource_left"><html:text property="txtEmail" styleClass="textbox" maxlength="45"/></div>                                 
    </div>
    <div class="cleared"></div>  
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.password"/></div>
        <div class="resource_left"><html:password  property="txtPassword" value="" styleClass="textbox" maxlength="45"/></div>
        <div class="resource_left"><bean:message key="text.passwordconfirm"/></div>
        <div class="resource_left"><html:password property="txtRePassword" value="" styleClass="textbox" maxlength="45"/></div>                                 
    </div>
    <div class="cleared"></div>  
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.group"/></div>
        <div class="resource_left">
            <%if(listUser.get(0).getUserName().equals("admin")){%>
                <%if(language==1) {%>
                    <html:select  property="dropGroup" styleClass="combobox" disabled="true" >
                        <html:option value="Admin"></html:option>
                    </html:select>
                <%}%>
                <%if(language==2) {%>
                <html:select  property="dropGroup" styleClass="combobox" disabled="true" >
                    <html:option value="Quản trị viên"></html:option>
                </html:select>
                <%}%>             
            <%}%>
            <%if(listUser.get(0).getUserName().equals("admin")==false){%>
                <%if(language==1) {%>
                    <html:select  property="dropGroup" styleClass="combobox" >
                        <html:optionsCollection name="EditUserForm"  property="listDropGroup" value="groupId" label="groupNameEn"  ></html:optionsCollection>
                    </html:select>
                <%}%>
                <%if(language==2) {%>
                    <html:select  property="dropGroup" styleClass="combobox" >
                        <html:optionsCollection name="EditUserForm"  property="listDropGroup" value="groupId" label="groupNameVn" ></html:optionsCollection>
                    </html:select>
                <%}%> 
            <%}%>                 
        </div> 
        <div class="resource_left"><bean:message key="text.level"/></div>
        <div class="resource_left">
            <%if(language==1) {%>
                <html:select  property="dropLevel" styleClass="combobox" >
                    <html:optionsCollection name="EditUserForm"  property="listDropLevel" value="levelId" label="levelNameEn"  ></html:optionsCollection>
                </html:select>
            <%}%>
            <%if(language==2) {%>
                <html:select  property="dropLevel" styleClass="combobox" >
                    <html:optionsCollection name="EditUserForm"  property="listDropLevel" value="levelId" label="levelNameVn" ></html:optionsCollection>
                </html:select>
            <%}%>            
        </div>         
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.faculty"/></div>
        <div class="resource_left">
            <%if(language==1) {%>
                <html:select  property="dropFaculty" styleClass="combobox" >
                    <html:optionsCollection name="EditUserForm"  property="listDropFaculty" value="facultyId" label="facultyNameEn"  ></html:optionsCollection>
                </html:select>
            <%}%>
            <%if(language==2) {%>
                <html:select  property="dropFaculty" styleClass="combobox" >
                    <html:optionsCollection name="EditUserForm"  property="listDropFaculty" value="facultyId" label="facultyNameVn" ></html:optionsCollection>
                </html:select>
            <%}%>            
        </div>
        <div class="resource_left"><bean:message key="text.realname"/></div>
        <div class="resource_left"><html:text property="txtRealName" styleClass="textbox" maxlength="255"/></div>          
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.class"/></div>
        <div class="resource_left"><html:text property="txtClass" styleClass="textbox" maxlength="45"/></div>
        <div class="resource_left"><bean:message key="text.schoolyear"/></div>
        <div class="resource_left"><html:text property="txtSchoolYear" styleClass="textbox" maxlength="45"/></div>                    
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.address"/></div>
        <div class="resource_left"><html:text property="txtAddress" styleClass="textbox" maxlength="255"/></div>
        <div class="resource_left"><bean:message key="text.workplace"/></div>
        <div class="resource_left"><html:text property="txtWorkPlace" styleClass="textbox" maxlength="255"/></div>                    
    </div>
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.birthday"/></div>
        <div class="resource_left"><input class="textbox" type="text" id="birthday" name="birthday" value="<%=birthday%>"></div>         
        <%if(listUser.get(0).getUserName().equals("admin")){%>       
        <div class="resource_left" style="display: none"><bean:message key="text.expiredday"/></div>
            <div class="resource_left" style="display: none">
                <input class="textbox" type="text" id="expiredDay" name="expiredDay" value="<%=expiredDay%>"/>
            </div>
        <%}%>
        <%if(!listUser.get(0).getUserName().equals("admin")){%>       
        <div class="resource_left"><bean:message key="text.expiredday"/></div>
            <div class="resource_left">
                <input class="textbox" type="text" id="expiredDay" name="expiredDay" value="<%=expiredDay%>"/>
            </div>
        <%}%>        
    </div>
    <div class="cleared"></div>
    <html:submit property="btnSubmit" onclick="return validate()" disabled="true"><bean:message key="text.buttonedit"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
    <html:javascript formName="EditUserForm"/>    
</html:form>
<script type="text/javascript">
    function init()
    {
        document.EditUserForm.btnSubmit.disabled=false;
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
            yearRange: "-100:+100" 
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