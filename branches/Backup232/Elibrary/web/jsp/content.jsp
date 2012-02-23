<%-- 
    Document   : content
    Created on : Nov 14, 2011, 2:03:22 PM
    Author     : Admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.struts.Globals"%>
<%@page import="java.util.List"%>
<%@page import="uit.elib.dto.News"%>
<%@page import="uit.elib.dto.Advertising"%>
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
    List<Advertising> listAds = (List<Advertising>)request.getAttribute("listAds");
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
                           
                            <%
                            String imageLink = "./image/news.jpg";
                            if(listNewsCate1.get(i).getNewsImage()!=null){ 
                                 imageLink = "./upload/"+listNewsCate1.get(i).getNewsImage().toString();%>                                                     
                            <%}%>
                            <div class="newscontent">
                                <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                                <div class="leftheadlinetitlenews">
                                    <div class="newstitle"><a style="color: #b8262b" href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><%=listNewsCate1.get(i).getNewsTitleEn()%></a></div>
                                    <div class="justify"><%=listNewsCate1.get(i).getNewsHeadlineEn()%></div>
                                </div>                            
                            </div>  
                        <%}%>
                        <% if(language==2) { %>
                            <%
                            String imageLink = "./image/news.jpg";
                            if(listNewsCate1.get(i).getNewsImage()!=null){ 
                                 imageLink = "./upload/"+listNewsCate1.get(i).getNewsImage().toString();%>                                                     
                            <%}%>
                            <div class="newscontent">
                                <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                                <div class="leftheadlinetitlenews">
                                    <div class="newstitle"><a style="color: #b8262b" href="./LoadNews.do?newsID=<%=listNewsCate1.get(i).getNewsId()%>"><%=listNewsCate1.get(i).getNewsTitleVn()%></a></div>
                                    <div class="justify"><%=listNewsCate1.get(i).getNewsHeadlineVn()%></div>
                                </div>                            
                            </div>    
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
            if(listNewsCate2.size()>0){
                if(language==1) { 
                    String imageLink = "./image/news.jpg";
                    if(listNewsCate2.get(0).getNewsImage()!=null){ 
                         imageLink = "./upload/"+listNewsCate2.get(0).getNewsImage().toString();%>                                                     
                    <%}%>
                    <div class="newscontent">
                        <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listNewsCate2.get(0).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                        <div class="leftheadlinetitlenews">
                            <div class="newstitle"><a class="ahrefnewstitle" href="./LoadNews.do?newsID=<%=listNewsCate2.get(0).getNewsId()%>"><%=listNewsCate2.get(0).getNewsTitleEn()%></a></div>
                            <div class="justify"><%=listNewsCate2.get(0).getNewsHeadlineEn()%></div>
                        </div>                            
                    </div> 
                <%}%>
                <% if(language==2) { 
                    String imageLink = "./image/news.jpg";
                    if(listNewsCate2.get(0).getNewsImage()!=null){ 
                         imageLink = "./upload/"+listNewsCate2.get(0).getNewsImage().toString();%>                                                     
                    <%}%>
                    <div class="newscontent">
                        <div class="leftimagenews"><a href="./LoadNews.do?newsID=<%=listNewsCate2.get(0).getNewsId()%>"><img src="<%=imageLink%>" class="imagenews"/></a></div>
                        <div class="leftheadlinetitlenews">
                            <div class="newstitle"><a class="ahrefnewstitle" href="./LoadNews.do?newsID=<%=listNewsCate2.get(0).getNewsId()%>"><%=listNewsCate2.get(0).getNewsTitleVn()%></a></div>
                            <div class="justify"><%=listNewsCate2.get(0).getNewsHeadlineVn()%></div>
                        </div>                            
                    </div> 
                <%}%>                        
        <%}%>
    </div> 
    </div> 
    <div class="table_advertising">
        <div>
            <div class="title_h3"><bean:message key="text.listofads"/></div>
        </div>
        <div style="; width: 218px;" align="left">
            <script type="text/javascript">
                    var news_link="";
                    news_link +='<DIV id="demo" style="OVERFLOW: hidden; WIDTH:100%; HEIGHT: 325px; "><DIV id="demo1">';
                    <%for (int i = 0; i < listAds.size(); i++) {%>
                    news_link +='<table width=100%><tr><td>';    
                    news_link +='<a href="http://<%=listAds.get(i).getLink()%>" > <img src="upload/<%=listAds.get(i).getImage()%>" width="218" height="55" alt="<%=listAds.get(i).getAdvertisingNameVn()%>"/></a>';
                    news_link +='</td></tr></table>';
                    <%}%>

                    news_link +='</DIV><DIV id="demo2"></DIV></DIV>';
                     document.write(news_link);
                     var speed=60;
                     document.getElementById("demo2").innerHTML=document.getElementById("demo1").innerHTML;
                     function Marquee(){
                        if(document.getElementById("demo2").offsetTop-document.getElementById("demo").scrollTop<=310)
                        document.getElementById("demo").scrollTop-=document.getElementById("demo1").offsetHeight;
                        else{
                        document.getElementById("demo").scrollTop++;
                        }
                     }
                     var MyMar=setInterval(Marquee,speed);
                     document.getElementById("demo").onmouseover=function(){clearInterval(MyMar);}
                     document.getElementById("demo").onmouseout=function(){MyMar=setInterval(Marquee,speed);}
             </script>
         </div>     
    </div>      
