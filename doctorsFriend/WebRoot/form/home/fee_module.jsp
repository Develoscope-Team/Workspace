<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "BAFNA";
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

</head>
<jsp:include page="../common/header.jsp"></jsp:include>

<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading">
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			<jsp:include page="/form/common/sidebar.jsp"></jsp:include>
			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				<jsp:include page="/form/common/navbar.jsp"></jsp:include>
				<!--end::Header-->
				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">

							<form class="form" id="kt_form_1">
								<div class=" col-lg-10 offset-lg-1 col-md-12 col-sm-12">
									<div class="row">
										<div class="col-xl-6">
											<div class="form-group">
												<label>Patient Name</label><span class="text-danger">*</span>
												<div class="typeahead">
													<input type="text"
														class="form-control form-control-solid form-control-lg"
														name="patientName" id="patient_name" /> <span
														class="msg text-danger" id="type1"> </span>
												</div>
											</div>

										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>Patient Code</label> <input type="text"
													class="form-control form-control-solid" id="patient_code" />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label>Mobile</label> <input type="text"
													class="form-control form-control-solid" id="mobile_no" />
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>Payment mode</label> <select name="paymentMode"
													id="paymentMode" class="form-control form-control-solid">
													<option value="cash">Cash</option>
													<option value="upi">UPI</option>
													<option value="nb">Net Banking</option>
													<option value="cheque">Cheque</option>
													<option value="credit">Credit</option>
												</select>
											</div>
										</div>
									</div>

									<div class="form-group" id="upi_div">
										<input type="text" class="form-control form-control-solid"
											name="upi_id" id="upi_id"
											placeholder="Enter UPI Transaction Id" />
									</div>
									<div class="form-group" id="nb_div">
										<input type="text" class="form-control form-control-solid"
											name="nb_id" id="np_id" placeholder="Enter Transaction No" />
									</div>


									<div class="form-group" id="cheque_div">
										<input type="text" class="form-control form-control-solid"
											name="cheque_id" id="cheque_id"
											placeholder="Enter Account No" />
									</div>

									<div class="card card-custom gutter-b">
										<div class="col-xl-12">
											<table class="table">
												<thead>
													<tr>
														<th style="text-align: center" scope="col">Sr. No</th>
														<th style="text-align: center" scope="col">Invoice Id</th>
														<th style="text-align: center" scope="col">Invoice
															Date</th>
														<th style="text-align: center" scope="col">Clinic Fee</th>
														<th style="text-align: center" scope="col">Paid</th>
														<th style="text-align: center" scope="col">To Be Paid</th>
														<th style="text-align: center" scope="col">Now Paying</th>
														<th style="text-align: center" scope="col" hidden>Visit
															Id</th>
														<th style="text-align: center" scope="col" hidden>Payment
															Id</th>


													</tr>
												</thead>
												<tbody class="table_body">
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">

										<div class="col-lg-12 text-right">
											<!-- <button type="button" id="addPayment" 
										class="btn font-weight-bold btn-primary mr-2">Submit</button> -->
											<button type="button" id="calculate_total"
												class="btn font-weight-bold btn-primary ">Calculate</button>

										</div>
									</div>

									<div class="row" id="grand_total_field">
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Grand Total</label> <span class="text-danger"
													id="type">*</span><input type="number"
													class="form-control form-control-solid" name="grand_total"
													id="grand_total" placeholder="Enter Grand Total" />
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Actual Paid Amount</label> <span class="text-danger"
													id="type">*</span><input type="number"
													class="form-control form-control-solid" name="paid_amount"
													id="paid_amount" placeholder="Enter Paid Amount" />
											</div>
										</div>
									</div>
									<div class="row" id="grand_total_field1" >
										<div class="col-lg-6">
											<div class="form-group" id="amount_div">
												<label>Balance Amount</label> <span class="text-danger"
													id="type">*</span><input type="number"
													class="form-control form-control-solid"
													name="balance_amount" id="balance_amount"
													placeholder="Enter Balance Amount" disabled />
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>Received by</label> <input type="text"
													class="form-control form-control-solid" id="received_by"
													disabled /> <span class="msg text-danger" id="type1">
												</span>
											</div>
										</div>
										<div class="form-group" id="amount_div" hidden>
											<label>Extra Content</label> <input type="text"
												class="form-control form-control-solid" name="extraContent"
												id="extraContent" placeholder="Enter Extra Content" />
										</div>
									</div>

									<div class="card-footer">
										<div class="row">

											<div class="col-lg-6 offset-3">

												<button type="button" id="addPayment1" onclick="printP()"
													class="btn font-weight-bold btn-primary ml-40 ">Submit</button>
												<button type="button" id="cancel"
													class="btn font-weight-bold btn-secondary">Cancel</button>
											</div>

										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<jsp:include page="../common/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>

	<jsp:include page="../common/jsfiles.jsp"></jsp:include>

	<script type="text/javascript">
	var basePath='<%=basePath%>';    
	var base='<%=base%>'; 
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();
	today = dd + '/' + mm + '/' + yyyy;
	 $('#upi_div').hide();
	 $('#nb_div').hide();
	 $('#cheque_div').hide();
	 $('.card').hide();
	 $('#calculate_total').hide();
	 $('#grand_total_field1').hide();
	 $('#grand_total_field').hide();
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const patient_code = urlParams.get('pcode');
	var vid = urlParams.get('vid');
	console.log(patient_code);
	console.log(vid);
	var pcode1= patient_code;
	 var j=0;
	 
	 var pName = [];
		
		$.ajax({
		url : base + "/dssAPI/dfapi/getPatientDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {"flag":1},
		success:function(data)
  {
			if(data != null){
				data.forEach(function(e){
					pName.push(e.patient_name);
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

      $('#patient_name').typeahead({
          hint: true,
          highlight: true,
          minLength: 1
      }, {
          name: 'pName',
          source: bloodhound
      });
	 
	 
	 
	 $('#patient_name').change(function(){
	
			var patient_name = $(this).val();
			$.ajax({
				url : base + "/dssAPI/dfapi/getPatientDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {"flag":1,},
				success:function(data)
		        {
					const row = data.find(d => d.patient_name == patient_name);
					if(row != null){
						var pcode = row.patient_code; 
					
						$('#mobile_no').val(row.mobile_no);
						$('#patient_code').val(row.patient_code);
						$('#patient_code').addClass("text-muted");
						$('#received_by').val("Dr. Rakesh Bafna");
						
					}else{
						$('#patient_code').val("");
					}
		        }
			});	
			var Grand_Total = 0;
			var pcode2 = $('#patient_code').val();
			
				$.ajax({
					url : base + "/dssAPI/dfapi/getPaymentDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {"patient_code": patient_code},
					success:function(data)
			    	{
						const row = data.find(d => d.patient_code == patient_code);
						data.forEach((row)=> {
							if(pcode2 == row.patient_code && row.balance_amount > 0)
							{
							    j++;
							   
							}
						});
			    	}
				});	
				if(j > 0){
					 $('.card').show();
					 $('#calculate_total').show();
					 $('#grand_total_field1').show();
					 $('#grand_total_field').show();
				}else{
					 $('.card').hide();
					 $('#grand_total_field1').hide();
					 $('#grand_total_field').hide();
				}
				for(var i = 0; i < j; i++){
				 	  var html = '';
				 	  html += '<tr>'
				 	  html += ' <td><input type="checkbox" class="form-control Sr.No d-flex flex-column-fluid h-20px w-20px mt-3" id="id-'+i+'" onClick="checkedBox('+i+')"></td>';
				 	 html += ' <td><input type="text" class="form-control Invoice Id d-flex flex-column-fluid" id="invoiceId-' + i +'" name="invoiceId" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Invoice Date d-flex flex-column-fluid" id="invoiceDate-' + i +'" name="invoiceDate" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Clinic Fee d-flex flex-column-fluid" id="clinicFee-' + i +'" name="clinicFee" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Paid d-flex flex-column-fluid" id="paid-' + i +'" name="paid" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control To Be Paid d-flex flex-column-fluid" id="toBePaid-' + i +'" name="toBePaid" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Paid d-flex flex-column-fluid" id="nowPaying-'+i+'" disabled></td>';
				 	 html += ' <td><input type="hidden" class="form-control Visit Id d-flex flex-column-fluid" id="visitId-' + i +'" name="visitId" hidden></td>';
				 	 html += ' <td><input type="hidden" class="form-control Payment Id d-flex flex-column-fluid" id="paymentId-' + i +'" name="paymentId" hidden></td>';
				 	 html += '</tr>';
				 	  $('.table_body').append(html);
		} 
				var to_be_paid = 0;
				var k=0;
					$.ajax({
						url : base + "/dssAPI/dfapi/getPaymentDetails",
						type : "post",
						dataType : "json",
						async : false,
						data : {"patient_code": patient_code},
						success:function(data)
				 	{
							const row = data.find(d => d.patient_code == patient_code);
							data.forEach((row)=> {
								if(pcode2 == row.patient_code && row.balance_amount > 0 )
								{
								 
								   Grand_Total = Grand_Total + row.balance_amount;
										 $('#invoiceId-' + k).val(row.invoice_id);
										$('#invoiceDate-' + k).val(row.payment_date);
										$('#clinicFee-' + k).val(row.invoice_total);
										$('#paid-' + k).val(row.paid_amount);
										$('#toBePaid-' + k).val(row.balance_amount);
										$('#visitId-' + k).val(row.visit_id);
										$('#paymentId-' + k).val(row.payment_details_id);
										 k++;
								}
							});
				 	}
					});	
					 $('#grand_total').val(Grand_Total); 
					 $("#patient_name").prop('disabled', true);
					 $("#patient_code").prop('disabled', true);
	 })
 function checkedBox(i){
						 if ($("#id-"+i).prop('checked')==true){ 
							   $("#nowPaying-"+i).prop('disabled', false);
							 }else{
								 $("#nowPaying-"+i).prop('disabled', true);
									$("#nowPaying-"+i).val('');
							 }
						}; 
						 $('#calculate_total').click(function() {
							
									 var calculate_paid = 0;
									for(i=0; i < j ; i++)
									{
								 if ($("#id-"+i).prop('checked')==true){ 
									 var calculate_invoice_paid = $("#nowPaying-"+i).val();
									  calculate_paid = parseInt(calculate_paid) + parseInt(calculate_invoice_paid);
									 $('#paid_amount').val(calculate_paid);
									 var calculate_grand_total =  $("#grand_total").val();
									 var calculate_balance = parseInt(calculate_grand_total) - parseInt(calculate_paid);
										$('#balance_amount').val(calculate_balance);
								 }
								}
								});
	 $('#cancel').click(function() {		
			window.location.reload();
			})
	$('#paymentMode').change(function(){
		var payment_mode = $(this).val();
		if(payment_mode == 'upi'){
			$('#upi_div').show();
			$('#nb_div').hide();
			$('#cheque_div').hide();
		}else if(payment_mode == 'nb'){
			$('#upi_div').hide();
			$('#nb_div').show();
		    $('#cheque_div').hide();
		}else if(payment_mode == 'cheque'){
			$('#upi_div').hide();
			$('#nb_div').hide();
			$('#cheque_div').show();
		}else{
			$('#upi_div').hide();
			$('#nb_div').hide();
			$('#cheque_div').hide();
		}
	});
	 var checked = 0;
$('#addPayment1').click(function() {
		var patient_code = $('#patient_code').val();
		var payment_date   = today;
		var payment_mode =  $('#paymentMode').val();
		//alert(payment_mode);
		var flag 		  = 1; // Addition
		for(i=0; i <= j ; i++)
		{
	 if ($("#id-"+i).prop('checked')==true){ 
		    checked++;
		   var a1 = $("#nowPaying-"+i).val();
		   var a2 = $("#invoiceId-"+i).val();
		   var a3 = $("#invoiceDate-"+i).val();
		   var a4 = $("#clinicFee-"+i).val();
		   var a5 = $("#paid-"+i).val();
		   var a6 = $("#visitId-"+i).val();
		   var a7 = $("#toBePaid-"+i).val();
		   var a10= $("#paymentId-"+i).val();
		   var a8 = parseInt(a5) + parseInt(a1);
		   var a9 = parseInt(a4) - parseInt(a8);
		    $.ajax({
				url : base + "/dssAPI/dfapi/insertUpdateOutStandingInvoiceDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {
					
				    "invoice_id"   : a2,
					"patient_code" : patient_code,
					"visit_id" 	   : a6,
					"inv_date"     : a3,
					"clinic_fee"   : a4,
					"to_be_paid"   : a9,
					"paid_fee"     : a8,
					"paid_date"    : payment_date,
					"balance_amt"  : a9,
					"payment_mode" : payment_mode,
					"flag"         : flag
				},
				error : function(xhr) {
					var msg = "OutStanding Invoice   insertion/updation failed. Error : "
							+ xhr.status
							+ " "
							+ xhr.statusText;
					alert(msg);
				},
				success : function(response) {
					if (response != null) {

						if (response >= 1) {

							var msg = "OutStanding Invoice Data inserted/Updated Successfully.";
							alert(msg);
						}
					}
				}
			});  
		  
		   $.ajax({
				url : base + "/dssAPI/dfapi/updatePaymentDetails",
				type : "post",
				dataType : "json",
				async : false,
				data : {
					
					"paid_amount"  : a8,
					"balance_amount" : a9,
					"payment_details_id" : a10,
					"flag"         : flag
				},
				error : function(xhr) {
					var msg = "Payment updation failed. Error : "
							+ xhr.status
							+ " "
							+ xhr.statusText;
					alert(msg);
				},
				success : function(response) {
					if (response != null) {

						if (response >= 1) {

							var msg = "Payment Data Updated Successfully.";
							alert(msg);
						}
					}
				}
			});   
			
		 }
		}
		
		
		window.location.reload();	
	})
	
</script>
</body>
</html>


<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>