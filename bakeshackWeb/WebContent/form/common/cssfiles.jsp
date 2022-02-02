<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String dbConnVar="BAKESHACK";
try
	{
	
	I18nUtility i18n=new I18nUtility(dbConnVar);
	
%>
<base href="">
		<meta charset="utf-8" />
		<link rel="shortcut icon"
	href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/Bake-Shack-Logo.png" />
		<title>Bake Shack</title>
		<meta name="description" content="Updates and statistics" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<link rel="canonical" href="https://keenthemes.com/metronic" />
		<!--begin::Fonts-->

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
		<!--end::Fonts-->
		<!--begin::Page Vendors Styles(used by this page)-->
		<link href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/fullcalendar.bundle.css" rel="stylesheet"  />
		<!--end::Page Vendors Styles-->
		<!--begin::Global Theme Styles(used by all pages)-->
<%-- 		<link href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/plugins.bundle.css" rel="stylesheet"  />
 --%>	<link rel="stylesheet" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/plugins/global/plugins.bundle.css">
 
        <link href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/prismjs.bundle.css" rel="stylesheet"  />
		<link href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/style.bundle.css" rel="stylesheet"  />
		
<%-- 		<script src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/plugins/custom/datatables/datatables.bundle.js"></script> --%>
		<!--end::Global Theme Styles-->
		<!--begin::Layout Themes(used by all pages)-->
		<!--end::Layout Themes-->
		<%-- <link rel="shortcut icon" href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/media/logos/Bake-Shack-Logo.png" /> --%>

<%
	}catch(Exception e){
		Logger.log(dbConnVar,""+e);
	}
%>