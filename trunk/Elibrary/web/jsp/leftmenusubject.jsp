<%-- 
    Document   : leftmenusubject
    Created on : Nov 21, 2011, 9:13:39 AM
    Author     : tiendv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <%
                int subjectID, resourcecategoryID, orderChapter ;
                subjectID =Integer.parseInt(request.getParameter("subjectID")); // lấy giá trị của subjectID từ action truyền qua
                resourcecategoryID =Integer.parseInt(request.getParameter("resourceCategoryID")); // lấy giá trị của resourceCategoryID từ action truyền qua
                orderChapter = Integer.parseInt(request.getParameter("orderChapter")); // lấy giá trị của orderChapter từ action truyền qua
                String href = "SubjectCategory.do?subjectID="+subjectID+
                        "&orderChapter="+orderChapter+
                        "&resourceCategoryID=";
            %>
             <tr>
            <td class="leftmenu_td_link"><a href="SubjectHome.do?subjectID=<%=subjectID%>"><bean:message  key="text.menu.subjecthome"/></a></td>
          </tr>
            <tr>
            <td class="leftmenu_td_link"><a href="#"><bean:message  key="text.menu.syllabus"/></a></td>
          </tr>
          <tr>
            
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=10&orderChapter=<%=orderChapter%>" > <bean:message  key="text.menu.lecturenote"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=9&orderChapter=<%=orderChapter%>"> <bean:message  key="text.menu.reading"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=10&orderChapter=<%=orderChapter%>"><bean:message  key="text.menu.assignments"/></a></td>
          </tr>
          <tr>
            <td class="leftmenu_td_link"><a href="SubjectCategory.do?subjectID=<%=subjectID%>&resourceCategoryID=6&orderChapter=<%=orderChapter%>"><bean:message  key="text.menu.project"/></a></td>
          </tr>
          <tr>
            <td >&nbsp;</td>
          </tr>
 </table>
