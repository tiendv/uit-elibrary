<%-- 
    Document   : news
    Created on : Jan 26, 2012, 11:38:30 PM
    Author     : Nguyen Hoang Tan
--%>

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
%>
<%  if(language==1){%>
    <div class="newstitle"><%=listNews.get(0).getNewsTitleEn()%></div>
    <%String imageLink = "./image/news.jpg";
    if(listNews.get(0).getNewsImage()!=null) 
         imageLink = "./upload/"+listNews.get(0).getNewsImage().toString();%>                                                      
    <div class="center"><img src="<%=imageLink%>" class="imagenews"/></div>
    <div class="left"><%=listNews.get(0).getNewsContentEn()%></div>
<%}%>
<%  if(language==2){%>
    <div class="newstitle"><%=listNews.get(0).getNewsTitleVn()%></div>
    <%String imageLink = "./image/news.jpg";
    if(listNews.get(0).getNewsImage()!=null) 
         imageLink = "./upload/"+listNews.get(0).getNewsImage().toString();%>                                                      
    <div class="center"><img src="<%=imageLink%>" class="imagenews"/></div>
    <div class="left"><%=listNews.get(0).getNewsContentVn()%></div>
<%}}%>


