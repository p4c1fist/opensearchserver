<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.jaeksoft.searchlib.renderer.Renderer"%>
<%@ page
	import="com.jaeksoft.searchlib.renderer.plugin.AuthPluginInterface"%>
<%
	Renderer renderer = (Renderer) request.getAttribute("renderer");
	AuthPluginInterface.User user = (AuthPluginInterface.User) session
			.getAttribute("rendererUser");
	String login = user == null ? "" : user.username;
%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OpenSearchServer</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/opensearchserver.js"
	charset="UTF-8"></script>
</head>
<body>
	<div class="container">
		<div id="oss-wrap">
			<div id="oss-header">
				<%=renderer.getHeader()%>
			</div>
			<%
				if (renderer.isAuthentication()) {
			%>
			<div id="oss-login" >
				<%=login%>&nbsp;-&nbsp;<a
					href="<%=request.getAttribute("getUrl")%>&logout"><%=renderer.getLogoutText()%></a>
			</div>
			<%
				}
			%>
			<div class="row">
				<div class="col-md-2">
					<div id="oss-facet">
						<jsp:include page="renderer/facet.jsp" />
					</div>
				</div>
				<div class="col-md-7">
					<div id="oss-main">
						<jsp:include page="renderer5/form.jsp" />
						<jsp:include page="renderer/numfound.jsp" />
						<jsp:include page="renderer/doclist.jsp" />
					</div>
				</div>
			</div>
			<div id="oss-footer">
				<%=renderer.getFooter()%>
			</div>
			<div align="right" style="clear: both;">
				<a href="http://www.open-search-server.com/" target="_blank"><img
					alt="OpenSearchServer Logo" src=" images/oss_logo_32.png"
					style="vertical-align: bottom" /></a>
			</div>
		</div>
	</div>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>