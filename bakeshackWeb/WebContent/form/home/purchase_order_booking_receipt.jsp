<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
	String dbConnVar = "BAKESHACk";
	try {
%>
<head>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script src="//code.jquery.com/jquery.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
	
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>
</head>
<body onafterprint="printP()" id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
	
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
					
					<!--begin::Entry-->
					<div class="d-flex flex-column">
						<!--begin::Container-->
						<!--begin::Container-->
							<div class="container mt-10" style="font-size: 16px;">
							<!-- begin::Card-->
							<div class="card card-custom overflow-hidden">
								<div class="card-body p-0">
									<!-- begin: Invoice-->
									<!-- begin: Invoice header-->
									<div
										class="row justify-content-center bgi-size-cover bgi-no-repeat">
										<div class="  col-md-10 ">
										<img alt="Logo"
												src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/Footer1.png"
												class="logo-default " id="pri1"
												style="position: fixed; top: 0;" />


											<h1
												class=" text-black font-weight-boldest mt-35  mb-20  text-center ml-25 "><u>PURCHASE ORDER </u>
												</h1>



											<div id="name" class="col-md-12">
												<span
													class="d-flex justify-content-between align-items-baseline">

													<div class="d-flex justify-content-start">
														<div class="  font-weight-bolder ml-3 ">
															<u>Invoice No:</u>
														</div>
														<span class="invoice-no font-weight-bolder ml-2"
															id="invoice_no"></span>
													</div>

													<div class="d-flex justify-content-start">
														<div class="  font-weight-bolder ">
															<u>Invoice Date:</u>&#160;&#160;
														</div>
														<span class="font-weight-bolder " id="invoice_date"></span>
													</div>
												</span>
											<div class="d-flex flex-column flex-root">
													<div class="font-weight-bolder ml-3">
														<u>Bill To:</u>&#160;&#160;<span
															class=" font-weight-bold mr-10" id="bill_to"></span>
													</div>
													<span class="ml-20 col-3" id="bill_to1"></span>
												</div>
												</div>
										</div>
									</div>
									<!-- end: Invoice header-->
									<!-- begin: Invoice body-->
									<div
										class="row justify-content-center ml-3">
										<div class="col-md-10">
											<div class="table-responsive">
											<table class="table" style="border:none; border-bottom-style: none;"
													>
													<thead>
													
														<tr>
															<th class="pl-0 font-weight-bold text-muted "
																style="font-size: 16px;" id="no"
																cellspacing="0" cellpadding="0">Sr.No</th>
																
															<th class="text-center font-weight-bold text-muted "
																style="font-size: 16px;" id="product_name"
																cellspacing="0" cellpadding="0">Product Details</th>
																
															<th class="text-center font-weight-bold text-muted "
																style="font-size: 16px;" id="quantity"
																cellspacing="0" cellpadding="0">Quantity</th>
															<th class="text-center font-weight-bold text-muted "
																style="font-size: 16px; " id="selling_price"
																cellspacing="0" cellpadding="0">Unit Price</th>
																
															<th class="text-center pr-0 font-weight-bold text-muted "
																style="font-size: 16px; " id="amount"
																cellspacing="0" cellpadding="0">Amount (₹)</th>
														</tr>
													</thead>
													<tbody class="t_body text-center"
														>

													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="row col-md-10 justify-content offset-1 ">

										<div class="col-7 ">
											<label>  </label> <span
												class="font-weight-bold " id="amount_in_word0"><lable></lable></span>
										</div>
										<div class="col-3 text-right">
											<label class="">Discount :</label>
										</div>
										<div class="col-2 text-center ">
											<span class="font-weight-bolder text-right" id="discount"></span>
										</div>

									</div>

									<div class="row col-md-10 justify-content offset-1 ">

										<div class="col-7 ">
											<label> Amount In Word :</label> <span
												class="font-weight-bold " id="amount_in_word"><lable></lable></span>
										</div>
										<div class="col-3 text-right">
											<label class=""> Total Amount :</label>
										</div>
										<div class="col-2 text-center ">
											<span class="font-weight-bolder text-right" id="total"></span>
										</div>

									</div>
									<div class="row col-md-10 justify-content-center offset-1 ">

										<div class="col-7">
											<label>Payment Mode :</label> <span
												class="amount_in_word1 font-weight-bold"
												id="amount_in_word1"></span>
										</div>
										<div class="col-3 text-right">
											<label> Advance/Partial Paid :</label>
										</div>
										<div class="col-2 text-center">
											<span class=" font-weight-bolder" id="total_paid"></span>
										</div>

									</div>
									<div class="row col-md-10 justify-content-center offset-1">

										<div class="col-3">
											<label> </label>
										</div>
										<div class="col-4 ">
											<span class="amount_in_word2" id="amount_in_word2"></span>
										</div>
										<div class="col-3 text-right">
											<hr>
											<label> Balance Amount :</label>
										</div>
										<div class="col-2 text-center">
											<hr>
											<span class=" font-weight-bolder" id="balance_amount"></span>
										</div>

									</div>


									
									<!-- end: Invoice body-->
									<div class="row col-md-10 justify-content mt-15 ml-6" >
									<div class="col-md-10" style="position: relative;  ">
  											<img src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/stampsign.png" class="offset-1" id="sign" >
   											<div class="font-weight-bold " style=" position: absolute; top: 50%; left: 22%; transform: translate(-50%, -50%);">
   												<span>Authorized Signatory</span></br> </br> </br> 
   												<span>For, BakeShack</span> </br> <span>by Bakeology</span>
   											</div>
									</div>
									</div>
									<!-- begin: Invoice footer-->
									
									<div
										class="row col-md-10 justify-content-center mt-20 offset-1"
										style="font-size: 16px;">
										<div class="col-md-12">
										<h2
												class=" text-black font-weight-bolder  text-center " style="font-size: 18px;"><u> Bank Details</u></h2>
										
											<div
												class="d-flex justify-content-between flex-column flex-md-row font-size-16">

												<table id="bank_details_table"
													style="width: 100%; font-size: 16px; border: 1px solid black;">

													<tr style="border: 1px solid black;">
														<td class="  font-weight-bolder"
															style="border: 1px solid black;">&#160;&#160; Bank
															Name</td>
														<td class="  font-weight-bolder " style="font-size: 16px;"
															style="margin-left: 2px"><span class="ml-2"
															id="bank_name"></span></td>

													</tr>
													<tr style="border: 1px solid black; margin-left: 2px">
														<td class="  font-weight-bolder"
															style="border: 1px solid black;">&#160;&#160;
															Account Holder Name</td>
														<th class="  font-weight-bolder   "
															style="font-size: 16px;"><span class="ml-2"
															id="account_holder_name"></span></th>

													</tr>
													<tr style="border: 1px solid black;">
														<td class=" font-weight-bolder"
															style="border: 1px solid black;">&#160;&#160;
															Account Number</td>
														<th class="  font-weight-bolder     "
															style="font-size: 16px;"><span class="ml-2"
															id="account_no"></span></th>

													</tr>
													<tr style="border: 1px solid black;">
														<td class=" font-weight-bolder"
															style="border: 1px solid black;">&#160;&#160; IFSC
															Code</td>
														<th class="  font-weight-bolder   "
															style="font-size: 16px;"><span class="ml-2"
															id="IFSC_code"></span></th>

													</tr>
												</table>


											</div>
										</div>
									</div>
									<!-- end: Invoice footer-->
									<!-- begin: Invoice action-->

									<div class="modal" id="bankModel" tabindex="-1" role="dialog"
										aria-labelledby="staticBackdrop" aria-hidden="true">
										<div class="modal-dialog  modal-dialog-scrollable"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="history_patient_name"></h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<i aria-hidden="true" class="ki ki-close"></i>
													</button>
												</div>
												<div class="modal-body">
													<div class="form-group" id="nb_div">

														<label>Received Bank</label> <select
															class="form-control form-control-solid"
															id="received_bank">
															<option value="">Select a bank</option>

														</select>
													</div>



												</div>
												<div class="modal-footer">
													<button type="button"
														class="btn btn-light-primary font-weight-bold"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>
									<div class="row col-12  ">
										<div class="text-center col-md-10" id="print_button">
											<!-- <Button id="sudo" class="btn-print btn-primary font-weight-bold"/>
											 PDF Invoice
											</button> -->
											
											<Button id="sudo1" class="btn-print btn-primary font-weight-bold" onclick="document.title = '#invoice_no';" />
											Print Invoice
											</button>
											
											</div>
										<!-- <div class="col-md-10" id="pdf_inv">
											<Button id="sudo" class="btn-print btn-primary font-weight-bold" onclick="document.title = '#invoice_no';" />
											PDF Invoice
											</button>
											</div> -->
									</div>
										<!-- end: Invoice action-->
										<!-- end: Invoice-->
									</div>
								</div>
								<!-- end::Card-->
							</div>
							<!--end::Container-->
					</div>
					<!--end::Entry-->
				</div>
				<!--end::Content-->
				<!--begin::Footer-->
				
					<img alt="Logo"
						src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/Footer.png"
						class="  logo-default   " id="pri"
						style="position: fixed; bottom: 0;" />

				<!--end::Footer-->
			</div>
			<!--end::Wrapper-->
		</div>
		<!--end::Page-->
	</div>


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

<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/features/custom/spinners.js"></script>
	<script type="text/javascript"
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/form-repeater.js?v=7.2.7"></script>
	<script src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/pages/crud/forms/widgets/select2.js?v=7.2.8"></script>
	


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';
	 $("#pri").hide();
	 $("#pri1").hide();
	 $("#dis").hide();
	
	
	    
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const vendors_code = urlParams.get('vendors_code');
	const order_code = urlParams.get('order_code');
	const partial_paid_amount = urlParams.get('partial_paid_amount');
	const discount = urlParams.get('discount');

	var ccode=0;
	
	
	if(partial_paid_amount != 00)
	{
var invoice_id;
 $.ajax({
		url : base + "/bakeshackAPI/api/getInvoiceCode",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag": 1},
		success:function(data)
    	{
			//data.forEach((element)=> {
			const row = data.find(d => d.invoice_id == invoice_id);
			data.forEach((row)=> {
				$('#invoice_no').text(row.invoice_id);
			});
    	}
	});	  
 }
 else
	 {
	 $('#invoice_no').text(order_code);
	 }
	$.ajax({
			url : base + "/bakeshackAPI/api/getVendorsDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				const row = data.find(d => d.vendors_code == vendors_code);
				if(row != null){
					ccode = row.customer_code; 
				  
					$('#bill_to').text(row.vendors_name);
					$('#bill_to1').text(row.address);
				
				}else{
					$('#customer_code').val("");
				}
	        }
		});	
	var amount_in_word = 0;
	var total1=0;
	var j=0;
	 var r=0;
	 var bank = "";
	$.ajax({
		url : base + "/bakeshackAPI/api/getpurchaseorderDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"order_code": order_code},
		success:function(data)
	{
			
			const row = data.find(d => d.order_code == order_code);
			data.forEach((row)=> {
			
				if(row.order_code == order_code )
						{
					amount_in_word = row.partial_paid_amount;
					 $('#total').text("₹"+row.total_amount);
					 $('#total_paid').text("₹"+row.partial_paid_amount);
					 $('#balance_amount').text("₹"+row.balance_amount);
					 $('#discount').text("₹"+row.discount);
					 $('#invoice_date').text(row.order_date);
		         	$('#order_no').val(row.order_code);
		        	$('#amount_in_word1').text(row.payment_mode);
		         	var product_list = row.product_list;
		         	bank = row.received_bank;
		         	 
		         	if(bank == '')
		         		{
		         	
		         	
		         		  $("#bankModel").modal();
		         		}
		         	else{
		         		 $.ajax({
		     				url : base + "/bakeshackAPI/api/getBankDetails",
		     				type : "post",
		     				dataType : "json",
		     				async : false,
		     				data : {"flag":1},
		     				success:function(data)
		     			    {
		     					const row = data.find(d => d.bank_id == bank);
		     						
		     					   
		     					       $('#bank_name').text(row.bank_name);
		     					       $('#account_holder_name').text(row.account_holder_name);
		     					       $('#IFSC_code').text(row.IFSC_code);
		     				 			$('#account_no').text(row.account_no);  
		     					
		     			    }
		     			});	
		         	}
	         	const parsedData = JSON.parse(product_list);
			         
					 $(parsedData).each(function(index) {
						r++;
							$('#product-' + (index + 1)).val(parsedData[index]['product']);
							$('#unit-' + (index + 1)).val(parsedData[index]['unit']);
							 $('#quantity-' + (index + 1)).val(parsedData[index]['quantity']); 
							$('#unit_rate-' + (index + 1)).val(parsedData[index]['unit_rate']);
							$('#total-' + (index + 1)).val(parsedData[index]['total']);
						});
					 
					 for(var i = 1; i <=r; i++){
						  var html = '';
						  html += '<tr style="border:none;">'
					 	      html += '<td style=" border:none;"><input type="text" class=" form-control id  d-flex flex-column-fluid" id="id-' + i +'" name="id" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:left; font-size: 16px;" disabled></td>';
						      html += '<td style=" border:none;"><input type="text" class=" form-control Product Details d-flex flex-column-fluid" id="product-' + i +'" name="product" style="background-color:#FFFFFF; border:0px; width: 250px; text-align:left; font-size: 16px;" disabled></td>';
					 		  html += '<td style=" border:none;"><input type="text" class=" form-control quantity   d-flex flex-column-fluid" id="quantity-' + i +'" name="quantity" style="background-color:#FFFFFF; border:0px; width: 120px; text-align:center; font-size: 16px;" disabled></td>';
						 	  html += '<td style=" border:none;"><input type="text" class=" form-control unit  d-flex flex-column-fluid" id="unit-' + i +'" name="unit" style="background-color:#FFFFFF; border:0px; width: 150px; text-align:center; font-size: 16px;" disabled></td>';
					 		  html += '<td style=" border:none;"><input type="text" class=" form-control Unit Rate   d-flex flex-column-fluid" id="unit_rate-' + i +'" name="unit_rate" style="background-color:#FFFFFF; border:0px; width: 150px; text-align:center; font-size: 16px;" disabled></td>';
						 	 // html += '<td><a type="button"   onClick="nextPage(' + i + ')";  id="nextPage-' + i +'" class="btn_edit btn font-weight-bold btn-danger btn-icon btn-light-danger text-center"  style="border:0px; width:50px; text-align:center; " ><i class="la la-edit"></i></a>';
						 	 html += '</tr>';
						  $('.t_body').append(html);
				 }
					 const parseData1 = JSON.parse(product_list);
					 $(parseData1).each(function(index) {
						
						
						 $('#id-' + (index + 1)).val(index + 1);
						    $('#product-' + (index + 1)).val(parseData1[index]['product']);
							$('#quantity-' + (index + 1)).val(parseData1[index]['quantity']);
							var unit_rate = parseFloat(parseData1[index]['unit_rate']).toFixed(2);
							$('#unit-' + (index + 1)).val(unit_rate);
							var total = parseData1[index]['total'];
							var total2 = parseFloat(total).toFixed(2);
							$('#unit_rate-' + (index + 1)).val(total2);
							total1 = parseInt(total) + parseInt(total);
						
						});	
				 
					}
			});
	}
	});	
	 $.ajax({
			url : base + "/bakeshackAPI/api/getBankDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1},
			success:function(data)
		    {
				data.forEach((element)=> {
					
				        $('#received_bank').append($(document.createElement('option')).prop({
			                value: element.bank_id,
			                text: element.bank_name
			            }))
					
				});   
		    }
		});	
	 $('#received_bank').change(function(){
		 var bank = $(this).val();
		 $.ajax({
				url : base + "/bakeshackAPI/api/getBankDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1},
				success:function(data)
			    {
					const row = data.find(d => d.bank_id == bank);
						
					    
					       $('#bank_name').text(row.bank_name);
					       $('#account_holder_name').text(row.account_holder_name);
					       $('#IFSC_code').text(row.IFSC_code);
				 			$('#account_no').text(row.account_no);  
			    }
			});	
	});
		 function number2text(value) {
			    var fraction = Math.round(frac(value)*100);
			    var f_text  = "";

			    if(fraction > 0) {
			        f_text = "AND "+convert_number(fraction)+" PAISE";
			    }

			    return convert_number(value)+" RUPEE "+f_text+" ONLY.";
			}

			function frac(f) {
			    return f % 1;
			}

			function convert_number(number)
			{
			    if ((number < 0) || (number > 999999999)) 
			    { 
			        return "NUMBER OUT OF RANGE!";
			    }
			    var Gn = Math.floor(number / 10000000);  /* Crore */ 
			    number -= Gn * 10000000; 
			    var kn = Math.floor(number / 100000);     /* lakhs */ 
			    number -= kn * 100000; 
			    var Hn = Math.floor(number / 1000);      /* thousand */ 
			    number -= Hn * 1000; 
			    var Dn = Math.floor(number / 100);       /* Tens (deca) */ 
			    number = number % 100;               /* Ones */ 
			    var tn= Math.floor(number / 10); 
			    var one=Math.floor(number % 10); 
			    var res = ""; 

			    if (Gn>0) 
			    { 
			        res += (convert_number(Gn) + " CRORE"); 
			    } 
			    if (kn>0) 
			    { 
			            res += (((res=="") ? "" : " ") + 
			            convert_number(kn) + " LAKH"); 
			    } 
			    if (Hn>0) 
			    { 
			        res += (((res=="") ? "" : " ") +
			            convert_number(Hn) + " THOUSAND"); 
			    } 

			    if (Dn) 
			    { 
			        res += (((res=="") ? "" : " ") + 
			            convert_number(Dn) + " HUNDRED"); 
			    } 


			    var ones = Array("", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX","SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN","FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN","NINETEEN"); 
			var tens = Array("", "", "TWENTY", "THIRTY", "FOURTY", "FIFTY", "SIXTY","SEVENTY", "EIGHTY", "NINETY"); 

			    if (tn>0 || one>0) 
			    { 
			        if (!(res=="")) 
			        { 
			            res += " AND "; 
			        } 
			        if (tn < 2) 
			        { 
			            res += ones[tn * 10 + one]; 
			        } 
			        else 
			        { 

			            res += tens[tn];
			            if (one>0) 
			            { 
			                res += ("-" + ones[one]); 
			            } 
			        } 
			    }

			    if (res=="")
			    { 
			    	 res = "ZERO"; 
			    }
			    $('#amount_in_word').text("RUPEES " +" "+ res+ " " +" ONLY.");
			
			    return res;
			}
		 
		 
			number2text(amount_in_word);
			
			$("#sudo").click(function(){
				/* alert("hi"); */
				$("#print_button1").hide();
				$("#print_button").hide();
				 $("#pri").show();
				 $("#pri1").show();
				 $("#sign").show();
				 
				  window.print();
				    return false;
				    window.location.reload();
				
				
			})
					$("#sudo1").click(function(){
				/* alert("hi"); */
				$("#print_button1").hide();
				$("#print_button").hide();
				 $("#pri").hide();
				 $("#pri1").hide();
				 $("#sign").hide();
				  window.print();
				    return false;
				    window.location.reload();
			})
			
			function printP(){
				window.location.reload();
	}
	</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>