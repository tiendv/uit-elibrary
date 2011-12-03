<%-- 
    Document   : menu
    Created on : Nov 14, 2011, 2:03:44 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<!DOCTYPE html>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="menu_td_link"><a href="Welcome.do" class="menu_link"><bean:message  key="text.home"/></a></td>
                                <td class="menu_td_link"><a class="menu_link" href="LoadSubject.do"><bean:message  key="text.menu.subject"/></a></td>
                                <td class="menu_td_link"><a class="menu_link" href="#">Khóa luận</a></td>
                                <td class="menu_td_link"><a class="menu_link" href="#"><bean:message  key="text.menu.paper"/></a></td>
                                <td class="menu_td_link"><a class="menu_link" href="#"><bean:message  key="text.menu.help"/></a></td>
                                <td class="menu_td_link"><a class="menu_link" href="Admin.do">Quản trị</a></td>
                                <td align="right"><script type="text/javascript" src="js/ocw.js"></script>
                                    <form method="get" action="http://search.mit.edu/search">
                                        <div class="searchform">
                                            <div>

                                                <input type="hidden" value="ocw" name="site" />  
                                                <input type="hidden" value="mit" name="client" /> 			 
                                                <input type="hidden" value="*" name="getfields" />  
                                                <input type="hidden" value="xml_no_dtd" name="output" /> 			 
                                                <input type="hidden" value="http://ocw.mit.edu/search/google-ocw.xsl" name="proxystylesheet" />
                                                <input type="hidden" value="1" name="proxyreload" />  
                                                <input type="hidden" value="i" name="as_dt" /> 			 
                                                <input type="hidden" value="utf-8" name="oe" />  
                                                <input type="hidden" value="web" name="departmentName" />
                                                <input type="hidden" value="0" name="filter" />
                                                <input type="hidden" name="courseName" />
                                            </div>

                                            <div>
                                                <input type="text" onblur="fillSearchBox()" onfocus="clearSearchBox()" maxlength="255" value="Enter search keyword" name="q" class="search" id="terms" /> 			 
                                                <input type="image" alt="Go" src="../image/go_new.gif" name="btnG" class="but" /> 			 
                                                <a href="/search/AdvancedSearch.htm">Advanced Search</a>
                                            </div>
                                        </div>
                                    </form>
                                </td>
                            </tr>
</table>
