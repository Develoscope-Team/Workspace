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
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
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
										 <div id="chart_12" data-color="danger" style="height: 300px;">
												 </div> 
												<!-- <div id="chart_12"></div> -->
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
  -webkit-animation-duration: 2.5s;
  animation-name: fade;
  animation-duration: 2.0s;
}

@-webkit-keyframes fade {
  from {opacity: 1.0} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: 1.0} 
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
		
	
		
		$("#top_Subcategory").text(top_subcategory_name);
		$("#top_subcategory_count").text("#"+top_subcategory_count);
		var dashboard_month = [];
		var dashboard_months_sale = [0,0,0,0,0,0,0,0,0,0,0,0];
		var dashboard_months_purchase = [0,0,0,0,0,0,0,0,0,0,0,0];
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
						//dashboard_month.push(e.production_to_month);
						dashboard_months_sale[e.production_to_month -1] = e.monthly_sum;

					})
				}
			}
		});
		month_sale_average = month_sale_sum / month_count;
		$.ajax({
					url : base + "/bakeshackAPI/api/getMonthWisePurchaseReportForGraph",
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
								dashboard_months_purchase[e.production_to_month -1] = e.monthly_sum;

							})
						}
					}
				});
		month_purchase_average = month_purchase_sum / month_count;
		$("#average_expances").text("₹" + month_purchase_average);
		$("#average_sale").text("₹" + month_sale_average);
		$("#annual_expances").text("₹" + month_purchase_sum);
		$("#annual_income").text("₹" + month_sale_sum);
		var dashboard_week_sale = [0,0,0,0,0,0,0];
		var dashboard_week_purchase = [0,0,0,0,0,0,0];
		var week_days_count = 0;
		var weekly_sale_sum = 0;
		var weekly_sale_average;
		var weekly_purchase_sum = 0;
		var weekly_purchase_average = 0;
		var week_sale_for_graph =[0,0,0,0,0,0,0];
		var week_purchase_for_graph = [0,0,0,0,0,0,0];
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
						
							week_sale_for_graph[e.days -1] = e.day_wise_sum;
							
							weekly_sale_sum += parseInt(e.day_wise_sum);
							i++;
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
							week_purchase_for_graph[e.days - 1] = e.day_wise_sum;
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
					labels : subcategory
					
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
						color: '#BE508D',
						data :dashboard_months_sale
					}, {
						name : 'Month Purchase',
						color: '#9C4EB4',
						data :  dashboard_months_purchase
					} ],
					chart : {
						type : 'bar',
						height : 350
					},
					plotOptions : {
						bar : {
							horizontal : false,
							columnWidth : '75%',
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
						categories :['January','February','March','April','May','June','July','August','September','October','November','December'],
					},
					yaxis : {
						title : {
							
							text : ' (Amount in ₹)',
							style: {
								color: '#9C4EB4'
							}
						}
					},
					fill : {
						opacity : 1
					},
					tooltip : {
						y : {
							formatter : function(val) {
								return "₹ " + val + " Amount"
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
						color: info,
						data: week_sale_for_graph
					}, {
						name: 'Expenses',
						type: 'column',
						color: success,
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
						categories:['Mon','Tue','Wed','Thu','Fri','Sat','Sun']
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
								text: "Income (Amount in ₹)",
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
								text: " Expenses (Amount in ₹)",
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

		/* var KTamChartsChartsDemo = function() {

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
		}(); */

		/* jQuery(document).ready(function() {
			KTamChartsChartsDemo.init();
		});

		$('#updateRecipe').click(function() {

		}) */
		
		
		
		/* setTimeout(function() { 
			  alert("$premium$");
			}, 1);	 */
		

	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>