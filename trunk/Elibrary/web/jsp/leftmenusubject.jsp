<%-- 
    Document   : leftmenusubject
    Created on : Nov 21, 2011, 9:13:39 AM
    Author     : tiendv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean-el" prefix="bean" %>
<!DOCTYPE html>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
            <td >&nbsp;</td>
          </tr>
        <tr>
 <td  class="leftmenu_td_title">Nội dung</td>
 	        </tr>
             <tr>
            <td class="leftmenu_td_link"><a href="generalinformationPage.do"><bean:message  key="text.menu.subjecthome"/></a></td>
          </tr>
            <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message  key="text.menu.syllabus"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do"><bean:message  key="text.menu.lecturenote"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message  key="text.menu.reading"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message  key="text.menu.assignments"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message  key="text.menu.project"/></a></td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
 </table>
