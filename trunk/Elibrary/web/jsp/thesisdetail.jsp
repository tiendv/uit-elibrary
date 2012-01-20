<%-- 
    Document   : thesisdetail
    Created on : Jan 20, 2012, 12:16:52 AM
    Author     : Nguyen Hoang Tan
--%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="uit.elib.dto.Faculty"%>
<%@page import="uit.elib.dto.Level"%>
<%@page import="uit.elib.dto.Resource"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thesis Detail</title>
    </head>
    <body>
        <% List<Resource> listResource = (List<Resource>)request.getAttribute("listResource"); 
           List<Level> listLevel = (List<Level>)request.getAttribute("listLevel"); 
           List<Faculty> listFaculty = (List<Faculty>)request.getAttribute("listFaculty"); 
           String Mb;
           DecimalFormat dec = new DecimalFormat("#.##");
           int language =1; // English
           if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                language = 2; // VietNamese
        %>    
        <div class="resource1">
            <div class="resource_left"><bean:message key="text.thesisname"/></div>
            <div class="resource_left">
                <%if(language==1) {%>  
                    <%=listResource.get(0).getResourceNameEn()%>
                <%}%>
                <%if(language==2) {%>  
                    <%=listResource.get(0).getResourceNameVn()%>
                <%}%>                
            </div>                   
        </div>
        <div class="cleared"></div>     
        <div class="resource1">
            <div class="resource_left"><bean:message key="text.level"/></div>
            <div class="resource_left">
                <%if(language==1) {%>  
                    <%=listLevel.get(0).getLevelNameEn()%>
                <%}%>
                <%if(language==2) {%>  
                    <%=listLevel.get(0).getLevelNameVn()%>
                <%}%>                
            </div>
            <div class="resource_left"><bean:message key="text.faculty"/></div>
            <div class="resource_left">
                <%if(language==1) {%>  
                    <%=listFaculty.get(0).getFacultyNameEn()%>
                <%}%>
                <%if(language==2) {%>  
                    <%=listFaculty.get(0).getFacultyNameVn()%>
                <%}%>                 
            </div>                    
        </div>
        <div class="cleared"></div>    
        <div class="resource1">
            <div class="resource_left"><bean:message key="text.author"/></div>
            <div class="resource_left"><%=listResource.get(0).getAuthor()%></div>
            <div class="resource_left"><bean:message key="text.teacher"/></div>
            <div class="resource_left"><%=listResource.get(0).getTeacher()%></div>                    
        </div>
        <div class="cleared"></div> 
        <div class="resource1">
            <div class="resource_left"><bean:message key="text.class"/></div>
            <div class="resource_left"><%=listResource.get(0).getClass_()%></div>
            <div class="resource_left"><bean:message key="text.school"/></div>
            <div class="resource_left"><%=listResource.get(0).getSchool()%></div>                    
        </div>
        <div class="cleared"></div> 
        <div class="resource1">
            <div class="resource_left"><bean:message key="text.year"/></div>
            <div class="resource_left"><%=listResource.get(0).getYear()%></div>
            <div class="resource_left"><bean:message key="text.schoolyear"/></div>
            <div class="resource_left"><%=listResource.get(0).getSchoolYear()%></div>                    
        </div>
        <div class="cleared"></div> 
        <div class="resource1">
            <div class="resource_left">
                <bean:message key="text.download"/>
            </div>
            <div class="resource_left">
                <div class="displayIcon"><a href="DownLoad.do?resourceID=<%=listResource.get(0).getResourceId()%>"></a></div>
            </div>
            <div class="resource_left">
                <bean:message key="text.uploadname"/>
            </div>
            <div class="resource_left">
                <%=listResource.get(0).getUploadName() %>
            </div>
        </div>
        <div class="cleared"></div>     
        <div class="resource1">
            <div class="resource_left">
                <bean:message key="text.downloadnumber"/>
            </div>
            <div class="resource_left">
                <%=listResource.get(0).getDownloadNumber()%>
            </div>
            <div class="resource_left">
                <bean:message key="text.size"/>
            </div>
            <div class="resource_left">
                <% 
                   Mb=dec.format(listResource.get(0).getSize()/1000000);  
                %>
                <%=Mb%>Mb     
            </div>
        </div>
        <div class="cleared"></div>               
        <div class="resource1">
            <bean:message key="text.thesissummary"/>                                 
        </div>
        <div class="resource1">
            <%if(language==1) {%>  
                <%=listResource.get(0).getSummaryEn()%>
            <%}%>
            <%if(language==2) {%>  
                <%=listResource.get(0).getSummaryVn()%>
            <%}%>            
        </div>                
    </body>
</html>
