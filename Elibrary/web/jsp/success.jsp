<%-- 
    Document   : success
    Created on : Dec 14, 2011, 12:55:58 AM
    Author     : Nguyen Hoang Tan
--%>
<%@taglib uri="http://struts.apache.org/tags-html"  prefix="html"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<%@taglib uri="http://struts.apache.org/tags-bean-el" prefix="bean" %>
<title><bean:message key="text.success"/></title> 
 <link href="./css/base/jquery.ui.dialog.css" rel="stylesheet" type="text/css"/>
 <link href="./css/base/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
 <script src="./js/jquery-1.7.1.min.js"></script> 
 <script src="./js/jquery-ui-1.8.16.custom.min.js"></script> 
 <style>
.ui-dialog-titlebar-close{
    display: none;
}
</style>

  <script type="text/javascript"> 
  $(function(){        
    var execute = function() { 
        var myTextField = document.getElementById('href');
        window.location = myTextField.value;
    } 
    var dialogOpts = {
      show: true,
      buttons: {   
        "Ok": execute     
        } 
    }; 
    $("#myDialog").dialog(dialogOpts); 
  }); 
</script> 
  
</head> 
<body>
<%
    if(request.getAttribute("success")!=null)
    {
        if((Boolean)request.getAttribute("success"))
            if(request.getAttribute("href")!=null){    
%>
<input type="hidden" id="href" value="<%=request.getAttribute("href")%>" />
<div id="myDialog" title="<bean:message key="text.success"/>"><bean:message key="text.youhavesavedsuccessful"/></div> 
<%}}%> 
</body> 
</html>   