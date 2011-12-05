<%-- 
    Document   : leftmenu
    Created on : Nov 16, 2011, 9:26:30 AM
    Author     : tiendv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page import="uit.elib.bo.FacultyBO" %>
<%@page import="uit.elib.bo.SubjectCategoryBO" %>
<!DOCTYPE html>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
    <% %>
        <tr>
            <td >&nbsp;</td>
          </tr>
        <tr>
            <td  class="leftmenu_td_title"><bean:message key="text.menu.subject"/></td>
 	        </tr>
            <tr>
                <td class="leftmenu_td_link"><a href="./LoadBase.do"><bean:message key="text.leftmenu.base"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="./LoadFaculty.do"><bean:message key="text.leftmenu.faculty"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="./LoadOptional.do"><bean:message key="text.leftmenu.optional"/></a></td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
        <tr>
            <td  class="leftmenu_td_title" ><bean:message key="text.menu.thesis"/></td>
 	        </tr>
            <tr>
                <td class="leftmenu_td_link"><a href="#"><bean:message key="text.leftmenu.computerscience"/></a></td>
          </tr>
           <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message key="text.leftmenu.softwareengineering"/></a></td>
          </tr>
          
          <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message key="text.leftmenu.informationsystem"/></a></td>
          </tr>
           <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message key="text.leftmenu.computertechnical"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message key="text.leftmenu.computernetwork"/></a></td>
          </tr>
</table>