<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*" %>

<div class="list-group col-sm-2">
  <a href="QueryStatistics" class="list-group-item activetitle"><h2>查询统计</h2></a>
  
  <%
    ArrayList<String> right=(ArrayList<String>)session.getAttribute("rightCode");
    for(int i=0;i<right.size();i++){
    	if(right.get(i).equals("HTXXCX")){
    		out.println("<a id=\"htxxcx\" href=\"ContractInfoQuery\" class=\"list-group-item bg\"><h3>合同信息查询</h3></a>");
    	}
    	if(right.get(i).equals("HTLCCX")){
    		out.println("<a id=\"htlccx\" href=\"ContractStepQuery\" class=\"list-group-item bg\"><h3>合同流程查询</h3></a>");
    	}
    }
  
  %>
</div>

