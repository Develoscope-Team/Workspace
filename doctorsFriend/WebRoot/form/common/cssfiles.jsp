<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String dbConnVar="BAFNA";
try
	{
	
	I18nUtility i18n=new I18nUtility(dbConnVar);
	
%>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<link rel="stylesheet" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/global/plugins.bundle.css">
<link rel="stylesheet" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/plugins/custom/prismjs/prismjs.bundle.css">
<link rel="stylesheet" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/css/style.bundle.css">
<link rel="stylesheet" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/css/pages/login/login-1.css">

<%
	}catch(Exception e){
		Logger.log(dbConnVar,""+e);
	}
%>