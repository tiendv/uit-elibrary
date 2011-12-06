<%-- 
    Document   : mainpage
    Created on : Nov 14, 2011, 1:50:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<%@taglib uri="http://struts.apache.org/tags-bean-el" prefix="bean" %>
<html:html xhtml="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="<tiles:getAsString name="description"/>" />
        <title><tiles:getAsString name="title"/></title>
        <link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="<html:rewrite page='/js/jquery-1.7.1.js'/>"></script>
        <script type="text/javascript" src="<html:rewrite page='/js/jquery-1.7.1.min.js'/>"></script>
    </head>
    <body class="divemainbody">
        <!--LAYOUT CONTENTS-->
        <div class="wrapper">
            <div class="header">
               <tiles:insert attribute="header"/>
            </div>
            
            <div  class="menu">
               <tiles:insert attribute="menu"/>
            </div>
           
            <div id="divleftmenu" class="leftmenu">
              <tiles:insert attribute="leftmenu"/>
            </div>
            
            <div id="divContent" class="content">
                <tiles:insert attribute="content"/>
            </div>
            <div class="cleared"></div>
            <div class ="footer">
                <tiles:insert attribute="footer"/>
            </div>
        </div>
        <!--END LAYOUT CONTENTS-->
    </body>
    
    <script type="text/javascript">
        function setContent() { 
        var divHeight = ((document.getElementById("divContent").offsetHeight) + 'px');
        document.getElementById("divleftmenu").style.height = divHeight;
        }
        window.onload = function() { 
                        setContent(); 
        } 
    </script>
</html:html>
