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

    
<script>
		var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";
	</script>
	<!--begin::Global Config(global config for global JS scripts)-->
	<script>
		var KTAppSettings = {
			"breakpoints" : {
				"sm" : 576,
				"md" : 768,
				"lg" : 992,
				"xl" : 1200,
				"xxl" : 1200
			},
			"colors" : {
				"theme" : {
					"base" : {
						"white" : "#ffffff",
						"primary" : "#6993FF",
						"secondary" : "#E5EAEE",
						"success" : "#1BC5BD",
						"info" : "#8950FC",
						"warning" : "#FFA800",
						"danger" : "#F64E60",
						"light" : "#F3F6F9",
						"dark" : "#212121"
					},
					"light" : {
						"white" : "#ffffff",
						"primary" : "#E1E9FF",
						"secondary" : "#ECF0F3",
						"success" : "#C9F7F5",
						"info" : "#EEE5FF",
						"warning" : "#FFF4DE",
						"danger" : "#FFE2E5",
						"light" : "#F3F6F9",
						"dark" : "#D6D6E0"
					},
					"inverse" : {
						"white" : "#ffffff",
						"primary" : "#ffffff",
						"secondary" : "#212121",
						"success" : "#ffffff",
						"info" : "#ffffff",
						"warning" : "#ffffff",
						"danger" : "#ffffff",
						"light" : "#464E5F",
						"dark" : "#ffffff"
					}
				},
				"gray" : {
					"gray-100" : "#F3F6F9",
					"gray-200" : "#ECF0F3",
					"gray-300" : "#E5EAEE",
					"gray-400" : "#D6D6E0",
					"gray-500" : "#B5B5C3",
					"gray-600" : "#80808F",
					"gray-700" : "#464E5F",
					"gray-800" : "#1B283F",
					"gray-900" : "#212121"
				}
			},
			"font-family" : "Poppins"
		};
	</script>
	<!--end::Global Config-->
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/plugins/global/plugins.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/plugins/custom/prismjs/prismjs.bundle.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/js/scripts.bundle.js"></script>
	<!--end::Global Theme Bundle-->
	<!--begin::Page Vendors(used by this page)-->
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/plugins/custom/fullcalendar/fullcalendar.bundle.js"></script>
	<!--end::Page Vendors-->
	<!--begin::Page Scripts(used by this page)-->
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/js/pages/widgets.js"></script>
	<!--end::Page Scripts--><script type="text/javascript" src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/js/pages/custom/login/login-general.js"></script>
<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	

<%
	}catch(Exception e){
		Logger.log(dbConnVar,""+e);
	}
%>