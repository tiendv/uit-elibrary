<%-- 
    Document   : content
    Created on : Nov 14, 2011, 2:03:22 PM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="<html:rewrite page='/css/featuredcontentglider.css'/>" />
<script type="text/javascript" src="<html:rewrite page='/js/featuredcontentglider.js'/>"></script>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
    <tr>
        <td class="td_slide_show">
            <div class="fn_image">
            <script type="text/javascript" src="js/ja.js"></script>
            <script type="text/javascript">fadetime = 4000;</script>
            <div id="ja_header_jsfade" class="ja_header_jsfade">
            <img src="image/IMG_01.jpg" alt="" title="" class="advertising">
            <img src="image/IMG_02.jpg" alt="" title="" class="advertising">
            <img src="image/IMG_03.jpg" alt="" title="" class="advertising">
            <img src="image/IMG_04.jpg" alt="" title="" class="advertising">
            </div>
            </div>
        </td>
    </tr>
</table>
<table width="100%" border="0" cellspacing="5" cellpadding="2">    
    <tr>
        <td align="left" valign="top" class="td_course_item">
            <% 
                List<News> listNews = (List<News>)request.getAttribute("listNews");
                int language =1; // English
                if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
                    language=2; // VietNamese                
                if(listNews.size()>0){%>
                <script type="text/javascript">
                featuredcontentglider.init({
                        gliderid: "canadaprovinces", //ID of main glider container
                        contentclass: "glidecontent", //Shared CSS class name of each glider content
                        togglerid: "p-select", //ID of toggler container
                        remotecontent: "", //Get gliding contents from external file on server? "filename" or "" to disable
                        selected: 0, //Default selected content index (0=1st)
                        persiststate: false, //Remember last content shown within browser session (true/false)?
                        speed: 500, //Glide animation duration (in milliseconds)
                        direction: "rightleft", //set direction of glide: "updown", "downup", "leftright", or "rightleft"
                        autorotate: true, //Auto rotate contents (true/false)?
                        autorotateconfig: [5000, 0] //if auto rotate enabled, set [milliseconds_btw_rotations, cycles_before_stopping]
                })
                </script>
                <div id="canadaprovinces" class="glidecontentwrapper">
                    <% 
                        int size=listNews.size();
                        if(size>5)
                            size =5;
                        for(int i=0;i<size;i++) {
                            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy - HH:mm");
                            String postDate = simpleDateFormat.format(listNews.get(i).getPostDate());                            
                    %>
                        <div class="glidecontent">
                            <% if(language==1) { %>
                                <div class="greyrightcontent"><%=postDate%></div>
                                <div class="newstitle"><a style="color: #b8262b" href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><%=listNews.get(i).getNewsTitleEn()%></a></div>
                                <%
                                String imageLink = "./image/news.jpg";
                                if(listNews.get(i).getNewsImage()!=null){ 
                                     imageLink = "./upload/"+listNews.get(i).getNewsImage().toString();%>                                                     
                                <%}%>
                                <div class="newscontent"><a href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                                <div class="newsheadline"><%=listNews.get(i).getNewsHeadlineEn()%></div>
                            <%}%>
                            <% if(language==2) { %>
                                <div class="greyrightcontent"><%=postDate%></div>
                                <div class="newstitle"><a style="color: #b8262b" href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><%=listNews.get(i).getNewsTitleVn()%></a></div>
                                <%
                                String imageLink = "./image/news.jpg";
                                if(listNews.get(i).getNewsImage()!=null){ 
                                     imageLink = "./upload/"+listNews.get(i).getNewsImage().toString();%>                                                     
                                <%}%>
                                <div class="newscontent"><a href="./LoadNews.do?newsID=<%=listNews.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                                <div class="newsheadline"><%=listNews.get(i).getNewsHeadlineVn()%></div>
                            <%}%>                        
                        </div>
                    <%}%>
                </div>
                <div id="p-select" class="glidecontenttoggler">
                <a href="#" class="prev"><img border="0" src="image/icon_pre.jpg" /></a>
                <%      
                    for(int i=0;i<size;i++) {%>
                    <a href="#" class="toc"><%=i+1%></a>
                <%}%>
                <a href="#" class="next"><img border="0" src="image/icon_next.jpg" /></a>
                </div>
            <%}%>
        </td>
        <td align="left" valign="top">
            <table width="100%" border="0" cellspacing="2" cellpadding="2">
                <tr>
                    <td class="title_h3">Các đơn vị tham gia</td>
                </tr>
                <tr>
                    <td><img src="image/uit.png" width="100%" /></td>
                </tr>
                <tr>
                    <td><img src="image/isatd.png"  width="100%" /></td>
                </tr>
                <tr>
                    <td><img src="image/ntt.png" width="100%" /></td>
                </tr>
                <tr>
                    <td><img src="image/stu.png" width="100%" /></td>
                </tr>
                <tr>
                    <td><img src="image/duytan.png" width="100%"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>      
        </td>
    </tr>
</table>