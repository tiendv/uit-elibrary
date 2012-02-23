<%-- 
    Document   : news
    Created on : Jan 26, 2012, 11:38:30 PM
    Author     : Nguyen Hoang Tan
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="uit.elib.dto.News"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<%
    List<News> listNews = (List<News>)request.getAttribute("listNews");
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
    if(listNews.size()>0){
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy - HH:mm");
    String postDate = simpleDateFormat.format(listNews.get(0).getPostDate());    
%>
<%  if(language==1){%>
    <div class="newstitle3"><%=listNews.get(0).getNewsTitleEn()%></div>
    <div class="grey"><%=postDate%></div>
    <div class="bold"><%=listNews.get(0).getNewsHeadlineEn()%></div>
    <%String imageLink = "./image/news.jpg";
    if(listNews.get(0).getNewsImage()!=null) 
         imageLink = "./upload/"+listNews.get(0).getNewsImage().toString();%>    
        <div class="leftimagenewsdetail"><img src="<%=imageLink%>" class="imagenewsdetail"/></div>
        <div class="leftcontentnews"><%=listNews.get(0).getNewsContentEn()%></div>  
<%}%>
<%  if(language==2){%>
    <div class="newstitle3"><%=listNews.get(0).getNewsTitleVn()%></div>
    <div class="grey"><%=postDate%></div>
    <div class="bold"><%=listNews.get(0).getNewsHeadlineVn()%></div>
    <%String imageLink = "./image/news.jpg";
    if(listNews.get(0).getNewsImage()!=null) 
         imageLink = "./upload/"+listNews.get(0).getNewsImage().toString();%>       
        <div class="leftimagenewsdetail"><img src="<%=imageLink%>" class="imagenewsdetail"/></div>
        <div class="leftcontentnews"><%=listNews.get(0).getNewsContentVn()%></div>
<%}%>
    <div class="cleared"></div>
    <%List<News> listNewNews = (List<News>)request.getAttribute("listNewNews");%>
    <%if(listNewNews.size()>0){%>
    <div class="box">
    <div class="font1"><bean:message key="text.newnews"/></div>     
    <%for(int i=0;i<listNewNews.size();i++){%>
        <%
            Date date = listNewNews.get(i).getPostDate();
            String postdate = simpleDateFormat.format(date);
        %>
        <%  if(language==1){%>
        <div class="boxcol">
            <div class="boxcol1"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listNewNews.get(i).getNewsId()%>"><%=listNewNews.get(i).getNewsTitleEn()%> (<%=postdate%>)</a></div> 
            <div class="boxcol2"><img src="image/new-icon.gif" class="image_newicon" alt="new-icon"/></div> <!-- new icon  -->
        </div>
        <%}%>
        <%  if(language==2){%>
        <div class="boxcol">
            <div class="boxcol1"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listNewNews.get(i).getNewsId()%>"><%=listNewNews.get(i).getNewsTitleVn()%> (<%=postdate%>)</a></div>
            <div class="boxcol2"><img src="image/new-icon.gif" class="image_newicon" alt="new-icon"/></div> <!-- new icon  -->
        </div>   
        <%}%>
        <div class="cleared"></div>
    <%}%>    
    </div>
    <%}%>
<%}%>    


