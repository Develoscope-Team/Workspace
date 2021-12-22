<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAKESHACk";
try {
%>
<head>
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>

<link href="//www.amcharts.com/lib/3/plugins/export/export.css"
	rel="stylesheet" type="text/css" />
</head>



<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
	<!--begin::Main-->

	<!--begin::Header Mobile-->
	<div id="kt_header_mobile" class="header-mobile">
		<!--begin::Toolbar-->
		<div class="d-flex align-items-center">
			<button class="btn p-0 burger-icon burger-icon-left ml-4"
				id="kt_header_mobile_toggle">
				<span></span>
			</button>
			<button class="btn btn-icon btn-hover-transparent-white p-0 ml-3"
				id="kt_header_mobile_topbar_toggle">
				<span class="svg-icon svg-icon-xl"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/General/User.svg-->
					<svg xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
						height="24px" viewBox="0 0 24 24" version="1.1">
							<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
								<polygon points="0 0 24 0 24 24 0 24" />
								<path
							d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z"
							fill="#000000" fill-rule="nonzero" opacity="0.3" />
								<path
							d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z"
							fill="#000000" fill-rule="nonzero" />
							</g>
						</svg> <!--end::Svg Icon-->
				</span>
			</button>
		</div>
		<!--end::Toolbar-->
	</div>
	<!--end::Header Mobile-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">

				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Subheader-->
					<div class="subheader py-2 py-lg-12 subheader-transparent"
						id="kt_subheader">
						<div
							class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap mr-1">
								<!--begin::Heading-->
								<div class="d-flex flex-column">
									<!--begin::Title-->
									<h2 class="text-white font-weight-bold my-2 mr-5">Dashboard</h2>
									<!--end::Title-->

								</div>
								<!--end::Heading-->
							</div>
							<!--end::Info-->

						</div>
					</div>
					<!--end::Subheader-->
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">
							<!--begin::Dashboard-->
							<!--begin::Row-->
							<div class="row">
								<div class="col-xl-5">
									<!--begin::Tiles Widget 1-->
									<div class="card card-custom gutter-b card-stretch">
										<!--begin::Header-->
										<div class="card-header border-0 pt-5">
											<div class="card-title">
												<div class="card-label">
													<div class="font-weight-bolder">Weekly Sales Stats</div>
													<div class="font-size-sm text-muted mt-2">
														</div>
												</div>
											</div>

										</div>
										<!--end::Header-->
										<!--begin::Body-->
										<div class="card-body d-flex flex-column px-0">
											<!--begin::Chart-->
											<!-- <div id="kt_tiles_widget_1_chart" data-color="danger" style="height: 125px"></div> -->
											<div id="chart_12" data-color="danger"
												style="height: 125px; width: 350px"></div>
											<!--end::Chart-->
											<!--begin::Items-->
											<div class="flex-grow-1 card-spacer-x">
												<!--begin::Item-->
												<div
													class="d-flex align-items-center justify-content-between mb-10">
													<div class="d-flex align-items-center mr-2">
														<div
															class="symbol symbol-50 symbol-light mr-3 flex-shrink-0">
															
														</div>
														<div>
															<a href="#"
																class="font-size-h6 text-dark-75 text-hover-primary font-weight-bolder ml-8 mt-2">Top
																 category</a>
															<div
																class=" font-size-sm text-muted font-weight-bold ml-8 mt-1" id="top_Subcategory">Cakes</div>
														</div>
													</div>
													<div class="col-2 label label-light label-inline font-weight-bold text-dark-50  font-size-xl mr-5" id="top_subcategory_count"># 100</div>
												</div>
												<!--end::Item-->
												
												<div class="font-size-h5 font-weight-bolder mt-1 ml-10">Top 5 Product</div>
												<div class="row">
													<div class="col-5  text-muted font-size-lm font-weight-bolder mt-3 ml-10"
														id="top_product_1">-</div>

													<div
														class="col-2 label label-light label-inline font-weight-bold text-dark-50 font-size-xl mt-3 ml-35"
														id="top_product_qty_1">-</div>

												</div>
												<div class="row">
													<div class="col-5 text-muted font-size-lm font-weight-bolder mt-3 ml-10"
														id="top_product_2">-</div>

													<div
														class="col-2  label label-light label-inline font-weight-bold text-dark-50 font-size-xl mt-3 ml-35"
														id="top_product_qty_2">-</div>

												</div>
												<div class="row">
													<div class="col-5 text-muted font-size-lm font-weight-bolder mt-3 ml-10"
														id="top_product_3">-</div>

													<div
														class="col-2 label label-light label-inline font-weight-bold text-dark-50 font-size-xl mt-3 ml-35"
														id="top_product_qty_3">-</div>

												</div>
												<div class="row">
													<div class="col-5 text-muted font-size-lm font-weight-bolder mt-3 ml-10"
														id="top_product_4">-</div>

													<div
														class="col-2 label label-light label-inline font-weight-bold text-dark-50 font-size-xl mt-3 ml-35"
														id="top_product_qty_4">-</div>

												</div>
												<div class="row">
													<div class="col-5 text-muted font-size-lm font-weight-bolder mt-3 ml-10"
														id="top_product_5">-</div>

													<div
														class="col-2 label label-light label-inline font-weight-bold text-dark-50 font-size-xl mt-3 ml-35"
														id="top_product_qty_5">-</div>

												</div>

											</div>
											<!--end::Items-->
										</div>
										<!--end::Body-->
									</div>
									<!--end::Tiles Widget 1-->
								</div>
								<div class="col-xl-7">
									<div class="row">
										<div class="col-xl-3">
											<!--begin::Tiles Widget 3-->
											<div class="card card-custom bg-primary gutter-b"
												style="height: 150px">
												<div class="card-body">
													<span class="svg-icon svg-icon-3x svg-icon-white ml-n2">
														<!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Layout/Layout-4-blocks.svg-->
														<svg xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
															height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24" />
																			<rect fill="#000000" x="4" y="4" width="7" height="7"
																rx="1.5" />
																			<path
																d="M5.5,13 L9.5,13 C10.3284271,13 11,13.6715729 11,14.5 L11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L5.5,20 C4.67157288,20 4,19.3284271 4,18.5 L4,14.5 C4,13.6715729 4.67157288,13 5.5,13 Z M14.5,4 L18.5,4 C19.3284271,4 20,4.67157288 20,5.5 L20,9.5 C20,10.3284271 19.3284271,11 18.5,11 L14.5,11 C13.6715729,11 13,10.3284271 13,9.5 L13,5.5 C13,4.67157288 13.6715729,4 14.5,4 Z M14.5,13 L18.5,13 C19.3284271,13 20,13.6715729 20,14.5 L20,18.5 C20,19.3284271 19.3284271,20 18.5,20 L14.5,20 C13.6715729,20 13,19.3284271 13,18.5 L13,14.5 C13,13.6715729 13.6715729,13 14.5,13 Z"
																fill="#000000" opacity="0.3" />
																		</g>
																	</svg> <!--end::Svg Icon-->
													</span>
													<div
														class="text-inverse-primary font-weight-bolder font-size-h5 mt-3">Today's
														Footfall</div>
													<div class="font-size-h4 font-weight-bolder"
														id="footfall_count">-</div>
												</div>
											</div>
											<!--end::Tiles Widget 3-->
										</div>
										<div class="col-xl-3">
											<!--begin::Tiles Widget 3-->
											<div class="card card-custom gutter-b" style="height: 150px">
												<div class="card-body">
													<span class="svg-icon svg-icon-3x svg-icon-warning">
														<!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Communication/Group.svg-->
														<svg xmlns="http://www.w3.org/2000/svg"
															xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
															height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
																fill-rule="evenodd">
																			<polygon points="0 0 24 0 24 24 0 24" />
																			<path
																d="M18,14 C16.3431458,14 15,12.6568542 15,11 C15,9.34314575 16.3431458,8 18,8 C19.6568542,8 21,9.34314575 21,11 C21,12.6568542 19.6568542,14 18,14 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
																fill="#000000" fill-rule="nonzero" opacity="0.3" />
																			<path
																d="M17.6011961,15.0006174 C21.0077043,15.0378534 23.7891749,16.7601418 23.9984937,20.4 C24.0069246,20.5466056 23.9984937,21 23.4559499,21 L19.6,21 C19.6,18.7490654 18.8562935,16.6718327 17.6011961,15.0006174 Z M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
																fill="#000000" fill-rule="nonzero" />
																		</g>
																	</svg> <!--end::Svg Icon-->
													</span>
													<div class="text-dark font-weight-bolder font-size-h6 mt-3">Total
														Cust</div>
													<div class="font-size-h4 font-weight-bolder"
														id="total_customer_count">-</div>
												</div>
											</div>
											<!--end::Tiles Widget 3-->
										</div>
										<div class="col-xl-3">
											<!--begin::Tiles Widget 3-->
											<div class="card card-custom bg-primary gutter-b"
												style="height: 150px">
												<div class="card-body">
													<span class="svg-icon svg-icon-white svg-icon-2x"><!--begin::Svg Icon | path:/var/www/preview.keenthemes.com/metronic/releases/2021-05-14-112058/theme/html/demo2/dist/../src/media/svg/icons/Shopping/Sale1.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect x="0" y="0" width="24" height="24"/>
        <path d="M16.0322024,5.68722152 L5.75790403,15.945742 C5.12139076,16.5812778 5.12059836,17.6124773 5.75613416,18.2489906 C5.75642891,18.2492858 5.75672377,18.2495809 5.75701875,18.2498759 L5.75701875,18.2498759 C6.39304347,18.8859006 7.42424328,18.8859006 8.060268,18.2498759 C8.06056298,18.2495809 8.06085784,18.2492858 8.0611526,18.2489906 L18.3196731,7.9746922 C18.9505124,7.34288268 18.9501191,6.31942463 18.3187946,5.68810005 L18.3187946,5.68810005 C17.68747,5.05677547 16.6640119,5.05638225 16.0322024,5.68722152 Z" fill="#000000" />
        <path d="M9.85714286,6.92857143 C9.85714286,8.54730513 8.5469533,9.85714286 6.93006028,9.85714286 C5.31316726,9.85714286 4,8.54730513 4,6.92857143 C4,5.30983773 5.31316726,4 6.93006028,4 C8.5469533,4 9.85714286,5.30983773 9.85714286,6.92857143 Z M20,17.0714286 C20,18.6901623 18.6898104,20 17.0729174,20 C15.4560244,20 14.1428571,18.6901623 14.1428571,17.0714286 C14.1428571,15.4497247 15.4560244,14.1428571 17.0729174,14.1428571 C18.6898104,14.1428571 20,15.4497247 20,17.0714286 Z" fill="#000000" opacity="0.5"/>
    </g>
</svg><!--end::Svg Icon--></span>
													<div
														class="text-inverse-primary font-weight-bolder font-size-h2 mt-3"></div>
													<a href="sales-order-master.jsp"
														class="text-inverse-primary font-weight-bold font-size-h4 mt-1">Sales</a>
												</div>
											</div>
											<!--end::Tiles Widget 3-->
										</div>
										<div class="col-xl-3">
											<!--begin::Tiles Widget 3-->
											<div class="card card-custom gutter-b" style="height: 150px">
												<div class="card-body">
													<span class="svg-icon svg-icon-warning svg-icon-2x"><!--begin::Svg Icon | path:/var/www/preview.keenthemes.com/metronic/releases/2021-05-14-112058/theme/html/demo2/dist/../src/media/svg/icons/Shopping/Wallet.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <rect x="0" y="0" width="24" height="24"/>
        <circle fill="#000000" opacity="0.3" cx="20.5" cy="12.5" r="1.5"/>
        <rect fill="#000000" opacity="0.3" transform="translate(12.000000, 6.500000) rotate(-15.000000) translate(-12.000000, -6.500000) " x="3" y="3" width="18" height="7" rx="1"/>
        <path d="M22,9.33681558 C21.5453723,9.12084552 21.0367986,9 20.5,9 C18.5670034,9 17,10.5670034 17,12.5 C17,14.4329966 18.5670034,16 20.5,16 C21.0367986,16 21.5453723,15.8791545 22,15.6631844 L22,18 C22,19.1045695 21.1045695,20 20,20 L4,20 C2.8954305,20 2,19.1045695 2,18 L2,6 C2,4.8954305 2.8954305,4 4,4 L20,4 C21.1045695,4 22,4.8954305 22,6 L22,9.33681558 Z" fill="#000000"/>
    </g>
</svg><!--end::Svg Icon--></span>
													<div class="text-dark font-weight-bolder font-size-h2 mt-3"></div>
													<a href="purchase-master.jsp"
														class="text-dark font-weight-bolder font-size-h6 mt-1">Purchase</a>
												</div>
											</div>
											<!--end::Tiles Widget 3-->
										</div>

									</div>
									<div class="row">
									
										<div class="col-xl-12" style="height: 440px;">
											<!--begin::Mixed Widget 14-->
											<div
												class="card card-custom bgi-no-repeat bgi-size-cover gutter-b card-stretch"
												<%--  style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack012.jpg)" --%>  >
<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: left;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  max-height: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 5px;
  width: 5px;
  margin: 0 0px;
  background-color: #bbb;
  border-radius: 10%;
 /*  display: inline-block; */
 transition: background-color 0.0s ease; 
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>		
									<div class="slideshow-container" style="height:100%;">

<div class="mySlides fade">
  <div class="numbertext">1 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack001.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade"> 
  <div class="numbertext">2 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack002.jpg" style="width:100%;height:100%" >
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack004.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">5 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">6 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack006.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">7 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack007.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">8 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack008.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">9 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack009.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">10 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack010.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">11 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack011.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
<div class="mySlides fade">
  <div class="numbertext">12 / 12</div>
  <img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack012.jpg" style="width:100%;height:100%">
  <div class="text"></div>
</div>
</div>

	<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>											
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>												
												
												
												
												
												
											</div>
											<!--end::Mixed Widget 14-->
										</div>
									</div>
								</div>
							</div>
							<!--end::Row-->
							<!--begin::Row-->
							<div class="row">
								<div class="col-lg-6 col-xxl-4">
									<!--begin::Mixed Widget 4-->
									<div class="card card-custom  gutter-b card-stretch">
										<!--begin::Header-->
										<div class="card-header border-0 py-5">
											<h3 class="card-title font-weight-bolder text-black">Monthly
												Sales Progress</h3>

										</div>
										<!--end::Header-->
										<!--begin::Body-->
										<div class="card-body d-flex flex-column p-0">
											<!--begin::Chart-->
											<!-- <div id="kt_amcharts_4" style="height: 500px;"></div> -->
											<div id="chart_2"></div>
											<!--end::Chart-->
											<!--begin::Stats-->
											<div class="card-spacer bg-white card-rounded flex-grow-1">
												<!--begin::Row-->
												<div class="row m-0">
													<div class="col px-8 py-6 mr-8">
														<div class="font-size-sm text-muted font-weight-bold">Average
															Expances</div>
														<div class="font-size-h4 font-weight-bolder"
															id="average_expances">Rs.65,000</div>
													</div>
													<div class="col px-8 py-6">
														<div class="font-size-sm text-muted font-weight-bold">Average
															Sale</div>
														<div class="font-size-h4 font-weight-bolder"
															id="average_sale">Rs.1,33,600</div>
													</div>
												</div>
												<!--end::Row-->
												<!--begin::Row-->
												<div class="row m-0">
													<div class="col px-8 py-6 mr-8">
														<div class="font-size-sm text-muted font-weight-bold">Annual
															Expances</div>
														<div class="font-size-h4 font-weight-bolder"
															id="annual_expances">Rs.7,80,000</div>
													</div>
													<div class="col px-8 py-6">
														<div class="font-size-sm text-muted font-weight-bold">Annual
															Income</div>
														<div class="font-size-h4 font-weight-bolder"
															id="annual_income">Rs.16,03,200</div>
													</div>
												</div>
												<!--end::Row-->
											</div>
											<!--end::Stats-->
										</div>
										<!--end::Body-->
									</div>
									<!--end::Mixed Widget 4-->
								</div>
								<div class="col-lg-6 col-xxl-8">
									<!--begin::Advance Table Widget 1-->
									<div class="card card-custom card-stretch gutter-b">
										<div class="card-header border-0 py-5">
											<h3 class="card-title font-weight-bolder text-black">Weekly
												Sales Progress</h3>

										</div>

										<div id="chart_3" ></div>
										
										<div class="card-spacer bg-white card-rounded flex-grow-1">
												<!--begin::Row-->
												<div class="row m-0">
													<div class="col px-8 py-6 mr-8">
														<div class="font-size-sm text-muted font-weight-bold">Day's Average
															Expances</div>
														<div class="font-size-h4 font-weight-bolder"
															id="days_average_expances">Rs.65,000</div>
													</div>
													<div class="col px-8 py-6">
														<div class="font-size-sm text-muted font-weight-bold">Day's Average
															Sale</div>
														<div class="font-size-h4 font-weight-bolder"
															id="days_average_sale">Rs.1,33,600</div>
													</div>
												</div>
												<!--end::Row-->
												<!--begin::Row-->
												<div class="row m-0">
													<div class="col px-8 py-6 mr-8">
														<div class="font-size-sm text-muted font-weight-bold">Weekly
															Expances</div>
														<div class="font-size-h4 font-weight-bolder"
															id="weekly_expances">Rs.7,80,000</div>
													</div>
													<div class="col px-8 py-6">
														<div class="font-size-sm text-muted font-weight-bold">Weekly
															Income</div>
														<div class="font-size-h4 font-weight-bolder"
															id="weekly_income">Rs.16,03,200</div>
													</div>
												</div>
												<!--end::Row-->
											</div>
									</div>
									<!--end::Advance Table Widget 1-->
								</div>
							</div>
							<!--end::Row-->

							<!--end::Dashboard-->
						</div>
						<!--end::Container-->
					</div>
					<!--end::Entry-->
				</div>
				<!--end::Content-->

			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>
	<!--end::Main-->
	<!-- begin::User Panel-->
	
	<!-- end::User Panel-->
	<!--begin::Quick Panel-->
	<div id="kt_quick_panel" class="offcanvas offcanvas-right pt-5 pb-10">
		<!--begin::Header-->
		<div
			class="offcanvas-header offcanvas-header-navs d-flex align-items-center justify-content-between mb-5">
			<ul
				class="nav nav-bold nav-tabs nav-tabs-line nav-tabs-line-3x nav-tabs-primary flex-grow-1 px-10"
				role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#kt_quick_panel_logs">Audit Logs</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#kt_quick_panel_notifications">Notifications</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#kt_quick_panel_settings">Settings</a></li>
			</ul>
			<div class="offcanvas-close mt-n1 pr-5">
				<a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary"
					id="kt_quick_panel_close"> <i
					class="ki ki-close icon-xs text-muted"></i>
				</a>
			</div>
		</div>
		<!--end::Header-->
		<!--begin::Content-->
		<div class="offcanvas-content px-10">
			<div class="tab-content">
				<!--begin::Tabpane-->
				<div class="tab-pane fade show pt-3 pr-5 mr-n5 active"
					id="kt_quick_panel_logs" role="tabpanel">
					<!--begin::Section-->
					<div class="mb-15">
						<h5 class="font-weight-bold mb-5">System Messages</h5>
						<!--begin: Item-->
						<div class="d-flex align-items-center flex-wrap mb-5">
							<div class="symbol symbol-50 symbol-light mr-5">
								<span class="symbol-label"> <!-- 	<img src="assets/BakeShack_IM/media/svg/misc/006-plurk.svg" class="h-50 align-self-center" alt="" /> -->
								</span>
							</div>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-bolder text-dark-75 text-hover-primary font-size-lg mb-1">Top
									Authors</a> <span class="text-muted font-weight-bold">Most
									Successful Fellas</span>
							</div>
							<span
								class="btn btn-sm btn-light font-weight-bolder py-1 my-lg-0 my-2 text-dark-50">+82$</span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div class="d-flex align-items-center flex-wrap mb-5">
							<div class="symbol symbol-50 symbol-light mr-5">
								<span class="symbol-label"> <!-- <img src="assets/BakeShack_IM/media/svg/misc/015-telegram.svg" class="h-50 align-self-center" alt="" /> -->
								</span>
							</div>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-bolder text-dark-75 text-hover-primary font-size-lg mb-1">Popular
									Authors</a> <span class="text-muted font-weight-bold">Most
									Successful Fellas</span>
							</div>
							<span
								class="btn btn-sm btn-light font-weight-bolder my-lg-0 my-2 py-1 text-dark-50">+280$</span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div class="d-flex align-items-center flex-wrap mb-5">
							<div class="symbol symbol-50 symbol-light mr-5">
								<span class="symbol-label"> <!-- 	<img src="assets/BakeShack_IM/media/svg/misc/003-puzzle.svg" class="h-50 align-self-center" alt="" /> -->
								</span>
							</div>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-bolder text-dark-75 text-hover-primary font-size-lg mb-1">New
									Users</a> <span class="text-muted font-weight-bold">Most
									Successful Fellas</span>
							</div>
							<span
								class="btn btn-sm btn-light font-weight-bolder my-lg-0 my-2 py-1 text-dark-50">+4500$</span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div class="d-flex align-items-center flex-wrap mb-5">
							<div class="symbol symbol-50 symbol-light mr-5">
								<span class="symbol-label"> <!-- <img src="assets/BakeShack_IM/media/svg/misc/005-bebo.svg" class="h-50 align-self-center" alt="" /> -->
								</span>
							</div>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-bolder text-dark-75 text-hover-primary font-size-lg mb-1">Active
									Customers</a> <span class="text-muted font-weight-bold">Most
									Successful Fellas</span>
							</div>
							<span
								class="btn btn-sm btn-light font-weight-bolder my-lg-0 my-2 py-1 text-dark-50">+4500$</span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div class="d-flex align-items-center flex-wrap">
							<div class="symbol symbol-50 symbol-light mr-5">
								<span class="symbol-label"> <!-- 	<img src="assets/BakeShack_IM/media/svg/misc/014-kickstarter.svg" class="h-50 align-self-center" alt="" /> -->
								</span>
							</div>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-bolder text-dark-75 text-hover-primary font-size-lg mb-1">Bestseller
									Theme</a> <span class="text-muted font-weight-bold">Most
									Successful Fellas</span>
							</div>
							<span
								class="btn btn-sm btn-light font-weight-bolder my-lg-0 my-2 py-1 text-dark-50">+4500$</span>
						</div>
						<!--end: Item-->
					</div>
					<!--end::Section-->
					<!--begin::Section-->
					<div class="mb-5">
						<h5 class="font-weight-bold mb-5">Notifications</h5>
						<!--begin: Item-->
						<div
							class="d-flex align-items-center bg-light-warning rounded p-5 mb-5">
							<span class="svg-icon svg-icon-warning mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Home/Library.svg-->
									<svg xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
										height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none"
											fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24" />
												<path
											d="M5,3 L6,3 C6.55228475,3 7,3.44771525 7,4 L7,20 C7,20.5522847 6.55228475,21 6,21 L5,21 C4.44771525,21 4,20.5522847 4,20 L4,4 C4,3.44771525 4.44771525,3 5,3 Z M10,3 L11,3 C11.5522847,3 12,3.44771525 12,4 L12,20 C12,20.5522847 11.5522847,21 11,21 L10,21 C9.44771525,21 9,20.5522847 9,20 L9,4 C9,3.44771525 9.44771525,3 10,3 Z"
											fill="#000000" />
												<rect fill="#000000" opacity="0.3"
											transform="translate(17.825568, 11.945519) rotate(-19.000000) translate(-17.825568, -11.945519)"
											x="16.3255682" y="2.94551858" width="3" height="18" rx="1" />
											</g>
										</svg> <!--end::Svg Icon-->
							</span>
							</span>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-normal text-dark-75 text-hover-primary font-size-lg mb-1">Another
									purpose persuade</a> <span class="text-muted font-size-sm">Due
									in 2 Days</span>
							</div>
							<span class="font-weight-bolder text-warning py-1 font-size-lg">+28%</span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div
							class="d-flex align-items-center bg-light-success rounded p-5 mb-5">
							<span class="svg-icon svg-icon-success mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Communication/Write.svg-->
									<svg xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
										height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none"
											fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24" />
												<path
											d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z"
											fill="#000000" fill-rule="nonzero"
											transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953)" />
												<path
											d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z"
											fill="#000000" fill-rule="nonzero" opacity="0.3" />
											</g>
										</svg> <!--end::Svg Icon-->
							</span>
							</span>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-normal text-dark-75 text-hover-primary font-size-lg mb-1">Would
									be to people</a> <span class="text-muted font-size-sm">Due
									in 2 Days</span>
							</div>
							<span class="font-weight-bolder text-success py-1 font-size-lg">+50%</span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div
							class="d-flex align-items-center bg-light-danger rounded p-5 mb-5">
							<span class="svg-icon svg-icon-danger mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Communication/Group-chat.svg-->
									<svg xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
										height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none"
											fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24" />
												<path
											d="M16,15.6315789 L16,12 C16,10.3431458 14.6568542,9 13,9 L6.16183229,9 L6.16183229,5.52631579 C6.16183229,4.13107011 7.29290239,3 8.68814808,3 L20.4776218,3 C21.8728674,3 23.0039375,4.13107011 23.0039375,5.52631579 L23.0039375,13.1052632 L23.0206157,17.786793 C23.0215995,18.0629336 22.7985408,18.2875874 22.5224001,18.2885711 C22.3891754,18.2890457 22.2612702,18.2363324 22.1670655,18.1421277 L19.6565168,15.6315789 L16,15.6315789 Z"
											fill="#000000" />
												<path
											d="M1.98505595,18 L1.98505595,13 C1.98505595,11.8954305 2.88048645,11 3.98505595,11 L11.9850559,11 C13.0896254,11 13.9850559,11.8954305 13.9850559,13 L13.9850559,18 C13.9850559,19.1045695 13.0896254,20 11.9850559,20 L4.10078614,20 L2.85693427,21.1905292 C2.65744295,21.3814685 2.34093638,21.3745358 2.14999706,21.1750444 C2.06092565,21.0819836 2.01120804,20.958136 2.01120804,20.8293182 L2.01120804,18.32426 C1.99400175,18.2187196 1.98505595,18.1104045 1.98505595,18 Z M6.5,14 C6.22385763,14 6,14.2238576 6,14.5 C6,14.7761424 6.22385763,15 6.5,15 L11.5,15 C11.7761424,15 12,14.7761424 12,14.5 C12,14.2238576 11.7761424,14 11.5,14 L6.5,14 Z M9.5,16 C9.22385763,16 9,16.2238576 9,16.5 C9,16.7761424 9.22385763,17 9.5,17 L11.5,17 C11.7761424,17 12,16.7761424 12,16.5 C12,16.2238576 11.7761424,16 11.5,16 L9.5,16 Z"
											fill="#000000" opacity="0.3" />
											</g>
										</svg> <!--end::Svg Icon-->
							</span>
							</span>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-normel text-dark-75 text-hover-primary font-size-lg mb-1">Purpose
									would be to persuade</a> <span class="text-muted font-size-sm">Due
									in 2 Days</span>
							</div>
							<span class="font-weight-bolder text-danger py-1 font-size-lg">-27%</span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div class="d-flex align-items-center bg-light-info rounded p-5">
							<span class="svg-icon svg-icon-info mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/General/Attachment2.svg-->
									<svg xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
										height="24px" viewBox="0 0 24 24" version="1.1">
											<g stroke="none" stroke-width="1" fill="none"
											fill-rule="evenodd">
												<rect x="0" y="0" width="24" height="24" />
												<path
											d="M11.7573593,15.2426407 L8.75735931,15.2426407 C8.20507456,15.2426407 7.75735931,15.6903559 7.75735931,16.2426407 C7.75735931,16.7949254 8.20507456,17.2426407 8.75735931,17.2426407 L11.7573593,17.2426407 L11.7573593,18.2426407 C11.7573593,19.3472102 10.8619288,20.2426407 9.75735931,20.2426407 L5.75735931,20.2426407 C4.65278981,20.2426407 3.75735931,19.3472102 3.75735931,18.2426407 L3.75735931,14.2426407 C3.75735931,13.1380712 4.65278981,12.2426407 5.75735931,12.2426407 L9.75735931,12.2426407 C10.8619288,12.2426407 11.7573593,13.1380712 11.7573593,14.2426407 L11.7573593,15.2426407 Z"
											fill="#000000" opacity="0.3"
											transform="translate(7.757359, 16.242641) rotate(-45.000000) translate(-7.757359, -16.242641)" />
												<path
											d="M12.2426407,8.75735931 L15.2426407,8.75735931 C15.7949254,8.75735931 16.2426407,8.30964406 16.2426407,7.75735931 C16.2426407,7.20507456 15.7949254,6.75735931 15.2426407,6.75735931 L12.2426407,6.75735931 L12.2426407,5.75735931 C12.2426407,4.65278981 13.1380712,3.75735931 14.2426407,3.75735931 L18.2426407,3.75735931 C19.3472102,3.75735931 20.2426407,4.65278981 20.2426407,5.75735931 L20.2426407,9.75735931 C20.2426407,10.8619288 19.3472102,11.7573593 18.2426407,11.7573593 L14.2426407,11.7573593 C13.1380712,11.7573593 12.2426407,10.8619288 12.2426407,9.75735931 L12.2426407,8.75735931 Z"
											fill="#000000"
											transform="translate(16.242641, 7.757359) rotate(-45.000000) translate(-16.242641, -7.757359)" />
												<path
											d="M5.89339828,3.42893219 C6.44568303,3.42893219 6.89339828,3.87664744 6.89339828,4.42893219 L6.89339828,6.42893219 C6.89339828,6.98121694 6.44568303,7.42893219 5.89339828,7.42893219 C5.34111353,7.42893219 4.89339828,6.98121694 4.89339828,6.42893219 L4.89339828,4.42893219 C4.89339828,3.87664744 5.34111353,3.42893219 5.89339828,3.42893219 Z M11.4289322,5.13603897 C11.8194565,5.52656326 11.8194565,6.15972824 11.4289322,6.55025253 L10.0147186,7.96446609 C9.62419433,8.35499039 8.99102936,8.35499039 8.60050506,7.96446609 C8.20998077,7.5739418 8.20998077,6.94077682 8.60050506,6.55025253 L10.0147186,5.13603897 C10.4052429,4.74551468 11.0384079,4.74551468 11.4289322,5.13603897 Z M0.600505063,5.13603897 C0.991029355,4.74551468 1.62419433,4.74551468 2.01471863,5.13603897 L3.42893219,6.55025253 C3.81945648,6.94077682 3.81945648,7.5739418 3.42893219,7.96446609 C3.0384079,8.35499039 2.40524292,8.35499039 2.01471863,7.96446609 L0.600505063,6.55025253 C0.209980772,6.15972824 0.209980772,5.52656326 0.600505063,5.13603897 Z"
											fill="#000000" opacity="0.3"
											transform="translate(6.014719, 5.843146) rotate(-45.000000) translate(-6.014719, -5.843146)" />
												<path
											d="M17.9142136,15.4497475 C18.4664983,15.4497475 18.9142136,15.8974627 18.9142136,16.4497475 L18.9142136,18.4497475 C18.9142136,19.0020322 18.4664983,19.4497475 17.9142136,19.4497475 C17.3619288,19.4497475 16.9142136,19.0020322 16.9142136,18.4497475 L16.9142136,16.4497475 C16.9142136,15.8974627 17.3619288,15.4497475 17.9142136,15.4497475 Z M23.4497475,17.1568542 C23.8402718,17.5473785 23.8402718,18.1805435 23.4497475,18.5710678 L22.0355339,19.9852814 C21.6450096,20.3758057 21.0118446,20.3758057 20.6213203,19.9852814 C20.2307961,19.5947571 20.2307961,18.9615921 20.6213203,18.5710678 L22.0355339,17.1568542 C22.4260582,16.76633 23.0592232,16.76633 23.4497475,17.1568542 Z M12.6213203,17.1568542 C13.0118446,16.76633 13.6450096,16.76633 14.0355339,17.1568542 L15.4497475,18.5710678 C15.8402718,18.9615921 15.8402718,19.5947571 15.4497475,19.9852814 C15.0592232,20.3758057 14.4260582,20.3758057 14.0355339,19.9852814 L12.6213203,18.5710678 C12.2307961,18.1805435 12.2307961,17.5473785 12.6213203,17.1568542 Z"
											fill="#000000" opacity="0.3"
											transform="translate(18.035534, 17.863961) scale(1, -1) rotate(45.000000) translate(-18.035534, -17.863961)" />
											</g>
										</svg> <!--end::Svg Icon-->
							</span>
							</span>
							<div class="d-flex flex-column flex-grow-1 mr-2">
								<a href="#"
									class="font-weight-normel text-dark-75 text-hover-primary font-size-lg mb-1">The
									best product</a> <span class="text-muted font-size-sm">Due
									in 2 Days</span>
							</div>
							<span class="font-weight-bolder text-info py-1 font-size-lg">+8%</span>
						</div>
						<!--end: Item-->
					</div>
					<!--end::Section-->
				</div>
				<!--end::Tabpane-->
				<!--begin::Tabpane-->
				<div class="tab-pane fade pt-2 pr-5 mr-n5"
					id="kt_quick_panel_notifications" role="tabpanel">
					<!--begin::Nav-->
					<div class="navi navi-icon-circle navi-spacer-x-0">
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon-bell text-success icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">5 new user
										generated report</div>
									<div class="text-muted">Reports based on sales</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon2-box text-danger icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">2 new items
										submited</div>
									<div class="text-muted">by Grog John</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon-psd text-primary icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">79 PSD files
										generated</div>
									<div class="text-muted">Reports based on sales</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon2-supermarket text-warning icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">$2900 worth
										producucts sold</div>
									<div class="text-muted">Total 234 items</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon-paper-plane-1 text-success icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">4.5h-avarage
										response time</div>
									<div class="text-muted">Fostest is Barry</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon-safe-shield-protection text-danger icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">3 Defence
										alerts</div>
									<div class="text-muted">40% less alerts thar last week</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon-notepad text-primary icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">Avarage 4 blog
										posts per author</div>
									<div class="text-muted">Most posted 12 time</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						<a href="#" class="navi-item">
							<div class="navi-link rounded">
								<div class="symbol symbol-50 mr-3">
									<div class="symbol-label">
										<i class="flaticon-users-1 text-warning icon-lg"></i>
									</div>
								</div>
								<div class="navi-text">
									<div class="font-weight-bold font-size-lg">16 authors
										joined last week</div>
									<div class="text-muted">9 photodrapehrs, 7 designer</div>
								</div>
							</div>
						</a>
						<!--end::Item-->
						<!--begin::Item-->
						
						<!--end::Item-->
						<!--begin::Item-->
						
						<!--end::Item-->
						
					</div>
					<!--end::Nav-->
				</div>
				<!--end::Tabpane-->
				<!--begin::Tabpane-->
				<div class="tab-pane fade pt-3 pr-5 mr-n5"
					id="kt_quick_panel_settings" role="tabpanel">
					<form class="form">
						<!--begin::Section-->
						<div>
							<h5 class="font-weight-bold mb-3">Customer Care</h5>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Enable
									Notifications:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-success switch-sm"> <label>
											<input type="checkbox" checked="checked" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Enable Case
									Tracking:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-success switch-sm"> <label>
											<input type="checkbox" name="quick_panel_notifications_2" />
											<span></span>
									</label>
									</span>
								</div>
							</div>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Support Portal:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-success switch-sm"> <label>
											<input type="checkbox" checked="checked" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
						</div>
						<!--end::Section-->
						<div class="separator separator-dashed my-6"></div>
						<!--begin::Section-->
						<div class="pt-2">
							<h5 class="font-weight-bold mb-3">Reports</h5>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Generate Reports:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-sm switch-danger"> <label>
											<input type="checkbox" checked="checked" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Enable Report
									Export:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-sm switch-danger"> <label>
											<input type="checkbox" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Allow Data
									Collection:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-sm switch-danger"> <label>
											<input type="checkbox" checked="checked" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
						</div>
						<!--end::Section-->
						<div class="separator separator-dashed my-6"></div>
						<!--begin::Section-->
						<div class="pt-2">
							<h5 class="font-weight-bold mb-3">Memebers</h5>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Enable Member
									singup:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-sm switch-primary"> <label>
											<input type="checkbox" checked="checked" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Allow User
									Feedbacks:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-sm switch-primary"> <label>
											<input type="checkbox" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
							<div class="form-group mb-0 row align-items-center">
								<label class="col-8 col-form-label">Enable Customer
									Portal:</label>
								<div class="col-4 d-flex justify-content-end">
									<span class="switch switch-sm switch-primary"> <label>
											<input type="checkbox" checked="checked" name="select" /> <span></span>
									</label>
									</span>
								</div>
							</div>
						</div>
						<!--end::Section-->
					</form>
				</div>
				<!--end::Tabpane-->
			</div>
		</div>
		<!--end::Content-->
	</div>
	<!--end::Quick Panel-->
	<!--begin::Chat Panel-->
	<div class="modal modal-sticky modal-sticky-bottom-right"
		id="kt_chat_modal" role="dialog" data-backdrop="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<!--begin::Card-->
				<div class="card card-custom">
					<!--begin::Header-->
					<div class="card-header align-items-center px-4 py-3">
						<div class="text-left flex-grow-1">
							<!--begin::Dropdown Menu-->
							<div class="dropdown dropdown-inline">
								<button type="button"
									class="btn btn-clean btn-sm btn-icon btn-icon-md"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<span class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Communication/Add-user.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M18,8 L16,8 C15.4477153,8 15,7.55228475 15,7 C15,6.44771525 15.4477153,6 16,6 L18,6 L18,4 C18,3.44771525 18.4477153,3 19,3 C19.5522847,3 20,3.44771525 20,4 L20,6 L22,6 C22.5522847,6 23,6.44771525 23,7 C23,7.55228475 22.5522847,8 22,8 L20,8 L20,10 C20,10.5522847 19.5522847,11 19,11 C18.4477153,11 18,10.5522847 18,10 L18,8 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z"
												fill="#000000" fill-rule="nonzero" opacity="0.3" />
													<path
												d="M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z"
												fill="#000000" fill-rule="nonzero" />
												</g>
											</svg> <!--end::Svg Icon-->
									</span>
								</button>
								<div
									class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-md">
									<!--begin::Navigation-->
									<ul class="navi navi-hover py-5">
										<li class="navi-item"><a href="#" class="navi-link">
												<span class="navi-icon"> <i class="flaticon2-drop"></i>
											</span> <span class="navi-text">New Group</span>
										</a></li>
										<li class="navi-item"><a href="#" class="navi-link">
												<span class="navi-icon"> <i class="flaticon2-list-3"></i>
											</span> <span class="navi-text">Contacts</span>
										</a></li>
										<li class="navi-item"><a href="#" class="navi-link">
												<span class="navi-icon"> <i
													class="flaticon2-rocket-1"></i>
											</span> <span class="navi-text">Groups</span> <span
												class="navi-link-badge"> <span
													class="label label-light-primary label-inline font-weight-bold">new</span>
											</span>
										</a></li>
										<li class="navi-item"><a href="#" class="navi-link">
												<span class="navi-icon"> <i class="flaticon2-bell-2"></i>
											</span> <span class="navi-text">Calls</span>
										</a></li>
										<li class="navi-item"><a href="#" class="navi-link">
												<span class="navi-icon"> <i class="flaticon2-gear"></i>
											</span> <span class="navi-text">Settings</span>
										</a></li>
										<li class="navi-separator my-3"></li>
										<li class="navi-item"><a href="#" class="navi-link">
												<span class="navi-icon"> <i
													class="flaticon2-magnifier-tool"></i>
											</span> <span class="navi-text">Help</span>
										</a></li>
										<li class="navi-item"><a href="#" class="navi-link">
												<span class="navi-icon"> <i class="flaticon2-bell-2"></i>
											</span> <span class="navi-text">Privacy</span> <span
												class="navi-link-badge"> <span
													class="label label-light-danger label-rounded font-weight-bold">5</span>
											</span>
										</a></li>
									</ul>
									<!--end::Navigation-->
								</div>
							</div>
							<!--end::Dropdown Menu-->
						</div>
						<div class="text-center flex-grow-1">
							<div class="text-dark-75 font-weight-bold font-size-h5">Matt
								Pears</div>
							<div>
								<span class="label label-dot label-success"></span> <span
									class="font-weight-bold text-muted font-size-sm">Active</span>
							</div>
						</div>
						<div class="text-right flex-grow-1">
							<button type="button"
								class="btn btn-clean btn-sm btn-icon btn-icon-md"
								data-dismiss="modal">
								<i class="ki ki-close icon-1x"></i>
							</button>
						</div>
					</div>
					<!--end::Header-->
					<!--begin::Body-->
					<div class="card-body">
						<!--begin::Scroll-->
						<div class="scroll scroll-pull" data-height="375"
							data-mobile-height="300">
							<!--begin::Messages-->
							<div class="messages">
								<!--begin::Message In-->
								<div class="d-flex flex-column mb-5 align-items-start">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-circle symbol-40 mr-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
										<div>
											<a href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">Matt
												Pears</a> <span class="text-muted font-size-sm">2 Hours</span>
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-success text-dark-50 font-weight-bold font-size-lg text-left max-w-400px">How
										likely are you to recommend our company to your friends and
										family?</div>
								</div>
								<!--end::Message In-->
								<!--begin::Message Out-->
								<div class="d-flex flex-column mb-5 align-items-end">
									<div class="d-flex align-items-center">
										<div>
											<span class="text-muted font-size-sm">3 minutes</span> <a
												href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">You</a>
										</div>
										<div class="symbol symbol-circle symbol-40 ml-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-primary text-dark-50 font-weight-bold font-size-lg text-right max-w-400px">Hey
										there, we’re just writing to let you know that you’ve been
										subscribed to a repository on GitHub.</div>
								</div>
								<!--end::Message Out-->
								<!--begin::Message In-->
								<div class="d-flex flex-column mb-5 align-items-start">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-circle symbol-40 mr-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
										<div>
											<a href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">Matt
												Pears</a> <span class="text-muted font-size-sm">40
												seconds</span>
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-success text-dark-50 font-weight-bold font-size-lg text-left max-w-400px">Ok,
										Understood!</div>
								</div>
								<!--end::Message In-->
								<!--begin::Message Out-->
								<div class="d-flex flex-column mb-5 align-items-end">
									<div class="d-flex align-items-center">
										<div>
											<span class="text-muted font-size-sm">Just now</span> <a
												href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">You</a>
										</div>
										<div class="symbol symbol-circle symbol-40 ml-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-primary text-dark-50 font-weight-bold font-size-lg text-right max-w-400px">You’ll
										receive notifications for all issues, pull requests!</div>
								</div>
								<!--end::Message Out-->
								<!--begin::Message In-->
								<div class="d-flex flex-column mb-5 align-items-start">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-circle symbol-40 mr-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
										<div>
											<a href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">Matt
												Pears</a> <span class="text-muted font-size-sm">40
												seconds</span>
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-success text-dark-50 font-weight-bold font-size-lg text-left max-w-400px">
										You can unwatch this repository immediately by clicking here:
										<a href="#">https://github.com</a>
									</div>
								</div>
								<!--end::Message In-->
								<!--begin::Message Out-->
								<div class="d-flex flex-column mb-5 align-items-end">
									<div class="d-flex align-items-center">
										<div>
											<span class="text-muted font-size-sm">Just now</span> <a
												href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">You</a>
										</div>
										<div class="symbol symbol-circle symbol-40 ml-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-primary text-dark-50 font-weight-bold font-size-lg text-right max-w-400px">Discover
										what students who viewed Learn Figma - UI/UX Design. Essential
										Training also viewed</div>
								</div>
								<!--end::Message Out-->
								<!--begin::Message In-->
								<div class="d-flex flex-column mb-5 align-items-start">
									<div class="d-flex align-items-center">
										<div class="symbol symbol-circle symbol-40 mr-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
										<div>
											<a href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">Matt
												Pears</a> <span class="text-muted font-size-sm">40
												seconds</span>
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-success text-dark-50 font-weight-bold font-size-lg text-left max-w-400px">Most
										purchased Business courses during this sale!</div>
								</div>
								<!--end::Message In-->
								<!--begin::Message Out-->
								<div class="d-flex flex-column mb-5 align-items-end">
									<div class="d-flex align-items-center">
										<div>
											<span class="text-muted font-size-sm">Just now</span> <a
												href="#"
												class="text-dark-75 text-hover-primary font-weight-bold font-size-h6">You</a>
										</div>
										<div class="symbol symbol-circle symbol-40 ml-3">
											<img alt="Pic"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack005.jpg" />
										</div>
									</div>
									<div
										class="mt-2 rounded p-5 bg-light-primary text-dark-50 font-weight-bold font-size-lg text-right max-w-400px">Company
										BBQ to celebrate the last quater achievements and goals. Food
										and drinks provided</div>
								</div>
								<!--end::Message Out-->
							</div>
							<!--end::Messages-->
						</div>
						<!--end::Scroll-->
					</div>
					<!--end::Body-->
					<!--begin::Footer-->
					<div class="card-footer align-items-center">
						<!--begin::Compose-->
						<textarea class="form-control border-0 p-0" rows="2"
							placeholder="Type a message"></textarea>
						<div
							class="d-flex align-items-center justify-content-between mt-5">
							<div class="mr-3">
								<a href="#" class="btn btn-clean btn-icon btn-md mr-1"> <i
									class="flaticon2-photograph icon-lg"></i>
								</a> <a href="#" class="btn btn-clean btn-icon btn-md"> <i
									class="flaticon2-photo-camera icon-lg"></i>
								</a>
							</div>
							<div>
								<button type="button"
									class="btn btn-primary btn-md text-uppercase font-weight-bold chat-send py-2 px-6">Send</button>
							</div>
						</div>
						<!--begin::Compose-->
					</div>
					<!--end::Footer-->
				</div>
				<!--end::Card-->
			</div>
		</div>
	</div>
	<!--end::Chat Panel-->
	<!--begin::Scrolltop-->
	<div id="kt_scrolltop" class="scrolltop">
		<span class="svg-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Navigation/Up-2.svg-->
			<svg xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
				height="24px" viewBox="0 0 24 24" version="1.1">
					<g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
						<polygon points="0 0 24 0 24 24 0 24" />
						<rect fill="#000000" opacity="0.3" x="11" y="10" width="2"
					height="10" rx="1" />
						<path
					d="M6.70710678,12.7071068 C6.31658249,13.0976311 5.68341751,13.0976311 5.29289322,12.7071068 C4.90236893,12.3165825 4.90236893,11.6834175 5.29289322,11.2928932 L11.2928932,5.29289322 C11.6714722,4.91431428 12.2810586,4.90106866 12.6757246,5.26284586 L18.6757246,10.7628459 C19.0828436,11.1360383 19.1103465,11.7686056 18.7371541,12.1757246 C18.3639617,12.5828436 17.7313944,12.6103465 17.3242754,12.2371541 L12.0300757,7.38413782 L6.70710678,12.7071068 Z"
					fill="#000000" fill-rule="nonzero" />
					</g>
				</svg> <!--end::Svg Icon-->
		</span>
	</div>
	<!--end::Scrolltop-->
	<!--begin::Sticky Toolbar-->
	<!-- <ul class="sticky-toolbar nav flex-column pl-2 pr-2 pt-3 pb-3 mt-4">
		begin::Item
		<li class="nav-item mb-2" id="kt_demo_panel_toggle"
			data-toggle="tooltip" title="Check out more demos"
			data-placement="right"><a
			class="btn btn-sm btn-icon btn-bg-light btn-icon-success btn-hover-success"
			href="#"> <i class="flaticon2-drop"></i>
		</a></li>
		end::Item
		begin::Item
		<li class="nav-item mb-2" data-toggle="tooltip" title="Layout Builder"
			data-placement="left"><a
			class="btn btn-sm btn-icon btn-bg-light btn-icon-primary btn-hover-primary"
			href="https://preview.keenthemes.com/metronic/demo2/builder.html"
			target="_blank"> <i class="flaticon2-gear"></i>
		</a></li>
		end::Item
		begin::Item
		<li class="nav-item mb-2" data-toggle="tooltip" title="Documentation"
			data-placement="left"><a
			class="btn btn-sm btn-icon btn-bg-light btn-icon-warning btn-hover-warning"
			href="https://keenthemes.com/metronic/?page=docs" target="_blank">
				<i class="flaticon2-telegram-logo"></i>
		</a></li>
		end::Item
		begin::Item
		<li class="nav-item" id="kt_sticky_toolbar_chat_toggler"
			data-toggle="tooltip" title="Chat Example" data-placement="left">
			<a
			class="btn btn-sm btn-icon btn-bg-light btn-icon-danger btn-hover-danger"
			href="#" data-toggle="modal" data-target="#kt_chat_modal"> <i
				class="flaticon2-chat-1"></i>
		</a>
		</li>
		end::Item
	</ul> -->
	<!--end::Sticky Toolbar-->
	<!--begin::Demo Panel-->
	<div id="kt_demo_panel" class="offcanvas offcanvas-right p-10">
		<!--begin::Header-->
		<div
			class="offcanvas-header d-flex align-items-center justify-content-between pb-7">
			<h4 class="font-weight-bold m-0">Select A Demo</h4>
			<a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary"
				id="kt_demo_panel_close"> <i
				class="ki ki-close icon-xs text-muted"></i>
			</a>
		</div>
		<!--end::Header-->
		<!--begin::Content-->

		<!--end::Content-->
	</div>
	<!--end::Demo Panel-->
	<script src="//www.amcharts.com/lib/3/amcharts.js"></script>
	<script src="//www.amcharts.com/lib/3/serial.js"></script>
	<script src="//www.amcharts.com/lib/3/radar.js"></script>
	<script src="//www.amcharts.com/lib/3/pie.js"></script>
	<script
		src="//www.amcharts.com/lib/3/plugins/tools/polarScatter/polarScatter.min.js"></script>
	<script src="//www.amcharts.com/lib/3/plugins/animate/animate.min.js"></script>
	<script src="//www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
	<script src="//www.amcharts.com/lib/3/themes/light.js"></script>
	<script
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/charts/amcharts/charts.js"></script>
	<script>

	
	
	var k = 0;
		$.ajax({
			url : base + "/bakeshackAPI/api/getTop5ProductDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						k++;
						$("#top_product_" + k).text(e.product_name);
						$("#top_product_qty_" + k).text(
								"#" + parseInt(e.product_total));

						//dashboard_week_sale.push(e.days);

					})
				}
			}
		});

		$.ajax({
			url : base + "/bakeshackAPI/api/getCustomerCount",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {

						$("#total_customer_count").text(e.customer_count);

						//dashboard_week_sale.push(e.days);

					})
				}
			}
		});

		$.ajax({
			url : base + "/bakeshackAPI/api/getTodaysFootfallCount",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {

						$("#footfall_count").text(e.todays_footfall);

						//dashboard_week_sale.push(e.days);

					})
				}
			}
		});

		var subcategory_count = [];
		var subcategory = [];

		$.ajax({
			url : base + "/bakeshackAPI/api/getSubcategoryCountDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						subcategory.push(e.subcategory_name);
						subcategory_count.push(e.monthly_sum);

					})
				}
			}
		});
		var top_subcategory_name="";
		var top_subcategory_count = Math.max(...subcategory_count);
		//alert(top_subcategory_count);

		$.ajax({
			url : base + "/bakeshackAPI/api/getSubcategoryCountDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						
						if(e.monthly_sum == top_subcategory_count)
							{
							top_subcategory_name = e.subcategory_name;
						/* subcategory.push(e.subcategory_name);
						subcategory_count.push(e.monthly_sum); */
							}

					})
				}
			}
		});
		
	//alert(top_subcategory_name);
		
		$("#top_Subcategory").text(top_subcategory_name);
		$("#top_subcategory_count").text("#"+top_subcategory_count);
		
		
		
		var dashboard_month = [];
		var dashboard_months_sale = [];
		var dashboard_months_purchase = [];
		var month_count = 0;
		var month_sale_sum = 0;
		var month_sale_average;
		var month_purchase_sum = 0;
		var month_purchase_average = 0;
		$.ajax({
			url : base + "/bakeshackAPI/api/getMonthWiseSaleReportForGraph",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						month_count++;
						month_sale_sum += parseInt(e.monthly_sum);
						dashboard_month.push(e.production_to_month);
						dashboard_months_sale.push(e.monthly_sum);

					})
				}
			}
		});
		month_sale_average = month_sale_sum / month_count;

		//alert("month_sale_average"+month_sale_average);
		$
				.ajax({
					url : base
							+ "/bakeshackAPI/api/getMonthWisePurchaseReportForGraph",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						"flag" : 1
					},
					success : function(data) {
						if (data != null) {
							data.forEach(function(e) {
								month_purchase_sum += parseInt(e.monthly_sum);
								dashboard_months_purchase.push(e.monthly_sum);

							})
						}
					}
				});

		month_purchase_average = month_purchase_sum / month_count;

		$("#average_expances").text("₹" + month_purchase_average);
		$("#average_sale").text("₹" + month_sale_average);
		$("#annual_expances").text("₹" + month_purchase_sum);
		$("#annual_income").text("₹" + month_sale_sum);

		var dashboard_week_sale = [];
		var dashboard_week_purchase = [];

		var week_days_count = 0;
		var weekly_sale_sum = 0;
		var weekly_sale_average;
		var weekly_purchase_sum = 0;
		var weekly_purchase_average = 0;
		
		
		
		
		
		$.ajax({
			url : base + "/bakeshackAPI/api/getWeekWiseSaleReportForGraph",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						//alert(e.days);
						dashboard_week_sale.push(e.days);

					})
				}
			}
		});

		$.ajax({
			url : base + "/bakeshackAPI/api/getWeekWisePurchaseReportForGraph",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						for (i = 0; i < dashboard_week_sale.lenght; i++) {
							if (dashboard_week_sale[i] != e.days) {
								dashboard_week_sale.push(e.days);
							}
						}
					})
				}
			}
		});

		//alert("week_days"+ dashboard_week_sale);

		var week_sale_for_graph = [];
		var week_purchase_for_graph = [];

		var i = 0;
		$.ajax({
			url : base + "/bakeshackAPI/api/getWeekWiseSaleReportForGraph",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						//alert(e.day_wise_sum);

						if (dashboard_week_sale[i] == e.days) {
							week_sale_for_graph.push(e.day_wise_sum);
							
							weekly_sale_sum += parseInt(e.day_wise_sum);
							
							i++;
						} else {
							week_sale_for_graph.push('00');
						}

					})
				}
			}
		});

		
		
		var j = 0;
		$.ajax({
			url : base + "/bakeshackAPI/api/getWeekWisePurchaseReportForGraph",
			type : "post",
			dataType : "json",
			async : false,
			data : {
				"flag" : 1
			},
			success : function(data) {
				if (data != null) {
					data.forEach(function(e) {
						
							
							week_purchase_for_graph.push(e.day_wise_sum);
						
							j++;
							
							weekly_purchase_sum += parseInt(e.day_wise_sum);
						

					})
				}
			}
		});
		
		weekly_purchase_average = weekly_purchase_sum / 7;
	
		weekly_sale_average  = weekly_sale_sum / 7;
		$("#days_average_expances").text("₹" + parseInt(weekly_purchase_average));
		$("#days_average_sale").text("₹" + parseInt(weekly_sale_average));
		$("#weekly_expances").text("₹" + parseInt(weekly_purchase_sum));
		$("#weekly_income").text("₹" + parseInt(weekly_sale_sum));
		

		var KTApexChartsDemo = function() {
			var _demo12 = function() {
				const apexChart = "#chart_12";
				var options = {
					series : subcategory_count,
					chart : {
						width : 380,
						type : 'pie',
					},
					labels : subcategory,
					responsive : [ {
						breakpoint : 480,
						options : {
							chart : {
								width : 200
							},
							legend : {
								position : 'bottom'
							}
						}
					} ],
				/* colors: [primary, success, warning, danger, info] */
				};

				var chart = new ApexCharts(document.querySelector(apexChart),
						options);
				chart.render();
			}

			var _demo3 = function() {
				const apexChart = "#chart_2";
				var options = {
					series : [ {
						name : 'Month Sale',
						data : dashboard_months_sale
					}, {
						name : 'Month Purchase',
						data : dashboard_months_purchase
					} /* , {
									name: 'Free Cash Flow',
									data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
								} */],
					chart : {
						type : 'bar',
						height : 350
					},
					plotOptions : {
						bar : {
							horizontal : false,
							columnWidth : '55%',
							endingShape : 'rounded'
						},
					},
					dataLabels : {
						enabled : false
					},
					stroke : {
						show : true,
						width : 2,
						colors : [ 'transparent' ]
					},
					xaxis : {
						categories : dashboard_month,
					},
					yaxis : {
						title : {
							text : '$ (thousands)'
						}
					},
					fill : {
						opacity : 1
					},
					tooltip : {
						y : {
							formatter : function(val) {
								return "$ " + val + " thousands"
							}
						}
					},
				/* colors: [success, warning]  */
				};

				var chart = new ApexCharts(document.querySelector(apexChart),
						options);
				chart.render();
			}

			var _demo4 = function() {
				const apexChart = "#chart_5";
				var options = {
					series : [ {
						name : 'Weekly  Sale',
						data : week_sale_for_graph
					}, {
						name : 'Weekly Purchase',
						data : week_purchase_for_graph
					} /* , {
									name: 'Free Cash Flow',
									data: [35, 41, 36, 26, 45, 48, 52, 53, 41]
								} */],
					chart : {
						type : 'bar',
						height : 350
					},
					plotOptions : {
						bar : {
							horizontal : false,
							columnWidth : '55%',
							endingShape : 'rounded'
						},
					},
					dataLabels : {
						enabled : false
					},
					stroke : {
						show : true,
						width : 2,
						colors : [ 'transparent' ]
					},
					xaxis : {
						categories : dashboard_week_sale,
					},
					yaxis : {
						title : {
							text : '$ (thousands)'
						}
					},
					fill : {
						opacity : 1
					},
					tooltip : {
						y : {
							formatter : function(val) {
								return "$ " + val + " thousands"
							}
						}
					},
				/* colors: [success, warning]  */
				};

				var chart = new ApexCharts(document.querySelector(apexChart),
						options);
				chart.render();
			}
			
		
			const primary = '#f71197';
			const success = '#fcbd58';
			const info = '#eb008b';
			const warning = '#eb008b';
			const danger = '#F64E60';

			
			var _demo5 = function () {
				const apexChart = "#chart_3";
				var options = {
					series: [{
						name: 'Income',
						type: 'column',
						data: week_sale_for_graph
					}, {
						name: 'Cashflow',
						type: 'column',
						data: week_purchase_for_graph
					}],
					chart: {
						height: 350,
						type: 'line',
						stacked: false
					},
					dataLabels: {
						enabled: false
					},
					stroke: {
						width: [1, 1, 4]
					},
					
					xaxis: {
						categories: dashboard_week_sale,
					},
					yaxis: [
						{
							axisTicks: {
								show: true,
							},
							axisBorder: {
								show: true,
								color: primary
							},
							labels: {
								style: {
									colors: primary,
								}
							},
							title: {
								text: "Income (thousand crores)",
								style: {
									color: primary,
								}
							},
							tooltip: {
								enabled: true
							}
						},
						{
							seriesName: 'Income',
							opposite: true,
							axisTicks: {
								show: true,
							},
							axisBorder: {
								show: true,
								color: success
							},
							labels: {
								style: {
									colors: success,
								}
							},
							title: {
								text: "Operating Cashflow (thousand crores)",
								style: {
									color: success,
								}
							},
						}
						
					],
					
					
				};

				var chart = new ApexCharts(document.querySelector(apexChart), options);
				chart.render();
			}
			return {
				// public functions
				init : function() {
					_demo12();
					_demo3();
					_demo5();
				}
			};
		}();

		jQuery(document).ready(function() {
			KTApexChartsDemo.init();
		});

		"use strict";

		var KTamChartsChartsDemo = function() {

			var demo4 = function() {
				var chart = AmCharts
						.makeChart(
								"kt_amcharts_4",
								{
									"theme" : "light",
									"type" : "serial",
									"dataProvider" : [ {
										"country" : dashboard_week_sale,
										"year2004" : week_sale_for_graph,
										"year2005" : week_purchase_for_graph
									} ],
									"valueAxes" : [ {
										"stackType" : "3d",
										"unit" : "%",
										"position" : "left",
										"title" : "GDP growth rate",
									} ],
									"startDuration" : 1,
									"graphs" : [
											{
												"balloonText" : "GDP grow in [[category]] (2004): <b>[[value]]</b>",
												"fillAlphas" : 0.9,
												"lineAlpha" : 0.2,
												"title" : "2004",
												"type" : "column",
												"valueField" : "year2004"
											},
											{
												"balloonText" : "GDP grow in [[category]] (2005): <b>[[value]]</b>",
												"fillAlphas" : 0.9,
												"lineAlpha" : 0.2,
												"title" : "2005",
												"type" : "column",
												"valueField" : "year2005"
											} ],
									"plotAreaFillAlphas" : 0.1,
									"depth3D" : 40,
									"angle" : 20,
									"categoryField" : "country",
									"categoryAxis" : {
										"gridPosition" : "start"
									},
									"export" : {
										"enabled" : true
									}
								});
			}
			return {
				// public functions
				init : function() {

					demo4();

				}
			};
		}();

		jQuery(document).ready(function() {
			KTamChartsChartsDemo.init();
		});

		$('#updateRecipe').click(function() {

		})
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>