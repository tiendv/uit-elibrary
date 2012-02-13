<%-- 
    Document   : content
    Created on : Nov 14, 2011, 2:03:22 PM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.News"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> 
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="<html:rewrite page='/css/featuredcontentglider.css'/>" />
<script type="text/javascript" src="<html:rewrite page='/js/featuredcontentglider.js'/>"></script>
<div class="slide_show">
    <script type="text/javascript" src="js/ja.js"></script>
    <script type="text/javascript">fadetime = 4000;</script>
    <div id="ja_header_jsfade" class="ja_header_jsfade">
        <img src="image/IMG_01.jpg" alt="" title="" class="advertising">
        <img src="image/IMG_02.jpg" alt="" title="" class="advertising">
        <img src="image/IMG_03.jpg" alt="" title="" class="advertising">
        <img src="image/IMG_04.jpg" alt="" title="" class="advertising">
    </div>
</div> 
<%
    List<News> listNewsCate1 = (List<News>)request.getAttribute("listNewsCate1");
    List<News> listNewsCate2 = (List<News>)request.getAttribute("listNewsCate2");
    int language =1; // English
    if(request.getSession().getAttribute(Globals.LOCALE_KEY).toString().equals("vn"))
        language=2; // VietNamese   
%>
<div class="divcontent">
    <div class="td_course_item">
        <%              
            if(listNewsCate1.size()>0){%>
            <script type="text/javascript">
            featuredcontentglider.init({
                    gliderid: "canadaprovinces", //ID of main glider container
                    contentclass: "glidecontent", //Shared CSS class name of each glider content
                    togglerid: "p-select", //ID of toggler container
                    remotecontent: "", //Get gliding contents from external file on server? "filename" or "" to disable
                    selected: 0, //Default selected content index (0=1st)
                    persiststate: false, //Remember last content shown within browser session (true/false)?
                    speed: 1500, //Glide animation duration (in milliseconds)
                    direction: "rightleft", //set direction of glide: "updown", "downup", "leftright", or "rightleft"
                    autorotate: true, //Auto rotate contents (true/false)?
                    autorotateconfig: [8000, 0] //if auto rotate enabled, set [milliseconds_btw_rotations, cycles_before_stopping]
            })
            </script>
            <div id="canadaprovinces" class="glidecontentwrapper">
            <div class="newscategory1"><bean:message key="text.newbook"/></div>    
                <% 
                    for(int i=0;i<listNewsCate1.size();i++) {                     
                %>
                    <div class="glidecontent">
                        <% if(language==1) { %>
                            <div class="newstitle"><a style="color: #b8262b" href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><%=listNewsCate1.get(i).getNewsTitleEn()%></a></div>
                            <%
                            String imageLink = "./image/news.jpg";
                            if(listNewsCate1.get(i).getNewsImage()!=null){ 
                                 imageLink = "./upload/"+listNewsCate1.get(i).getNewsImage().toString();%>                                                     
                            <%}%>
                            <div class="newscontent"><a href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                            <div class="newsheadline"><%=listNewsCate1.get(i).getNewsHeadlineEn()%></div>
                        <%}%>
                        <% if(language==2) { %>
                            <div class="newstitle"><a style="color: #b8262b" href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><%=listNewsCate1.get(i).getNewsTitleVn()%></a></div>
                            <%
                            String imageLink = "./image/news.jpg";
                            if(listNewsCate1.get(i).getNewsImage()!=null){ 
                                 imageLink = "./upload/"+listNewsCate1.get(i).getNewsImage().toString();%>                                                     
                            <%}%>
                            <div class="newscontent"><a href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                            <div class="newsheadline"><%=listNewsCate1.get(i).getNewsHeadlineVn()%></div>
                        <%}%>                        
                    </div>
                <%}%>
            </div>
            <div id="p-select" class="glidecontenttoggler">
            </div>
        <%}%>
    </div>
    <div class="newscate2">
        <div class="linenewscategory"></div>
        <div class="newscategory2"><bean:message key="text.announcements"/></div>
        <%              
            if(listNewsCate2.size()>0){%>
                <% 
                    for(int i=0;i<listNewsCate2.size();i++) {                     
                %>
                        <% if(language==1) { %>
                            <div class="newstitle"><a class="newslink" href="./LoadNews.do?newsID=<%=listNewsCate2.get(i).getNewsId()%>"><%=listNewsCate2.get(i).getNewsTitleEn()%></a></div>
                            <%
                            String imageLink = "./image/news.jpg";
                            if(listNewsCate2.get(i).getNewsImage()!=null){ 
                                 imageLink = "./upload/"+listNewsCate2.get(i).getNewsImage().toString();%>                                                     
                            <%}%>
                            <div class="newscontent"><a href="./LoadNews.do?newsID=<%=listNewsCate2.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                            <div class="newsheadline"><%=listNewsCate2.get(i).getNewsHeadlineEn()%></div>
                        <%}%>
                        <% if(language==2) { %>
                            <div class="newstitle"><a class="newslink" href="./LoadNews.do?newsID=<%=listNewsCate2.get(i).getNewsId()%>"><%=listNewsCate2.get(i).getNewsTitleVn()%></a></div>
                            <%
                            String imageLink = "./image/news.jpg";
                            if(listNewsCate2.get(i).getNewsImage()!=null){ 
                                 imageLink = "./upload/"+listNewsCate2.get(i).getNewsImage().toString();%>                                                     
                            <%}%>
                            <div class="newscontent"><a href="./LoadNews.do?newsID=<%=listNewsCate2.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                            <div class="newsheadline"><%=listNewsCate2.get(i).getNewsHeadlineVn()%></div>
                        <%}%>                        
                <%}%>
        <%}%>
    </div> 
    </div> 
    <div class="table_advertising">
        <div>
            <div class="title_h3">Các đơn vị tham gia</div>
        </div>
        <div>
            <div class="imagead"><img src="image/uit.png" class="imageadvertising"/></div>
        </div>
        <div>
            <div class="imagead"><img src="image/isatd.png"  class="imageadvertising" /></div>
        </div>
        <div>
            <div class="imagead"><img src="image/ntt.png" class="imageadvertising" /></div>
        </div>
        <div>
            <div class="imagead"><img src="image/stu.png" class="imageadvertising" /></div>
        </div>
        <div>
            <div class="imagead"><img src="image/duytan.png" class="imageadvertising"/></div>
        </div>
        <div>
            <div class="imagead"><img src="image/giadinh.png" class="imageadvertising"/></div>
        </div>
        <div>
            <div class="imagead"><img src="image/hutech.jpg" class="imageadvertising"/></div>
        </div>         
        <div>
            <div class="imagead"><img src="image/huflit.png" class="imageadvertising"/></div>
        </div>           
    </div>      

