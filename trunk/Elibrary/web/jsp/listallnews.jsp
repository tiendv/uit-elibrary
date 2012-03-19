<%-- 
    Document   : listallnews
    Created on : Jan 27, 2012, 12:25:06 AM
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
    List<News> listBook = (List<News>)request.getAttribute("listBook");
    List<News> listAnnoun = (List<News>)request.getAttribute("listAnnoun");
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vi_VN"))
        language = 2; // VietNamese
%>
<div class="newscategory3"><bean:message key="text.book"/></div>
<%
    if(listBook.size()>0){
    for(int i=0;i<listBook.size();i++){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        Date date = listBook.get(i).getPostDate();
        String postDate = simpleDateFormat.format(date);              

 if(language==1){%>
    <%String imageLink = "./image/news.jpg";
    if(listBook.get(i).getNewsImage()!=null) 
         imageLink = "./upload/"+listBook.get(i).getNewsImage().toString();%> 
    <div class="newscontent1"> 
        <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listBook.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="smallimage"/></a></div>
        <div class="leftheadlinetitlenews2">
        <div class="newstitle2"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listBook.get(i).getNewsId()%>"><%=listBook.get(i).getNewsTitleEn()%></a></div>
        <div class="grey"><%=postDate%></div>                 
        <div class="newsheadline"><%=listBook.get(i).getNewsHeadlineEn()%></div>
        </div>
    </div>
    <div class="cleared"></div>
    <div class="line"></div>
<%}%>
<%  if(language==2){%>
    <%String imageLink = "./image/news.jpg";
    if(listBook.get(i).getNewsImage()!=null) 
         imageLink = "./upload/"+listBook.get(i).getNewsImage().toString();%>                                                      
         <div sclass="newscontent1">
             <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listBook.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="smallimage"/></a></div>
             <div class="leftheadlinetitlenews2">
                <div class="newstitle2"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listBook.get(i).getNewsId()%>"><%=listBook.get(i).getNewsTitleVn()%></a></div>
                <div class="grey"><%=postDate%></div>                 
                <div class="newsheadline"><%=listBook.get(i).getNewsHeadlineVn()%></div>
             </div>
         </div>
         <div class="cleared"></div>
         <p class="line"></p>
<%}}}%>
<div class="newscategory3"><bean:message key="text.announcements"/></div>
<%
   if(listAnnoun.size()>0){
    for(int i=0;i<listAnnoun.size();i++){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        Date date = listAnnoun.get(i).getPostDate();
        String postDate = simpleDateFormat.format(date);              
%>
<%  if(language==1){%>
    <%String imageLink = "./image/news.jpg";
    if(listAnnoun.get(i).getNewsImage()!=null) 
         imageLink = "./upload/"+listAnnoun.get(i).getNewsImage().toString();%> 
    <div class="newscontent1"> 
        <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listAnnoun.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="smallimage"/></a></div>
        <div class="leftheadlinetitlenews2">
        <div class="newstitle2"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listAnnoun.get(i).getNewsId()%>"><%=listAnnoun.get(i).getNewsTitleEn()%></a></div>
        <div class="grey"><%=postDate%></div>                 
        <div class="newsheadline"><%=listAnnoun.get(i).getNewsHeadlineEn()%></div>
        </div>
    </div>
    <div class="cleared"></div>
    <div class="line"></div>
<%}%>
<%  if(language==2){%>
    <%String imageLink = "./image/news.jpg";
    if(listAnnoun.get(i).getNewsImage()!=null) 
         imageLink = "./upload/"+listAnnoun.get(i).getNewsImage().toString();%>                                                      
         <div sclass="newscontent1">
             <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listAnnoun.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="smallimage"/></a></div>
             <div class="leftheadlinetitlenews2">
                <div class="newstitle2"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listAnnoun.get(i).getNewsId()%>"><%=listBook.get(i).getNewsTitleVn()%></a></div>
                <div class="grey"><%=postDate%></div>                 
                <div class="newsheadline"><%=listAnnoun.get(i).getNewsHeadlineVn()%></div>
             </div>
         </div>
         <div class="cleared"></div>
         <p class="line"></p>
<%}}}%>
       