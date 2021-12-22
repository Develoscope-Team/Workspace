$("#addBank").show();
	
	$('#addBank').click(function() {
				
								var bank_name = $('#bank_name').val();
								var account_holder_name = $('#account_holder_name').val();
								var account_no = $('#account_no').val();
								var IFSC_code = $('#IFSC_code').val();
								var branch = $('#branch').val();
								var acc_type = $('#acc_type').val();
								var opening_amount= $('#opening_amount').val();
								
								var flag 		  = 1; 
															
								if(bank_name != '' || account_holder_name != ''){
									$.ajax({
										url : base +"/ipdAPI/ipdapi/insertUpdateBank",
										
										type : "post",
										dataType : "json",
										async : false,
										data : {
											
											"bank_name" : bank_name,
											"account_holder_name" : account_holder_name,
											"account_no" : account_no,
											"IFSC_code" : IFSC_code,
											"branch" : branch,
											"acc_type" : acc_type,
											"opening_amount" : opening_amount,
											
											"flag" : flag
										},
										error : function(xhr) {
											var msg = "(insertUpdateRecipe)Sorry but there was an error : "
													+ xhr.status
													+ " "
													+ xhr.statusText;
											alert(msg);
										},
										success : function(response) {
											if (response != null) {

												if (response >= 1) {

													var msg = "Bank Data inserted/Updated Successfully.";
													alert(msg);
													location.reload(true);

												} 										}
										}

									});
								}

							})

			"use strict";
			//Class definition
					

var bank_id;
var html = "";

$.ajax({
	
	url : base +"/ipdAPI/ipdapi/getBankDetails",
	type : "post",
	dataType : "json",
	async : false,
	data : {"bank_id": bank_id},
	success:function(data)
	{
		  
		
		const row = data.find(d => d.bank_id == bank_id);
		data.forEach((row)=> {
			html +="<tr id= tr-id-2 class= tr-class-2>"
			html += "<td>"+row.bank_id+"</td>"; 
			 html += "<td>"+row.bank_name+"</td>";
	           
	            html += "<td>"+row.account_holder_name+"</td>";
	            html += "<td>"+row.acc_type+"</td>";
	            html += "<td>"+row.account_no+"</td>";
	           
	         
     	       	 html += '<td><a href="javascript:update('+row.bank_id+');" class="btn_action btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="12" height="2" rx="1"/></g></svg></span>'
         

     	       	+ '<a href="javascript:deleteById('+row.bank_id+');" class="btn_action btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
	            html +="</tr>"
		
		
		});
		 $(".data").html(html);
	}
	
});	



$(document).ready(function (){
	   var table = $('#table-id').DataTable();
	 
	});

	// Update data by recipe name and id
	function update(bank_id) {
		$('.btn_action').hide();

		$("#updateBank").show();
		$("#addBank").hide();
		

		$.ajax({
			
			url : base +"/ipdAPI/ipdapi/getBankDetails",
			type : "post",
			dataType : "json",
			async : false,
			data : {"flag":1,},
			success:function(data)
	        {
				
				const row = data.find(d => d.bank_id == bank_id);
				
				console.log(row);
				
				if(row != null){
					$('#bank_name').val(row.bank_name);
					$('#account_holder_name').val(row.account_holder_name);
					$('#account_no').val(row.account_no);
					$('#IFSC_code').val(row.IFSC_code);
					$('#branch').val(row.branch);
					$('#acc_type').val(row.acc_type);
					$('#opening_amount').val(row.opening_amount);
					
				
				}

	        }	
		});				

		$('#updateBank')
				.click(
						function() {

							var bank_name = $('#bank_name').val();
							var account_holder_name = $('#account_holder_name').val();
							var account_no = $('#account_no').val();
							var IFSC_code = $('#IFSC_code').val();
							var branch = $('#branch').val();
							var acc_type = $('#acc_type').val();
							var opening_amount = $('#opening_amount').val();
							


							var flag = 2; // Addition

							if (bank_name != '') {
							
								$.ajax({
									url : base +"/ipdAPI/ipdapi/insertUpdateBank",
									
											type : "post",
											dataType : "json",
											async : false,
											data : {
												"bank_id" :bank_id,
												"bank_name" : bank_name,
												"account_holder_name" : account_holder_name,
												"account_no" : account_no,
												"IFSC_code" : IFSC_code,
												"branch" : branch,
												"acc_type" : acc_type,
												"opening_amount" : opening_amount,
												
												"flag" : flag
											},
											error : function(xhr) {
												var msg = "(insertUpdateBank)Sorry but there was an error : "
														+ xhr.status
														+ " "
														+ xhr.statusText;
												alert(msg);
											},
											success : function(response) {
												if (response != null) {

													if (response >= 1) {

														var msg = "Bank Data Updated Successfully.";
														alert(msg);

													 
													}
												}
											}

										});
							}

						})

		"use strict";
	}
	$('#cancel')
    .click(
          function() {		
           window.location.reload();
                     	})

	// Delete data by Recipe_id
	function deleteById(id) {
		 if (confirm("Press OK to confirm!")) {

		var bank_id = id;
		var flag = 3;
		$
				.ajax({
					url : base +"/ipdAPI/ipdapi/insertUpdateBank",
					
					type : "post",
					dataType : "json",
					async : false,
					data : {
						
						"bank_id" : bank_id,
						"bank_name" : "",
						"account_holder_name" : "",
						"account_no" : "",
						"IFSC_code" : "",
						"branch" : "",
						"acc_type" : "",
						"opening_amount" :"",
						
						"flag" : flag
					},

					error : function(xhr) {
						var msg = "(insertUpdateBank)Sorry but there was an error : "
								+ xhr.status + " " + xhr.statusText;
						alert(msg);
					},
					success : function(response) {
						if (response != null) {
							
							if (response >= 1) {

								var msg = "Bank Data deleted Successfully.";
								alert(msg);
								location.reload(true);

							}
						}
					}

				});
		 }else {
			  window.location.reload();
		  }
	}
	$(document).ready(function(){

		  // Search all columns
		  $('#txt_searchall').keyup(function(){
		    // Search Text
		    var search = $(this).val();

		    // Hide all table tbody rows
		    $('table tbody tr').hide();

		    // Count total search result
		    var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

		    if(len > 0){
		      // Searching text in columns and show match row
		      $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
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
		 