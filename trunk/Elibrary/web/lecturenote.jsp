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
        
        <div><a href="materialPage.do">Giáo Trình</a> > <a href="generalinformationPage.do">Tin Học Đại Cương</a> > Bài Giảng</div>
        <table cellspacing="0" style="border: 1px #B4B1A2 solid ; margin-left: 17px " width="728px"  >
            <tr  style="background-color:#B4B1A2; color: #680a12" > <!-- title -->
                <td width="80px"><bean:message key="text.OrderChapter" /></td>
                <td width="200px"><bean:message key="text.ChapterTitle" /></td>
                <td width="300px"><bean:message key="text.Summary" /></td>
                <td width="92"><bean:message key="text.Document" /></td>
            </tr>
            <tr><br></br><br></br></tr>
        <% 
                    List<Resource> listResource;
                    listResource = (List<Resource>)request.getAttribute("listResource");
                    int language =1; // English
                    Locale locale = request.getLocale();
                    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                        language = 2; // VietNamese
                    int color=0;
                    for(int i = 0; i<listResource.size();i++){
        %>
        <tr>
            <%if(i==0){%> <!-- giá trị đầu tiên -->
            <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>"> 
                               <%=listResource.get(i).getOderChapter()%>
             </td>
             <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>">              
                        <% if(language==1) {%>
                        <p>  <%=listResource.get(i).getResourceName()%> </p>
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listResource.get(i).getResourceNameVn()%> 
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>">              
                        <% if(language==1) {%>
                            <%=listResource.get(i).getSummary()%> 
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listResource.get(i).getSummaryVn()%>
                        <% } %>                         
             </td>
             <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>">
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listResource.get(i).getOderChapter().toString())== Integer.parseInt(listResource.get(k).getOderChapter().toString()))
                           {%>
                    <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" > <%=listResource.get(k).getFormat() %> </a>
                    <%}%>
             </td>
             <%color++;%>
                <%}%>
             <!-- End of first value -->
             
             
             <% if(i<listResource.size()-1 && i >0) // ngăn tràn mảng khi j=i+1 và i k phải phần tử đầu tiên;             
                if(Integer.parseInt( listResource.get(i).getOderChapter().toString())!= Integer.parseInt( listResource.get(i-1).getOderChapter().toString())){%>
                <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>> 
                        <%=listResource.get(i).getOderChapter()%>     
                </td>
                <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>>              
                        <% if(language==1) {%>
                            <%=listResource.get(i).getResourceName()%> 
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listResource.get(i).getResourceNameVn()%> 
                        <% } %>                         
                </td>
                <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>>              
                        <% if(language==1) {%>
                            <%=listResource.get(i).getSummary()%> 
                        <% } %> 
                        <% if(language==2) {%>
                            <%=listResource.get(i).getSummaryVn()%> 
                        <% } %>                         
                </td>
                <td <% if(color%2==0){ %> 
                                    style="background-color:#E2E1D9"
                                <%}%>>
                    <%for(int k=0;k<listResource.size();k++)
                        if(Integer.parseInt(listResource.get(i).getOderChapter().toString())== Integer.parseInt(listResource.get(k).getOderChapter().toString()))
                           {%>
                           <a href="DownLoad.do?resourceID=<%=listResource.get(k).getResourceId()%>" > <%=listResource.get(k).getFormat() %> </a>
                    <%}%>
                </td>
                <%}%>
                
        </tr>
                <%}%>
        </table>
    </body>
</html>
