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
<table width="100%"  border="0" cellspacing="2" cellpadding="2">
    <% %>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td  class="leftmenu_td_title"><bean:message key="text.subject"/></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadBase.do"><bean:message key="text.base"/></a></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadFaculty.do"><bean:message key="text.faculty"/></a></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadOptional.do"><bean:message key="text.optional"/></a></td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td  class="leftmenu_td_title" ><bean:message key="text.thesis"/></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadThesis.do?facultyID=1"><bean:message key="text.computerscience"/></a></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadThesis.do?facultyID=2"><bean:message key="text.softwareengineering"/></a></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadThesis.do?facultyID=3"><bean:message key="text.informationsystem"/></a></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadThesis.do?facultyID=4"><bean:message key="text.computertechnical"/></a></td>
    </tr>
    <tr>
        <td class="leftmenu_td_link"><a href="./LoadThesis.do?facultyID=5"><bean:message key="text.computernetwork"/></a></td>
    </tr>
</table>