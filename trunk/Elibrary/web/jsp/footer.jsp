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
            <ol class="ol">
                <li class="footerli"><a class="footerhyperlink" href="jsp/help.jsp"><bean:message key="text.help"/></a> | </li>
                <li class="footerli"><a class="footerhyperlink" href="jsp/paq.jsp"><bean:message key="text.faq"/></a> | </li>
                <li class="footerli"><a class="footerhyperlink" href="jsp/about.jsp"><bean:message key="text.about"/></a> | </li>
                <li class="footerli"><a class="footerhyperlink" href="jsp/contact.jsp"><bean:message key="text.contact"/></a> | </li>
                <li class="footerli"><a class="footerhyperlink" href="jsp/privacystatement.jsp"><bean:message key="text.privacystatement"/></a> - 
                    <a><b><bean:message key="text.copyright"/></b></a>
                </li>
            </ol>
                    <ol class="ol"><bean:message key="text.uit"/> <br/></ol>
             <ol class="ol"><bean:message key="text.uit.address"/></ol>
        </div>
</div>