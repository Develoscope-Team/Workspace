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
<jsp:include page="../common/cssfiles.jsp"></jsp:include>
<jsp:include page="../common/navbar.jsp"></jsp:include>

<script type="text/javascript"
	src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/jspdf.min.js"></script>

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
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
<body id="kt_body"
	style="background-image: url(<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/gif/BakeShack003.jpg)"
	class="quick-panel-right demo-panel-right offcanvas-right header-fixed subheader-enabled page-loading">
	
	<jsp:include page="/form/common/mobile-header.jsp"></jsp:include>
	<!--end::Header Mobile-->
	<div class="col-xl-10 mt-20 offset-1 ">
	<div class="card card-custom gutter-b ">
				<div class="dropdown dropdown-inline mt-5" >
					<button type="button1" class="  btn  font-weight-bolder " style="float:right;"
						value="Create Print" id="Print" onclick="MyApp.printTable()">
						<i class="icon-2x flaticon2-printer" style="color: #4A7DFF"></i>
					</button>
					<button type="button " class=" btn font-weight-bolder " style="float:right;"
						value="Create PDF" id="PDF" onclick="run()">
						<i class=" icon-2x fas fa-file-pdf " style="color:  #4A7DFF"></i>
					</button>
					<button onclick="dataContentExportExl('card_Report', 'user-data')"
						class="  btn  font-weight-bolder " style="float:right;" value="Create Excel" id="Excel">
						<i class=" icon-2x fas fa-file-excel" style="color:  #4A7DFF"></i>
					</button>
				</div>
		<div class=" " id="card_Report">
			<font size="+3"><u><center>Monthly Product Report</center></u></font> <br />
			<div class=" mr-10 " >
			<font size="+2"><u><center>Date: <span class=" " id="finish"></span></center></u></font></div><br />
			<table class="table" style="border: 1px solid black">
				<thead>
					<tr>
						<th style="text-align: center;" scope="col">Product Name </th>
						<th style="text-align: center" scope="col">Jan.</th>
						<th style="text-align: center" scope="col">Feb.</th>
						<th style="text-align: center" scope="col">Mar.</th>
						<th style="text-align: center" scope="col">Apr.</th>
						<th style="text-align: center" scope="col">May.</th>
						<th style="text-align: center" scope="col">Jun.</th>
						<th style="text-align: center" scope="col">Jul.</th>
						<th style="text-align: center" scope="col">Aug.</th>
						<th style="text-align: center" scope="col">Sep.</th>
						<th style="text-align: center" scope="col">Oct.</th>
						<th style="text-align: center" scope="col">Nov.</th>
						<th style="text-align: center" scope="col">Dec.</th>
						
					</tr>
				</thead>
				<tbody class="table_body text-center">
				</tbody>
			</table>
		</div>
	</div>
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
		src="<%=VO_Face.getContainerDeployPath()%>/ResourceBundles/Resources/assets/BakeShack_IM/js/main.js"></script>


	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';

	 var today = new Date();
	 var date = (today.getMonth()+1)+'-'+today.getFullYear();
	 $('#finish').text(date);
	 $('#from_date').val(date);
	
	 $('#till_date').val(date);
	var product_name = " ";
	const queryString = window.location.search;
	const urlParams = new URLSearchParams(queryString);
	const product_code = urlParams.get('product_code');
	 product_name = urlParams.get('product_name');
   
	const  from_date = urlParams.get('from_date');
	 const till_date = urlParams.get('till_date');
	var j=0;
	var html;
	$.ajax({
		url : base + "/bakeshackAPI/api/getProductDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {
		
			},
		success:function(data)
	    {
			
			const row = data.find(d => d.product_name == product_name);
			data.forEach((row)=> {
				j++;
			});
			
		}
	});	
				for(var i = 1; i <= j; i++){
				 	  var html = '';
				 	  html += '<tr>'
			 	      html += '<td><input type="text-left" class=" " id="product_name-' + i +'" name="product_name" style="background-color:#FFFFFF; border:0px; width: 100px; text-align:center" disabled></td>';
				 	  html += '<td><input type="text" class=" " id="jan-' + i +'" name="jan" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 		  html += '<td><input type="text" class=" " id="feb-' + i +'" name="feb" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 		  html += '<td><input type="text" class=" " id="mar-' + i +'" name="mar" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="april-' + i +'" name="april" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="may-' + i +'" name="may" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="june-' + i +'" name="june" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="july-' + i +'" name="july" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="aug-' + i +'" name="aug" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="sep-' + i +'" name="sep" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="oct-' + i +'" name="oct" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="nov-' + i +'" name="nov" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
			 	      html += '<td><input type="text" class=" " id="dec-' + i +'" name="dec" style="background-color:#FFFFFF; border:0px; width: 50px; text-align:center" disabled></td>';
				 	 html += '</tr>';
				 	  $('.table_body').append(html);
		}
				
				var k=0;
				
				$.ajax({
					url : base + "/bakeshackAPI/api/getProductDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						},
					success:function(data)
				    {
						const row = data.find(d => d.product_name == product_name);
						data.forEach((row)=> {
							k++;
							$('#product_name-'+k).val(row.product_name);
						});
					}
				});	
				$.ajax({	
				url : base + "/bakeshackAPI/api/getMontProductDetails",
					type : "post",
					dataType : "json",
					async : false,
					data : {
						},
					success:function(data)
				    {
						const row = data.find(d => d.product_name == product_name);
						data.forEach((row)=> {	
							var d = new Date(row.product_name);
							let month = d.getMonth()+1;
				for(var i = 1; i <= j; i++){
					var product_name = $('#product_name-'+i).val()
					if(product_name == row.entry_date)
						{
						if(month ==1){
							$('#jan-'+i).val(row.distributed_quantity);
						}
						else if(month ==2){
							$('#feb-'+i).val(row.distributed_quantity);
						}
						else if(month ==3){
							$('#mar-'+i).val(row.distributed_quantity);
						}
						else if(month ==4){
							$('#april-'+i).val(row.distributed_quantity);
						}
						else if(month ==5){
							$('#may-'+i).val(row.distributed_quantity);
						}
						else if(month ==6){
							$('#june-'+i).val(row.distributed_quantity);
						}
						else if(month ==7){
							$('#july-'+i).val(row.distributed_quantity);
						}
						else if(month ==8){
							$('#aug-'+i).val(row.distributed_quantity);
						}
						else if(month ==9){
							$('#sep-'+i).val(row.distributed_quantity);
						}
						else if(month ==10){
							$('#oct-'+i).val(row.distributed_quantity);
						}
						else if(month ==11){
							$('#nov-'+i).val(row.distributed_quantity);
						}
						else if(month ==12){
							$('#dec-'+i).val(row.distributed_quantity);
						}
						}
				}
				
           });
					}
				});	
				

			
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
	 
	 var MyApp = new function () {
	     this.printTable = function () {
	         var tab = document.getElementById('card_Report');
	         printHeader:"<h1>Example Table Header<h1>"

	         var style = "<style>";
	             style = style + "table {width: 100%;font: 17px Calibri;}";
	             style = style + "table, th, td {border: solid 1px #DDD; border-collapse: collapse;";
	             style = style + "padding: 2px 3px;text-align: center;}";
	             style = style + "</style>";

	         var win = window.open('', '', 'height=700,width=700');
	         win.document.write(style);          //  add the style.
	         win.document.write(card_Report.outerHTML);
	         win.document.close();
	         win.print();
	     }
	 }

	 function run() {
		  var doc = new jsPDF("l",'pt','a3');
		  doc.setFontSize(15);
		    doc.text( '', 10, 15,{
		        align: 'justify'
		    });
		    doc.setFontSize(10);
		  doc.fromHTML($("#card_Report").get(0), 150, 20,{
		    width: 1000,
		    align: 'justify'
		  },function(a) {
		    doc.save("Image.pdf");
		  });
		}
	function dataContentExportExl(memberId, filename = ''){
		    var fourceFileSaveDataUrl;
		    var dataFileType = 'application/vnd.ms-excel';
		    var tableSelect = document.getElementById(memberId);
		    var dataContentSource = tableSelect.innerHTML.replace(/ /g, '%20');
		    
		    // Specify file name
		    filename = filename?filename+'.xls':'export_excel_data.xls';
		    
		    // Create download link element
		    fourceFileSaveDataUrl = document.createElement("a");
		    
		    document.body.appendChild(fourceFileSaveDataUrl);
		    
		    if(navigator.msSaveOrOpenBlob){
		        var blob = new Blob(['\ufeff', dataContentSource], {
		            type: dataFileType
		        });
		        navigator.msSaveOrOpenBlob( blob, filename);
		    }else{
		        // Create a link to the file
		        fourceFileSaveDataUrl.href = 'data:' + dataFileType + ', ' + dataContentSource;
		    
		        // Setting the file name
		        fourceFileSaveDataUrl.download = filename;
		        
		        //triggering the function
		        fourceFileSaveDataUrl.click();
		    }
		};

	</script>
</body>
</html>

<%
	} catch (Exception e) {
		Logger.log(dbConnVar, "" + e);
	}
%>