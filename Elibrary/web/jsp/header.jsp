<%--
    Document   : header
    Created on : Nov 14, 2011, 1:59:03 PM
    Author     : tiendv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<script language="JavaScript" type="text/javascript">
    <!--
    function hideLoadingPage() {
        if (document.getElementById) { // DOM3 = IE5, NS6
            document.getElementById('hidepage').style.visibility = 'hidden';
        }
        else {
            if (document.layers) { // Netscape 4
                document.hidepage.visibility = 'hidden';
            }
            else { // IE 4
                document.all.hidepage.style.visibility = 'hidden';
            }
        }
    }
    function showLoadingPage() {
        if (document.getElementById) { // DOM3 = IE5, NS6
            document.getElementById('hidepage').style.visibility = 'visible';
        }
        else {
            if (document.layers) { // Netscape 4
                document.hidepage.visibility = 'show';
            }
            else { // IE 4
                document.all.hidepage.style.visibility = 'visible';
            }
        }
    }
    // End -->
</script>
<!DOCTYPE html>

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                  <bean:message key="text.webtitle.resource"/>
                  <br/>
                  <bean:message key="text.webtitle.resource1"/>
            </td>
            <td class="language" style="width: 50%;height: 100px;text-align: right" valign="bottom">
                    <!-- ENGLISH LOCALE-->
                        <td>
                        
                    <div class="cssEnglish">
                    <form method="post" action="./Locale.do" id="English_Form">
                        <input type="hidden" name="method" value="english"/>
                        <script language="javscript" type="text/javascript">
                            document.write('<input type="hidden" name="page" value='+ document.location.href +'>');
                        </script>
                        <a href="#" onclick='document.forms["English_Form"].submit();'>
                         <img src="<bean:message key="image.en"/>" alt="<bean:message key="image.en.alttext"/>"/>
                        </a>
                    </form>
                   </div>
                        </td>
                    <!-- END ENGLISH LOCALE-->

                    <!-- VIETNAMESE LOCALE-->
                    <td>
                   <div class="cssVietNamese">
                    <form method="post" action="./Locale.do" id="Vietnamese_Form">
                        <input type="hidden" name="method" value="vietnamese"/>
                        <script language="javscript" type="text/javascript">
                            document.write('<input type="hidden" name="page" value='+ document.location.href +'>');
                        </script>
                        <a href="#" onclick='document.forms["Vietnamese_Form"].submit();'>
                            <img src="<bean:message key="image.vn"/>" alt="<bean:message key="image.vn.alttext"/>"/>
                         </a>
                    </form>
                   </div>
                         </td>
                        
                    <!-- END VIETNAMESE LOCALE-->

             </td>
          </tr>
  </table>
