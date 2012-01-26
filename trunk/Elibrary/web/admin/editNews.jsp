<%-- 
    Document   : editNews
    Created on : Jan 25, 2012, 8:44:41 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="uit.elib.dto.News"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK" %>
<!DOCTYPE html>
<%
    List<News> listNews = (List<News>)request.getAttribute("listNews");
%>
<h1><bean:message key="text.editnews"/></h1>
<html:form method="post" action="EditNews" enctype="multipart/form-data" onsubmit="return validateEditNewsForm(this)"> 
    <input type="hidden" name="txtID" value="<%=listNews.get(0).getNewsId()%>" />
    <%if(listNews.get(0).getNewsImage()!=null){ 
        String imageLink = "./upload/"+listNews.get(0).getNewsImage().toString();
    %>
        <div><img src="<%=imageLink%>" class="image"/></div>
    <%}%>              
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.imagegallery"/></div>
        <div class="resource_left"><html:file property="fileImage" size="24"/></div>                                
    </div> 
    <div class="cleared"></div>             
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.titleen"/></div>
        <div class="resource_left"><html:text property="txtTitleEN" styleClass="textbox"/></div>
        <div class="resource_left"><bean:message key="text.titlevn"/></div>
        <div class="resource_left"><html:text property="txtTitleVN" styleClass="textbox"/></div>                                 
    </div>              
    <div class="cleared"></div>           
    <div class="resource1"><bean:message key="text.headlineen"/></div>
    <div class="resource1"><html:textarea property="txtHeadlineEN" styleClass="textarea"/></div>
    <div class="resource1"><bean:message key="text.headlinevn"/></div>
    <div class="resource1"><html:textarea property="txtHeadlineVN" styleClass="textarea"/></div>              
    <h2><bean:message key="text.contenten"/></h2>
    <FCK:editor  instanceName="fckContentEN" height="300px">
        <jsp:attribute name="value">
            <%=listNews.get(0).getNewsContentEn()%>
        </jsp:attribute>
    </FCK:editor>
    <hr/>
    <h2><bean:message key="text.contentvn"/></h2>
    <FCK:editor  instanceName="fckContentVN" height="300px">
        <jsp:attribute name="value">
            <%=listNews.get(0).getNewsContentVn()%>
        </jsp:attribute>
    </FCK:editor>
    <hr/>            
    <html:submit property="btnSubmit" onclick="beforeValidation()" disabled="true"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
    <html:javascript formName="EditNewsForm"/>
</html:form>
<script type="text/javascript">
    function init()
    {
        document.EditNewsForm.btnSubmit.disabled=false;
    }
    function beforeValidation()
    {
       document.getElementById("fckContentEN").value = FCKeditorAPI.GetInstance("fckContentEN").GetXHTML();
       document.getElementById("fckContentVN").value = FCKeditorAPI.GetInstance("fckContentVN").GetXHTML();
       
    }    
</script>    
