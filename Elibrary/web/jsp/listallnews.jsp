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
<!DOCTYPE html>
<%
    List<News> listNews = (List<News>)request.getAttribute("listNews");
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language = 2; // VietNamese
    if(listNews.size()>0){
    for(int i=0;i<listNews.size();i++){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        Date date = listNews.get(i).getPostDate();
        String postDate = simpleDateFormat.format(date);              
%>
<%  if(language==1){%>
<div class="newstitle2"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><%=listNews.get(i).getNewsTitleEn()%></a></div>
<div class="grey"><%=postDate%></div>
    <%String imageLink = "./image/news.jpg";
    if(listNews.get(i).getNewsImage()!=null) 
         imageLink = "./upload/"+listNews.get(i).getNewsImage().toString();%> 
    <div style="width: 500px">     
        <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="smallimage"/></a></div>
        <div class="leftheadlinenews"><%=listNews.get(i).getNewsHeadlineEn()%></div>
    </div>
    <div class="cleared"></div>
<%}%>
<%  if(language==2){%>
    <div class="newstitle2"><a class="linkcolor" href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><%=listNews.get(i).getNewsTitleVn()%></a></div>
    <div class="grey"><%=postDate%></div>
    <%String imageLink = "./image/news.jpg";
    if(listNews.get(i).getNewsImage()!=null) 
         imageLink = "./upload/"+listNews.get(i).getNewsImage().toString();%>                                                      
         <div style="width: 500px">
             <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="smallimage"/></a></div>
             <div class="leftheadlinenews"><%=listNews.get(i).getNewsHeadlineVn()%></div>
         </div>
         <div class="cleared"></div>    
<%}}}%>
    