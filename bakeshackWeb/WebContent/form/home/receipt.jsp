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
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
	
	<div id="kt_header_mobile" class="header-mobile">
		<!--begin::Toolbar-->
		<div class="d-flex align-items-center">
			<button class="btn p-0 burger-icon burger-icon-left ml-4"
				id="kt_header_mobile_toggle">
				 
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
										
									<!--end::Title-->

								</div>
								<!--end::Heading-->
							</div>
							<!--end::Info-->

						</div>
					</div>
					<!--end::Subheader-->
					<!--begin::Entry-->
					<div class="d-flex flex-column">
						<!--begin::Container-->
						<!--begin::Container-->
							<div class="container">
								<!-- begin::Card-->
								<div class="card card-custom overflow-hidden">
									<div class="card-body p-0">
										<!-- begin: Invoice-->
										<!-- begin: Invoice header-->
										<div class="row justify-content-center " >
											<div class="col-md-9">
												
										
													<h1 class=" text-black font-weight-boldest mb-10 text-center ">INVOICE</h1>
													
												
												
								<div id="name" class="col-md-10">
									<span
										class="d-flex justify-content-between align-items-baseline">

										<div class="d-flex justify-content-start">
											<div
												class="  font-weight-bolder  ">Invoice No:
											</div>
											<span class="font-weight-bolder ml-2" id="invoice_no"></span>
										</div>

										<div class="d-flex justify-content-start">
											<div
												class="  font-weight-bolder "> Invoice Date:
											</div>
											<span class="font-weight-bolder " id="invoice_date"></span>
										</div>
									</span>

								</div>
								</br>
													<div class="d-flex flex-column flex-root">
														<span class="font-weight-bolder ml-4 mt-4">Bill To:</span>
														<span class=" ml-20"id="bill_to">
														<br /></span>
														<span class=" ml-20"id="bill_to1"></span>
													</div>
													
													
												
											</div>
										</div>
										<!-- end: Invoice header-->
										<!-- begin: Invoice body-->
										<div class="row justify-content-center py-8 px-8 py-md-10 px-md-0">
											<div class="col-md-9">
												<div class="table-responsive">
													<table class="table">
														<thead>
															<tr>
																<th class="pl-0 font-weight-bold text-muted " id="no">Sr.No</th>
																<th class="text-left font-weight-bold text-muted " id="product_name">Product Details</th>
																<th class="text-center font-weight-bold text-muted " id="quantity">Quantity</th>
																<th class="text-center font-weight-bold text-muted " id="selling_price">Unit Price</th>
																<th class="text-center pr-0 font-weight-bold text-muted " id="amount">Amount </th>
															</tr>
														</thead>
														<tbody class="t_body">
															
														</tbody>
													</table>
												</div>
											</div>
										</div>
										
										<div class="row justify-content-center ">
										
										<div class="col-2">
										<label> Amount In Word :</label>
										</div>
										<div class="col-3 ">
										<span class="font-weight-bolder" id="amount_in_word"></span>
										</div>
										<div class="col-2 text-right">
										<label> Total Amount :</label>
										</div>
										<div class="col-2 text-center">
										<span class=" font-weight-bolder" id="total"></span>
										</div>
										
										</div>
										<div class="row justify-content-center ">
										
										<div class="col-2">
										<label> </label>
										</div>
										<div class="col-3 ">
										<span class="amount_in_word1" id="amount_in_word1"></span>
										</div>
										<div class="col-2 text-right">
										<label> Total Paid Amount :</label>
										</div>
										<div class="col-2 text-center">
										<span class=" font-weight-bolder" id="total_paid"></span>
										</div>
										
										</div>
										<div class="row justify-content-center ">
										
										<div class="col-2">
										<label> </label>
										</div>
										<div class="col-3 ">
										<span class="amount_in_word2" id="amount_in_word2"></span>
										</div>
										<div class="col-2 text-right">
										<label> Balance Amount :</label>
										</div>
										<div class="col-2 text-center">
										<span class=" font-weight-bolder" id="balance_amount"></span>
										</div>
										
										</div>
										
										
										<!-- <div class=" ml-10 text-center">
														<span class="font-size-lg font-weight-bolder mb-1">TOTAL AMOUNT</span>
														<span class="font-size-h3 font-weight-bolder  mb-1" id="total"></span>
														</br>
														
													</div> -->
										<!-- end: Invoice body-->
										<div class="row justify-content-center py-8 px-8 py-md-10 px-md-0">
											<div class="col-md-9">
												<div class=" mr-15 font-weight-bold ">
													<span>Authorized Signatory</span></br>
													</br><span>For, BakeShack</span>
													</br>
													<span>by Bakeology</span>
<!-- 												 <button type="button" class="btn btn-primary font-weight-bold" onclick="window.print();">Print Invoice</button> 
 -->												</div>
											</div>
										</div>
										<!-- begin: Invoice footer-->
										<div class="row justify-content-center bg-gray-100 py-8 px-8 py-md-10 px-md-0">
											<div class="col-md-9">
												<div class="d-flex justify-content-between flex-column flex-md-row font-size-lg">
													<div class="d-flex flex-column mb-10 mb-md-0">
														<div class="font-weight-bolder font-size-lg mb-3">BANK TRANSFER</div>
														<div class="d-flex justify-content-between mb-3">
															<span class="mr-15 font-weight-bold">Bank Name:</span>
															<span class="text-right"id="bank_name" ></span>
														</div>
														<div class="d-flex justify-content-between mb-3">
															<span class="mr-15 font-weight-bold">Account Holder Name:</span>
															<span class="text-right"id="account_holder_name" ></span>
														</div>
														<div class="d-flex justify-content-between mb-3">
															<span class="mr-15 font-weight-bold">Account Number:</span>
															<span class="text-right"id="account_no"></span>
														</div>
														<div class="d-flex justify-content-between">
															<span class="mr-15 font-weight-bold">IFSC Code:</span>
															<span class="text-right"id="IFSC_code"></span>
														</div>
													</div>
													
												</div>
											</div>
										</div>
										<!-- end: Invoice footer-->
										<!-- begin: Invoice action-->
										 <div class="row justify-content-center py-8 px-8 py-md-10 px-md-0">
											<div class="col-md-9">
												
													
												 <button type="button" class="btn-print btn-primary font-weight-bold" onclick="window.print();">Print Invoice</button> 
												
											</div>
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
				<div style=" position:fixed; bottom:0;   width:100%;" class="fixed">
				<jsp:include page="../common/footer.jsp"></jsp:include>
				</div>
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
	    
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const customer_code = urlParams.get('customer_code');
	const order_code = urlParams.get('order_code');
	const invoice_id = urlParams.get('invoice_id');
	var ccode=0;
	$('#invoice_no').text(invoice_id);
	alert(invoice_id);
	$.ajax({
			url : base + "/bakeshackAPI/api/getCustomerDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				const row = data.find(d => d.customer_code == customer_code);
				if(row != null){
					ccode = row.customer_code; 
				  
					$('#bill_to').text(row.customer_name);
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
	$.ajax({
		url : base + "/bakeshackAPI/api/getSalesAndOrderDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"invoice_code": invoice_id},
		success:function(data)
	{
			
			const row = data.find(d => d.invoice_code == invoice_id);
			data.forEach((row)=> {
			
				if(row.invoice_code == invoice_id )
						{
					amount_in_word = row.partial_paid_amount;
					 $('#total').text(row.total_amount);
					 $('#total_paid').text(row.partial_paid_amount);
					 $('#balance_amount').text(row.balance_amount);
					 $('#invoice_date').text(row.odrer_date);
		         	$('#order_no').val(row.order_code);
		         	var product_list = row.product_list;
		         	alert(product_list);
		         	alert(row.received_bank);
		         	
		         	const parsedData = JSON.parse(product_list);
			         
					 $(parsedData).each(function(index) {
						r++;
							$('#product-' + (index + 1)).val(parsedData[index]['product']);
							$('#unit-' + (index + 1)).val(parsedData[index]['unit']);
							 $('#quantity-' + (index + 1)).val(parsedData[index]['quantity']); 
							$('#unit_rate-' + (index + 1)).val(parsedData[index]['unit_rate']);
							$('#total-' + (index + 1)).val(parsedData[index]['total']);
						
							
							//alert(r);
						});
					 
					 for(var i = 1; i <=r; i++){
						  var html = '';
						  html += '<tr>'
							  html += '<td  style="width: 50px; text-align:left">' + i + '</td>';
					 	      html += '<td><input type="text" class=" form-control Product Details d-flex flex-column-fluid" id="product-' + i +'" name="product" style="background-color:#FFFFFF; border:0px; width: 250px; text-align:left" disabled></td>';
					 		  html += '<td><input type="text" class=" form-control quantity   d-flex flex-column-fluid" id="quantity-' + i +'" name="quantity" style="background-color:#FFFFFF; border:0px; width: 120px; text-align:center" disabled></td>';
						 	  html += '<td><input type="text" class=" form-control unit  d-flex flex-column-fluid" id="unit-' + i +'" name="unit" style="background-color:#FFFFFF; border:0px; width: 150px; text-align:center" disabled></td>';
					 		  html += '<td><input type="text" class=" form-control Unit Rate   d-flex flex-column-fluid" id="unit_rate-' + i +'" name="unit_rate" style="background-color:#FFFFFF; border:0px; width: 150px; text-align:center" disabled></td>';
						 	 // html += '<td><a type="button"   onClick="nextPage(' + i + ')";  id="nextPage-' + i +'" class="btn_edit btn font-weight-bold btn-danger btn-icon btn-light-danger text-center"  style="border:0px; width:50px; text-align:center; " ><i class="la la-edit"></i></a>';
						 	 html += '</tr>';
						  $('.t_body').append(html);
				 }
					 const parsedData1 = JSON.parse(product_list);
					 $(parsedData1).each(function(index) {
							$('#product-' + (index + 1)).val(parsedData1[index]['product']);
							$('#unit-' + (index + 1)).val(parsedData1[index]['unit_rate']);
							$('#quantity-' + (index + 1)).val(parsedData1[index]['quantity']);
							$('#unit_rate-' + (index + 1)).val(parsedData1[index]['total']);
							$('#total-' + (index + 1)).val(parsedData1[index]['total']);
							var total = parsedData1[index]['total'];
							total1 = parseInt(total) + parseInt(total);
							alert(total1);
						});	
				 
					}
			});
	}
	});	
	
/* 
	// Convert numbers to words
	// copyright 25th July 2006, by Stephen Chapman http://javascript.about.com
	// permission to use this Javascript on your web page is granted
	// provided that all of the code (including this copyright notice) is
	// used exactly as shown (you can change the numbering system if you wish)


	// American Numbering System
	var th = ['','thousand','million', 'billion','trillion'];
	// uncomment this line for English Number System
	// var th = ['','thousand','million', 'milliard','billion'];

	var dg = ['zero','one','two','three','four','five','six','seven','eight','nine']; 
	var tn =['ten','eleven','twelve','thirteen', 'fourteen','fifteen','sixteen','seventeen','eighteen','nineteen'];
	var tw = ['twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety'];
	
	function toWords(s)
	 {
		s = s.toString(); 
		s =	s.replace(/[\, ]/g,''); 
		if (s != parseFloat(s)) return 'not a number'; 
		var x = s.indexOf('.'); if (x == -1) x = s.length; if (x > 15) return 'too big';
		var n = s.split('');
		var str = ''; 
		var sk = 0; 
		for (var i=0; i < x; i++)
		{  
			if((x-i)%3==2) {if (n[i] == '1') {str += tn[Number(n[i+1])] + ' '; i++; sk=1;} else if (n[i]!=0) {str += tw[n[i]-2] + ' ';sk=1;}} 
			else if (n[i]!=0) {
				str +=dg[n[i]] +' '; 
				if ((x-i)%3==0) str += 'hundred ';sk=1;
				} if ((x-i)%3==1) {if (sk)str += th[(x-i-1)/3] + ' ';sk=0;}} if (x != s.length) {var y = s.length; str +='point '; for (var i=x+1; istr.replace(/\s+/g,' ');
			

	var num=1450;
	  var words = toWords(num);
		alert(words); */
		
		
		
		
	
		
		function numberToEnglish(n, custom_join_character) {

		    var string = n.toString(),
		        units, tens, scales, start, end, chunks, chunksLen, chunk, ints, i, word, words;

		    var and = custom_join_character || 'and';

		    /* Is number zero? */
		    if (parseInt(string) === 0) {
		        return 'zero';
		    }

		    /* Array of units as words */
		    units = ['', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];

		    /* Array of tens as words */
		    tens = ['', '', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];

		    /* Array of scales as words */
		    scales = ['', 'hundred', 'thousand', 'billion', 'trillion', 'quadrillion', 'quintillion', 'sextillion', 'septillion', 'octillion', 'nonillion', 'decillion', 'undecillion', 'duodecillion', 'tredecillion', 'quatttuor-decillion', 'quindecillion', 'sexdecillion', 'septen-decillion', 'octodecillion', 'novemdecillion', 'vigintillion', 'centillion'];

		    /* Split user arguemnt into 3 digit chunks from right to left */
		    start = string.length;
		    chunks = [];
		    while (start > 0) {
		        end = start;
		        chunks.push(string.slice((start = Math.max(0, start - 3)), end));
		    }

		    /* Check if function has enough scale words to be able to stringify the user argument */
		    chunksLen = chunks.length;
		    if (chunksLen > scales.length) {
		        return '';
		    }

		    /* Stringify each integer in each chunk */
		    words = [];
		    for (i = 0; i < chunksLen; i++) {

		        chunk = parseInt(chunks[i]);

		        if (chunk) {

		            /* Split chunk into array of individual integers */
		            ints = chunks[i].split('').reverse().map(parseFloat);

		            /* If tens integer is 1, i.e. 10, then add 10 to units integer */
		            if (ints[1] === 1) {
		                ints[0] += 10;
		            }

		            /* Add scale word if chunk is not zero and array item exists */
		            if ((word = scales[i])) {
		                words.push(word);
		            }

		            /* Add unit word if array item exists */
		            if ((word = units[ints[0]])) {
		                words.push(word);
		            }

		            /* Add tens word if array item exists */
		            if ((word = tens[ints[1]])) {
		                words.push(word);
		            }

		            /* Add 'and' string after units or tens integer if: */
		            if (ints[0] || ints[1]) {

		                /* Chunk has a hundreds integer or chunk is the first of multiple chunks */
		                if (ints[2] || !i && chunksLen) {
		                    words.push(and);
		                }

		            }

		            /* Add hundreds word if array item exists */
		            if ((word = units[ints[2]])) {
		                words.push(word + ' hundred');
		            }

		        }

		    }
		    var amount_in_word1 = words.reverse().join(' ');
		    $('#amount_in_word').text(amount_in_word1);
		    alert("amount" + amount_in_word1);
         alert(words.reverse().join(' '));
		    return words.reverse().join(' ');

		}
		
		numberToEnglish(amount_in_word);
	</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>