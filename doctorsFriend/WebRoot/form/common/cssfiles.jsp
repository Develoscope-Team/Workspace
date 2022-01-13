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
<base href="">
<meta charset="utf-8" />
<title>DoctorsFriend</title>
<meta name="description" content="Updates and statistics" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="canonical" href="https://keenthemes.com/metronic" />
<!--begin::Fonts-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
<!--end::Fonts-->
<!--begin::Page Vendors Styles(used by this page)-->
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/plugins/custom/fullcalendar/fullcalendar.bundle.css"
	rel="stylesheet" type="text/css" />
<!--end::Page Vendors Styles-->
<!--begin::Global Theme Styles(used by all pages)-->
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/plugins/global/plugins.bundle.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/plugins/custom/prismjs/prismjs.bundle.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/css/style.bundle.css"
	rel="stylesheet" type="text/css" />
<!--end::Global Theme Styles-->
<!--begin::Layout Themes(used by all pages)-->
<!--end::Layout Themes-->
<link rel="shortcut icon" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/gif/logo.png" />

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/css/pages/login/login-1.css">


<%
	}catch(Exception e){
		Logger.log(dbConnVar,""+e);
	}
%>