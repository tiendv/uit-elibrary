<%-- 
    Document   : thesis
    Created on : Jan 16, 2012, 11:08:17 PM
    Author     : Nguyen Hoang Tan
--%>
<%@page import="uit.elib.utility.CheckGroupDetail"%>
<%
boolean allow=false;
String username = null;
if(session.getAttribute("username")!=null)
    username = (String)session.getAttribute("username");
CheckGroupDetail checkGroupDetail = new CheckGroupDetail();
if(checkGroupDetail.GroupDetail(username,2,1)==true)
{
    allow=true; 
%>
<%@page import="uit.elib.dto.Level"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="uit.elib.dto.Faculty"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.Resource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<% 
    List<Resource> listResource =  (List<Resource>)request.getAttribute("listResource");
    List<Level> listLevel =  (List<Level>)request.getAttribute("listLevel");
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
        language=2; // VietNamese
    int year;
    Boolean haveThesis;
    Boolean lastIndex=false;
    if(listResource.size()>0){
    int r=0;                     
    for(int l=0;l<listLevel.size();l++){
        haveThesis=true;
        if(language==1) { %>
            <div class="title_h5"><%=listLevel.get(l).getLevelNameEn() %></div>  <!--English Level Name-->
        <% } %> 
        <% if(language==2) {%>
            <div class="title_h5"><%=listLevel.get(l).getLevelNameVn() %></div> <!--Vietnamese Level Name-->
        <% } %>         
        <%
           if(listResource.get(r).getLevel().getLevelId()!=listLevel.get(l).getLevelId()){
               haveThesis=false;
        %>
            <div class="thesis_update">
                <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                <bean:message key="text.updating"/>
            </div>
         <%  }
            while(listResource.get(r).getLevel().getLevelId()==listLevel.get(l).getLevelId()&&lastIndex==false){
                year=listResource.get(r).getYear();
                String thesisID="";
         %> 
            <div class="year"><bean:message key="text.year"/> <%=year%></div>
            <table class="thesis_table"> 
            <%                 
                for(int i=r;i<listResource.size();i=i+2) {
                    if(listResource.get(i).getLevel().getLevelId()!=listLevel.get(l).getLevelId() || year!=listResource.get(i).getYear())
                        break;
                    thesisID = thesisID+listResource.get(i).getResourceId()+",";
            %>
            <tr>      
            <td class="thesis_row">              
                    <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                    <% if(language==1) { %>
                        <a href ="#<%=listResource.get(i).getResourceId()%>" class="href_subject" onclick="displayDetail('currentSeeAllL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','L<%=listLevel.get(l).getLevelId()%>Y<%=year%>',<%=listResource.get(i).getResourceId()%>)" > <%=listResource.get(i).getResourceNameEn()%>  </a> <!--English Resource Name-->
                    <% } %> 
                    <% if(language==2) {%>
                        <a href ="#<%=listResource.get(i).getResourceId()%>" class="href_subject" onclick="displayDetail('currentSeeAllL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','L<%=listLevel.get(l).getLevelId()%>Y<%=year%>',<%=listResource.get(i).getResourceId()%>)" ><%=listResource.get(i).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                    <% } %>                         
            </td>
            <td class="thesis_row">
                <% if(i+1<listResource.size() && (listResource.get(i+1).getLevel().getLevelId()==listLevel.get(l).getLevelId()) && (year==listResource.get(i+1).getYear())){ %>
                    <img src="image/black-arrow.gif" class="image_black_arrow" alt="black-arrow"/>
                    <% if(language==1) {%>
                        <a href ="#<%=listResource.get(i+1).getResourceId()%>" class="href_subject" onclick="displayDetail('currentSeeAllL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','L<%=listLevel.get(l).getLevelId()%>Y<%=year%>',<%=listResource.get(i+1).getResourceId()%>)" > <%=listResource.get(i+1).getResourceNameEn()%> </a> <!--English Resource Name-->
                    <% } %> 
                    <% if(language==2) {%>
                        <a href ="#<%=listResource.get(i+1).getResourceId()%>" class="href_subject" onclick="displayDetail('currentSeeAllL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','L<%=listLevel.get(l).getLevelId()%>Y<%=year%>',<%=listResource.get(i+1).getResourceId()%>)" > <%=listResource.get(i+1).getResourceNameVn()%> </a> <!--Vietnamese Resource Name-->
                    <% } %>
                    <%thesisID = thesisID+listResource.get(i+1).getResourceId()+",";%>
                <% } %>    
            </td>
            </tr>
            <% } %>
        </table>
        <table class="table_thesis" id="L<%=listLevel.get(l).getLevelId()%>Y<%=year%>">
            <tr class="color_title_table">
                <td class="td_chapter_1"><bean:message key="text.ordernumber"/></td>
                <td class="td_chapter_2"><bean:message key="text.thesisname"/></td>
                <td class="td_chapter_3"><bean:message key="text.mark"/></td>                
                <td class="td_chapter_4"></td>                
            </tr>
            <%  
               int color=0;
               int number =0;
               for(int i=r;i<listResource.size();i++) {
                   String href="./LoadThesisDetail.do?thesisID="+listResource.get(i).getResourceId();
                   if(listResource.get(i).getLevel().getLevelId()!=listLevel.get(l).getLevelId()|| year!=listResource.get(i).getYear())
                   {     
                        r=i;
                        break;
                   }
            %>
            <% Date date = new Date();
               boolean oneMonth = false; 
               if(listResource.get(i).getPostDate()!=null)
               {
                   long time= date.getTime()- listResource.get(i).getPostDate().getTime(); // time = today - postdate
                   if(time<=((long)30*24*60*60*1000)) // time <= 30 days
                       oneMonth=true;
               }                    
            %>
           <tr id="<%=listResource.get(i).getResourceId()%>" class="none">    
                <td <% if(color%2==0){ %>class="td_chapter_1_content_even"<%}%> 
                    <% if(color%2!=0){ %>class="td_chapter_1_content_odd"<%}%> >
                    <%=++number%> 
                </td>  
                <% if(language==1) {%>                              
                    <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                        <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                        <a href="<%=href%>" class="href_subject" name="<%=listResource.get(i).getResourceId()%>"><%=listResource.get(i).getResourceNameEn() %></a> <!--English Resource Name-->
                    </td>
                <% } %> 
                <% if(language==2) {%>                               
                    <td <% if(color%2==0){ %>class="td_chapter_2_content_even"<%}%> 
                        <% if(color%2!=0){ %>class="td_chapter_2_content_odd"<%}%> >
                        <a href="<%=href%>" class="href_subject" name="<%=listResource.get(i).getResourceId()%>"><%=listResource.get(i).getResourceNameVn() %></a> <!--Vietnamese Resource Name-->
                    </td>
                <% } %>
                <td <% if(color%2==0){ %>class="td_chapter_3_content_even"<%}%> 
                    <% if(color%2!=0){ %>class="td_chapter_3_content_odd"<%}%> >
                    <%=listResource.get(i).getMark()%>
                </td>
                <td <% if(color%2==0){ %>class="td_chapter_4_content_even"<%}%> 
                    <% if(color%2!=0){ %>class="td_chapter_4_content_odd"<%}%> >
                    <% if(oneMonth==true) {%>
                        <img src="image/new-icon.gif" class="image_newicon" alt="new-icon"/> <!-- new icon  -->
                    <% } %>
                </td>
            </tr >
            <% color ++; 
               if(i+1>=listResource.size()) 
                   lastIndex=true;
            } %>
        </table> 
<% if(haveThesis) {%>
<input type="hidden" id="currentSeeAllL<%=listLevel.get(l).getLevelId()%>Y<%=year%>" value="0"/>
<div class="seealldetail" id="seeAllDetailL<%=listLevel.get(l).getLevelId()%>Y<%=year%>" onclick="seeAllDetail('currentSeeAllL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','seeAllDetailL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','closeAllDetailL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','L<%=listLevel.get(l).getLevelId()%>Y<%=year%>','<%=thesisID%>')"><a class="href_subject"><bean:message key="text.seealldetail"/></a></div>
<div class="closealldetail" id="closeAllDetailL<%=listLevel.get(l).getLevelId()%>Y<%=year%>" onclick="closeAllDetail('currentSeeAllL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','seeAllDetailL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','closeAllDetailL<%=listLevel.get(l).getLevelId()%>Y<%=year%>','L<%=listLevel.get(l).getLevelId()%>Y<%=year%>','<%=thesisID%>')"><a class="href_subject"><bean:message key="text.closealldetail"/></a></div>   
<% } %>            
<%}}}%>
<%}%>
<%if(allow==false){%>
<jsp:include page="../jsp/wrongpage.jsp" flush="true"/>
<%}%>
<input type="hidden" id="currentLevelYear" value="-1"/>
<input type="hidden" id="currentThesisID" value="-1"/>
<script type="text/javascript">
    function displayDetail(currentSeeAll,levelYear,thesisID)
    {
        var csa= document.getElementById(currentSeeAll).value;
        if(csa==0)
        {   
            var t= document.getElementById("currentThesisID").value;
            var l= document.getElementById("currentLevelYear").value;
            if(l!=levelYear)
            {
                document.getElementById(levelYear).style.display = "block";
                if(l>-1)
                    document.getElementById(l).style.display = "none";
                document.getElementById("currentLevelYear").value=levelYear;
            }           
            if(t!=thesisID)
            {
                document.getElementById(thesisID).style.display = "table-row";
                if(t>-1)
                    document.getElementById(t).style.display = "none";
                document.getElementById("currentThesisID").value=thesisID;
            }     
            setContent(); 
        }            
    }
    function seeAllDetail(currentSeeAll,seealldetail,closeAllDetail,levelYear,manyResourceID)
    {
        var thesisID = manyResourceID.split(',');
        document.getElementById(levelYear).style.display = "block";
        for(var i=0;i<thesisID.length-1;i++)
            document.getElementById(thesisID[i]).style.display = "table-row";
        document.getElementById(seealldetail).style.display = "none";  
        document.getElementById(closeAllDetail).style.display = "block";
        document.getElementById(currentSeeAll).value=1;
        document.getElementById("currentLevelYear").value=-1;
        document.getElementById("currentThesisID").value=-1;
        setContent();  
    }
    function closeAllDetail(currentSeeAll,seealldetail,closeAllDetail,levelYear,manyResourceID)
    {
        var thesisID = manyResourceID.split(',');
        document.getElementById(levelYear).style.display = "none";
        for(var i=0;i<thesisID.length-1;i++)
            document.getElementById(thesisID[i]).style.display = "none";
        document.getElementById(seealldetail).style.display = "block";  
        document.getElementById(closeAllDetail).style.display = "none";
        document.getElementById(currentSeeAll).value=0;
        setContent();          
    }    
</script>
