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
<html lang="en">
<!--begin::Head-->
<head>
	
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
</style>
<style>
table.a {
	table-layout: auto;
	width: 100%;
}
</style>
</head>
<!--end::Head-->
<!--begin::Body-->

<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<body id="kt_body"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed header-mobile-fixed aside-enabled aside-static page-loading" 
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/OPD/media/bg/bg-9.jpg)">
	<!--begin::Main-->
	<!--begin::Header Mobile-->
	
	<!--end::Header Mobile-->
	<div class="d-flex flex-column flex-root">
		<!--begin::Page-->
		<div class="d-flex flex-row flex-column-fluid page">
			<!--begin::Aside-->
			
      <jsp:include page="/form/common/navbar.jsp"></jsp:include>

			<!--end::Aside-->
			<!--begin::Wrapper-->
			<div class="d-flex flex-column flex-row-fluid wrapper"
				id="kt_wrapper">
				<!--begin::Header-->
				
				
				<jsp:include page="/form/common/header.jsp"></jsp:include>
				<!--end::Header-->


				<!--begin::Content-->
				<div class="content d-flex flex-column flex-column-fluid"
					id="kt_content">
					<!--begin::Entry-->
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->

						<div
							class="container d-flex align-items-stretch justify-content-between">
							<div class="col-xl-12 ">
				
					<h2
									class="d-flex align-items-center text-dark font-weight-bold my-1 mr-3 ml-4"  > Fees Reciept Printing
										</h2>
								
									<div class="col-xl-12 offset-xl-0">
										<div class="example mb-10">
											<div class="example-preview">
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

									<div class="card card-custom gutter-b">
										<div class="col-xl-12">
											<table class="table">
												<thead>
													<tr>
														<th style="text-align: center" scope="col">Sr. No</th>
														<th style="text-align: center" scope="col">Invoice Id</th>
														<th style="text-align: center" scope="col">Visit Id</th>
														<th style="text-align: center" scope="col">Invoice
															Date</th>
														<th style="text-align: center" scope="col">Clinic Fee</th>
														<th style="text-align: center" scope="col">Paid</th>
														<th style="text-align: center" scope="col">To Be Paid</th>
														<th style="text-align: center" scope="col">Now Paying</th>



													</tr>
												</thead>
												<tbody class="table_body">
												</tbody>
											</table>
										</div>
									</div>
									<div class="row">

										

												
													<button type="button" id="Print_receipt" 
														onclick="invoice_print()"
														class="btn font-weight-bold btn-primary text-right ml-5">Print
														Receipt</button>
												

										
									</div>
							</form>
						</div>
					</div>
				</div>
				</div>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
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
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const patient_code = urlParams.get('pcode');
	var vid = urlParams.get('vid');
	console.log(patient_code);
	console.log(vid);
	var pcode1= patient_code;
	var pcode2;
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
			 pcode2 = $('#patient_code').val();
			
				$.ajax({
					url : base + "/dssAPI/dfapi/getInvoiceDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {"patient_code": pcode2},
					success:function(data)
			    	{
						const row = data.find(d => d.patient_code == pcode2);
						data.forEach((row)=> {
							if(pcode2 == row.patient_code )
							{
							    j++;
							   
							}
						});
			    	}
				});	
				if(j > 0){
					 $('.card').show();
					 $('#calculate_total').show();
				}else{
					 $('.card').hide();
				}
				for(var i = 0; i < j; i++){
				 	  var html = '';
				 	  html += '<tr>'
				 	  html += ' <td><input type="checkbox" class="form-control Sr.No d-flex flex-column-fluid h-20px w-20px mt-3" id="id-'+i+'" onClick="checkedBox('+i+')"></td>';
				 	 html += ' <td><input type="text" class="form-control Invoice Id d-flex flex-column-fluid" id="invoiceId-' + i +'" name="invoiceId" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Visit Id d-flex flex-column-fluid" id="visitId-' + i +'" name="visitId" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Invoice Date d-flex flex-column-fluid" id="invoiceDate-' + i +'" name="invoiceDate"  style="background-color:#FFFFFF; border:0px;text-align:left" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Clinic Fee d-flex flex-column-fluid" id="clinicFee-' + i +'" name="clinicFee" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control Paid d-flex flex-column-fluid" id="paid-' + i +'" name="paid" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled></td>';
				 	 html += ' <td><input type="text" class="form-control To Be Paid d-flex flex-column-fluid" id="toBePaid-' + i +'" name="toBePaid" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled></td>';
				 	  html += '<td><a type="button"   onClick="nextPage(' + i + ')";  id="nextPage-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger text-center"  style="border:0px; width:50px; text-align:center; " data-toggle="modal" data-target="#prescriptionHistory"><i class="la la-print"></i></a></td></tr>';
				 	 html += '</tr>';
				 	  $('.table_body').append(html);
		} 
				var to_be_paid = 0;
				var k=0;
					$.ajax({
						url : base + "/dssAPI/dfapi/getInvoiceDetails",
						type : "post",
						dataType : "json",
						async : false,
						data : {"patient_code": pcode2},
						success:function(data)
				 	{
							const row = data.find(d => d.patient_code == pcode2);
							data.forEach((row)=> {
								if(pcode2 == row.patient_code )
								{								 
								
									    $('#invoiceId-' + k).val(row.invoice_id);
										$('#invoiceDate-' + k).val(row.paid_date);
										$('#clinicFee-' + k).val(row.clinic_fee);
										$('#paid-' + k).val(row.paid_fee);
										$('#toBePaid-' + k).val(row.balance_amt);
										$('#visitId-' + k).val(row.visit_id);
										
										 k++;
								}
							});
				 	}
					});	
					
					 $("#patient_name").prop('disabled', true);
					 $("#patient_code").prop('disabled', true);
	 })

	 function nextPage(i){
		                 let patient_name = $('#patient_name').val();
		                 let invoice_id =  $('#invoiceId-'+i).val();
				 		 let visit_id = $('#visitId-'+i).val();
				 		 let invoiceDate = $('#invoiceDate-'+i).val();
				 		 let clinicFee = $('#clinicFee-'+i).val();
				 		 let paid = $('#paid-'+i).val();
				 		 let toBePaid = $('#toBePaid-'+i).val();
 						var url = "singleInvoicesPrinting.jsp" + '?patient_name=' + patient_name + '&invoice_id=' + invoice_id + '&clinicFee=' + clinicFee + '&paid='+paid + '&toBePaid=' +toBePaid + '&invoiceDate=' +invoiceDate + '&visit_id=' +visit_id;
/*  					var url = "demo7_invoice_receipt.jsp" + '?patient_name=' + patient_name + '&invoice_id=' + invoice_id + '&clinicFee=' + clinicFee + '&paid='+paid + '&toBePaid=' +toBePaid + '&invoiceDate=' +invoiceDate + '&visit_id=' +visit_id;
 */
						window.location.assign(url);	
 
				 		  }
					 function invoice_print(){
						 const invoices = [];
						var checked1=0;
						for(i=0; i <= j ; i++)
						{
					 if ($("#id-"+i).prop('checked')==true){ 
						   var a2 = $("#invoiceId-"+i).val();
						  invoices[checked1] = a2;
						   checked1++;
				 		  }
						}
						let unique = [...new Set(invoices)];
					 var checked_invoices = unique.length;
 						var url = "multiInvoicesPrinting.jsp" + '?patient_name=' + unique + '&noofincoixes=' + checked_invoices ;
 						window.location.assign(url);
	 }

</script>
</body>
</html>


<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>