<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>合同管理系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="shortcut icon" href="img/title.ico">
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="css/bootstrap_3.0.3/css/bootstrap.css">
    <link rel="stylesheet" href="css/main_css/supersized.css">
    <link href="css/main_css/bootstrap-datetimepicker.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" type="text/css" href="css/main_css/main.css">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
        <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
	   function checkNull(){
    		if(document.getElementById("startTime").value==""||document.getElementById("finishTime").value==""){
    			alert("请填写完整查询信息");
    			return false;
    		}else if(document.getElementById("startTime").value>document.getElementById("finishTime").value){
    			alert("结束时间必须比起始时间晚！");
    			return true;
    		}
	   }
	function ChangeHref(id){
		
		var newHref=document.getElementById(id).getAttribute("href");
		if(newHref.match("startTime")==null&&newHref.match("finishTime")==null&&newHref.match("#")==null){
			newHref+="&startTime="+document.getElementById("startTime").value;
			newHref+="&finishTime="+document.getElementById("finishTime").value;
			
		}
		document.getElementById(id).setAttribute("href",newHref);
	}

	</script>

    <%
    ArrayList<Log> logs=(ArrayList<Log>)request.getAttribute("logs");
    ArrayList<String> names=(ArrayList<String>)request.getAttribute("names");
    Integer pageNo=(Integer)request.getAttribute("pageNo");
    Integer pageNum=(Integer)request.getAttribute("pageNum");
    Integer pageRecordNum=(Integer)request.getAttribute("pageRecordNum");
    Integer totalRecordNum=(Integer)request.getAttribute("totalRecordNum");
    String startTime=(String)request.getAttribute("startTime");
    String finishTime=(String)request.getAttribute("finishTime");
    String startTimeDate=(String)request.getAttribute("startTimeDate");
    String finishTimeDate=(String)request.getAttribute("finishTimeDate");
    
    
    %>
	
</head>
<body>
  <!-- 引用外部页眉    -->
  <%@ include file="Head.jsp"%>
  <script type="text/javascript">
	document.getElementById("xtgl").setAttribute("class","active");
  </script>
   
  <div class="container-manage">
    <!-- 引用系统管理导航栏    -->
    <%@ include file="SystemManageNav.jsp" %>
    <script type="text/javascript">
		document.getElementById("rzgl").setAttribute("class","list-group-item bg active");
    </script>
    
       <div class="panel panel-default col-sm-10 bg"><!--panel start-->
          <div class="panel-heading">
            <h3 class="panel-title">日志管理</h3>
          </div>        
          <div class="panel-body"><!--panel body start-->
            <form class="form-horizontal" role="form" action="LogManage?type=query" method="post">
              <div class="form-group">
              	<%if(request.getAttribute("expotRes")!=null){%>
  					<label><%=request.getAttribute("expotRes") %></label>
  				<%}%>
  			  </div>
  			  <div class="form-group">
                <label for="startTime" class="col-md-2 control-label">开始时间: </label>
                <div class="input-group date form_date col-md-3" data-date="" data-date-format="yyyy-MM-dd" data-link-field="startTime" data-link-format="yyyy-mm-dd" >
                    <input class="form-control" size="16" type="text" value="<%if(startTime!=null) out.print(startTime); %>" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="startTime" name="startTime" value="<%if(startTime!=null) out.print(startTime); %>" />
			  </div>
			  <div class="form-group">
				<label for="finishTime" class="col-md-2 control-label">结束时间: </label>
                <div class="input-group date form_date col-md-3" data-date="" data-date-format="yyyy-MM-dd" data-link-field="finishTime" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="<%if(finishTime!=null) out.print(finishTime); %>" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="finishTime" name="finishTime" value="<%if(finishTime!=null) out.print(finishTime); %>" />
			  </div>
			  <div class="form-group">
				<div class="col-sm-2 col-sm-offset-2">
                  <button type="submit" class="btn btn-info btn-block" onclick="return checkNull()">查询</button>                    
                </div> 		
               </div>
              
            </form>
            <table class="table table table-hover table-condensed table-condensed table-white">
                <thead>
                	<th>序号</th>
                    <th>操作员</th>
                    <th>操作内容</th>
                    <th>操作时间</th>
                </thead>
                <tbody>
                  <% if(logs!=null){ %>
                  <% for(int i=0;i<logs.size();i++){%>
                    <tr>
                        <td><%=((Log)logs.get(i)).GetId()%></td>
                        <td><%=names.get(i)%></td>
                        <td><%=((Log)logs.get(i)).getContent()%></td>
                        <td><%=((Log)logs.get(i)).getTime()%></td>
                    </tr>
                  <%} %>
                  <%} %>
                </tbody>
            </table>            
            <form class="form-horizontal" role="form">
	            <div class="form-group">
		          <div class="col-sm-5 col-sm-offset-4">
	            
	              <a id="pageone" onmouseover="ChangeHref('pageone')" class="col-sm-1 col-sm-offset-1" href="<%if(pageNo!=1){out.print("LogManage?type=query&pageNo=1");}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-backward myclickstyle"></span></a>
		      	  <a id="pagebefore" onmouseover="ChangeHref('pagebefore')" class="col-sm-1" href="<% if(pageNo>=2){out.print("LogManage?type=query&pageNo="+(pageNo-1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-left myclickstyle"></span></a>
		      	  <span class="col-sm-6"><%=pageNo %>/<%=pageNum %>(共 <%=totalRecordNum%> 条)</span>
		      	  <a id="pagenext" onmouseover="ChangeHref('pagenext')" class="col-sm-1" href="<% if(pageNo+1<=pageNum){out.print("LogManage?type=query&pageNo="+(pageNo+1));}else{out.print("#");} %>"><span class="glyphicon glyphicon-arrow-right myclickstyle"></span></a>
		      	  <a id="pagefinal" onmouseover="ChangeHref('pagefinal')" class="col-sm-1" href="<%if(pageNo!=pageNum){out.print("LogManage?type=query&pageNo="+pageNum);}else{out.print("#");}%>"><span class="glyphicon glyphicon-fast-forward myclickstyle"></span></a>
		      	  <!--<span>每页<input id="pageRecordNum" type="text" size="3" value="">条</span>-->
		        </div><!--display table page-->
		        </div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-4">
                      <a href="LogManage?type=export&startTimeDate=<%=startTimeDate%>&finishTimeDate=<%=finishTimeDate%>" ><button type="button" class="btn btn-info btn-block">导出</button></a>               
                    </div>
                </div>		        
	        </form>
          </div><!--panel body over-->
      </div><!--panel over-->     
  </div>
  
  <div style="margin-top:800px;"><jsp:include page="Footer.jsp"></jsp:include></div>
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="css/bootstrap_3.0.3/js/jquery-2.0.2.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="css/bootstrap_3.0.3/js/bootstrap.js"></script>
  <script src="css/main_js/supersized.3.2.7.min.js"></script>
  <script src="css/main_js/supersized-init.js"></script>
  <script type="text/javascript" src="css/main_js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
  <script type="text/javascript" src="css/main_js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
  <script type="text/javascript">
	$('.form_date').datetimepicker({
        language:  'fr',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
  </script>
</body>
</html>