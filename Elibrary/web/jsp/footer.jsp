<%-- 
    Document   : footer
    Created on : Nov 14, 2011, 2:03:04 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<link rel="stylesheet" type="text/css" href="css/uit.css" />
<!DOCTYPE html>

<div class="footer" >
        <div  class="sub_footer_image"><img src="<bean:message key="image.uitlogo"/>" width="31" height="32" alt="<bean:message key="image.uitlogo.alttext"/>" longdesc="http://www.uit.edu.vn" /></div>
        <div class="sub_footer">
            <bean:message key="text.copyright"/><br />
            <bean:message key="text.uit"/> <br/>
            <bean:message key="text.uit.address"/>
        </div>
</div>