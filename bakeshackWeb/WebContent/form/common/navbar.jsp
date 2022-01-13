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

</head>


<body id="kt_header" class="header header-fixed">
	<!--begin::Container-->
	<div
		class="container d-flex align-items-stretch justify-content-between">
		<!--begin::Left-->
		<div class="d-flex align-items-stretch mr-3">
			<!--begin::Header Logo-->
			<div class="header-logo">
				<a id="dashboard_logo"> <img alt="Logo"
					src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/Bake-Shack-Logo.png"
					class="logo-default max-h-60px" />

				</a>
			</div>
			<!--end::Header Logo-->
			<!--begin::Header Menu Wrapper-->
			<div class="header-menu-wrapper header-menu-wrapper-left"
				id="kt_header_menu_wrapper">
				<!--begin::Header Menu-->
				<div id="kt_header_menu"
					class="header-menu header-menu-left header-menu-mobile header-menu-layout-default">
					<!--begin::Header Nav-->
					<ul class="menu-nav">
						<li
							class="menu-item menu-item-open menu-item-here menu-item-submenu menu-item-rel menu-item-open menu-item-here"
							data-menu-toggle="click" aria-haspopup="true"><a
							class="menu-link " id="dashboard"> <span class="menu-text">Dashboard</span>
								<i class="menu-arrow"></i>
						</a></li>
						<li class="menu-item menu-item-submenu menu-item-rel"
							data-menu-toggle="click" aria-haspopup="true"><a
							href="javascript:;" class="menu-link menu-toggle"> <span
								class="menu-text">Masters</span> <span class="menu-desc"></span>
								<i class="menu-arrow"></i>
						</a>
							<div class="menu-submenu menu-submenu-classic menu-submenu-left">
								<ul class="menu-subnav">

									<li class="menu-item" aria-haspopup="true"><a
										href="category-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Category Master</span>
									</a></li>

									<li class="menu-item" aria-haspopup="true"><a
										href="subcategory-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Subcategory Master</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="unit-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Unit Master</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="product-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Product Master</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="recipe-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Recipe Master</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="upi-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">UPI Master</span>
									</a></li>

									<li class="menu-item" aria-haspopup="true"><a
										href="bank-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Bank Master</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="role-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Role Master</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="user-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">User Master</span>
									</a></li>


								</ul>
							</div></li>
						<li class="menu-item menu-item-submenu menu-item-rel"
							data-menu-toggle="click" aria-haspopup="true"><a
							href="javascript:;" class="menu-link menu-toggle"> <span
								class="menu-text">Transaction</span> <span class="menu-desc"></span>
								<i class="menu-arrow"></i>
						</a>
							<div class="menu-submenu menu-submenu-classic menu-submenu-left">
								<ul class="menu-subnav">
									<li class="menu-item menu-item-submenu"
										data-menu-toggle="hover" aria-haspopup="true"><a
										href="javascript:;" class="menu-link menu-toggle"> <span
											class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Shopping/Box2.svg-->
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
										</span> <span class="menu-text">Sales &amp; Order</span> <i
											class="menu-arrow"></i>
									</a>
										<div
											class="menu-submenu menu-submenu-classic menu-submenu-right">
											<ul class="menu-subnav">
												<li class="menu-item" aria-haspopup="true"><a
													href="order_master.jsp" class="menu-link"> <i
														class="menu-bullet menu-bullet-dot"> <span></span>
													</i> <span class="menu-text">Order Booking</span>
												</a></li>
												<li class="menu-item" aria-haspopup="true"><a
													href="order_delivery.jsp" class="menu-link"> <i
														class="menu-bullet menu-bullet-dot"> <span></span>
													</i> <span class="menu-text">Order Billing</span>
												</a></li>

												<li class="menu-item" aria-haspopup="true"><a
													href="sales_return_screen.jsp" class="menu-link"> <i
														class="menu-bullet menu-bullet-dot"> <span></span>
													</i> <span class="menu-text"> Sales & Return</span>
												</a></li>


											</ul>
										</div></li>
									<li class="menu-item menu-item-submenu"
										data-menu-toggle="hover" aria-haspopup="true"><a
										href="javascript:;" class="menu-link menu-toggle"> <span
											class="svg-icon menu-icon"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/General/Thunder-move.svg-->
												<svg xmlns="http://www.w3.org/2000/svg"
													xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
													height="24px" viewBox="0 0 24 24" version="1.1">
																		<g stroke="none" stroke-width="1" fill="none"
														fill-rule="evenodd">
																			<rect x="0" y="0" width="24" height="24" />
																			<path
														d="M16.3740377,19.9389434 L22.2226499,11.1660251 C22.4524142,10.8213786 22.3592838,10.3557266 22.0146373,10.1259623 C21.8914367,10.0438285 21.7466809,10 21.5986122,10 L17,10 L17,4.47708173 C17,4.06286817 16.6642136,3.72708173 16.25,3.72708173 C15.9992351,3.72708173 15.7650616,3.85240758 15.6259623,4.06105658 L9.7773501,12.8339749 C9.54758575,13.1786214 9.64071616,13.6442734 9.98536267,13.8740377 C10.1085633,13.9561715 10.2533191,14 10.4013878,14 L15,14 L15,19.5229183 C15,19.9371318 15.3357864,20.2729183 15.75,20.2729183 C16.0007649,20.2729183 16.2349384,20.1475924 16.3740377,19.9389434 Z"
														fill="#000000" />
																			<path
														d="M4.5,5 L9.5,5 C10.3284271,5 11,5.67157288 11,6.5 C11,7.32842712 10.3284271,8 9.5,8 L4.5,8 C3.67157288,8 3,7.32842712 3,6.5 C3,5.67157288 3.67157288,5 4.5,5 Z M4.5,17 L9.5,17 C10.3284271,17 11,17.6715729 11,18.5 C11,19.3284271 10.3284271,20 9.5,20 L4.5,20 C3.67157288,20 3,19.3284271 3,18.5 C3,17.6715729 3.67157288,17 4.5,17 Z M2.5,11 L6.5,11 C7.32842712,11 8,11.6715729 8,12.5 C8,13.3284271 7.32842712,14 6.5,14 L2.5,14 C1.67157288,14 1,13.3284271 1,12.5 C1,11.6715729 1.67157288,11 2.5,11 Z"
														fill="#000000" opacity="0.3" />
																		</g>
																	</svg> <!--end::Svg Icon-->
										</span> <span class="menu-text">Purchase &amp; Order </span> <i
											class="menu-arrow"></i>
									</a>
										<div
											class="menu-submenu menu-submenu-classic menu-submenu-right">
											<ul class="menu-subnav">
												<li class="menu-item" aria-haspopup="true"><a
													href="purchase_order_booking.jsp" class="menu-link"> <i
														class="menu-bullet menu-bullet-dot"> <span></span>
													</i> <span class="menu-text">Purchase Order Booking</span>
												</a></li>
												<li class="menu-item" aria-haspopup="true"><a
													href="purchase_order_conformation.jsp" class="menu-link">
														<i class="menu-bullet menu-bullet-dot"> <span></span>
													</i> <span class="menu-text">Purchase Billing </span>
												</a></li>

												<li class="menu-item" aria-haspopup="true"><a
													href="purchase_return_screen.jsp" class="menu-link"> <i
														class="menu-bullet menu-bullet-dot"> <span></span>
													</i> <span class="menu-text">Purchase Return</span>
												</a></li>
											</ul>
										</div></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="production-master.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Production</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="expiry_good.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Expiry Goods</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="fund_transfer.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Fund Transfer</span>
									</a></li>
								</ul>
							</div></li>
						<li class="menu-item menu-item-submenu menu-item-rel"
							data-menu-toggle="click" aria-haspopup="true"><a
							href="javascript:;" class="menu-link menu-toggle"> <span
								class="menu-text">Reports</span> <span class="menu-desc"></span>
								<i class="menu-arrow"></i>
						</a>
							<div class="menu-submenu menu-submenu-classic menu-submenu-left">
								<ul class="menu-subnav">

									<li class="menu-item" aria-haspopup="true"><a
										href="finish_good_report.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Finish Good Category Report </span>
									</a></li>

									<li class="menu-item" aria-haspopup="true"><a
										href="customer_report.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text"> Customer Report </span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="product_sale_report.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Product Sale Report </span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="product_purchase_report.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Product Purchase Report</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="Category_sale_report.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Category Sale Report</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="Category_purchase_report.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Category Purchase Report</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="month_product_report_print.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Monthly product Report</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="subcategory_report_print.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">Monthly Subcategory Report</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="in_out_ledger.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">IN-OUT Ledger</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="pnl_search.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">PNL Day Wise</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="pnl_monthly_search.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">PNL Month Wise</span>
									</a></li>
									<li class="menu-item" aria-haspopup="true"><a
										href="pnl_yearly_search.jsp" class="menu-link"> <i
											class="menu-bullet menu-bullet-dot"> <span></span>
										</i> <span class="menu-text">PNL Year Wise</span>
									</a></li>



								</ul>
							</div></li>

					</ul>
					<!--end::Header Nav-->
				</div>
				<!--end::Header Menu-->
			</div>
			<!--end::Header Menu Wrapper-->
		</div>
		<!--end::Left-->
		<!--begin::Topbar-->
		<div class="topbar">
			<!--begin::Search-->
			<div class="dropdown">
				<!--begin::Toggle-->
				<div class="topbar-item" data-toggle="dropdown"
					data-offset="10px,0px">
					<div
						class="btn btn-icon btn-hover-transparent-white btn-lg btn-dropdown mr-1">
						<span class="svg-icon svg-icon-xl"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/General/Search.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
													<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
														<rect x="0" y="0" width="24" height="24" />
														<path
									d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
									fill="#000000" fill-rule="nonzero" opacity="0.3" />
														<path
									d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
									fill="#000000" fill-rule="nonzero" />
													</g>
												</svg> <!--end::Svg Icon-->
						</span>
					</div>
				</div>
				<!--end::Toggle-->
				<!--begin::Dropdown-->
				<div
					class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up dropdown-menu-lg">
					<div class="quick-search quick-search-dropdown "
						id="kt_quick_search_dropdown">
						<!--begin:Form-->
						<form method="get" class="quick-search-form">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text"> <span
										class="svg-icon svg-icon-lg"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/General/Search.svg-->
											<svg xmlns="http://www.w3.org/2000/svg"
												xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
												height="24px" viewBox="0 0 24 24" version="1.1">
																	<g stroke="none" stroke-width="1" fill="none"
													fill-rule="evenodd">
																		<rect x="0" y="0" width="24" height="24" />
																		<path
													d="M14.2928932,16.7071068 C13.9023689,16.3165825 13.9023689,15.6834175 14.2928932,15.2928932 C14.6834175,14.9023689 15.3165825,14.9023689 15.7071068,15.2928932 L19.7071068,19.2928932 C20.0976311,19.6834175 20.0976311,20.3165825 19.7071068,20.7071068 C19.3165825,21.0976311 18.6834175,21.0976311 18.2928932,20.7071068 L14.2928932,16.7071068 Z"
													fill="#000000" fill-rule="nonzero" opacity="0.3" />
																		<path
													d="M11,16 C13.7614237,16 16,13.7614237 16,11 C16,8.23857625 13.7614237,6 11,6 C8.23857625,6 6,8.23857625 6,11 C6,13.7614237 8.23857625,16 11,16 Z M11,18 C7.13400675,18 4,14.8659932 4,11 C4,7.13400675 7.13400675,4 11,4 C14.8659932,4 18,7.13400675 18,11 C18,14.8659932 14.8659932,18 11,18 Z"
													fill="#000000" fill-rule="nonzero" />
																	</g>
																</svg> <!--end::Svg Icon-->
									</span>
									</span>
								</div>
								<input type="text" class="form-control typeahead"
									id="global_search" placeholder="" />
								<div class="input-group-append">
									<span class="input-group-text"> <i
										class="quick-search-close ki ki-close icon-sm text-muted"></i>
									</span>
								</div>
							</div>
						</form>
						<!--end::Form-->
						<!--begin::Scroll-->
						<div class="quick-search-wrapper scroll" data-scroll="true"
							data-height="325" data-mobile-height="200"></div>
						<!--end::Scroll-->
					</div>
				</div>
				<!--end::Dropdown-->
			</div>
			<!--end::Search-->
			<!--begin::Notifications-->
			<div class="dropdown">
				<!--begin::Toggle-->
				<div class="topbar-item" data-toggle="dropdown"
					data-offset="10px,0px">
					<div
						class="btn btn-icon btn-hover-transparent-white btn-dropdown btn-lg mr-1 pulse pulse-primary">
						<span class="svg-icon svg-icon-xl"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Code/Compiling.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
													<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
														<rect x="0" y="0" width="24" height="24" />
														<path
									d="M2.56066017,10.6819805 L4.68198052,8.56066017 C5.26776695,7.97487373 6.21751442,7.97487373 6.80330086,8.56066017 L8.9246212,10.6819805 C9.51040764,11.267767 9.51040764,12.2175144 8.9246212,12.8033009 L6.80330086,14.9246212 C6.21751442,15.5104076 5.26776695,15.5104076 4.68198052,14.9246212 L2.56066017,12.8033009 C1.97487373,12.2175144 1.97487373,11.267767 2.56066017,10.6819805 Z M14.5606602,10.6819805 L16.6819805,8.56066017 C17.267767,7.97487373 18.2175144,7.97487373 18.8033009,8.56066017 L20.9246212,10.6819805 C21.5104076,11.267767 21.5104076,12.2175144 20.9246212,12.8033009 L18.8033009,14.9246212 C18.2175144,15.5104076 17.267767,15.5104076 16.6819805,14.9246212 L14.5606602,12.8033009 C13.9748737,12.2175144 13.9748737,11.267767 14.5606602,10.6819805 Z"
									fill="#000000" opacity="0.3" />
														<path
									d="M8.56066017,16.6819805 L10.6819805,14.5606602 C11.267767,13.9748737 12.2175144,13.9748737 12.8033009,14.5606602 L14.9246212,16.6819805 C15.5104076,17.267767 15.5104076,18.2175144 14.9246212,18.8033009 L12.8033009,20.9246212 C12.2175144,21.5104076 11.267767,21.5104076 10.6819805,20.9246212 L8.56066017,18.8033009 C7.97487373,18.2175144 7.97487373,17.267767 8.56066017,16.6819805 Z M8.56066017,4.68198052 L10.6819805,2.56066017 C11.267767,1.97487373 12.2175144,1.97487373 12.8033009,2.56066017 L14.9246212,4.68198052 C15.5104076,5.26776695 15.5104076,6.21751442 14.9246212,6.80330086 L12.8033009,8.9246212 C12.2175144,9.51040764 11.267767,9.51040764 10.6819805,8.9246212 L8.56066017,6.80330086 C7.97487373,6.21751442 7.97487373,5.26776695 8.56066017,4.68198052 Z"
									fill="#000000" />
													</g>
												</svg> <!--end::Svg Icon-->
						</span> <span class="pulse-ring"></span>
					</div>
				</div>
				<!--end::Toggle-->
				<!--begin::Dropdown-->
				<div
					class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-xl dropdown-menu-anim-up" style="width:900px">
					<form>
						<!--begin::Header-->
						<div
							class="d-flex align-items-center py-10 px-8 bgi-size-cover bgi-no-repeat rounded-top"
							style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack012.jpg)">
							<span class="btn btn-md btn-icon bg-white-o-15 mr-4"> <i
								class="flaticon2-shopping-cart-1 text-success"></i>
							</span>
							<h4 class="text-white m-0 flex-grow-1 mr-3">Orders
								Notifications</h4>
							<button type="button" class="btn btn-success btn-sm"
								id="order_count"> Items</button>
						</div>
						<!--end::Header-->
						<!--begin::Scroll-->
						<div class="scroll scroll-push" data-scroll="true"
							 data-height="250" data-mobile-height="200">

							<table data-toggle="table" class='a'
								data-classes="table table-hover table-condensed "
								data-striped="true" data-sort-name="Quality"
								data-sort-order="desc" data-pagination="false"
								data-scroll="false" data-height=550 id="table-id">
								<thead>
									<tr>
										<th class=" text-center" data-field="customer-Name"
											data-sortable="true">Customer Name</th>
										<th class=" text-center" data-field="delivery-date"
											data-sortable="true">Date</th>
										<th class=" text-center" data-field="Recipe-Name"
											data-sortable="true">Order List</th>
										  <th class="text-center" data-field="comment"
														data-sortable="true">comment</th>  
									</tr>

								</thead>
								<tbody class="Navbar_order_data text-center">


								</tbody>
							</table>



						</div>
						<!--end::Scroll-->
						<!--begin::Summary-->
						<div class="p-8">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<!-- <span class="font-weight-bold text-muted font-size-sm mr-2">Total</span>
								<span class="font-weight-bolder text-dark-50 text-right" id="balance_total"></span> -->
							</div>


						</div>

						<!--end::Summary-->
					</form>
				</div>
				<!--end::Dropdown-->
			</div>
			<!--end::Notifications-->
			<!--begin::Quick Actions-->
			<div class="dropdown">
				<!--begin::Toggle-->
				<div class="topbar-item" data-toggle="dropdown"
					data-offset="10px,0px">
					<div
						class="btn btn-icon btn-hover-transparent-white btn-dropdown btn-lg mr-1">
						<span class="svg-icon svg-icon-xl"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Media/Equalizer.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
													<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
														<rect x="0" y="0" width="24" height="24" />
														<rect fill="#000000" opacity="0.3" x="13" y="4" width="3"
									height="16" rx="1.5" />
														<rect fill="#000000" x="8" y="9" width="3" height="11"
									rx="1.5" />
														<rect fill="#000000" x="18" y="11" width="3" height="9"
									rx="1.5" />
														<rect fill="#000000" x="3" y="13" width="3" height="7"
									rx="1.5" />
													</g>
												</svg> <!--end::Svg Icon-->
						</span>
					</div>
				</div>
				<!--end::Toggle-->
				<!--begin::Dropdown-->
				<div
					class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-xl dropdown-menu-anim-up">
					<form>
						<!--begin::Header-->
						<div
							class="d-flex align-items-center py-10 px-8 bgi-size-cover bgi-no-repeat rounded-top"
							style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack013.jpg)">
							<span class="btn btn-md btn-icon bg-white-o-15 mr-4"> <i
								class="flaticon2-shopping-cart-1 text-success"></i>
							</span>
							<h4 class="text-white m-0 flex-grow-1 mr-3">Customer
								Outstanding</h4>
							<button type="button" class="btn btn-success btn-sm"
								id="customer_count">2 Items</button>
						</div>
						<!--end::Header-->
						<!--begin::Scroll-->
						<div class="scroll scroll-push" data-scroll="true"
							data-height="250" data-mobile-height="200">

							<table data-toggle="table" class='a'
								data-classes="table table-hover table-condensed "
								data-striped="true" data-sort-name="Quality"
								data-sort-order="desc" data-pagination="false"
								data-scroll="false" data-height=550 id="table-id">
								<thead>
									<tr>

										<th class="col-sm-2 text-center" data-field="Recipe-Name"
											data-sortable="true">Customer Name</th>
										<th class="col-sm-2 text-center" data-field="Product-Name"
											data-sortable="true">Balance</th>
									</tr>

								</thead>
								<tbody class="navbar_customer_data text-center">


								</tbody>
							</table>

						</div>
						<!--end::Scroll-->
						<!--begin::Summary-->
						<div class="p-8">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<span class="font-weight-bold text-muted font-size-sm mr-2">Total</span>
								<span class="font-weight-bolder text-dark-50 text-right"
									id="balance_total1"></span>
							</div>


						</div>
						<!--end::Summary-->
					</form>
				</div>
				<!--end::Dropdown-->
			</div>
			<!--end::Quick Actions-->
			<!--begin::My Cart-->
			<div class="dropdown">
				<!--begin::Toggle-->
				<div class="topbar-item" data-toggle="dropdown"
					data-offset="10px,0px">
					<div
						class="btn btn-icon btn-hover-transparent-white btn-dropdown btn-lg mr-1">
						<span class="svg-icon svg-icon-xl"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Shopping/Cart3.svg-->
							<svg xmlns="http://www.w3.org/2000/svg"
								xmlns:xlink="http://www.w3.org/1999/xlink" width="24px"
								height="24px" viewBox="0 0 24 24" version="1.1">
													<g stroke="none" stroke-width="1" fill="none"
									fill-rule="evenodd">
														<rect x="0" y="0" width="24" height="24" />
														<path
									d="M12,4.56204994 L7.76822128,9.6401844 C7.4146572,10.0644613 6.7840925,10.1217854 6.3598156,9.76822128 C5.9355387,9.4146572 5.87821464,8.7840925 6.23177872,8.3598156 L11.2317787,2.3598156 C11.6315738,1.88006147 12.3684262,1.88006147 12.7682213,2.3598156 L17.7682213,8.3598156 C18.1217854,8.7840925 18.0644613,9.4146572 17.6401844,9.76822128 C17.2159075,10.1217854 16.5853428,10.0644613 16.2317787,9.6401844 L12,4.56204994 Z"
									fill="#000000" fill-rule="nonzero" opacity="0.3" />
														<path
									d="M3.5,9 L20.5,9 C21.0522847,9 21.5,9.44771525 21.5,10 C21.5,10.132026 21.4738562,10.2627452 21.4230769,10.3846154 L17.7692308,19.1538462 C17.3034221,20.271787 16.2111026,21 15,21 L9,21 C7.78889745,21 6.6965779,20.271787 6.23076923,19.1538462 L2.57692308,10.3846154 C2.36450587,9.87481408 2.60558331,9.28934029 3.11538462,9.07692308 C3.23725479,9.02614384 3.36797398,9 3.5,9 Z M12,17 C13.1045695,17 14,16.1045695 14,15 C14,13.8954305 13.1045695,13 12,13 C10.8954305,13 10,13.8954305 10,15 C10,16.1045695 10.8954305,17 12,17 Z"
									fill="#000000" />
													</g>
												</svg> <!--end::Svg Icon-->
						</span>
					</div>
				</div>
				<!--end::Toggle-->
				<!--begin::Dropdown-->
				<div
					class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-xl dropdown-menu-anim-up">
					<form>
						<!--begin::Header-->
						<div
							class="d-flex align-items-center py-10 px-8 bgi-size-cover bgi-no-repeat rounded-top"
							style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack014.jpg)">
							<span class="btn btn-md btn-icon bg-white-o-15 mr-4"> <i
								class="flaticon2-shopping-cart-1 text-success"></i>
							</span>
							<h4 class="text-white m-0 flex-grow-1 mr-3">Vendors
								Outstanding</h4>
							<button type="button" class="btn btn-success btn-sm"
								id="vendors_count">2 Items</button>
						</div>
						<!--end::Header-->
						<!--begin::Scroll-->
						<div class="scroll scroll-push" data-scroll="true"
							data-height="250" data-mobile-height="200">

							<table data-toggle="table" class='a'
								data-classes="table table-hover table-condensed "
								data-striped="true" data-sort-name="Quality"
								data-sort-order="desc" data-pagination="false"
								data-scroll="false" data-height=550 id="table-id">
								<thead>
									<tr>

										<th class="col-sm-2 text-center" data-field="Recipe-Name"
											data-sortable="true">Vendors Name</th>
										<th class="col-sm-2 text-center" data-field="Product-Name"
											data-sortable="true">Balance</th>
									</tr>

								</thead>
								<tbody class="navbar_vendors_data text-center">


								</tbody>
							</table>



						</div>
						<!--end::Scroll-->
						<!--begin::Summary-->
						<div class="p-8">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<span class="font-weight-bold text-muted font-size-sm mr-2">Total</span>
								<span class="font-weight-bolder text-dark-50 text-right"
									id="balance_total"></span>
							</div>


						</div>
						<!--end::Summary-->
					</form>
				</div>
				<!--end::Dropdown-->
			</div>

			<!--begin::User-->
			<div class="dropdown">
				<!--begin::Toggle-->
				<div class="topbar-item">
					<div
						class="btn btn-icon btn-hover-transparent-white d-flex align-items-center btn-lg px-md-2 w-md-auto"
						id="kt_quick_user_toggle">
						<span
							class="text-white opacity-70 font-weight-bold font-size-base d-none d-md-inline mr-1">Hi,</span>
						<span
							class="text-white opacity-90 font-weight-bolder font-size-base d-none d-md-inline mr-4"
							id="navbar_title"></span> <span class="symbol symbol-35">
							<span
							class="symbol-label text-white font-size-h5 font-weight-bold bg-white-o-30">BS</span>
						</span>
					</div>
				</div>
				<!--end::Toggle-->
			</div>
			<div id="kt_quick_user" class="offcanvas offcanvas-right p-10">
				<!--begin::Header-->
				<div
					class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
					<h3 class="font-weight-bold m-0">
						User Profile <small class="text-muted font-size-sm ml-2">
							messages</small>
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
								style="background-image:url('<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/Bake-Shack-Logo.png')"></div>
							<i class="symbol-badge bg-success"></i>
						</div>
						<div class="d-flex flex-column">
							<a href="#"
								class="font-weight-bold font-size-h5 text-dark-75 text-hover-primary"
								id="navbar_login_id"></a>
							<div class="text-muted mt-1" id="navbar_user_name">
								</div>
							<div class="navi mt-2">
								<a href="#" class="navi-item"> <span
									class="navi-link p-0 pb-2"> <span class="navi-icon mr-1">
											<span class="svg-icon svg-icon-lg svg-icon-primary"> <!--begin::Svg Icon | path:assets/BakeShack_IM/media/svg/icons/Communication/Mail-notification.svg-->
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
									</span> <span class="navi-text text-muted text-hover-primary"
										id="navbar_user_email"></span>
								</span>
								</a>
								<button
									class="btn btn-sm btn-light-primary font-weight-bolder py-2 px-5"
									id="sign_out">Sign Out</button>
							</div>
						</div>
					</div>
					<!--end::Header-->
					<!--begin::Separator-->
					<div class="separator separator-dashed mt-8 mb-5"></div>






					<a href="customer_outstanding.jsp" class="mb-5">Customer
						OutStanding</a></br> <a href="vendors_outstanding.jsp" class="mb-5">Vendors
						OutStanding</a>
					<div class="separator separator-dashed mt-8 mb-5"></div>
					<!--end::Separator-->
					<!--begin::Notifications-->
					<div>
						<!--begin:Heading-->
						<h5 class="mb-5">Recent Notifications</h5>
						<!--end:Heading-->
						<!--begin::Item-->
						<div
							class="d-flex align-items-center bg-light-warning rounded p-5 gutter-b">
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
									class="font-weight-normal text-dark-75 text-hover-primary font-size-lg mb-1">Sale</a>
								<span class="text-muted font-size-sm"> in 1 Days</span>
							</div>
							<span class="font-weight-bolder text-warning py-1 font-size-lg"
								id="todays_sale_amount">-</span>
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div
							class="d-flex align-items-center bg-light-success rounded p-5 gutter-b">
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
									class="font-weight-normal text-dark-75 text-hover-primary font-size-lg mb-1">Total
									Purchase</a> <span class="text-muted font-size-sm"> in 1
									Days</span>
							</div>
							<span class="font-weight-bolder text-success py-1 font-size-lg"
								id="total_todays_purchase">-</span>
						</div>
						<!--end::Item-->
						<!--begin::Item-->
						<div
							class="d-flex align-items-center bg-light-danger rounded p-5 gutter-b">
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
									class="font-weight-normel text-dark-75 text-hover-primary font-size-lg mb-1">Cash
									In Hand</a> <span class="text-muted font-size-sm"> in 1 Days</span>
							</div>
							<span class="font-weight-bolder text-danger py-1 font-size-lg"
								id="cash_in_hand">-</span>
						</div>
						<!--end::Item-->
						<!--begin::Item-->
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
									class="font-weight-normel text-dark-75 text-hover-primary font-size-lg mb-1">Total
									Outstanding</a> <span class="text-muted font-size-sm"> in 1
									Days</span>
							</div>
							<span class="font-weight-bolder text-info py-1 font-size-lg"
								id="todays_total_outstanding">-</span>
						</div>
						<!--end::Item-->
					</div>

					<div class="separator separator-dashed my-7"></div>
					<div class="scroll scroll-push" data-scroll="true"
						data-mobile-height="200">

						<table data-toggle="table" class='a'
							data-classes="table table-hover table-condensed "
							data-striped="true" data-sort-name="Quality"
							data-sort-order="desc" data-pagination="false"
							data-scroll="false" data-height=250 id="table-id">
							<thead>
								<tr>

									<th class="col-sm-2 text-center" data-field="Recipe-Name"
										data-sortable="true">Product</th>
									<th class="col-sm-2 text-center" data-field="Product-Name"
										data-sortable="true">Balance</th>
								</tr>

							</thead>
							<tbody class="navbar_product_stock"text-center">


							</tbody>
						</table>



					</div>


					<ul class="sticky-toolbar nav flex-column pl-2 pr-2 pt-3 pb-3 mt-4">
						<li class="nav-item mb-2" id="kt_demo_panel_toggle"
							data-toggle="tooltip" title="Check out gmail"
							data-placement="right"><a
							class="btn btn-sm btn-icon btn-bg-light btn-icon-danger btn-hover-danger"
							href="https://mail.google.com"> <i class="flaticon2-mail"></i>
						</a></li>
						<li class="nav-item mb-2" data-toggle="tooltip" title="Whatsapp"
							data-placement="left"><a
							class="btn btn-sm btn-icon btn-bg-light btn-icon-success btn-hover-success"
							href="https://web.whatsapp.com/" target="_blank"> <i
								class="flaticon-whatsapp"></i>
						</a></li>
						<li class="nav-item mb-2" data-toggle="tooltip" title="Instagram"
							data-placement="left"><a
							class="btn btn-sm btn-icon btn-bg-light btn-icon-warning btn-hover-warning"
							href=" http://www.instagram.com/bake.shack/" target="_blank">
								<i class="flaticon-instagram-logo"></i>
						</a></li>
						<li class="nav-item" id="kt_sticky_toolbar_chat_toggler"
							data-toggle="tooltip" title="Facebook" data-placement="left">
							<a
							class="btn btn-sm btn-icon btn-bg-light btn-icon-primary btn-hover-primary"
							href="https://www.facebook.com" target="_blank"> <i
								class="flaticon-facebook-logo-button"></i>
						</a>
						</li>
					</ul>



				</div>
				<!--end::Content-->
			</div>

			<%
			String session1 = (String) session.getAttribute("login_id");
			if (session.getAttribute("login_id") != null) {
				String sessionName = (String) session.getAttribute("login_id");
			%>


			<%
			} else
			response.sendRedirect("LoginForm.html");
			%>
			<!--end::User-->
		</div>
		<!--end::Topbar-->
	</div>
	<!--end::Container-->
</body>
<script>
	var HOST_URL = "https://preview.keenthemes.com/metronic/theme/html/tools/preview";
</script>



<script
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/plugins.bundle.js"></script>
<script
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/prismjs.bundle.js"></script>
<script
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/scripts.bundle.js"></script>


<script
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/fullcalendar.bundle.js"></script>


<script
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/ref_file/widgets.js"></script>
<!--begin::Global Config(global config for global JS scripts)-->
<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	var session1='<%=session1%>';
	var login_id;
	var password;
	var navbar_user_name;
	$.ajax({
			url : base + "/bakeshackAPI/api/getUsersDetails",
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
					$('#navbar_title').text(row.users_name);
					$('#navbar_login_id').text(row.login_id);
					$('#navbar_user_name').text(row.users_name);
					$('#navbar_user_email').text(row.email_id);
					
					
				}
	        } 
		});	
	
	$('#dashboard').click(function(){
		var url = "/bakeshackWeb/form/home/index.jsp"  + '?login_id=' + login_id ;  
	
		window.location.assign(url);
	})
	
	$('#dashboard_logo').click(function(){
		var url = "/bakeshackWeb/form/home/index.jsp"  + '?login_id=' + login_id ;  
		
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
		        $("#docTimeout").text(docTimeout / 1000);
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

	
	var product_name2;
	var html5="";
	$.ajax({
		url : base + "/bakeshackAPI/api/getProducedProductListBatchWise",
		type : "post",
		dataType : "json",
		async : false,
		data : {"customer_name": customer_name1},
		success:function(data)
		{
			  
			
			const row = data.find(d => d.product_name == product_name2);
			data.forEach((row)=> {
			
				html5 +="<tr id= tr-id-2 class= tr-class-2>"
				html5 += "<td class='text-center'>"+row.product_name+"</td>"; 
				html5 += "<td class='text-center'>"+row.balance_quantity+"</td>";
				html5 +="</tr>"
			});
			 $(".navbar_product_stock").html(html5);
			
		}
	});	
	
	
	$.ajax({
		url : base + "/bakeshackAPI/api/getTodaysCustomerCollection",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			if (data != null) {
				data.forEach(function(e) {
					
					$("#todays_sale_amount").text("₹" + e.todays_collection);
					$("#todays_total_outstanding").text( "₹" + e.todays_outstanding);

					//dashboard_week_sale.push(e.days);

				})
			}
		}
	});	
	
	$.ajax({
		url : base + "/bakeshackAPI/api/getTotalCashInHand",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			if (data != null) {
				data.forEach(function(e) {
					
					$("#cash_in_hand").text("₹" + e.cash_in_hand);
					//dashboard_week_sale.push(e.days);
				})
			}
		}
	});	
	
	$.ajax({
		url : base + "/bakeshackAPI/api/getTodaysVendorsCollection",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"flag" : 1
		},
		success : function(data) {
			if (data != null) {
				data.forEach(function(e) {
					
					$("#total_todays_purchase").text("₹" + -e.todays_collection);
					//dashboard_week_sale.push(e.days);
				})
			}
		}
	});		
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
	
	
	
	 var cName = [];
		
		$.ajax({
		url : base + "/bakeshackAPI/api/getCustomerDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
{
			if(data != null){
				data.forEach(function(e){
					cName.push(e.customer_name);
				})
			}  
}
		});
		
		 var bloodhound = new Bloodhound({
       datumTokenizer: Bloodhound.tokenizers.whitespace,
       queryTokenizer: Bloodhound.tokenizers.whitespace,
       // `states` is an array of state names defined in "The Basics"
       local: cName
   });

   $('#global_search').typeahead({
       hint: true,
       highlight: true,
       minLength: 1
   }, {
       name: 'cName',
       source: bloodhound
   });
   
	
   var vName = [];
	
	$.ajax({
	url : base + "/bakeshackAPI/api/getVendorsDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"flag":1},
	success:function(data)
{
		if(data != null){
			data.forEach(function(e){
				vName.push(e.vendors_name);
			})
		}  
}
	});
	
	 var bloodhound = new Bloodhound({
     datumTokenizer: Bloodhound.tokenizers.whitespace,
     queryTokenizer: Bloodhound.tokenizers.whitespace,
     // `states` is an array of state names defined in "The Basics"
     local: vName
 });

 $('#global_search').typeahead({
     hint: true,
     highlight: true,
     minLength: 1
 }, {
     name: 'vName',
     source: bloodhound
 });
	
 var pName = [];
	
	$.ajax({
	url : base + "/bakeshackAPI/api/getProductDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"flag":1},
	success:function(data)
{
		if(data != null){
			data.forEach(function(e){
				pName.push(e.product_name);
			})
		}  
}
	});
	
var bloodhound = new Bloodhound({
datumTokenizer: Bloodhound.tokenizers.whitespace,
queryTokenizer: Bloodhound.tokenizers.whitespace,
 // `states` is an array of state names defined in "The Basics"
local: pName
});

$('#global_search').typeahead({
  hint: true,
  highlight: true,
  minLength: 1
}, {
  name: 'pName',
  source: bloodhound
});
	
	var customer_count = 0;
	var customer_name1;
	var html3 = "";
    var balance_total = 0;
    var outstanding_total =0;
	$.ajax({
		url : base + "/bakeshackAPI/api/getCustomerOutstandingForDashboard",
		type : "post",
		dataType : "json",
		async : false,
		data : {"customer_name": customer_name1},
		success:function(data)
		{
			  
			
			const row = data.find(d => d.customer_name == customer_name1);
			data.forEach((row)=> {
				customer_count++;
				html3 +="<tr id= tr-id-2 class= tr-class-2>"
				html3 += "<td class='customer_name01'>"+row.customer_name+"</td>"; 
				html3 += "<td>"+row.balance_amount+"</td>";
			//	html3 += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="ki ki-info text-info"></i></a></td>';
				html3 +="</tr>"
				
				outstanding_total += parseInt(row.balance_amount);
					
					
			});
			 $(".navbar_customer_data").html(html3);
			 $("#balance_total1").text(outstanding_total);
			$("#customer_count").text(customer_count);
		}
	});	

	 $('.navbar_customer_data').on('click','.customer_name01',function(){
		
			
			  var currentRow = $(this).closest("tr");
			  var query = currentRow.find(".customer_name01").html();
			 //alert("query-"+query);
			 
			 var ccode;
			 $.ajax({
					url : base + "/bakeshackAPI/api/getCustomerDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {"flag":1,},
					success:function(data)
			        {
						
						const row = data.find(d => d.customer_name == query );
			
						ccode = row.customer_code;
						
						var url = 'customer_outstanding_details.jsp' + '?ccode=' + ccode + '&query=' + query;
						
						window.location.assign(url);

			        }
				});	
			 
			 
			 
			 
			 
			 
			});
	
	var vendors_count = 0
	var vendors_name1;
	var html2 = "";
	$.ajax({
		url : base + "/bakeshackAPI/api/getVendorsOutstandingForDashboard",
		type : "post",
		dataType : "json",
		async : false,
		data : {"vendors_name": vendors_name1},
		success:function(data)
		{
			  
			
			const row = data.find(d => d.vendors_name == vendors_name1);
			data.forEach((row)=> {
				vendors_count++;
				 html2 +="<tr id= tr-id-2 class= tr-class-2>"
				 html2 += "<td class='vendors_name01'>"+row.vendors_name+"</td>"; 
				 html2 += "<td>"+row.balance_amount+"</td>";
				 html2 +="</tr>"
			 balance_total += parseInt(row.balance_amount);
				 
				 
				
			});
			 $(".navbar_vendors_data").html(html2);
			 $("#balance_total").text(balance_total);
			 $("#vendors_count").text(vendors_count);
		}
	});	

	
	
	 $('.navbar_vendors_data').on('click','.vendors_name01',function(){
			
			
		  var currentRow = $(this).closest("tr");
		  var query = currentRow.find(".vendors_name01").html();
		// alert("query-"+query);
		 
		 var vcode;
		 $.ajax({
				url : base + "/bakeshackAPI/api/getVendorsDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1,},
				success:function(data)
		        {
					
					const row = data.find(d => d.vendors_name == query );
		
					vcode = row.vendors_code;
					
					var url = 'vendors_outstanding_details.jsp' + '?vcode=' + vcode + '&query=' + query;
					
					window.location.assign(url);

		        }
			});	
				 
		});
	 
	 
	 
	
	var html1 = "";
	var product_list;
	var product_order_count =0;
	$.ajax({
		url : base + "/bakeshackAPI/api/getOrderDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"product_list": product_list},
		success:function(data)
		{
			const row = data.find(d => d.product_list == product_list);
			data.forEach((row)=> {
				product_order_count++;
				 const parsedData = JSON.parse(row["product_list"]);
				  html1 +="<tr id=tr-id-2 class= tr-class-2>";
					html1 += "<td style ='width:150px;'>"+row.customer_name+"</td>"; 
					html1 += "<td  style ='width:120px;'>"+row.delivery_date+"</td><td style ='width:200px;'>"; 
				    $(parsedData).each(function(index) {
				    html1 += parsedData[index]['product']+ "-"+parsedData[index]['quantity']+"</br>"; 
				 });
				  html1 +="</td><td type='hidden'><span id='product_order_code-1'>"+row.comment+"</span></td></tr>";
				 
				/*  html1 += '<tr>'
				    //  html1 +=  '<td><a type="button"   onClick="popup_for_comment(' + product_order_count + ')";  id="popup_for_comment-' + product_order_count +'" class="btn_edit btn font-weight-bold btn-primary btn-icon btn-primary text-left"  style="border:0px; text-align:center; " ><i class="la la-edit"></i></a></td>';
			 	      html1 += '<td><input type="text"  id="navbar_order_customer_name-' + product_order_count +'" name="navbar_order_customer_name" style="background-color:#FFFFFF; border:0px; " disabled>'+ row.customer_name +'</td>';
			 		  html1 += '<td><input type="text"  id="navbar_order_delivery_date-' + product_order_count +'" name="navbar_order_delivery_date" style="background-color:#FFFFFF; border:0px; " disabled>'+row.delivery_date+'</td>';
			 		  html1 += '<td><input type="text"  id="navbar_order_product_list-' +product_order_count +'" name="navbar_order_product_list" style="background-color:#FFFFFF; border:0px;  " disabled>';
			 		 $(parsedData).each(function(index) {
						    html1 += parsedData[index]['product']+ "-"+parsedData[index]['quantity']+"</br>"; 
						 });
			 		html1 +=  '</td><td><input type="text"  id="navbar_order_product_list-' +product_order_count +'" name="navbar_order_product_list" style="background-color:#FFFFFF; border:0px;  " disabled>'+row.comment+'</td>';
			 		 //  html1 += '</td><td><a type="button"   onClick="popup_for_comment(' + product_order_count + ')";  id="popup_for_comment-' + product_order_count +'" class="btn_edit btn font-weight-bold btn-primary btn-icon btn-primary text-left"  style="border:0px; text-align:left; " ><i class="la la-edit"></i></a></td>';
				 	 html1 += '</tr>'; */
			});
			 $(".navbar_order_data").html(html1);
			 $("#order_count").text(product_order_count);
		}
	});	

 function popup_for_comment(poc1){
	//var v1 = $('#navbar_order_product_list-'+poc1).val();	
	alert(poc1);
	var v1 =  $('#navbar_order_product_list-1').val();
	alert(v1); 
}	


/* $('.navbar_class').click(function(){
	var v1 = $(this).closest('tr').val();	
	alert(v1);
}) */

$('#global_search').on("change select",function(){
		
		var query = $(this).val();
		//alert(query);
		var ccode;
		var vcode;
		var pcode;
		
		$.ajax({
			url : base + "/bakeshackAPI/api/getCustomerDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				
				const row = data.find(d => d.customer_name == query );
	
				ccode = row.customer_code;
				
				var url = 'customer_transaction_details.jsp' + '?ccode=' + ccode + '&query=' + query;
				
				window.location.assign(url);

	        }
		});	
		
		$.ajax({
			url : base + "/bakeshackAPI/api/getVendorsDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				
				const row = data.find(d => d.vendors_name == query );
	
				vcode = row.vendors_code;
				
				var url = 'vendors_transaction_details.jsp' + '?vcode=' + vcode + '&query=' + query;
				
				window.location.assign(url);

	        }
		});	
		
		
		$.ajax({
			url : base + "/bakeshackAPI/api/getProductDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				
				const row = data.find(d => d.product_name == query );
	
				pcode = row.product_code;
				
				var url = 'product_transaction_details.jsp' + '?pcode=' + pcode+ '&query=' + query;
				
				window.location.assign(url);

	        }
		});	
		
		
		
	})	
	
	
	
	
</script>


<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>