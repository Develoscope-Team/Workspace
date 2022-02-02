<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()	+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "IPD-OPD";
	try {
%>
<div id="kt_header_mobile" class="header-mobile header-mobile-fixed">
		<!--begin::Logo-->
		<a id="dashboard_logo"> <img alt="Logo"
			src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/gif/logo.png"
			class="logo-sticky max-h-65px" />
		</a>
		<!--end::Logo-->
		<!--begin::Toolbar-->
		<div class="d-flex align-items-center">
			<button class="btn p-0 burger-icon rounded-0 burger-icon-left"
				id="kt_aside_tablet_and_mobile_toggle">
				<span></span>
			</button>
			<button class="btn btn-hover-text-primary p-0 ml-3"
				id="kt_header_mobile_topbar_toggle">
				<span class="svg-icon svg-icon-xl"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/User.svg-->
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

<div class="aside aside-left d-flex flex-column flex-row-auto"
				id="kt_aside">
				<!--begin::Aside Menu-->
				<div class="aside-menu-wrapper flex-column-fluid"
					id="kt_aside_menu_wrapper">
					<!--begin::Menu Container-->
					<div id="kt_aside_menu" class="aside-menu min-h-lg-800px"
						data-menu-vertical="1" data-menu-scroll="1"
						data-menu-dropdown-timeout="500">
						<!--begin::Menu Nav-->
						<ul class="menu-nav">
							<li class="menu-item menu-item-active" aria-haspopup="true">
								<a id="dashboard" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span> <span class="menu-text">Dashboard</span>
							</a>
							</li>
							<!-- <li class="menu-section"><a href="./form-wizard.jsp">
									<h4 class="menu-text">New Patient Entry</h4>
							</a> <i class="menu-icon ki ki-bold-more-hor icon-md"></i></li> -->
							<li class="menu-item menu-item-submenu" aria-haspopup="true"
								data-menu-toggle="hover"><a href="javascript:;"
								class="menu-link menu-toggle"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Layout/Layout-4-blocks.svg-->
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
								</span> <span class="menu-text">Master</span> <i class="menu-arrow"></i>
							</a>
								<div class="menu-submenu">
									<i class="menu-arrow"></i>
									<ul class="menu-subnav">
										<li class="menu-item menu-item-parent" aria-haspopup="true" >
											<span class="menu-link"> <span class="menu-text">Applications</span>
										</span>
										</li>
										
										<li class="menu-item" aria-haspopup="true" id="medicine_type_master"><a
											href="./medicine-type-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Medicine Type Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="medicine_category_master"><a
											href="./medicine-category-master.jsp" class="menu-link">
												<i class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Medicine Category Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="medicine_master"><a
											href="./medicine-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Medicine Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="medicine_template_master"><a
											href="./template-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Medicine Template Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="complaint_master"><a
											href="./complaint-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Complaint Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="diagnosis_master"><a
											href="./diagnosis-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Diagnosis Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="remark_master"><a
											href="./remark-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Remark Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="advice_master"><a
											href="./advice-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Advice Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="qualification_master"><a
											href="./qualification-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Qualification Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="city_master"><a
											href="./city-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">City Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="district_master"><a
											href="./district-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">District Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="upi_master"><a
											href="./upi-master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">UPI Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="company_master"><a
											href="./company_master.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Company Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="role_master"><a
											href="./roleMaster.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">Role Master</span>
										</a></li>
										<li class="menu-item" aria-haspopup="true" id="user_master"><a
											href="./userMaster.jsp" class="menu-link"> <i
												class="menu-bullet menu-bullet-line"> <span></span>
											</i> <span class="menu-text">User Master</span>
										</a></li>
									</ul>
								</div></li>
						</ul>
						<!--end::Menu Nav-->
					</div>
					<!--end::Menu Container-->
				</div>
				<!--end::Aside Menu-->
			</div>
<div id="kt_quick_user" class="offcanvas offcanvas-right p-10">
		<!--begin::Header-->
		<div
			class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
			<h3 class="font-weight-bold m-0">
				User Profile <small class="text-muted font-size-sm ml-2">
					</small>
			</h3>
			<a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary"
				id="kt_quick_user_close"> <i
				class="ki ki-close icon-xs text-muted"></i>
			</a>
		</div>
		<!--end::Header-->
		<!--begin::Content-->
		<div class="offcanvas-content pr-5 mr-n5">
			<!--begin::Header-->
			<div class="d-flex align-items-center mt-5">
				<div class="symbol symbol-100 mr-5">
					<div class="symbol-label"
						style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/users/300_21.jpg')"></div>
					<i class="symbol-badge bg-success"></i>
				</div>
				<div class="d-flex flex-column">
					<a href="#"
						class="font-weight-bold font-size-h5 text-dark-75 text-hover-primary" id="navbar_user_name">  </a>
					<div class="text-muted mt-1" id="navbar_user_login">  </div>
					<div class="navi mt-2">
						<a href="#" class="navi-item"> <span
							class="navi-link p-0 pb-2"> <span class="navi-icon mr-1">
									<span class="svg-icon svg-icon-lg svg-icon-primary"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-notification.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<rect x="0" y="0" width="24" height="24" />
													<path
												d="M21,12.0829584 C20.6747915,12.0283988 20.3407122,12 20,12 C16.6862915,12 14,14.6862915 14,18 C14,18.3407122 14.0283988,18.6747915 14.0829584,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,8 C3,6.8954305 3.8954305,6 5,6 L19,6 C20.1045695,6 21,6.8954305 21,8 L21,12.0829584 Z M18.1444251,7.83964668 L12,11.1481833 L5.85557487,7.83964668 C5.4908718,7.6432681 5.03602525,7.77972206 4.83964668,8.14442513 C4.6432681,8.5091282 4.77972206,8.96397475 5.14442513,9.16035332 L11.6444251,12.6603533 C11.8664074,12.7798822 12.1335926,12.7798822 12.3555749,12.6603533 L18.8555749,9.16035332 C19.2202779,8.96397475 19.3567319,8.5091282 19.1603533,8.14442513 C18.9639747,7.77972206 18.5091282,7.6432681 18.1444251,7.83964668 Z"
												fill="#000000" />
													<circle fill="#000000" opacity="0.3" cx="19.5" cy="17.5"
												r="2.5" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span>
							</span> <span class="navi-text text-muted text-hover-primary" id="navbar_user_email"></span>
						</span>
						</a> <a id="sign_out"
							class="btn btn-sm btn-light-primary font-weight-bolder py-2 px-5">Sign
							Out</a>
					</div>
				</div>
			</div>
			<!--end::Header-->
			<!--begin::Separator-->
			<div class="separator separator-dashed mt-8 mb-5"></div>
			<!--end::Separator-->
			<div class="tab-pane fade show pt-3 pr-5 mr-n5 "
					 role="tabpanel">
					<!--begin::Section-->
					
					
					<div class="mb-5" id="navbar_calculation_details">
						<h5 class="font-weight-bold mb-5">Calculation</h5>
						<!--begin: Item-->
						<div
							class="d-flex align-items-center bg-light-warning rounded p-5 mb-5">
							<span class="svg-icon svg-icon-warning mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/Home/Library.svg-->
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
									class="font-weight-normal text-dark-75 text-hover-primary font-size-lg mb-1">Total Collection
									</a> <span class="text-muted font-size-sm">
									</span>
							</div>
							<span class="font-weight-bolder text-warning py-1 font-size-lg" id="navbar_total_collection"></span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div
							class="d-flex align-items-center bg-light-success rounded p-5 mb-5">
							<span class="svg-icon svg-icon-success mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Write.svg-->
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
									class="font-weight-normal text-dark-75 text-hover-primary font-size-lg mb-1">Today's Collection
									</a> <span class="text-muted font-size-sm"></span>
							</div>
							<span class="font-weight-bolder text-success py-1 font-size-lg" id="navbar_todays_collection"></span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div
							class="d-flex align-items-center bg-light-danger rounded p-5 mb-5">
							<span class="svg-icon svg-icon-danger mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Group-chat.svg-->
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
									class="font-weight-normel text-dark-75 text-hover-primary font-size-lg mb-1">Today's Expences</a> 
									<span class="text-muted font-size-sm"></span>
							</div>
							<span class="font-weight-bolder text-danger py-1 font-size-lg" id="navbar_todays_expences"></span>
						</div>
						<!--end: Item-->
						<!--begin: Item-->
						<div class="d-flex align-items-center bg-light-info rounded p-5">
							<span class="svg-icon svg-icon-info mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/Attachment2.svg-->
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
									class="font-weight-normel text-dark-75 text-hover-primary font-size-lg mb-1">Total Patient Count</a>
									 <span class="text-muted font-size-sm"></span>
							</div>
							<span class="font-weight-bolder text-info py-1 font-size-lg" id="navbar_total_patient_count"></span>
						</div>
						<!--end: Item-->
						
						
						<!--begin: Item-->
						<div class="d-flex align-items-center bg-light-info rounded p-5 mt-5">
							<span class="svg-icon svg-icon-info mr-5"> <span
								class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/media/svg/icons/General/Attachment2.svg-->
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
									class="font-weight-normel text-dark-75 text-hover-primary font-size-lg mb-1">Todays's Patient Count</a> 
									<span class="text-muted font-size-sm"></span>
							</div>
							<span class="font-weight-bolder text-info py-1 font-size-lg" id="navbar_todays_patient_count"></span>
						</div>
						<!--end: Item-->
						
						
					</div>
					<!--end::Section-->
				</div>
			<!--begin::Separator-->
			<div class="separator separator-dashed my-7"></div>
			<!--end::Separator-->
			
		</div>
		<!--end::Content-->
	</div>
	
	<div id="kt_quick_panel" class="offcanvas offcanvas-right pt-5 pb-10">
		<!--begin::Header-->
		<div
			class="offcanvas-header offcanvas-header-navs d-flex align-items-center justify-content-between mb-5">
			<ul
				class="nav nav-bold nav-tabs nav-tabs-line nav-tabs-line-3x nav-tabs-primary flex-grow-1 px-10"
				role="tablist">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#kt_quick_panel_logs">Report </a></li>
               <li class="nav-item"><a class="nav-link "
					data-toggle="tab" href="#kt_quick_panel_logs1">Charts</a></li>
				
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
				<div class="tab-pane fade show pt-3 pr-5 mr-n5 "
					id="kt_quick_panel_logs1" role="tabpanel">
					<!--begin::Section-->
					
					
					<div class="mb-5">
						<h5 class="font-weight-bold mb-5">Charts</h5>
						<div class="row gutter-b">
			<div class="col-6" id="navbar_temp_chart">
					<a href="tempchartshow.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-attachment.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M14.8571499,13 C14.9499122,12.7223297 15,12.4263059 15,12.1190476 L15,6.88095238 C15,5.28984632 13.6568542,4 12,4 L11.7272727,4 C10.2210416,4 9,5.17258756 9,6.61904762 L10.0909091,6.61904762 C10.0909091,5.75117158 10.823534,5.04761905 11.7272727,5.04761905 L12,5.04761905 C13.0543618,5.04761905 13.9090909,5.86843034 13.9090909,6.88095238 L13.9090909,12.1190476 C13.9090909,12.4383379 13.8240964,12.7385644 13.6746497,13 L10.3253503,13 C10.1759036,12.7385644 10.0909091,12.4383379 10.0909091,12.1190476 L10.0909091,9.5 C10.0909091,9.06606198 10.4572216,8.71428571 10.9090909,8.71428571 C11.3609602,8.71428571 11.7272727,9.06606198 11.7272727,9.5 L11.7272727,11.3333333 L12.8181818,11.3333333 L12.8181818,9.5 C12.8181818,8.48747796 11.9634527,7.66666667 10.9090909,7.66666667 C9.85472911,7.66666667 9,8.48747796 9,9.5 L9,12.1190476 C9,12.4263059 9.0500878,12.7223297 9.14285008,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L14.8571499,13 Z"
									fill="#000000" opacity="0.3" />
										<path
									d="M9,10.3333333 L9,12.1190476 C9,13.7101537 10.3431458,15 12,15 C13.6568542,15 15,13.7101537 15,12.1190476 L15,10.3333333 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 L9,10.3333333 Z M10.0909091,11.1212121 L12,12.5 L13.9090909,11.1212121 L13.9090909,12.1190476 C13.9090909,13.1315697 13.0543618,13.952381 12,13.952381 C10.9456382,13.952381 10.0909091,13.1315697 10.0909091,12.1190476 L10.0909091,11.1212121 Z"
									fill="#000000" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Temp Chart</span>
					</a>
				</div>
				
				<div class="col-6" id="navbar_bp_chart">
					<a href="bpsugarchartshow.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-attachment.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M14.8571499,13 C14.9499122,12.7223297 15,12.4263059 15,12.1190476 L15,6.88095238 C15,5.28984632 13.6568542,4 12,4 L11.7272727,4 C10.2210416,4 9,5.17258756 9,6.61904762 L10.0909091,6.61904762 C10.0909091,5.75117158 10.823534,5.04761905 11.7272727,5.04761905 L12,5.04761905 C13.0543618,5.04761905 13.9090909,5.86843034 13.9090909,6.88095238 L13.9090909,12.1190476 C13.9090909,12.4383379 13.8240964,12.7385644 13.6746497,13 L10.3253503,13 C10.1759036,12.7385644 10.0909091,12.4383379 10.0909091,12.1190476 L10.0909091,9.5 C10.0909091,9.06606198 10.4572216,8.71428571 10.9090909,8.71428571 C11.3609602,8.71428571 11.7272727,9.06606198 11.7272727,9.5 L11.7272727,11.3333333 L12.8181818,11.3333333 L12.8181818,9.5 C12.8181818,8.48747796 11.9634527,7.66666667 10.9090909,7.66666667 C9.85472911,7.66666667 9,8.48747796 9,9.5 L9,12.1190476 C9,12.4263059 9.0500878,12.7223297 9.14285008,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L14.8571499,13 Z"
									fill="#000000" opacity="0.3" />
										<path
									d="M9,10.3333333 L9,12.1190476 C9,13.7101537 10.3431458,15 12,15 C13.6568542,15 15,13.7101537 15,12.1190476 L15,10.3333333 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 L9,10.3333333 Z M10.0909091,11.1212121 L12,12.5 L13.9090909,11.1212121 L13.9090909,12.1190476 C13.9090909,13.1315697 13.0543618,13.952381 12,13.952381 C10.9456382,13.952381 10.0909091,13.1315697 10.0909091,12.1190476 L10.0909091,11.1212121 Z"
									fill="#000000" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">BP  Chart</span>
					</a>
				</div>
				</div>
			<div class="row gutter-b">
				<!--begin::Item-->
				<div class="col-6" id="navbar_temp_chart_pdf">
					<a href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/temp_chart.pdf"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-attachment.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M14.8571499,13 C14.9499122,12.7223297 15,12.4263059 15,12.1190476 L15,6.88095238 C15,5.28984632 13.6568542,4 12,4 L11.7272727,4 C10.2210416,4 9,5.17258756 9,6.61904762 L10.0909091,6.61904762 C10.0909091,5.75117158 10.823534,5.04761905 11.7272727,5.04761905 L12,5.04761905 C13.0543618,5.04761905 13.9090909,5.86843034 13.9090909,6.88095238 L13.9090909,12.1190476 C13.9090909,12.4383379 13.8240964,12.7385644 13.6746497,13 L10.3253503,13 C10.1759036,12.7385644 10.0909091,12.4383379 10.0909091,12.1190476 L10.0909091,9.5 C10.0909091,9.06606198 10.4572216,8.71428571 10.9090909,8.71428571 C11.3609602,8.71428571 11.7272727,9.06606198 11.7272727,9.5 L11.7272727,11.3333333 L12.8181818,11.3333333 L12.8181818,9.5 C12.8181818,8.48747796 11.9634527,7.66666667 10.9090909,7.66666667 C9.85472911,7.66666667 9,8.48747796 9,9.5 L9,12.1190476 C9,12.4263059 9.0500878,12.7223297 9.14285008,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L14.8571499,13 Z"
									fill="#000000" opacity="0.3" />
										<path
									d="M9,10.3333333 L9,12.1190476 C9,13.7101537 10.3431458,15 12,15 C13.6568542,15 15,13.7101537 15,12.1190476 L15,10.3333333 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 L9,10.3333333 Z M10.0909091,11.1212121 L12,12.5 L13.9090909,11.1212121 L13.9090909,12.1190476 C13.9090909,13.1315697 13.0543618,13.952381 12,13.952381 C10.9456382,13.952381 10.0909091,13.1315697 10.0909091,12.1190476 L10.0909091,11.1212121 Z"
									fill="#000000" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Temp Chart (.pdf)</span>
					</a>
				</div>
				<!--end::Item-->
				<!--begin::Item-->
				<div class="col-6" id="navbar_bp_chart_pdf">
					<a href="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/Bafana_OPD/gif/bp_sugar_chart.pdf"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-attachment.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M14.8571499,13 C14.9499122,12.7223297 15,12.4263059 15,12.1190476 L15,6.88095238 C15,5.28984632 13.6568542,4 12,4 L11.7272727,4 C10.2210416,4 9,5.17258756 9,6.61904762 L10.0909091,6.61904762 C10.0909091,5.75117158 10.823534,5.04761905 11.7272727,5.04761905 L12,5.04761905 C13.0543618,5.04761905 13.9090909,5.86843034 13.9090909,6.88095238 L13.9090909,12.1190476 C13.9090909,12.4383379 13.8240964,12.7385644 13.6746497,13 L10.3253503,13 C10.1759036,12.7385644 10.0909091,12.4383379 10.0909091,12.1190476 L10.0909091,9.5 C10.0909091,9.06606198 10.4572216,8.71428571 10.9090909,8.71428571 C11.3609602,8.71428571 11.7272727,9.06606198 11.7272727,9.5 L11.7272727,11.3333333 L12.8181818,11.3333333 L12.8181818,9.5 C12.8181818,8.48747796 11.9634527,7.66666667 10.9090909,7.66666667 C9.85472911,7.66666667 9,8.48747796 9,9.5 L9,12.1190476 C9,12.4263059 9.0500878,12.7223297 9.14285008,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L14.8571499,13 Z"
									fill="#000000" opacity="0.3" />
										<path
									d="M9,10.3333333 L9,12.1190476 C9,13.7101537 10.3431458,15 12,15 C13.6568542,15 15,13.7101537 15,12.1190476 L15,10.3333333 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 L9,10.3333333 Z M10.0909091,11.1212121 L12,12.5 L13.9090909,11.1212121 L13.9090909,12.1190476 C13.9090909,13.1315697 13.0543618,13.952381 12,13.952381 C10.9456382,13.952381 10.0909091,13.1315697 10.0909091,12.1190476 L10.0909091,11.1212121 Z"
									fill="#000000" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Bp Sugar Chart (.pdf)</span>
					</a>
				</div>
				<!--end::Item-->
			</div>
					</div>
					<!--end::Section-->
				</div>
				<!--end::Tabpane-->
			<div class="tab-pane fade show pt-3 pr-5 mr-n5 active"
					id="kt_quick_panel_logs" role="tabpanel">
					<!--begin::Section-->
					<div class="mb-5">
						<h5 class="font-weight-bold mb-5">Reports</h5>
						<!--begin: Item-->
						<div class="menu">
							<ul class="menu-nav">		
							<li class="menu-item menu-item-active mb-1" aria-haspopup="true" id="patient_reports">
								<a href="./patientWiseReport.jsp" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="80px"
											height="80px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span><font size="3" class="font-weight-bold mb-10 text-black" style="font-family:verdana;">  Patient Report  </font>
							</a>
							</li>
										<li class="menu-item menu-item-active mb-1" aria-haspopup="true" id="city_reports">
								<a href="./CityWiseReport.jsp" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span> <font size="3" class="font-weight-bold mb-10 text-black" style="font-family:verdana;">  City Report  </font>
							</a>
							</li>
							
							<li class="menu-item menu-item-active mb-1" aria-haspopup="true" id="diagnosis_reports">
								<a href="./DiagnosisWiseReport.jsp" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span> <font size="3" class="font-weight-bold mb-10 text-black" style="font-family:verdana;">   Diagnosis Report </font>
							</a>
							</li>
									<li class="menu-item menu-item-active mb-1" aria-haspopup="true" id="city_wise_patient_count_reports">
								<a href="./CityWisePatientCountjsp.jsp" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span> <font size="3" class="font-weight-bold mb-10 text-black" style="font-family:verdana; "> City Wise Patient Count</font>
							</a>
							</li>	

										
										<li class="menu-item menu-item-active mb-1" aria-haspopup="true" id="fees_collection">
								<a href="./FeesCollection.jsp" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span> <font size="3" class="font-weight-bold mb-10 text-black" style="font-family:verdana; "> Fees Collection </font>
							</a>
							</li>
<li class="menu-item menu-item-active mb-1" aria-haspopup="true" id="medical_representative_reports">
								<a href="./mr_visit_report.jsp" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span> <font size="3" class="font-weight-bold mb-10 text-black" style="font-family:verdana;"> Medical Representative  </font>
							</a>
							</li>
										
							<li class="menu-item menu-item-active mb-1" aria-haspopup="true" id="income_and_expenses_reports">
								<a href="./income_n_expenses_search.jsp" class="menu-link"> <span
									class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Layers.svg-->
										<svg xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
											height="24px" viewBox="0 0 24 24" version="1.1">
												<g stroke="none" stroke-width="1" fill="none"
												fill-rule="evenodd">
													<polygon points="0 0 24 0 24 24 0 24" />
													<path
												d="M12.9336061,16.072447 L19.36,10.9564761 L19.5181585,10.8312381 C20.1676248,10.3169571 20.2772143,9.3735535 19.7629333,8.72408713 C19.6917232,8.63415859 19.6104327,8.55269514 19.5206557,8.48129411 L12.9336854,3.24257445 C12.3871201,2.80788259 11.6128799,2.80788259 11.0663146,3.24257445 L4.47482784,8.48488609 C3.82645598,9.00054628 3.71887192,9.94418071 4.23453211,10.5925526 C4.30500305,10.6811601 4.38527899,10.7615046 4.47382636,10.8320511 L4.63,10.9564761 L11.0659024,16.0730648 C11.6126744,16.5077525 12.3871218,16.5074963 12.9336061,16.072447 Z"
												fill="#000000" fill-rule="nonzero" />
													<path
												d="M11.0563554,18.6706981 L5.33593024,14.122919 C4.94553994,13.8125559 4.37746707,13.8774308 4.06710397,14.2678211 C4.06471678,14.2708238 4.06234874,14.2738418 4.06,14.2768747 L4.06,14.2768747 C3.75257288,14.6738539 3.82516916,15.244888 4.22214834,15.5523151 C4.22358765,15.5534297 4.2250303,15.55454 4.22647627,15.555646 L11.0872776,20.8031356 C11.6250734,21.2144692 12.371757,21.2145375 12.909628,20.8033023 L19.7677785,15.559828 C20.1693192,15.2528257 20.2459576,14.6784381 19.9389553,14.2768974 C19.9376429,14.2751809 19.9363245,14.2734691 19.935,14.2717619 L19.935,14.2717619 C19.6266937,13.8743807 19.0546209,13.8021712 18.6572397,14.1104775 C18.654352,14.112718 18.6514778,14.1149757 18.6486172,14.1172508 L12.9235044,18.6705218 C12.377022,19.1051477 11.6029199,19.1052208 11.0563554,18.6706981 Z"
												fill="#000000" opacity="0.3" />
												</g>
											</svg> <!--end::Svg Icon-->
								</span> <font size="3" class="font-weight-bold mb-10 text-black" style="font-family:verdana; "> Income & Expenses </font>
							</a>
							</li>
									</ul>
								</div>
						<!--end: Item-->
					</div>
					<!--end::Section-->
				</div>
			</div>
		</div>
		<!--end::Content-->
	</div>
	
	<div id="kt_quick_notifications" class="offcanvas offcanvas-right p-10">
		<!--begin::Header-->
		<div
			class="offcanvas-header d-flex align-items-center justify-content-between mb-10">
			<h3 class="font-weight-bold m-0">
				Notifications <small class="text-muted font-size-sm ml-2">
					Upcoming Patient List</small>
			</h3>
			<a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary"
				id="kt_quick_notifications_close"> <i
				class="ki ki-close icon-xs text-muted"></i>
			</a>
		</div>
		<!--end::Header-->
		
		<div class="card-body pt-2" id="appointment_list"></div>
	</div>
	
	<div id="kt_quick_actions" class="offcanvas offcanvas-right p-10">
		<!--begin::Header-->
		<div
			class="offcanvas-header d-flex align-items-center justify-content-between pb-10">
			<h3 class="font-weight-bold m-0">
				Quick Actions <small class="text-muted font-size-sm ml-2">
					</small>
			</h3>
			<a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary"
				id="kt_quick_actions_close"> <i
				class="ki ki-close icon-xs text-muted"></i>
			</a>
		</div>
		<!--end::Header-->
		<!--begin::Content-->
		<div class="offcanvas-content pr-5 mr-n5">
			
			<div class="row gutter-b">
			<div class="col-6" id="navbar_new_patient_entry">
					<a href="./form-wizard.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-primary svg-icon-3x"><!--begin::Svg Icon | path:/var/www/preview.keenthemes.com/metronic/releases/2021-05-14-112058/theme/html/demo5/dist/../src/media/svg/icons/Communication/Add-user.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <polygon points="0 0 24 0 24 24 0 24"/>
        <path d="M18,8 L16,8 C15.4477153,8 15,7.55228475 15,7 C15,6.44771525 15.4477153,6 16,6 L18,6 L18,4 C18,3.44771525 18.4477153,3 19,3 C19.5522847,3 20,3.44771525 20,4 L20,6 L22,6 C22.5522847,6 23,6.44771525 23,7 C23,7.55228475 22.5522847,8 22,8 L20,8 L20,10 C20,10.5522847 19.5522847,11 19,11 C18.4477153,11 18,10.5522847 18,10 L18,8 Z M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
        <path d="M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z" fill="#000000" fill-rule="nonzero"/>
    </g>
</svg><!--end::Svg Icon--></span> <span class="d-block font-weight-bold font-size-h6 mt-2">New Patient Entry</span>
					</a>
				</div>
				
				<div class="col-6" id="navbar_prescription_print">
					<a href="./prescriptionPrint.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-attachment.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M14.8571499,13 C14.9499122,12.7223297 15,12.4263059 15,12.1190476 L15,6.88095238 C15,5.28984632 13.6568542,4 12,4 L11.7272727,4 C10.2210416,4 9,5.17258756 9,6.61904762 L10.0909091,6.61904762 C10.0909091,5.75117158 10.823534,5.04761905 11.7272727,5.04761905 L12,5.04761905 C13.0543618,5.04761905 13.9090909,5.86843034 13.9090909,6.88095238 L13.9090909,12.1190476 C13.9090909,12.4383379 13.8240964,12.7385644 13.6746497,13 L10.3253503,13 C10.1759036,12.7385644 10.0909091,12.4383379 10.0909091,12.1190476 L10.0909091,9.5 C10.0909091,9.06606198 10.4572216,8.71428571 10.9090909,8.71428571 C11.3609602,8.71428571 11.7272727,9.06606198 11.7272727,9.5 L11.7272727,11.3333333 L12.8181818,11.3333333 L12.8181818,9.5 C12.8181818,8.48747796 11.9634527,7.66666667 10.9090909,7.66666667 C9.85472911,7.66666667 9,8.48747796 9,9.5 L9,12.1190476 C9,12.4263059 9.0500878,12.7223297 9.14285008,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L14.8571499,13 Z"
									fill="#000000" opacity="0.3" />
										<path
									d="M9,10.3333333 L9,12.1190476 C9,13.7101537 10.3431458,15 12,15 C13.6568542,15 15,13.7101537 15,12.1190476 L15,10.3333333 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 L9,10.3333333 Z M10.0909091,11.1212121 L12,12.5 L13.9090909,11.1212121 L13.9090909,12.1190476 C13.9090909,13.1315697 13.0543618,13.952381 12,13.952381 C10.9456382,13.952381 10.0909091,13.1315697 10.0909091,12.1190476 L10.0909091,11.1212121 Z"
									fill="#000000" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Prescription Print</span>
					</a>
				</div>
				
				</div>
			
			
			
			<div class="row gutter-b">
				<!--begin::Item-->
				<div class="col-6" id="navbar_fee_collection">
					<a href="fee_module.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Shopping/Euro.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M4.3618034,10.2763932 L4.8618034,9.2763932 C4.94649941,9.10700119 5.11963097,9 5.30901699,9 L15.190983,9 C15.4671254,9 15.690983,9.22385763 15.690983,9.5 C15.690983,9.57762255 15.6729105,9.65417908 15.6381966,9.7236068 L15.1381966,10.7236068 C15.0535006,10.8929988 14.880369,11 14.690983,11 L4.80901699,11 C4.53287462,11 4.30901699,10.7761424 4.30901699,10.5 C4.30901699,10.4223775 4.32708954,10.3458209 4.3618034,10.2763932 Z M14.6381966,13.7236068 L14.1381966,14.7236068 C14.0535006,14.8929988 13.880369,15 13.690983,15 L4.80901699,15 C4.53287462,15 4.30901699,14.7761424 4.30901699,14.5 C4.30901699,14.4223775 4.32708954,14.3458209 4.3618034,14.2763932 L4.8618034,13.2763932 C4.94649941,13.1070012 5.11963097,13 5.30901699,13 L14.190983,13 C14.4671254,13 14.690983,13.2238576 14.690983,13.5 C14.690983,13.5776225 14.6729105,13.6541791 14.6381966,13.7236068 Z"
									fill="#000000" opacity="0.3" />
										<path
									d="M17.369,7.618 C16.976998,7.08599734 16.4660031,6.69750122 15.836,6.4525 C15.2059968,6.20749878 14.590003,6.085 13.988,6.085 C13.2179962,6.085 12.5180032,6.2249986 11.888,6.505 C11.2579969,6.7850014 10.7155023,7.16999755 10.2605,7.66 C9.80549773,8.15000245 9.45550123,8.72399671 9.2105,9.382 C8.96549878,10.0400033 8.843,10.7539961 8.843,11.524 C8.843,12.3360041 8.96199881,13.0779966 9.2,13.75 C9.43800119,14.4220034 9.7774978,14.9994976 10.2185,15.4825 C10.6595022,15.9655024 11.1879969,16.3399987 11.804,16.606 C12.4200031,16.8720013 13.1129962,17.005 13.883,17.005 C14.681004,17.005 15.3879969,16.8475016 16.004,16.5325 C16.6200031,16.2174984 17.1169981,15.8010026 17.495,15.283 L19.616,16.774 C18.9579967,17.6000041 18.1530048,18.2404977 17.201,18.6955 C16.2489952,19.1505023 15.1360064,19.378 13.862,19.378 C12.6999942,19.378 11.6325049,19.1855019 10.6595,18.8005 C9.68649514,18.4154981 8.8500035,17.8765035 8.15,17.1835 C7.4499965,16.4904965 6.90400196,15.6645048 6.512,14.7055 C6.11999804,13.7464952 5.924,12.6860058 5.924,11.524 C5.924,10.333994 6.13049794,9.25950479 6.5435,8.3005 C6.95650207,7.34149521 7.5234964,6.52600336 8.2445,5.854 C8.96550361,5.18199664 9.8159951,4.66400182 10.796,4.3 C11.7760049,3.93599818 12.8399943,3.754 13.988,3.754 C14.4640024,3.754 14.9609974,3.79949954 15.479,3.8905 C15.9970026,3.98150045 16.4939976,4.12149906 16.97,4.3105 C17.4460024,4.49950095 17.8939979,4.7339986 18.314,5.014 C18.7340021,5.2940014 19.0909985,5.62999804 19.385,6.022 L17.369,7.618 Z"
									fill="#000000" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Fee Collection</span>
					</a>
				</div>
				<!--end::Item-->
				<!--begin::Item-->
				<div class="col-6" id="navbar_fee_receipt_printing">
					<a href="feesReceiptPrinting.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Communication/Mail-attachment.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M14.8571499,13 C14.9499122,12.7223297 15,12.4263059 15,12.1190476 L15,6.88095238 C15,5.28984632 13.6568542,4 12,4 L11.7272727,4 C10.2210416,4 9,5.17258756 9,6.61904762 L10.0909091,6.61904762 C10.0909091,5.75117158 10.823534,5.04761905 11.7272727,5.04761905 L12,5.04761905 C13.0543618,5.04761905 13.9090909,5.86843034 13.9090909,6.88095238 L13.9090909,12.1190476 C13.9090909,12.4383379 13.8240964,12.7385644 13.6746497,13 L10.3253503,13 C10.1759036,12.7385644 10.0909091,12.4383379 10.0909091,12.1190476 L10.0909091,9.5 C10.0909091,9.06606198 10.4572216,8.71428571 10.9090909,8.71428571 C11.3609602,8.71428571 11.7272727,9.06606198 11.7272727,9.5 L11.7272727,11.3333333 L12.8181818,11.3333333 L12.8181818,9.5 C12.8181818,8.48747796 11.9634527,7.66666667 10.9090909,7.66666667 C9.85472911,7.66666667 9,8.48747796 9,9.5 L9,12.1190476 C9,12.4263059 9.0500878,12.7223297 9.14285008,13 L6,13 C5.44771525,13 5,12.5522847 5,12 L5,3 C5,2.44771525 5.44771525,2 6,2 L18,2 C18.5522847,2 19,2.44771525 19,3 L19,12 C19,12.5522847 18.5522847,13 18,13 L14.8571499,13 Z"
									fill="#000000" opacity="0.3" />
										<path
									d="M9,10.3333333 L9,12.1190476 C9,13.7101537 10.3431458,15 12,15 C13.6568542,15 15,13.7101537 15,12.1190476 L15,10.3333333 L20.2072547,6.57253826 C20.4311176,6.4108595 20.7436609,6.46126971 20.9053396,6.68513259 C20.9668779,6.77033951 21,6.87277228 21,6.97787787 L21,17 C21,18.1045695 20.1045695,19 19,19 L5,19 C3.8954305,19 3,18.1045695 3,17 L3,6.97787787 C3,6.70173549 3.22385763,6.47787787 3.5,6.47787787 C3.60510559,6.47787787 3.70753836,6.51099993 3.79274528,6.57253826 L9,10.3333333 Z M10.0909091,11.1212121 L12,12.5 L13.9090909,11.1212121 L13.9090909,12.1190476 C13.9090909,13.1315697 13.0543618,13.952381 12,13.952381 C10.9456382,13.952381 10.0909091,13.1315697 10.0909091,12.1190476 L10.0909091,11.1212121 Z"
									fill="#000000" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Fees Receipt Printing</span>
					</a>
				</div>
				<!--end::Item-->
			</div>
			<div class="row gutter-b">
				<!--begin::Item-->
				<div class="col-6" id="navbar_mr_entry">
					<a href="./mr_entry_screen.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> 
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
								</svg> 
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">MR Entry</span>
					</a>
				</div>
				<!--end::Item-->
				<!--begin::Item-->
				<div class="col-6" id="navbar_purchase_entry">
					<a href="./purchase_screen.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Shopping/Box2.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M4,9.67471899 L10.880262,13.6470401 C10.9543486,13.689814 11.0320333,13.7207107 11.1111111,13.740321 L11.1111111,21.4444444 L4.49070127,17.526473 C4.18655139,17.3464765 4,17.0193034 4,16.6658832 L4,9.67471899 Z M20,9.56911707 L20,16.6658832 C20,17.0193034 19.8134486,17.3464765 19.5092987,17.526473 L12.8888889,21.4444444 L12.8888889,13.6728275 C12.9050191,13.6647696 12.9210067,13.6561758 12.9368301,13.6470401 L20,9.56911707 Z"
									fill="#000000" />
										<path
									d="M4.21611835,7.74669402 C4.30015839,7.64056877 4.40623188,7.55087574 4.5299008,7.48500698 L11.5299008,3.75665466 C11.8237589,3.60013944 12.1762411,3.60013944 12.4700992,3.75665466 L19.4700992,7.48500698 C19.5654307,7.53578262 19.6503066,7.60071528 19.7226939,7.67641889 L12.0479413,12.1074394 C11.9974761,12.1365754 11.9509488,12.1699127 11.9085461,12.2067543 C11.8661433,12.1699127 11.819616,12.1365754 11.7691509,12.1074394 L4.21611835,7.74669402 Z"
									fill="#000000" opacity="0.3" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Purchase Entry</span>
					</a>
				</div>
				<!--end::Item-->
			</div>
			<div class="row gutter-b">
				<!--begin::Item-->
				<div class="col-6" id="navbar_certificate">
					<a href="./certificate-parameter.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Shopping/Chart-bar1.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<rect fill="#000000" opacity="0.3" x="12" y="4" width="3"
									height="13" rx="1.5" />
										<rect fill="#000000" opacity="0.3" x="7" y="9" width="3"
									height="8" rx="1.5" />
										<path
									d="M5,19 L20,19 C20.5522847,19 21,19.4477153 21,20 C21,20.5522847 20.5522847,21 20,21 L4,21 C3.44771525,21 3,20.5522847 3,20 L3,4 C3,3.44771525 3.44771525,3 4,3 C4.55228475,3 5,3.44771525 5,4 L5,19 Z"
									fill="#000000" fill-rule="nonzero" />
										<rect fill="#000000" opacity="0.3" x="17" y="11" width="3"
									height="6" rx="1.5" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Certificate</span>
					</a>
				</div>
				<!--end::Item-->
				<!--begin::Item-->
				<div class="col-6" id="navbar_notice">
					<a href="./notice.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-3x svg-icon-primary m-0"> <!--begin::Svg Icon | path:assets/media/svg/icons/Design/Color-profile.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
									<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
										<rect x="0" y="0" width="24" height="24" />
										<path
									d="M12,10.9996338 C12.8356605,10.3719448 13.8743941,10 15,10 C17.7614237,10 20,12.2385763 20,15 C20,17.7614237 17.7614237,20 15,20 C13.8743941,20 12.8356605,19.6280552 12,19.0003662 C11.1643395,19.6280552 10.1256059,20 9,20 C6.23857625,20 4,17.7614237 4,15 C4,12.2385763 6.23857625,10 9,10 C10.1256059,10 11.1643395,10.3719448 12,10.9996338 Z M13.3336047,12.504354 C13.757474,13.2388026 14,14.0910788 14,15 C14,15.9088933 13.7574889,16.761145 13.3336438,17.4955783 C13.8188886,17.8206693 14.3938466,18 15,18 C16.6568542,18 18,16.6568542 18,15 C18,13.3431458 16.6568542,12 15,12 C14.3930587,12 13.8175971,12.18044 13.3336047,12.504354 Z"
									fill="#000000" fill-rule="nonzero" opacity="0.3" />
										<circle fill="#000000" cx="12" cy="9" r="5" />
									</g>
								</svg> <!--end::Svg Icon-->
					</span> <span class="d-block font-weight-bold font-size-h6 mt-2">Notice</span>
					</a>
				</div>
				<!--end::Item-->
			</div>
			<div class="row gutter-b">
				<!--begin::Item-->
				<div class="col-6" id="navbar_update_patient_details">
					<a href="./patientDetailsUpdate.jsp"
						class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center py-10 px-5">
						<span class="svg-icon svg-icon-primary svg-icon-3x"><!--begin::Svg Icon | path:/var/www/preview.keenthemes.com/metronic/releases/2021-05-14-112058/theme/html/demo5/dist/../src/media/svg/icons/Communication/Delete-user.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
        <polygon points="0 0 24 0 24 24 0 24"/>
        <path d="M9,11 C6.790861,11 5,9.209139 5,7 C5,4.790861 6.790861,3 9,3 C11.209139,3 13,4.790861 13,7 C13,9.209139 11.209139,11 9,11 Z M21,8 L17,8 C16.4477153,8 16,7.55228475 16,7 C16,6.44771525 16.4477153,6 17,6 L21,6 C21.5522847,6 22,6.44771525 22,7 C22,7.55228475 21.5522847,8 21,8 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
        <path d="M0.00065168429,20.1992055 C0.388258525,15.4265159 4.26191235,13 8.98334134,13 C13.7712164,13 17.7048837,15.2931929 17.9979143,20.2 C18.0095879,20.3954741 17.9979143,21 17.2466999,21 C13.541124,21 8.03472472,21 0.727502227,21 C0.476712155,21 -0.0204617505,20.45918 0.00065168429,20.1992055 Z" fill="#000000" fill-rule="nonzero"/>
    </g>
</svg><!--end::Svg Icon--></span> <span class="d-block font-weight-bold font-size-h6 mt-2">Update Patient Details</span>
					</a>
				</div>
				<!--end::Item-->
				<%
			String session1 = (String) session.getAttribute("login_id");
			if (session.getAttribute("login_id") != null) {
				String sessionName = (String) session.getAttribute("login_id");
		
			} else
			response.sendRedirect("LoginForm.html");
			%>
			</div>
		</div>
		<!--end::Content-->
	</div>
	
	<script>
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	var session1='<%=session1%>';
	
	$('#navbar_calculation_details').hide();
	
	$('#role_master').hide();
	$('#user_master').hide();	
	$('#medicine_category_master').hide();	
	$('#medicine_type_master').hide();	
	$('#medicine_master').hide();	
	$('#medicine_template_master').hide();	
	$('#diagnosis_master').hide();	
	$('#complaint_master').hide();	
	$('#company_master').hide();	
	$('#advice_master').hide();	
	$('#district_master').hide();	
	$('#qualification_master').hide();	
	$('#remark_master').hide();	
	$('#upi_master').hide();	
	$('#city_master').hide();	
	
	$('#navbar_new_patient_entry').hide();
	$('#navbar_prescription_print').hide();
	$('#navbar_fee_collection').hide();
	$('#navbar_fee_receipt_printing').hide();
	$('#navbar_mr_entry').hide();
	$('#navbar_purchase_entry').hide();
	$('#navbar_certificate').hide();
	$('#navbar_notice').hide();
	$('#navbar_update_patient_details').hide();
	
	$('#patient_reports').hide();
	$('#city_reports').hide();
	$('#diagnosis_reports').hide();
	$('#city_wise_patient_count_reports').hide();
	$('#fees_collection').hide();
	$('#medical_representative_reports').hide();
	$('#income_and_expenses_reports').hide();
	
	$('#navbar_temp_chart').hide();
	$('#navbar_bp_chart').hide();
	$('#navbar_temp_chart_pdf').hide();
	$('#navbar_bp_chart_pdf').hide();
	
	var login_id;
	var password;
	var navbar_user_name;
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getUser_Role_Details",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1,},
		success:function(data)
        {
			const row = data.find(d => d.login_id == session1);
			if(row != null){
				navbar_user_name = row.users_name;
				login_id = row.login_id;
				password = row.password;
				$('#navbar_user_login').text(row.login_id);
				$('#navbar_user_name').text(row.users_name);
				$('#navbar_user_email').text(row.email_id);
				$('#navbar_calculation_details').show();
				var role_permission = row.role_permission;
				const myArray = role_permission.split(",");
				if(myArray[0] == "Y"){
					$('#role_master').show();	
					}
				if(myArray[1] == "Y"){
					$('#user_master').show();	
					}
				if(myArray[2] == "Y"){
					$('#medicine_category_master').show();		
					}
				if(myArray[3] == "Y"){
					$('#medicine_type_master').show();	
					}
				if(myArray[4] == "Y"){
					$('#medicine_master').show();	
					}
				if(myArray[5] == "Y"){
					$('#medicine_template_master').show();	
					}
				if(myArray[6] == "Y"){
					$('#diagnosis_master').show();	
					}
				if(myArray[7] == "Y"){
					$('#complaint_master').show();	
					}
				if(myArray[8] == "Y"){
					$('#company_master').show();	
					}
				if(myArray[9] == "Y"){
					$('#advice_master').show();	
					}
				if(myArray[10] == "Y"){
					$('#district_master').show();	
					}
				if(myArray[11] == "Y"){
					$('#qualification_master').show();	
					}
				if(myArray[12] == "Y"){
					$('#remark_master').show();		
					}
				if(myArray[13] == "Y"){
					$('#upi_master').show();	
					}
				if(myArray[14] == "Y"){
					$('#city_master').show();	
					}
				
				//Transaction Screen
				if(myArray[15] == "Y"){
					$('#navbar_new_patient_entry').show();	
					}
				if(myArray[16] == "Y"){
					$('#navbar_prescription_print').show();	
					}
				if(myArray[17] == "Y"){
					$('#navbar_fee_collection').show();	
					}
				if(myArray[18] == "Y"){
					$('#navbar_fee_receipt_printing').show();	
					}
				if(myArray[19] == "Y"){
					$('#navbar_mr_entry').show();	
					}
				if(myArray[20] == "Y"){
					$('#navbar_purchase_entry').show();	
					}
				if(myArray[21] == "Y"){
					$('#navbar_certificate').show();	
					}
				if(myArray[22] == "Y"){
					$('#navbar_notice').show();	
					}
				if(myArray[23] == "Y"){
					$('#navbar_update_patient_details').show();	
					}
				if(myArray[24] == "Y"){
					$('#navbar_purchase_entry').show();	
					}
				if(myArray[25] == "Y"){
					$('#navbar_certificate').show();	
					}
				if(myArray[26] == "Y"){
					$('#navbar_notice').show();	
					}
				if(myArray[27] == "Y"){
					$('#navbar_update_patient_details').show();	
					}
				//Reports
				if(myArray[28] == "Y"){
					$('#patient_reports').show();	
					}
				if(myArray[29] == "Y"){
					$('#city_reports').show();	
					}
				if(myArray[30] == "Y"){
					$('#diagnosis_reports').show();	
					}
				if(myArray[31] == "Y"){
					$('#city_wise_patient_count_reports').show();	
					}
				if(myArray[32] == "Y"){
					$('#fees_collection').show();	
					}
				if(myArray[33] == "Y"){
					$('#medical_representative_reports').show();	
					}
				if(myArray[34] == "Y"){
					$('#income_and_expenses_reports').show();	
					}
				//charts
				if(myArray[35] == "Y"){
					$('#navbar_temp_chart').show();	
					}
				if(myArray[36] == "Y"){
					$('#navbar_temp_chart_pdf').show();	
					}
				if(myArray[37] == "Y"){
					$('#navbar_bp_chart').show();	
					}
				if(myArray[38] == "Y"){
					$('#navbar_bp_chart_pdf').show();	
					}
			}
        } 
	});	
	$('#dashboard').click(function(){
		var url = "/doctorsFriend/form/home/index.jsp"  + '?login_id=' + login_id ;  
		window.location.assign(url);
	})
	$('#dashboard_logo').click(function(){
		var url = "/doctorsFriend/form/home/index.jsp"  + '?login_id=' + login_id ;  
		window.location.assign(url);
	})
	$('#sign_out').click(function(){
		var url = "logout.jsp" ;  
		Swal.fire({
	        title: "GOOD BYE!",
	        text: "Have A Nice Day " + navbar_user_name,
	        icon: "success",
	        timer: 3000,
	        onOpen: function() {
	            Swal.showLoading()
	        }
	    }).then(function(result) {
	        if (result.dismiss === "timer") {
	        	window.location.assign(url);
	        }
	    })
	});
	
	var appointment_count = 0;
	$.ajax({
		url : base + "/dssAPI/dfapi/getAppoinmentDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			if (data != null) {
				data.forEach(function(e) {
					appointment_count++;
							$('#appointment_list')
									.append(
											'<div class="d-flex align-items-center mb-5"><div class="d-flex flex-column font-weight-bold"><a href="javascript:updatebyNavbar('+e.appointment_no+');" class="text-dark text-hover-primary mb-1 font-size-lg">'
													+ e.patient_name
													+ ' </a>'
													+ e.city
													+ '</span></div><a href="javascript:navbardeleteById('+e.appointment_no+');" class="btn btn-xs btn-icon ml-20 btn-light btn-hover-primary"	> <i class="ki ki-close icon-xs text-muted"></i> </a><span class="text-muted"></div>')
						});
			}
		}
	});
	
	$.ajax({
		url : base + "/dssAPI/dfapi/getNavbarCollection",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			var row = data[0];
			if (row != null) {

			    $('#navbar_todays_patient_count').text(row.todays_visit_count);
				$('#navbar_total_patient_count').text(row.patient_count);
				
				
				$('#navbar_todays_expences').text(parseFloat(row.todays_expences).toFixed(2)); 
				$('#navbar_total_collection').text(parseFloat(row.total_collection).toFixed(2));
				if (row.todays_collection != null) {
					$('#navbar_todays_collection').text(
							parseFloat(row.todays_collection).toFixed(2) + ' RS');
				} else {
					$('#navbar_todays_collection').text('0');
				}
				
			}
		}
	});

	
	
function updatebyNavbar(id){
	$.ajax({
		url : base + "/dssAPI/dfapi/getAppoinmentDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			if (data != null) {
				data.forEach(function(e) {
					if(e.appointment_no == id)
					{
						var url = "form-wizard.jsp" + '?pcode=' + e.patient_code;
						window.location.assign(url);
					}
				});
			}
		}
	});
}	
	
function navbardeleteById(id){
	alert(id);	
	Swal.fire({
		    title: "Are you sure?",
			text: "You want to Cancle Appointment..!",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "Yes, delete it!",
			cancelButtonText: "No, cancel!",
			reverseButtons: true
					    }).then(function(result) {
					        if (result.value) {
					        	$.ajax({
									url : base + "/dssAPI/dfapi/insertUpdateAppointmentBooking",
									type : "post",
									dataType : "json",
									async : false,
									data : {
										"appointment_id" : id,
										"status" :0,
										"flag" : 3
									},
									error : function(xhr) {
										var msg = "(Data deletion failed. Error : "
												+ xhr.status
												+ " "
												+ xhr.statusText;
										$('#warning_msg').text(msg);
										 $('#warning_alert').addClass("show");
								           $('#warning_alert').removeClass("hide");
								           $('#warning_alert').addClass("showAlert");
								           setTimeout(function(){
								             $('#warning_alert').removeClass("show");
								             $('#warning_alert').addClass("hide");
								           },2000);
									},
									success : function(response) {
										if (response != null) {
											if (response >=1) {
												var msg = "Appointment Canceled...!";
												$('#danger_msg').text(msg);
												 $('#danger_alert').addClass("show");
										           $('#danger_alert').removeClass("hide");
										           $('#danger_alert').addClass("showAlert");
										           setTimeout(function(){
										             $('#danger_alert').removeClass("show");
										             $('#danger_alert').addClass("hide");
										           },2000);
												location.reload(true);

											} else {
												Swal.fire({text : "deletion failed!",
														   icon : "error",
														   buttonsStyling : false,
														   confirmButtonText : "Ok, got it!",
														   customClass : {
														   confirmButton : "btn font-weight-bold btn-light-primary"
														  }
													     })
														.then(function() {KTUtil.scrollTop();});
											}
										}
									}

								});
					        } else if (result.dismiss === "cancel") {
					            window.location.reload();
					        }
					    });
					}	
					
//idle Timer 

var url = "logout.jsp" ; 
    var KTIdleTimerDemo = function() {
     var _init = function() {
      var docTimeout = 1800000;
						        $(document).on("idle.idleTimer", function(event, elem, obj) {
						            $("#docStatus").val(function(i, v) {
						                    return v + "Idle @ " + moment().format() + " \n";
						                })
						            Swal.fire({
								        title: "You Want To Logout!?",
								        text: "our System idle from 50 sec!",
								        icon: "warning",
								        showCancelButton: true,
								        confirmButtonText: "Yes, Logout!",
								        cancelButtonText: "No, Continue!",
								        reverseButtons: true
								    }).then(function(result) {
								        if (result.value) {
								        	window.location.assign(url);
								        } else if (result.dismiss === "cancel") {
									        	 window.location.reload();
									        }
									    }); 
						            setTimeout(function(){
						            	window.location.assign(url);
								           },50000);
						        });
					        $(document).idleTimer(docTimeout);
				            //For demo purposes, display the actual timeout on the page
						        $("#docTimeout").text(docTimeout / 5000);
						    }
						    return {
						        //main function to initiate the module
						        init: function() {
						            _init();
						        }
						    };
						}();
						jQuery(document).ready(function() {
						    KTIdleTimerDemo.init();
						});
	</script>
<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>