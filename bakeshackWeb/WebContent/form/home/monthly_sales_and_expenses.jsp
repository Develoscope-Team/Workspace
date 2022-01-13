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
	<div class="col-xl-12 mt-20  ">
	<div class="card card-custom gutter-b ">
				<div class="dropdown dropdown-inline mt-5" >
					<button type="button1" class="  btn  font-weight-bolder " style="float:right;"
						value="Create Print" id="Print" onclick="MyApp.printTable()">
						<i class="icon-2x flaticon2-printer" style="color: #4A7DFF"></i>
					</button>
					<button type="button " class=" btn font-weight-bolder " style="float:right;"
						value="Create PDF" id="PDF" onclick="run()">
						<i class=" icon-2x fas fa-file-pdf " style="color: #4A7DFF"></i>
					</button>
					<button onclick="dataContentExportExl('card_Report', 'user-data')"
						class="  btn  font-weight-bolder " style="float:right;" value="Create Excel" id="Excel">
						<i class=" icon-2x fas fa-file-excel" style="color: #4A7DFF"></i>
					</button>
				</div>
		<div class=" table-responsive" id="card_Report">
			<font size="+3"><u><center>Yearly Profit And Loss Statement</center></u></font> <br />
			<div class="  " >
			<font size="+2"><u><center>Date Range: <span class=" " id="finish"></span> To <span class=" " id="finish1"></span></center></u></font></div><br />
			
			
				
				
				
						
			<table class="table "  style="border: 1px solid black; ">
				


					<thead>
					<col>
					<colgroup span="4"></colgroup>
					<colgroup span="4"></colgroup>
					<tr>
						<td rowspan="1" style="text-align: center; border-bottom: 1px solid black;"></td>
						<th colspan="7" scope="colgroup" style="text-align: center; border-bottom: 1px solid black;">Sales</th>
						<th colspan="7" scope="colgroup" style="text-align: center; border-bottom: 1px solid black;">Expense</th>
					</tr>
					<tr >
						<th style="text-align: center; border-bottom: 1px solid black; border: 1px solid black"
							scope="col">Month</th>
						<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Sales Inv. Amt</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Cash</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Net B.</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Upi</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Cheque</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Card</th>
						<th
							style="text-align: center;border: 1px solid black"
							scope="col">Credit</th>
						
						<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Pur. Inv. Amt</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Cash</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">NB</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">UPI</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Cheque</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col">Card</th>
						<th
							style="text-align: center; border: 1px solid black"
							scope="col">Credit</th>
					

					</tr>
					</thead>
					<tbody class="table_body text-center" style="font-size:16px; border-bottom: 1px solid black;">
				</tbody>
				<tfoot>
				<col>
					<colgroup span="7"></colgroup>
					<colgroup span="7"></colgroup>
					
					<tr>
						<td rowspan="1" style="text-align: center; border: 1px solid black;"></td>
						<tr >
						<th style="text-align: center; border-bottom: 1px solid black; border: 1px solid black"
							scope="col"> -- </th>
						<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col"  id="total_sales_amount">00.00</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col"  id="total_sales_cash"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col"  id="total_sales_nb"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col"  id="total_sales_upi"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col"  id="total_sales_cheque"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col"  id="total_sales_card"> - </th>
						<th
							style="text-align: center;border: 1px solid black"
							scope="col"  id="total_current_sales_amount">00.00</th>
							
							
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col" id="total_purchase_amount">00.00</th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col" id="total_purchase_cash"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col" id="total_purchase_nb"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col" id="total_purchase_upi"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col" id="total_purchase_cheque"> - </th>
							<th
							style="text-align: center; border-bottom: 1px solid black; border-top: 1px solid black;"
							scope="col" id="total_purchase_card"> - </th>
						<th
							style="text-align: center; border: 1px solid black"
							scope="col" id="total_current_purchase_amount">00.00</th></tr>
					<tr>
						<td rowspan="1" style="text-align: center; border: 1px solid black;"></td>
						<th colspan="14" scope="colgroup" style="text-align: center; border: 1px solid black;">Profit/Loss =<span class="ml-2" id="pnl"></</span></th>
					</tr>
					</tfoot>
				
				
				
			</table>
			
		
		</div>
	</div>
	</div>

<!--begin::Footer-->
				<div style=" position:fixed; bottom:0;   width:100%;" class="fixed">
				<jsp:include page="../common/footer.jsp"></jsp:include>
				</div>
				<!--end::Footer-->
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

	
	
	 var category_name = " ";
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		
        const  from_date = urlParams.get('from_date');
		const till_date = urlParams.get('till_date');
		 var today = new Date(from_date);
			
			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		 $('#finish').text(date);
		 var today = new Date(till_date);
			
			var date = today.getDate()+'-'+(today.getMonth()+1)+'-'+today.getFullYear();
		 $('#finish1').text(date);
	var sale_amount = 00;
	var sale_current_amount = 00;
	var sale_amount_cash = 00;
	var sale_amount_nb = 00;
	var sale_amount_upi = 00;
	var sale_amount_cheque = 00;
	var sale_amount_card = 00;
	var sale_amount_credit = 00;
	
	
	
	
	
	
	
	
	 

	
	const monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
		  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	
	
	 var html = '';
	for(var i = 1; i <= 12; i++){
	 	 
	 	         html += "<tr id= tr-id-2 class= tr-class-2>"
	 	       	 html += '<td id="date-' + i +'" style="border-right:1px solid black; border-left:1px solid black; height:30px"> '+ monthNames[i - 1]+' </td>';
		 	     html += '<td id="sale_amount-' + i +'"> - </td>';
		 	     html += '<td id="cash-' + i +'"> - </td>';
		 	     html += '<td id="net_bank-' + i +'"> - </td>';
		 	     html += '<td id="upi-' + i +'"> - </td>';
		 	     html += '<td id="cheque-' + i +'"> - </td>';
		 	     html += '<td id="card-' + i +'"> - </td>';
			 	 html += '<td id="credit-' + i +'" style="border-right:1px solid black"> - </td>';
                 html += '<td  id="purchase_amount-' + i +'"> - </td>';
                 html += '<td  id="purchase_cash-' + i +'"> - </td>';
                 html += '<td  id="purchase_nb-' + i +'"> - </td>';
                 html += '<td  id="purchase_upi-' + i +'"> - </td>';
                 html += '<td  id="purchase_cheque-' + i +'"> - </td>';
                 html += '<td  id="purchase_card-' + i +'"> - </td>';
                 html += '<td id="purchase_credit-' + i +'" style="border-right:1px solid black"> - </td>';
                 html += '</tr>';
		        $(".table_body").html(html);
}
	
	
	$.ajax({
		url : base + "/bakeshackAPI/api/getDailySaleOfYearDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			 "from_date" : from_date,
			    "till_date" : till_date
			},
		success:function(data)
	    {
			const row = data.find(d => d.paid_date != " ");
			data.forEach((row)=> {
				
					
				$('#date-'+row.paid_date).text(monthNames[row.paid_date - 1]);
				sale_amount += parseInt(row.invoice_amonut);
				sale_current_amount += parseInt(row.current_paid_amount);
				$('#sale_amount-'+row.paid_date).text(sale_amount.toFixed(2));
				if(row.payment_mode == 'cash')
				{
					$('#cash-'+row.paid_date).text(row.current_paid_amount);
					sale_amount_cash  += parseInt(row.current_paid_amount);
					
				}else if(row.payment_mode == 'nb')
				{
					$('#net_bank-'+row.paid_date).text(row.current_paid_amount);
					sale_amount_nb  += parseInt(row.current_paid_amount);
					
				}else if(row.payment_mode == 'upi')
				{
					$('#upi-'+row.paid_date).text(row.current_paid_amount);
					sale_amount_upi  += parseInt(row.current_paid_amount);
				}else if(row.payment_mode == 'credit')
				{
					
					$('#credit-'+row.paid_date).text(row.current_paid_amount);
					sale_amount_nb  += parseInt(row.current_paid_amount);
				}else if(row.payment_mode == 'card')
				{
					$('#card-'+row.paid_date).text(row.current_paid_amount);
					sale_amount_card  += parseInt(row.current_paid_amount);
				}else if(row.payment_mode == 'cheque')
				{
					$('#cheque-'+row.paid_date).text(row.current_paid_amount);
					sale_amount_cheque  += parseInt(row.current_paid_amount);
				}
				
				
			
				 $('#credit-'+row.paid_date).text((sale_amount - sale_current_amount).toFixed(2)); 
				
			});
			 
		}
	});	 
	$('#total_sales_amount').text(sale_amount.toFixed(2));
	$('#total_current_sales_amount').text((sale_amount - sale_current_amount).toFixed(2)); 
	$('#total_sales_cash').text(sale_amount_cash.toFixed(2));
	$('#total_sales_nb').text(sale_amount_nb.toFixed(2));
	$('#total_sales_upi').text(sale_amount_upi.toFixed(2));
	$('#total_sales_card').text(sale_amount_card.toFixed(2));
	$('#total_sales_cheque').text(sale_amount_cheque.toFixed(2));
	

	var expn_amount = 00;	
	var expn_current_amount = 00;
	var expn_amount_cash = 00;
	var expn_amount_nb = 00;
	var expn_amount_upi = 00;
	var expn_amount_cheque = 00;
	var expn_amount_card = 00;
	var expn_amount_credit = 00;
	
	
	
	
	
	
	
	$.ajax({
		url : base + "/bakeshackAPI/api/getDailyPurchaseOfYearDetails",
		type : "post",
		dataType : "json",
		async : false,
		data : {
			 "from_date" : from_date,
			    "till_date" : till_date
			},
		success:function(data)
	    {
			const row = data.find(d => d.paid_date != " ");
			data.forEach((row)=> {
				
				 	
				$('#date-'+row.paid_date).text(monthNames[row.paid_date - 1]);
				
				//$('#purchase_current_amt-'+row.paid_date).text(row.current_paid_amount);
				if(row.payment_mode == 'cash')
				{
					$('#purchase_cash-'+row.paid_date).text(row.current_paid_amount);
					expn_amount_cash  += parseInt(row.current_paid_amount);
				}else if(row.payment_mode == 'nb')
				{
					$('#purchase_nb-'+row.paid_date).text(row.current_paid_amount);
					expn_amount_nb  += parseInt(row.current_paid_amount);
				}else if(row.payment_mode == 'upi')
				{
					$('#purchase_upi-'+row.paid_date).text(row.current_paid_amount);
					expn_amount_upi  += parseInt(row.current_paid_amount);
				}else if(row.payment_mode == 'credit')
				{
					$('#purchase_credit-'+row.paid_date).text(row.current_paid_amount);
				}else if(row.payment_mode == 'card')
				{
					$('#purchase_card-'+row.paid_date).text(row.current_paid_amount);
					expn_amount_card  += parseInt(row.current_paid_amount);
				}else if(row.payment_mode == 'cheque')
				{
					$('#purchase_cheque-'+row.paid_date).text(row.current_paid_amount);
					expn_amount_cheque  += parseInt(row.current_paid_amount);
				}
				expn_amount += parseInt(row.invoice_amonut);
				$('#purchase_amount-'+row.paid_date).text(expn_amount.toFixed(2));
				 expn_current_amount += parseInt(row.current_paid_amount); 
				 $('#purchase_credit-'+row.paid_date).text((expn_amount - expn_current_amount).toFixed(2));

			
			});
			 
		}
	});	
	$('#total_purchase_amount').text(expn_amount.toFixed(2));
	$('#total_current_purchase_amount').text((expn_amount - expn_current_amount).toFixed(2));
	$('#pnl').text((sale_amount + expn_amount).toFixed(2));
	
	$('#total_purchase_cash').text(expn_amount_cash.toFixed(2));
	$('#total_purchase_nb').text(expn_amount_nb.toFixed(2));
	$('#total_purchase_upi').text(expn_amount_upi.toFixed(2));
	$('#total_purchase_card').text(expn_amount_card.toFixed(2));
	$('#total_purchase_cheque').text(expn_amount_cheque.toFixed(2));
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