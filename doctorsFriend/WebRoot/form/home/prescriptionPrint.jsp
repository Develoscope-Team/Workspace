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
									<div class="row visit_details">
										<div class="col-xl-6">
											<div class="form-group">
												<label>Visit Id</label><span class="text-danger">*</span>
												<div class="typeahead">
													<input type="text"
														class="form-control form-control-solid form-control-lg"
														name="patientName" id="visit_id" /> 
												</div>
											</div>

										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>Prescription Code</label> <input type="text"
													class="form-control form-control-solid" id="prescription_code" />
											</div>
										</div>
										
										<div class="col-lg-6">
											<div class="form-group">
												 <input type="hidden"
													class="form-control form-control-solid" id="re_visit_days" />
											</div>
										</div>
									</div>
									<div class="card-body ">
										<span class="text-danger">double click on Medicine
											Field to search new medicine</span>
										<table class="table" id="Mtable">
											<thead>
												<tr>
													<th style="text-align: center" scope="col">#</th>
													<th style="text-align: center" scope="col">Med. Name</th>
													<th style="text-align: center" scope="col">Type</th>
													<th style="text-align: center" scope="col">Dose</th>
													<th style="text-align: center" scope="col">Time</th>
													<th style="text-align: center" scope="col">Qty</th>
													<th style="text-align: center" scope="col">Spl</th>
													<th style="text-align: center" scope="col">Prt</th>
													<th style="text-align: center" scope="col">Remark</th>
													<th style="text-align: center" scope="col">Action</th>
													<th style="text-align: center" scope="col" hidden>Category</th>
													<!-- <th style="text-align:center" scope="col" hidden>Is_Printable</th> -->
												</tr>
											</thead>

											<tbody class="add_medicine" id="add-medicine"></tbody>


										</table>
									</div>

<div class="row">
									<div class="col-9 text-right mb-5">
										<button type="button" id="add"
											class="btn font-weight-bold  btn-icon btn-light-success">
											<i class="la la-plus"></i>
										</button>
									</div>
                                   
                                   <div class="col-3 text-left mb-5 ">
										<button type="button" id="save_print"
											class="btn font-weight-bold   btn-light-danger "> Save & Print	
										</button>
									</div>

</div>
									<div class="modal" id="medicineModel" tabindex="-1"
										role="dialog" aria-labelledby="staticBackdrop"
										aria-hidden="true">
										<div class="modal-dialog  modal-xl modal-dialog-scrollable"
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
													<!-- <h3>THIS IS A modal for MEDISION SELECTION</h3> -->
													<div
														class="quick-search quick-search-inline ml-20 w-300px "
														id="kt_quick_search_inline">
														<form method="get" class="quick-search-form">
															<div class="input-group rounded bg-light">
																<div class="input-group-prepend">
																	<span class="input-group-text"> <span
																		class="svg-icon svg-icon-lg"> <svg
																				xmlns="http://www.w3.org/2000/svg"
																				xmlns:xlink="http://www.w3.org/1999/xlink"
																				width="24px" height="24px" viewBox="0 0 24 24"
																				version="1.1">
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
														</svg>
																	</span>
																	</span>
																</div>
																<input type="text" class="form-control h-45px "
																	id="txt_searchall" placeholder="Search..." />
																<div class="input-group-append">
																	<span class="input-group-text"> <i
																		class="quick-search-close ki ki-close icon-sm text-muted"></i>
																	</span>
																</div>
															</div>
														</form>




														<div id="kt_quick_search_toggle" data-toggle="dropdown"
															data-offset="0px,1px"></div>

														<div
															class="dropdown-menu dropdown-menu-left dropdown-menu-lg dropdown-menu-anim-up">
															<div class="quick-search-wrapper scroll"
																data-scroll="true" data-height="350"
																data-mobile-height="200"></div>
														</div>

													</div>
													<br />
													<div
														class="datatable datatable-bordered datatable-head-custom"
														id="kt_datatable"></div>


												</div>
												<div class="modal-footer">
													<button type="button"
														class="btn btn-light-primary font-weight-bold"
														data-dismiss="modal">Close</button>
												</div>
											</div>
										</div>
									</div>

									<!-- <div class="modal" id="medicineModel" 
																role="dialog" aria-labelledby="staticBackdrop"
																aria-hidden="true">

  Modal content
  <div class="modal-content">
    <span class="close">&times;</span>
    <p>Some text in the Modal..</p>
  </div>

</div> -->


									<div class="card card-custom gutter-b">
										<div class="col-xl-12">
											<table class="table">
												<thead>
													<tr>
														<th scope="col">Prescription Id</th>
														<th scope="col">Visit Id</th>

														<th scope="col">patient_code</th>

														<th scope="col">Action</th>
														<th scope="col" hidden>Re-Visit Days</th>



													</tr>
												</thead>
												<tbody class="table_body">
												</tbody>
											</table>
										</div>
									</div>


									<!-- <div class="row">

										<div class="card-footer">
											<div class="row">

												<div class="col-lg-6 offset-3">
													<button type="button" id="Print_receipt"
														onclick="invoice_print()"
														class="btn font-weight-bold btn-primary text-right">Print
														Receipt</button>
												</div>

											</div>
										</div>
									</div> -->
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
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const patient_code = urlParams.get('pcode');
	var vid = urlParams.get('vid');
	console.log(patient_code);
	console.log(vid);
	var pcode1= patient_code;
	var pcode2;
	 var j=0;
	 $('.card-body').hide();
	 $('#add').hide();
	 $('#save_print').hide();
	 $('.visit_details').hide();
	
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
					url : base + "/dssAPI/dfapi/getPatientPrescription",
					type : "post",
					dataType : "json",
					async : false,
					data : {"patient_code" : pcode2
						},
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
 			 	 html += '<td><input type="text" class="form-control Invoice Id d-flex flex-column-fluid" id="prescription_id-' + i +'" name="prescription_id" style="background-color:#FFFFFF; border:0px; width: 80px; text-align:center" disabled></td>';
				 	 html += '<td><input type="text" class="form-control Visit Id d-flex flex-column-fluid" id="visitId-' + i +'" name="visitId" style="background-color:#FFFFFF; border:0px; width: 80px; text-align:center" disabled></td>';
  			 	  html += '<td><input type="text" class="form-control Clinic Fee d-flex flex-column-fluid" id="patient_code-' + i +'" name="patient_code" style="background-color:#FFFFFF; border:0px; width: 80px; text-align:center" disabled></td>';
				 	  html += '<td><a type="button"   onClick="nextPage(' + i + ')";  id="nextPage-' + i +'" class="btn_edit btn font-weight-bold btn-danger btn-icon btn-light-danger text-center"  style="border:0px; width:50px; text-align:center; " data-toggle="modal" data-target="#prescriptionHistory"><i class="la la-edit"></i></a>';
				 	 html  += '<a type="button"   onClick="print_prescription(' + i + ')";  id="print_prescription-' + i +'" class="btn_print ml-2 btn font-weight-bold btn-danger btn-icon btn-light-danger text-center"  style="border:0px; width:50px; text-align:center; " data-toggle="modal" data-target="#prescriptionHistory"><i class="la la-print"></i></a></td>';
				 	 html += '<td><input type="hidden" class="form-control To Be Paid d-flex flex-column-fluid" id="reVisitDays-' + i +'" name="reVisitDays" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled></td>';
				 	 html += '<td><input type="hidden" class="form-control To Be Paid d-flex flex-column-fluid" id="prescription_desc-' + i +'" name="prescription_desc" style="background-color:#FFFFFF; border:0px; width: 80px;text-align:center" disabled></td>';

				 	 html += '</tr>';
				 	  $('.table_body').append(html);
		} 
				var to_be_paid = 0;
				var k=0;
					$.ajax({
						url : base + "/dssAPI/dfapi/getPatientPrescription",
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
								
									    $('#prescription_id-' + k).val(row.prescription_id);
										$('#patient_code-' + k).val(row.patient_code);
										$('#reVisitDays-' + k).val(row.re_visit); 
										$('#visitId-' + k).val(row.visit_id);
										$('#prescription_desc-' + k).val(row.prescription_desc);
										
										 k++;
								}
							});
				 	}
					});	
					
					 $("#patient_name").prop('disabled', true);
					 $("#patient_code").prop('disabled', true);
	 })

	 var r=0;
	 function nextPage(i){
		 
		 $('.visit_details').show();            
		 $('.card-body').show();
		 $('#save_print').show();
		 $('#add').show();
		 $('.btn_edit').hide();
		 $('.btn_print').hide();
		                
		                 let patient_name = $('#patient_name').val();
		                 let prescription_id =  $('#prescription_id-'+i).val();
				 		 let visitId = $('#visitId-'+i).val();
				 		 let patient_code = $('#patient_code-'+i).val();
				 		 let re_visit_days = $('#reVisitDays-'+i).val();
				 		 let prescription_desc = $('#prescription_desc-'+i).val();
				 		// alert(prescription_desc);
				 		  $('#re_visit_days').val(re_visit_days);
				 		 $('#visit_id').val(visitId);
				 		$('#prescription_code').val(prescription_id);
				 		 
				 		const parsedData = JSON.parse(prescription_desc);
				         
						 $(parsedData).each(function(index) {
							r++;
								$('#medicineName-' + (index + 1)).val(parsedData[index]['medicineName']);
								$('#type-' + (index + 1)).val(parsedData[index]['type']);
								 $('#category-' + (index + 1)).val(parsedData[index]['category']); 
								$('#dose-' + (index + 1)).val(parsedData[index]['dose']);
								$('#time-' + (index + 1)).val(parsedData[index]['time']);
								$('#qty-' + (index + 1)).val(parsedData[index]['qty']);
								if(parsedData[index]['is_special'] == 'Y'){
									$('#isSpecial-' + (index + 1)).prop("checked", true)
								}
								if(parsedData[index]['isPrintable'] == 'Y'){
									$('#Is_Printable-' + (index + 1)).prop("checked", true)
								}
								$('#remark-' + (index + 1)).val(parsedData[index]['remark']);
								
								//alert(r);
							});
						 
						 for(var i = 1; i <=r; i++){
							  var html = '';
							  html += '<tr>';
							  html += '<td style="width: 3%;">' + i + '</td>';
							  html += '<td style="width: 18%;" ><input type="text" class="form-control medicineName" id="medicineName-' + i +'" name="medicineName" data-medicine-id="'+ i + '"><option value="" disabled selected hidden>Select</option></select></td>';
	 					     html += '<td style="width: 16%;"><input type="text" class="form-control type" name="type" id="type-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
							  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid dose" name="dose" id="dose-' + i + '" placeholder="Dose" /></td>';
							  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid time" name="time" id="time-' + i + '" placeholder="Time" /></td>';
							  html += '<td style="width: 12%;"><input type="text" class="form-control form-control-solid qty" name="qty" id="qty-' + i + '" placeholder="Qty" /></td>';
							  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="isSpecial" name="isSpecial" id="isSpecial-'+ i +'"/> <span></span></label></div></td>';
							  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="Is_Printable" name="Is_Printable" id="Is_Printable-'+ i +'"/> <span></span></label></div></td>';
							  html += '<td style="width: 25%;"><input type="text" class="form-control remark" name="remark" id="remark-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
							//  html += '<td style="width: 5%;"><a type="button" data-repeater-reset="" onClick="resetRow(' + i + ')"; id="resetRow-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger"><i class="la la-eraser"></i></a></td>';
								 html += '<td style="width: 5%;"><a type="button" data-repeater-delete="";  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
							// html += '<td><a type="button" data-repeater-reset="" onClick="resetRow(' + i + ')"; id="resetRow-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger"><i class="la la-eraser"></i></a></td>';
							  //html += '<td><a type="button" data-repeater-create="" onClick="addRow(' + i + ')"; id="addRow-' + i +'" class="btn font-weight-bold btn-danger btn-icon btn-light-danger"><i class="la la-plus"></i></a></td></tr>';
	     					  html += '<td style="width: 0%;"><input type="text" class="form-control category" name="category" id="category-' + i + '" hidden><option value="" disabled selected hidden>Select</option></select></td>';

							  $('.add_medicine').append(html);
					 }
				 		 
						 const parsedData1 = JSON.parse(prescription_desc);
						 $(parsedData1).each(function(index) {
								$('#medicineName-' + (index + 1)).val(parsedData1[index]['medicineName']);
								$('#type-' + (index + 1)).val(parsedData1[index]['type']);
								$('#category-' + (index + 1)).val(parsedData1[index]['category']);
								$('#dose-' + (index + 1)).val(parsedData1[index]['dose']);
								$('#time-' + (index + 1)).val(parsedData1[index]['time']);
								$('#qty-' + (index + 1)).val(parsedData1[index]['qty']);
								if(parsedData1[index]['is_special'] == 'Y'){
									$('#isSpecial-' + (index + 1)).prop("checked", true)
								}
								if(parsedData[index]['isPrintable'] == 'Y'){
									$('#Is_Printable-' + (index + 1)).prop("checked", true)
								}
								$('#remark-' + (index + 1)).val(parsedData1[index]['remark']);
							});	
				 		 
						 table_len=(Mtable.rows.length);
						// alert(table_len);
 					//	var url = "prescription_module_print.jsp" + '?patient_name=' + patient_name + '&prescription_id=' + prescription_id + '&patient_code=' + patient_code + '&visitId=' +visitId + '&re_visit_days=' + re_visit_days;

					//	window.location.assign(url);	
 
				 		  }
					/*  function invoice_print(){
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
	 } */
	 function update(id){
			// var medicine_name = $(this).val(row.medicine_name);
			//var id = $(this).data('medicine-id');

			//console.log(medicine_name);
			
			$.ajax({
		        type:"POST",
		        dataType: "json",
		        data:{"medicine_id": id},
				async : false,
		        url: base + "/dssAPI/dfapi/getMedicineDetails",
		        success:function(data)
		        {
		            const row = data.find(d => d.medicine_id ==id);
		            $('#medicineName-'+ matches).val(row.medicine_name);
		        	$("#type-"+ matches).val(row.medicine_type);
		        	$("#category-"+ matches).val(row.medicine_category);
		        	if(row.is_special == 'Y'){
		        		$('#isSpecial-' + matches).prop("checked", true)
		        	}
		        	if(row.is_printable == 'Y'){
		        		$('#Is_Printable-' + matches).prop("checked", true)
		        	}
		        }
		     });
			 $("#medicineModel").modal('hide');
		} 
	 var medData;
	 var r=0;
	 var table_len=(Mtable.rows.length);
	 $('#add').click(function () {
		 	
		 	var i =table_len;
		 	
		 	  
		 	  var html = ''; 
		 	  html += '<tr>';
		 	  html += '<td style="width: 3%;">' + i + '</td>';
		 	  html += '<td style="width: 18%;" ><input type="text" class="form-control medicineName" id="medicineName-' + i +'" name="medicineName" data-medicine-id="'+ i + '" placeholder="Medicine"></input></td>';
	 	 	  html += '<td style="width: 16%;"><input type="text" class="form-control type" name="type" id="type-' + i + '" placeholder="Type"></input></td>';
		 	  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid dose" name="dose" id="dose-' + i + '" placeholder="Dose" /></td>';
		 	  html += '<td style="width: 9%;"><input type="text" class="form-control form-control-solid time" name="time" id="time-' + i + '" placeholder="Time" /></td>';
		 	  html += '<td style="width: 12%;"><input type="text" class="form-control form-control-solid qty" name="qty" id="qty-' + i + '" placeholder="Qty" /></td>';
		 	  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="isSpecial" name="isSpecial" id="isSpecial-'+ i +'"/> <span></span></label></div></td>';
		 	  html += '<td style="width: 5%;"><div class="checkbox-inline justify-content-center  ml-5"><label class="checkbox checkbox-success"> <input type="checkbox" class="Is_Printable" name="Is_Printable" id="Is_Printable-'+ i +'"/> <span></span></label></div></td>';
		 	  html += '<td style="width: 25%;"><select class="form-control remark" name="remark" id="remark-' + i + '"><option value="" disabled selected hidden>Select</option></select></td>';
		 	 html += '<td style="width: 5%;"><a type="button" data-repeater-delete="" ;  class="btn_delete btn-sm btn-clean btn-icon"><i class="la la-trash-o"></i></a></td>';
		 	  html += '<td style="width: 0%;"><input type="text" class="form-control category" name="category" id="category-' + i + '" placeholder="Category" hidden></input></td></tr>';
		 	 
		 	 $('.add_medicine').append(html); 
		 		 $('.add_medicine #medicineName-'+ i).dblclick(function () {
		 			   mname=(this.id);
		 			 //  alert("say hi");
		 			  var str = mname;
		 	           matches = str.match(/(\d+)/);
		 	         
		 			
		 			  $("#medicineModel").modal();
		 			 
		 			});
		 		 $.ajax({
		 				url : base + "/dssAPI/dfapi/getRemark",
		 				type : "post",
		 				dataType : "json",
		 				async : false,
		 				data : {"flag":1},
		 				success:function(data)
		 			    {
		 					data.forEach((element)=> {
		 						
		 					        $('#remark-' + i).append($(document.createElement('option')).prop({
		 				                value: element.remark_desc,
		 				                text: element.remark_name
		 				            }))
		 						
		 					});   
		 			    }
		 			});	
		 		 
		 		 table_len++;
		 		
		 		
		 		
		 		
		 		});
	 
	 $('.add_medicine').on('click','.btn_delete',function(){
	 		$(this).closest('tr').remove();	
	 		});
	 
	 
	 
	 
	 function print_prescription(i){
	 
		  let patient_name = $('#patient_name').val();
          let prescription_id =  $('#prescription_id-'+i).val();
	 		 let visitId = $('#visitId-'+i).val();
	 		 let patient_code = $('#patient_code-'+i).val();
	 		 let re_visit_days = $('#reVisitDays-'+i).val();
	 		 let prescription_desc = $('#prescription_desc-'+i).val();
	 		var url = "prescription_module_print.jsp" + '?patient_name=' + patient_name + '&prescription_id=' + prescription_id + '&patient_code=' + patient_code + '&visitId=' +visitId + '&re_visit_days=' + re_visit_days;

			window.location.assign(url);
	 
	 }
	 
	 
	
		 $('#save_print').click(function(){ 
		     let patient_name = $('#patient_name').val();
             let prescription_id =  $('#prescription_code').val();
	 		 let visitId = $('#visit_id').val();
	 		 let patient_code = $('#patient_code').val();
	 		 let re_visit_days = $('#re_visit_days').val();
	 		 //let prescription_desc = $('#prescription_desc').val();
	 		 
	 		  var med = [];

	 $("table tbody tr").each(function(index) {
	 	
	 	if($(this).find('.medicineName').val() != null){
	 		
	 		var isSpecialValue =  $(this).find('.isSpecial').is(":checked");
	 		var isSpecial;
	 		if(isSpecialValue == true){
	 			isSpecial = "Y";
	 		}else{
	 			isSpecial = "N";
	 		}
	 		
	 		var isPrintableValue =  $(this).find('.Is_Printable').is(":checked");
	 		var isPrintable;
	 		if(isPrintableValue == true){
	 			isPrintable = "Y";
	 		}else{
	 			isPrintable = "N";
	 		}
	 	
	     med.push({ 
	         "medicineName": $(this).find('.medicineName').val(),
	         "type": $(this).find('.type').val(),
	         "category": $(this).find('.category').val(),
	         "dose":$(this).find('.dose').val(),
	         "time":$(this).find('.time').val(),
	         "qty":$(this).find('.qty').val(),
	         "remark":$(this).find('.remark').val(),
	         "is_special": isSpecial,
	         "isPrintable":isPrintable
	     	});
	 	
	    
	 	}
	 });

	 var jsonString = JSON.stringify(med);
	// alert(jsonString);
	 
	 
	 $.ajax({
	 		url : base + "/dssAPI/dfapi/updatePrescriptionDetails",
	 		type : "post",
	 		dataType : "json",
	 		async : false,
	 		data : {
	 			
	 			"patient_code" : patient_code,
	 			"visit_id" : visitId,
	 			"prescription_desc" : jsonString,
	 			
	 		},
	 		error : function(xhr) {
	 			var msg = "(Data updation failed. Error : "
	 					+ xhr.status
	 					+ " "
	 					+ xhr.statusText;
	 			alert(msg);
	 		},
	 		success : function(response) {
	 			if (response != null) {

	 				if (response >= 1) {

	 					var msg = "Prescription Data Updated Successfully.";
	 					alert(msg);

	 				} 
	 			}
	 		}

	 	});
	 		 
	 		 
	 		 
	 		 
	 	 	var url = "prescription_module_print.jsp" + '?patient_name=' + patient_name + '&prescription_id=' + prescription_id + '&patient_code=' + patient_code + '&visitId=' +visitId + '&re_visit_days=' + re_visit_days;

			window.location.assign(url); 
	 
	 });
	 
	 
	 
	 
	 $(document).ready(function(){

		  // Search all columns
		  $('#txt_searchall').keyup(function(){
		    // Search Text
		    var search = $(this).val();

		    // Hide all table tbody rows
		    $('#kt_datatable tbody tr').hide();

		    // Count total search result
		    var len = $('#kt_datatable tbody tr:not(.notfound) td:contains("'+search+'")').length;

		    if(len > 0){
		      // Searching text in columns and show match row
		      $('#kt_datatable tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
		        $(this).closest('tr').show();
		      });
		    }else{
		      $('.notfound').show();
		    }

		  });

		 

		});
	$.expr[":"].contains = $.expr.createPseudo(function(arg) {
		   return function( elem ) {
		     return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
		   };
		});	 
var KTBootstrapDaterangepicker = function() {
			// Private functions
			var demo2 = function() {
		var medicineId=null;
      var datatable = $('#kt_datatable').KTDatatable({
          // datasource definition
          data: {
              type: 'remote',
              source: {
                  read: {
                      url: base + "/dssAPI/dfapi/getMedicineDetails",
                      // sample custom headers
                      // headers: {'x-my-custom-header': 'some value', 'x-test-header': 'the value'},
                      map: function(raw) {
                          // sample data mapping
                          var dataSet = raw;
                          if (typeof raw.data !== 'undefined') {
                              dataSet = raw.data;
                          }
                          return dataSet;
                      },
                  },
              },
              pageSize: 10,
              serverPaging: true,
              serverFiltering: true,
              serverSorting: true,
          },
         layout: {
              scroll: true,
              footer: false,
          },
         sortable: true,
        pagination: false,
          search: {
              input: $('#kt_datatable_search_query'),
              key: 'generalSearch'
          },
      columns: [{
              field: 'medicine_id',
              title: '#',
              sortable: 'asc',
              width: 30,
              type: 'number',
              selector: false,
              textAlign: 'center',
          }, {
              field: 'medicine_name',
              title: 'Medicine Name',
          }, {
              field: 'medicine_type',
              title: 'Medicine Type',
              
          },{
              field: 'medicine_category',
              title: 'Medicine Category',
              
          }, {
              field: 'Actions',
              title: ' Actions',
              sortable: false,
              width: 125,
              overflow: 'visible',
              autoHide: false,
              template: function(row) {
                  return '\
                      <a href="javascript:update('+row.medicine_id+');" class="btn btn-sm btn-clean btn-icon mr-2" title="Edit details" id="edit">\
                      <span class="svg-icon svg-icon-md svg-icon-2x">\
                     <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">\
                      <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">\
                          <polygon points="0 0 24 0 24 24 0 24"/>\
                          <rect fill="#000000" opacity="0.3" x="11" y="7" width="2" height="14" rx="1"/>\
                          <path d="M6.70710678,20.7071068 C6.31658249,21.0976311 5.68341751,21.0976311 5.29289322,20.7071068 C4.90236893,20.3165825 4.90236893,19.6834175 5.29289322,19.2928932 L11.2928932,13.2928932 C11.6714722,12.9143143 12.2810586,12.9010687 12.6757246,13.2628459 L18.6757246,18.7628459 C19.0828436,19.1360383 19.1103465,19.7686056 18.7371541,20.1757246 C18.3639617,20.5828436 17.7313944,20.6103465 17.3242754,20.2371541 L12.0300757,15.3841378 L6.70710678,20.7071068 Z" fill="#000000" fill-rule="nonzero" transform="translate(12.000003, 16.999999) scale(1, -1) translate(-12.000003, -16.999999) "/>\
                          <rect fill="#000000" opacity="0.3" x="3" y="3" width="18" height="2" rx="1"/>\
                      </g>\
                    </svg>\
                  </span>\
                      </a>\
                     ';
              },
          }],

      });
  };
  return {
		// public functions
		init : function() {
			demo2();
		}
	};
}();

jQuery(document).ready(function() {
	KTBootstrapDaterangepicker.init();
});

</script>
</body>
</html>


<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>