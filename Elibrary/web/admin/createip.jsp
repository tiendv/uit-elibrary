<%-- 
    Document   : createip
    Created on : Feb 3, 2012, 10:02:08 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<!DOCTYPE html>
<h1><bean:message key="text.createip"/></h1>
<html:form method="post" action="CreateIP" >
    <div class="cleared"></div>
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.action"/></div>
        <div class="resource_left">
            <html:select property="dropStatus" value="0">
                <html:option value="0"><bean:message key="text.deny"/> <bean:message key="text.singleip"/></html:option>
                <html:option value="1"><bean:message key="text.deny"/> <bean:message key="text.iprange"/></html:option>
                <html:option value="2"><bean:message key="text.allow"/> <bean:message key="text.singleip"/></html:option>
                <html:option value="3"><bean:message key="text.allow"/> <bean:message key="text.iprange"/></html:option>
            </html:select>
        </div>    
    </div>                             
    <div class="cleared"></div>                                
    <html:submit property="btnSubmit" onclick="beforeValidation()" disabled="true"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
</html:form>
<script type="text/javascript">
    function init()
    {
        document.CreateIPForm.btnSubmit.disabled=false;
    }
    function beforeValidation()
    {
       document.getElementById("fckContentEN").value = FCKeditorAPI.GetInstance("fckContentEN").GetXHTML();
       document.getElementById("fckContentVN").value = FCKeditorAPI.GetInstance("fckContentVN").GetXHTML();
       
    }    
</script>      
