<%-- 
    Document   : createip
    Created on : Feb 3, 2012, 10:02:08 PM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<!DOCTYPE html>
<h1><bean:message key="text.createip"/></h1>
<html:form method="post" action="CreateIP" onsubmit="return validateCreateIPForm(this)">
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.action"/></div>
        <div class="resource_left">
            <html:select property="dropStatus" value="0" onchange="singleip()">
                <html:option value="0"><bean:message key="text.deny"/> <bean:message key="text.singleip"/></html:option>
                <html:option value="1"><bean:message key="text.deny"/> <bean:message key="text.iprange"/></html:option>
                <html:option value="2"><bean:message key="text.allow"/> <bean:message key="text.singleip"/></html:option>
                <html:option value="3"><bean:message key="text.allow"/> <bean:message key="text.iprange"/></html:option>
            </html:select>
        </div>    
    </div>                             
    <div class="cleared"></div> 
    <div class="resource1">
        <div class="resource_left"><bean:message key="text.sourceip"/></div>
        <div class="resource_left"><html:text style="textbox" property="txtSourceIP" maxlength="15" value=""/></div>
        <div class="resource_left" id="divDestinationip" ><bean:message key="text.destinationip"/></div>
        <div class="resource_left"><html:text style="textbox" property="txtDestinationIP" maxlength="15" value=""/></div>         
    </div>                             
    <div class="cleared"></div>      
    <html:submit property="btnSubmit" onclick="beforeValidation()" disabled="true"><bean:message key="text.buttoncreate"/></html:submit><noscript><bean:message key="text.noscript"/></noscript>
    <html:javascript formName="CreateIPForm"/>    
</html:form>
<script type="text/javascript">
    function init()
    {
        document.CreateIPForm.btnSubmit.disabled=false;
        document.getElementsByName("txtDestinationIP")[0].style.display = "none";
        document.getElementById("divDestinationip").style.display = "none";
    }
    function beforeValidation()
    {
        if(document.getElementsByName("dropStatus")[0].value==0 || document.getElementsByName("dropStatus")[0].value==2)
        {
            document.getElementsByName("txtDestinationIP")[0].value=document.getElementsByName("txtSourceIP")[0].value;
        }       
    } 
    function singleip()
    {
        if(document.getElementsByName("dropStatus")[0].value==0 || document.getElementsByName("dropStatus")[0].value==2)
        {
            document.getElementsByName("txtDestinationIP")[0].style.display = "none";
            document.getElementById("divDestinationip").style.display = "none";
        }
        if(document.getElementsByName("dropStatus")[0].value==1 || document.getElementsByName("dropStatus")[0].value==3)
        {
            document.getElementsByName("txtDestinationIP")[0].style.display = "block";
            document.getElementById("divDestinationip").style.display = "block";
        }        
    }     
</script>      
<%}}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>