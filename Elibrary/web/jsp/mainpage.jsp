<%-- 
    Document   : mainpage
    Created on : Nov 14, 2011, 1:50:38 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@taglib uri="http://struts.apache.org/tags-tiles"  prefix="tiles"%>
<html:html xhtml="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="<tiles:getAsString name="description"/>" />
        <title><tiles:getAsString name="title"/></title>
        <link href="<html:rewrite page='/css/uit.css'/>" rel="stylesheet" type="text/css" />
    </head>
    <body class="divemainbody">
        <!--LAYOUT CONTENTS-->
        <div class="wrapper">
            <tiles:insert attribute="header"/>
            <tiles:insert attribute="menu"/>
            <div class="content">
                <tiles:insert attribute="content"/>
            </div>
        </div>
        <div class ="footer">
            <tiles:insert attribute="footer"/>
        </div>
        <!--END LAYOUT CONTENTS-->
    </body>
</html:html>
