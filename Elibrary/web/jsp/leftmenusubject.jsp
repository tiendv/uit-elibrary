<%-- 
    Document   : leftmenusubject
    Created on : Nov 21, 2011, 9:13:39 AM
    Author     : tiendv
--%>

<%@page import="uit.elib.utility.IsNumber"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uit.elib.utility.IsNumber" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
            <td >&nbsp;</td>
          </tr>
        <tr>
            <td  class="leftmenu_td_title">Nội dung</td>
        </tr>
        <% int subjectID, orderChapter ; 
            IsNumber isnumber = new IsNumber(); // kiểm tra có phải là số không
        %>
        <%if(request.getParameter("subjectID")!= null && isnumber.checkInt(request.getParameter("subjectID")) ) // nếu khác rỗng và là số
            subjectID =Integer.parseInt(request.getParameter("subjectID").toString());
          else
            subjectID = 1;
        %>
        <%if(request.getParameter("orderChapter")!= null && isnumber.checkInt(request.getParameter("orderChapter"))) 
            orderChapter = Integer.parseInt(request.getParameter("orderChapter").toString());
        else
            orderChapter = 1;
        %>
        <%if(request.getParameter("resourceCategoryID")!= null && isnumber.checkInt(request.getParameter("resourceCategoryID"))) 
            orderChapter = Integer.parseInt(request.getParameter("resourceCategoryID").toString());
        else
            orderChapter = 1;
        %>
        <tr>
            <td class="leftmenu_td_link"><a href="SubjectIntroduction.do?subjectID=<%=subjectID%>"><bean:message  key="text.subjecthome"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="Syllabus.do?subjectID=<%=subjectID%>"><bean:message  key="text.syllabus"/></a></td>
        </tr>
        <tr>          
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=10&orderChapter=<%=orderChapter%>" > <bean:message  key="text.lecturenote"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=9&orderChapter=<%=orderChapter%>"> <bean:message  key="text.reading"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=4&orderChapter=<%=orderChapter%>"><bean:message  key="text.assignments"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=5&orderChapter=<%=orderChapter%>"><bean:message  key="text.example"/></a></td>
        </tr>
        <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=6&orderChapter=<%=orderChapter%>"><bean:message  key="text.project"/></a></td>
        </tr>
        <tr>
            <td >&nbsp;</td>
        </tr>
 </table>
