<%-- 
    Document   : lecturenote
    Created on : Dec 1, 2012, 8:27:49 AM
    Author     : HERO
--%>

<%@page import="uit.elib.entities.Resource"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    List<Resource> listResource; // List resource of subject ( not chapter)
                    List<Resource> listChapter; // List Chapter of Subject
                    listResource = (List<Resource>)request.getAttribute("listResource");
                    listChapter = (List<Resource>)request.getAttribute("listChapter");
                    int orderChapter = Integer.parseInt(request.getAttribute("orderChapter").toString());
                    int subjectID = Integer.parseInt(request.getAttribute("subjectID").toString());
                    int resourceCategoryID = Integer.parseInt(request.getAttribute("resourceCategoryID").toString());
                    int language =1; // English
                    Locale locale = request.getLocale();
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
                    int color=1;
        %>
        
        <!-- Bengin load rerource by OrderChapter (ResourceCategoryID= 10, giáo trình) -->
        <%if(resourceCategoryID==10) {%>
        
        <div><a href="materialPage.do">Giáo Trình</a> > <a href="generalinformationPage.do">Tin Học Đại Cương</a> > Bài Giảng</div>
        <table cellspacing="0" style="border: 1px #B4B1A2 solid ; margin-left: 17px " width="738px"  >
            <tr  style="background-color:#B4B1A2; color: #680a12"  height="30px"> <!-- title -->
                <td width="80px"><bean:message key="text.OrderChapter" /></td>
                <td width="230px"><bean:message key="text.ChapterTitle" /></td>
                <td width="330px"><bean:message key="text.Summary" /></td>
                <td width="98px"><bean:message key="text.Document" /></td>
            </tr>
            <tr><br></br><br></br></tr>
        <% 
                    
                    for(int i = 0; i<listChapter.size();i++){
        %>
        <tr>
            <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%> > 
                               <%=listChapter.get(i).getOderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%> >              
                        <% if(language==1) {%>
                        <p>  <%=listChapter.get(i).getResourceName()%> </p>
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listChapter.get(i).getResourceNameVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%> >              
                        <% if(language==1) {%>
                            <%=listChapter.get(i).getSummary()%> 
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listChapter.get(i).getSummaryVn()%>
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>  >
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listChapter.get(i).getOderChapter().toString())== Integer.parseInt(listResource.get(k).getOderChapter().toString()))
                           {%>
                    <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" > <%=listResource.get(k).getFormat() %> </a>
                    <%}%>
             </td>
             <%color++;%>
        </tr>
                <%}%>
        </table>
        <%}%>  <!--End of ResourceCategoryID=10  IF -->
        
        
        <!--End of ResourceCategoryID= 10, giáo trình -->
        
        <!--Begin Load Reading ( ResourceCategoryID=9, tài liệu tham khảo) -->
        
        <%if(resourceCategoryID==9) {%>
        <div><a href="materialPage.do">Giáo Trình</a> > <a href="generalinformationPage.do">Tin Học Đại Cương</a> > Tài liệu tham khảo</div>
        <table cellspacing="0" style="border: 1px #B4B1A2 solid ; margin-left: 17px " width="738px" >
            <tr style="background-color:#B4B1A2; color: #680a12"  height="30px">
                <td width="100px"><bean:message key="text.OrderNumber"/> </td>
                <td width="638px"><bean:message key="text.Document"/> </td>
            </tr>
            <tr><br></br><br></br></tr>
                <%
                    int count = 1; //thứ tự
                    for(int i = 0; i<listResource.size();i++){
                 %>
                 <tr>
                 <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>>
                     <%=count%></td>
                 <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>>
                     <% if(language==1) {%>
                        <%=listResource.get(i).getResourceName()%>
                     <%}%>
                     <% if(language==2) {%>
                        <%=listResource.get(i).getResourceNameVn()%>
                     <%}%>
                 </td>
                 <% count++;%>
                 <%color++;%>
                 <%}%>
            </tr>
         </table>
        <%}%> <!--End of ResourceCategoryID=9 IF -->
        
    </body>
</html>
