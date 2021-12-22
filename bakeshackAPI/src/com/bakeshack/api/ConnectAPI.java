package com.bakeshack.api;

import javax.ws.rs.Path;

import java.sql.Date;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.json.JSONArray;
import org.json.JSONObject;

import com.customLog.*;

import com.fasterxml.jackson.core.JsonParser;

import jdk.nashorn.internal.parser.JSONParser;

@Path("/api")
public class ConnectAPI {

	@POST
	@Path("/insertUpdateCategory")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateCategory(@FormParam("category_name") String category_name,
			@FormParam("category_code") String category_code, @FormParam("inventory_flag") String inventory_flag,
			@FormParam("sale_flag") String sale_flag,
			@FormParam("purchase_flag") String purchase_flag, 
			@FormParam("category_id") int category_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("Category name in api : " + category_name);

			Logger.log("BAKESHACK", "Category name:: " + category_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateCategory(category_name, category_code, inventory_flag, sale_flag,purchase_flag, category_id,
					flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getCategoryDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCategoryDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getCategoryDetails");

			bean = new ConnectDataBean();
			beanData = bean.getCategoryDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// Subcategory master

	@POST
	@Path("/insertUpdateSubcategory")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateSubcategory(@FormParam("subcategory_name") String subcategory_name,
			@FormParam("category") int category, @FormParam("subcategory_id") int subcategory_id,
			@FormParam("flag") int flag) {

		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("subcategory_name : " + subcategory_name);

			Logger.log("BAKESHACK", "subcategory_name:: " + subcategory_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateSubcategory(subcategory_name, category, subcategory_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getSubcategoryDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getSubcategoryDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getSubcategoryDetails");

			bean = new ConnectDataBean();
			beanData = bean.getSubcategoryDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

//unit details

	@POST
	@Path("/insertUpdateUnit")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateUnit(@FormParam("unit_desc") String unit_desc, @FormParam("unit_code") String unit_code,
			@FormParam("unit_id") int unit_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("unit_desc in api : " + unit_desc);

			Logger.log("BAKESHACK", "Unit Desc:: " + unit_desc);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateUnit(unit_desc, unit_code, unit_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getUnitDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getUnitDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getUnitDetails");

			bean = new ConnectDataBean();
			beanData = bean.getUnitDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

//product master

	@POST
	@Path("/insertUpdateProduct")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateProduct(@FormParam("product_name") String product_name,
			@FormParam("product_code") String product_code, @FormParam("subcategory") String subcategory,
			@FormParam("product_desc") String product_desc, @FormParam("selling_price") String selling_price,
			@FormParam("unit") String unit, @FormParam("opening_quantity_main_unit") String opening_quantity_main_unit,
			@FormParam("opening_quantity_sub_unit") String opening_quantity_sub_unit,
			@FormParam("product_id") int product_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("product name in api : " + product_name);

			Logger.log("BAKESHACK", "Product name:: " + product_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateProduct(product_name, product_code, subcategory, product_desc, selling_price,
					unit, opening_quantity_main_unit, opening_quantity_sub_unit, product_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getProductDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getProductDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getProductDetails");

			bean = new ConnectDataBean();
			beanData = bean.getProductDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateQuantityDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateQuantityDetails(@FormParam("entry_date") String entry_date,
			@FormParam("expiry_date") String expiry_date, @FormParam("product_batch") String product_batch,
			@FormParam("product_name") String product_name, @FormParam("unit") String unit,
			@FormParam("price") String price, @FormParam("opening_quantity") String opening_quantity,
			@FormParam("purchase_quantity") String purchase_quantity,
			@FormParam("purchase_return_quantity") String purchase_return_quantity,
			@FormParam("used_quantity") String used_quantity, @FormParam("sale_quantity") String sale_quantity,
			@FormParam("sale_return_quantity") String sale_return_quantity,
			@FormParam("out_quantity") String out_quantity, @FormParam("produced_quantity") String produced_quantity,
			@FormParam("transaction_field") String transaction_field,
			@FormParam("quantity_master_id") int quantity_master_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + entry_date);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateQuantityDetails(entry_date, expiry_date, product_batch, product_name, unit,
					price, opening_quantity, purchase_quantity, purchase_return_quantity, used_quantity, sale_quantity,
					sale_return_quantity, out_quantity, produced_quantity, transaction_field, quantity_master_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// Recipe master

	@POST

	@Path("/insertUpdateRecipe")

	@Produces(MediaType.TEXT_PLAIN)

	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateRecipe(

			@FormParam("recipe_name") String recipe_name,

			@FormParam("recipe_code") String recipe_code,

			@FormParam("product") int product,

			@FormParam("product_req") String product_req,

			@FormParam("recipe_id") int recipe_id,

			@FormParam("flag") int flag) {

		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("recipe_name   : " + recipe_name);
			System.out.println("pcode   : " + product);

			Logger.log("BAKESHACK", "recipe_name:: " + recipe_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateRecipe(recipe_name, recipe_code, product, product_req, recipe_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getRecipeDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getRecipeDetails() {

		ConnectDataBean bean = null;
		String beanData = null;

		try {
			System.out.println("getRecipeDetails");

			bean = new ConnectDataBean();
			beanData = bean.getRecipeDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}

	// Bank Master

	@POST

	@Path("/insertUpdateBank")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateBank(@FormParam("bank_name") String bank_name,
			@FormParam("account_holder_name") String account_holder_name, @FormParam("account_no") String account_no,
			@FormParam("IFSC_code") String IFSC_code, @FormParam("branch") String branch,
			@FormParam("acc_type") String acc_type, @FormParam("opening_amount") String opening_amount,
			@FormParam("bank_id") int bank_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");
			bean = new ConnectDataBean();
			beanData = bean.insertUpdateBank(bank_name, account_holder_name, account_no, IFSC_code, branch, acc_type,
					opening_amount, bank_id, flag);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getBankDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getBankDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getBankDetails().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}

	// Upi master

	@POST
	@Path("/insertUpdateUpi")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateUpi(@FormParam("upi_name") String upi_name, @FormParam("upi_master_id") int upi_master_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("upi_name : " + upi_name);
			Logger.log("BAKESHACK", "upi_name:: " + upi_name);
			bean = new ConnectDataBean();
			beanData = bean.insertUpdateUpi(upi_name, upi_master_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getUpiDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getUpiDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getUpiDetails");
			bean = new ConnectDataBean();
			beanData = bean.getUpiDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// Role Master

	@POST
	@Path("/insertUpdateRole")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateRoleDetails(@FormParam("role_type") String role_type, @FormParam("role_id") int role_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");
			Logger.log("BAKESHACK", "Role:: " + role_type + "role_id" + role_id);
			bean = new ConnectDataBean();
			beanData = bean.insertUpdateRole(role_type, role_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);
			if (beanData > 0) {
			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}

	@POST
	@Path("/getRoleDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getRoleDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getRoleDetails");
			bean = new ConnectDataBean();
			beanData = bean.getRoleDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}

	// user master

	@POST
	@Path("/getUsersDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getUsersDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("I am here");

			bean = new ConnectDataBean();
			beanData = bean.getUsersDetails().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateUsersDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateUsersDetails(@FormParam("users_name") String users_name,
			@FormParam("login_id") String login_id, @FormParam("password") String password,
			@FormParam("birth_date") String birth_date, @FormParam("role_type") String role_type,
			@FormParam("address") String address, @FormParam("city_desc") String city_desc,
			@FormParam("district_desc") String district_desc, @FormParam("gender") String gender,
			@FormParam("mobile_no") String mobile_no, @FormParam("email_id") String email_id,
			@FormParam("gov_id") String gov_id, @FormParam("flag") int flag, @FormParam("users_id") int users_id) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");

			Logger.log("BAKESHACK", "users_name:: " + users_name);
			Logger.log("BAKESHACK", "password:: " + password);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateUsersDetails(users_name, login_id, password, birth_date, role_type, address,
					city_desc, district_desc, gender, mobile_no, email_id, gov_id, flag, users_id);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

// Production master

	@POST
	@Path("/insertUpdateProduction")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateProduction(@FormParam("product_name") int product_name,
			@FormParam("product_qty") int product_qty, @FormParam("product_date") String product_date,
			@FormParam("expiry_date") String expiry_date, @FormParam("product_req") String product_req,
			@FormParam("users_id") int users_id, @FormParam("production_id") int production_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("product_name   : " + product_name);
			Logger.log("BAKESHACK", "product_name:: " + product_name);
			bean = new ConnectDataBean();
			beanData = bean.insertUpdateProduction(product_name, product_qty, product_date, expiry_date, product_req,
					users_id, production_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);
			if (beanData > 0) {
			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getProductionDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getProductionDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getProductionDetails");

			bean = new ConnectDataBean();
			beanData = bean.getProductionDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getLatestProductionId")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getLatestProductionId() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getLatestProductionId().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getLatestOrder")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getLatestOrder() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getLatestOrder().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getProducedProductListBatchWise")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getProducedProductListBatchWise() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getProducedProductListBatchWise().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST

	@Path("/insertUpdateCustomer")

	@Produces(MediaType.TEXT_PLAIN)

	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateCustomer(

			@FormParam("customer_name") String customer_name,

			@FormParam("customer_code") int customer_code,

			@FormParam("mobile_no") String mobile_no,

			@FormParam("address") String address,

			@FormParam("customer_master_id") int customer_master_id,

			@FormParam("flag") int flag) {

		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("customer_name   : " + customer_name);

			Logger.log("BAKESHACK", "customer_name:: " + customer_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateCustomer(customer_name, customer_code, mobile_no, address, customer_master_id,
					flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST

	@Path("/getCustomerDetails")

	@Produces(MediaType.TEXT_PLAIN)

	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCustomerDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getCustomerDetails");

			bean = new ConnectDataBean();
			beanData = bean.getCustomerDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// insert update sales and Order code

	@POST
	@Path("/insertUpdateSalesAndOrderDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePaymentDetails(@FormParam("customer_code") int customer_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("delivery_date") String delivery_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("received_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("transaction_code") String transaction_code,
			@FormParam("invoice_code") int invoice_code,
			@FormParam("credit_period") int credit_period, 
			@FormParam("sales_and_order_id") int sales_and_order_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateSalesAndOrderDetails(customer_code, delivery_address, order_date, delivery_date,
					order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no, transaction_code, invoice_code,credit_period,
					sales_and_order_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST

	@Path("/getLatestInvoice")

	@Produces(MediaType.TEXT_PLAIN)

	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getLatestInvoice() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getLatestInvoice().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateInvoice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateInvoice(@FormParam("customer_code") int customer_code,
			@FormParam("order_code") String order_code, @FormParam("invoice_date") String invoice_date,
			@FormParam("paid_date") String paid_date, @FormParam("invoice_amonut") String invoice_amonut,
			@FormParam("to_be_paid") String to_be_paid, @FormParam("paid_amount") String paid_amount,
			@FormParam("current_paid_amount") String current_paid_amount, @FormParam("balance_amt") String balance_amt,
			@FormParam("field") String field, @FormParam("payment_mode") String payment_mode,
			@FormParam("vendors_code") int vendors_code, @FormParam("invoice_code") String invoice_code,
			@FormParam("transaction_code") String transaction_code,
			@FormParam("advance_paid") String advance_paid,@FormParam("flag") int flag) {

		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("upi_name : " + invoice_code);

			Logger.log("BAKESHACK", "upi_name:: " + invoice_code);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateInvoice(customer_code, order_code, invoice_date, paid_date, invoice_amonut,
					to_be_paid, paid_amount, current_paid_amount, balance_amt, field, payment_mode, vendors_code,
					invoice_code, transaction_code,advance_paid, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;

	}

	// getting sales and order data

	@POST
	@Path("/getSalesAndOrderDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getSalesAndOrderDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getSalesAndOrderDetails");

			bean = new ConnectDataBean();
			beanData = bean.getSalesAndOrderDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// update data of sales and order data

	@POST
	@Path("/updateSalesAndOrderDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int updatePaymentDetails(@FormParam("customer_code") int customer_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("delivery_date") String delivery_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("received_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("invoice_code") int invoice_code,
			@FormParam("sales_and_order_id") int sales_and_order_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.updateSalesAndOrderDetails(customer_code, delivery_address, order_date, delivery_date,
					order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no, invoice_code, sales_and_order_id,
					flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// insert data into sales and return master

	@POST
	@Path("/insertUpdateSalesAndReturnDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateSalesAndReturnDetails(@FormParam("customer_code") int customer_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("return_date") String return_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("given_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("invoice_code") int invoice_code,
			@FormParam("sales_and_return_id") int sales_and_return_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateSalesAndReturnDetails(customer_code, delivery_address, order_date, return_date,
					order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no, invoice_code, sales_and_return_id,
					flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getLatestSalesReturnInvoice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getLatestSalesReturnInvoice() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getLatestSalesReturnInvoice().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// retrive data from sales and return master

	@POST
	@Path("/getSalesAndReturnDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getSalesAndReturnDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getSalesAndReturnDetails");

			bean = new ConnectDataBean();
			beanData = bean.getSalesAndReturnDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// vendors Details

	@POST
	@Path("/insertUpdateVendors")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateVendors(@FormParam("vendors_name") String vendors_name,
			@FormParam("vendors_code") int vendors_code, @FormParam("mobile_no") String mobile_no,
			@FormParam("address") String address, @FormParam("vendors_master_id") int vendors_master_id,
			@FormParam("flag") int flag) {

		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("customer_name   : " + vendors_name);
			Logger.log("BAKESHACK", "customer_name:: " + vendors_name);
			bean = new ConnectDataBean();
			beanData = bean.insertUpdateVendors(vendors_name, vendors_code, mobile_no, address, vendors_master_id,
					flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getVendorsDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getVendorsDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getVendorsDetails");
			bean = new ConnectDataBean();
			beanData = bean.getVendorsDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// insert data into purchase master

	@POST
	@Path("/insertUpdatePurchaseDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePurchaseDetails(@FormParam("vendors_code") int vendors_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("delivery_date") String delivery_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("given_bank") String received_bank,
			@FormParam("account_no") String account_no,
			@FormParam("delivery_charges") String delivery_charges,
			@FormParam("invoice_code") int invoice_code,
			@FormParam("credit_period") int credit_period,
			@FormParam("purchase_id") int purchase_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatePurchaseDetails(vendors_code, delivery_address, order_date, delivery_date,
					order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no,delivery_charges, invoice_code,credit_period, purchase_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getLatestPurchaseInvoice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getLatestPurchaseInvoice() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getLatestPurchaseInvoice().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// retrive purchase details

	@POST
	@Path("/getpurchaseDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getpurchaseDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getpurchaseDetails");

			bean = new ConnectDataBean();
			beanData = bean.getpurchaseDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// update data into purchase master

	@POST
	@Path("/updatePurchaseDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int updatePurchaseDetails(@FormParam("vendors_code") int vendors_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("delivery_date") String delivery_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("given_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("invoice_code") int invoice_code,
			@FormParam("purchase_id") int purchase_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.updatePurchaseDetails(vendors_code, delivery_address, order_date, delivery_date, order_code,
					product_list, amount, discount, payment_mode, upi_name, total_amount, partial_paid_amount,
					balance_amount, received_bank, account_no, invoice_code, purchase_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// insert data into Purchase return master

	@POST
	@Path("/insertUpdatePurchaseReturnDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePurchaseReturnDetails(@FormParam("vendors_code") int vendors_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("return_date") String return_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("given_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("invoice_code") int invoice_code,
			@FormParam("purchase_return_id") int purchase_return_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatePurchaseReturnDetails(vendors_code, delivery_address, order_date, return_date,
					order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no, invoice_code, purchase_return_id,
					flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// retrive data from purchase return master

	@POST
	@Path("/getPurchaseAndReturnDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPurchaseAndReturnDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getPurchaseAndReturnDetails");

			bean = new ConnectDataBean();
			beanData = bean.getPurchaseAndReturnDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getLatestPurchaseReturnInvoice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getLatestPurchaseReturnInvoice() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getLatestPurchaseReturnInvoice().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// Expiry_good master

	@POST
	@Path("/insertUpdateExpiryGood")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateExpiryGood(@FormParam("product_name") String product_name,
			@FormParam("product_qty") int product_qty, @FormParam("price") String price,
			@FormParam("resion") String resion, @FormParam("product_date") String product_date,
			@FormParam("expiry_date") String expiry_date, @FormParam("expiry_good_id") int expiry_good_id,
			@FormParam("flag") int flag) {

		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("product_name   : " + product_name);

			Logger.log("BAKESHACK", "product_name:: " + product_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateExpiryGood(product_name, product_qty, price, resion, product_date, expiry_date,
					expiry_good_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getExpiryGoodDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getExpiryGoodDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getExpiry_goodDetails");

			bean = new ConnectDataBean();
			beanData = bean.getExpiryGoodDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getCustomerOutstandingForDashboard")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCustomerOutstandingForDashboard() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getCustomerOutstandingForDashboard().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getVendorsOutstandingForDashboard")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getVendorsOutstandingForDashboard() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getVendorsOutstandingForDashboard().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getOrderDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getOrderDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getOrderDetails");

			bean = new ConnectDataBean();
			beanData = bean.getOrderDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);
			// System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getCustomerCount")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCustomerCount() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getCustomerCount");

			bean = new ConnectDataBean();
			beanData = bean.getCustomerCount().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);
			// System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getTop5ProductDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getTop5ProductDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getTop5ProductDetails");

			bean = new ConnectDataBean();
			beanData = bean.getTop5ProductDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData); // System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getTodaysFootfallCount")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getTodaysFootfallCount() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getTodaysFootfallCount");

			bean = new ConnectDataBean();
			beanData = bean.getTodaysFootfallCount().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData); // System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getSubcategoryCountDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getSubcategoryCountDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getSubcategoryCountDetails");

			bean = new ConnectDataBean();
			beanData = bean.getSubcategoryCountDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData); // System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMonthWiseSaleReportForGraph")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMonthWiseSaleReportForGraph() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getMonthWiseSaleReportForGraph");

			bean = new ConnectDataBean();
			beanData = bean.getMonthWiseSaleReportForGraph().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData); // System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMonthWisePurchaseReportForGraph")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMonthWisePurchaseReportForGraph() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getMonthWisePurchaseReportForGraph");

			bean = new ConnectDataBean();
			beanData = bean.getMonthWisePurchaseReportForGraph().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData); // System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getWeekWiseSaleReportForGraph")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getWeekWiseSaleReportForGraph() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getWeekWiseSaleReportForGraph");

			bean = new ConnectDataBean();
			beanData = bean.getWeekWiseSaleReportForGraph().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData); // System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getWeekWisePurchaseReportForGraph")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getWeekWisePurchaseReportForGraph() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getWeekWisePurchaseReportForGraph");

			bean = new ConnectDataBean();
			beanData = bean.getWeekWisePurchaseReportForGraph().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData); // System.out.println(beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// Report
	@POST
	@Path("/getFinishGoodProductReportDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getFinishGoodProductReportDetails(@FormParam("product_name") String product_name,
			@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println(product_name);

			bean = new ConnectDataBean();
			beanData = bean.getFinishGoodProductReportDetails(product_name, from_date, till_date).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Customer Wise Report

	@POST
	@Path("/getCustomerWiseReportDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCustomerWiseReportDetails(@FormParam("customer_name") String customer_name,
			@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println(customer_name);

			bean = new ConnectDataBean();
			beanData = bean.getCustomerWiseReportDetails(customer_name, from_date, till_date).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Product wise sale report

	@POST
	@Path("/getSaleProductReportDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getSaleProductReportDetails(@FormParam("product_name") String product_name,
			@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println(product_name);

			bean = new ConnectDataBean();
			beanData = bean.getSaleProductReportDetails(product_name, from_date, till_date).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Product wise Purchase report

	@POST
	@Path("/getPurchaseProductReportDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPurchaseProductReportDetails(@FormParam("product_name") String product_name,
			@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println(product_name);

			bean = new ConnectDataBean();
			beanData = bean.getPurchaseProductReportDetails(product_name, from_date, till_date).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// sale product category wise report

	@POST
	@Path("/getSaleProductCategoryReportDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getSaleProductCategoryReportDetails(@FormParam("category_name") String category_name,
			@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println(category_name);

			bean = new ConnectDataBean();
			beanData = bean.getSaleProductCategoryReportDetails(category_name, from_date, till_date).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Purchase product category wise report

	@POST
	@Path("/getPurchaseProductCategoryReportDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPurchaseProductCategoryReportDetails(@FormParam("category_name") String category_name,
			@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("api" + category_name);

			bean = new ConnectDataBean();
			beanData = bean.getPurchaseProductCategoryReportDetails(category_name, from_date, till_date).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMontProductDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMontProductDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("Product_name");

			bean = new ConnectDataBean();
			beanData = bean.getMontProductDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMontSubcategoryDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMontSubcategoryDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("product_name");

			bean = new ConnectDataBean();
			beanData = bean.getMontSubcategoryDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}
//In Out Laser Report

	@POST
	@Path("/getInOutProductReportDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getInOutProductReportDetails(@FormParam("product_name") String product_name,
			@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("api" + product_name);

			bean = new ConnectDataBean();
			beanData = bean.getInOutProductReportDetails(product_name, from_date, till_date).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// insert update Order data

	@POST
	@Path("/insertUpdateOrderBookingDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateOrderBookingDetails(@FormParam("customer_code") int customer_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("delivery_date") String delivery_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("received_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("transaction_code") String transaction_code,
			@FormParam("cancelation_date") String cancelation_date, @FormParam("status") int status, @FormParam("credit_period") int credit_period,
			@FormParam("order_id") int order_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateOrderBookingDetails(customer_code, delivery_address, order_date, delivery_date,
					order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no, transaction_code, cancelation_date,
					status,credit_period, order_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getOrderInvoiceTransactionCode")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getOrderInvoiceTransactionCode() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getOrderInvoiceTransactionCode().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getOrderMasterDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getOrderMasterDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getOrderMasterDetails().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// insert update sales and Order code

	@POST
	@Path("/insertUpdateSalesAndOrderDetailsFromDelivery")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateSalesAndOrderDetailsFromDelivery(@FormParam("customer_code") int customer_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("delivery_date") String delivery_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("received_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("transaction_code") String transaction_code,
			@FormParam("invoice_code") String invoice_code,
			@FormParam("advance_paid") String advance_paid,
			@FormParam("delivery_charges") String delivery_charges,
			@FormParam("credit_period") int credit_period,
			@FormParam("sales_and_order_id") int sales_and_order_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateSalesAndOrderDetailsFromDelivery(customer_code, delivery_address, order_date,
					delivery_date, order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no, transaction_code, invoice_code,advance_paid,
					delivery_charges,credit_period,sales_and_order_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// insert update Order data

	@POST
	@Path("/insertUpdatePurchaseOrderMasterDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePurchaseOrderMasterDetails(@FormParam("vendors_code") int vendors_code,
			@FormParam("delivery_address") String delivery_address, @FormParam("order_date") String order_date,
			@FormParam("delivery_date") String delivery_date, @FormParam("order_code") String order_code,
			@FormParam("product_list") String product_list, @FormParam("amount") String amount,
			@FormParam("discount") String discount, @FormParam("payment_mode") String payment_mode,
			@FormParam("upi_name") String upi_name, @FormParam("total_amount") String total_amount,
			@FormParam("partial_paid_amount") String partial_paid_amount,
			@FormParam("balance_amount") String balance_amount, @FormParam("received_bank") String received_bank,
			@FormParam("account_no") String account_no, @FormParam("transaction_code") String transaction_code,
			@FormParam("cancelation_date") String cancelation_date,
			@FormParam("advance_paid") String advance_paid,
			@FormParam("status") String status,
			@FormParam("invoice_code") int invoice_code,
			@FormParam("purchase_order_id") int purchase_order_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAKESHACK", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatePurchaseOrderMasterDetails(vendors_code, delivery_address, order_date,
					delivery_date, order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
					partial_paid_amount, balance_amount, received_bank, account_no, transaction_code, cancelation_date,advance_paid,
					status,invoice_code, purchase_order_id, flag);
			Logger.log("BAKESHACK", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getLatestPurchaseOrderMasterInvoice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getLatestPurchaseOrderMasterInvoice() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getLatestPurchaseOrderMasterInvoice().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getpurchaseorderDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getpurchaseorderDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getpurchaseorderDetails");

			bean = new ConnectDataBean();
			beanData = bean.getpurchaseorderDetails().toString();
			Logger.log("BAKESHACK", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	// Fund_transfer Master

	@POST
	@Path("/insertUpdatefundTransferMaster")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatefundTransferMaster(@FormParam("sender_payment_mode") String sender_payment_mode,
			@FormParam("sender_upi_name") String sender_upi_name,
			@FormParam("sender_select_bank") String sender_select_bank,
			@FormParam("sender_current_amount") String sender_current_amount,
			@FormParam("sender_bank_name") String sender_bank_name, @FormParam("sender_acc_no") String sender_acc_no,
			@FormParam("sender_ifsc_code") String sender_ifsc_code,
			@FormParam("sender_acc_holder_name") String sender_acc_holder_name,
			@FormParam("receiver_payment_mode") String receiver_payment_mode,
			@FormParam("receiver_upi_name") String receiver_upi_name,
			@FormParam("receiver_select_bank") String receiver_select_bank,
			@FormParam("receiver_current_amount") String receiver_current_amount,
			@FormParam("receiver_bank_name") String receiver_bank_name,
			@FormParam("receiver_acc_no") String receiver_acc_no,
			@FormParam("receiver_ifsc_code") String receiver_ifsc_code,
			@FormParam("receiver_acc_holder_name") String receiver_acc_holder_name, @FormParam("amount") String amount,
			@FormParam("fund_transfer_id") int fund_transfer_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatefundTransferMaster(sender_payment_mode, sender_upi_name, sender_select_bank,
					sender_current_amount, sender_bank_name, sender_acc_no, sender_ifsc_code, sender_acc_holder_name,
					receiver_payment_mode, receiver_upi_name, receiver_select_bank, receiver_current_amount,
					receiver_bank_name, receiver_acc_no, receiver_ifsc_code, receiver_acc_holder_name, amount,
					fund_transfer_id, flag);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}

		return beanData;
	}

	@POST
	@Path("/getFundTransferDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getFundTransferDetails() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			bean = new ConnectDataBean();
			beanData = bean.getFundTransferDetails().toString();
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}

	
	@POST
	@Path("/getTodaysCustomerCollection")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getTodaysCustomerCollection() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			bean = new ConnectDataBean();
			beanData = bean.getTodaysCustomerCollection().toString();
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}
	
	@POST
	@Path("/getTodaysVendorsCollection")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getTodaysVendorsCollection() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			bean = new ConnectDataBean();
			beanData = bean.getTodaysVendorsCollection().toString();
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}
	
	@POST
	@Path("/getTodaysCashInHand")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getTodaysCashInHand() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			bean = new ConnectDataBean();
			beanData = bean.getTodaysCashInHand().toString();
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}
	
	@POST
	@Path("/getTotalCashInHand")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getTotalCashInHand() {
		ConnectDataBean bean = null;
		String beanData = null;
		try {
			bean = new ConnectDataBean();
			beanData = bean.getTotalCashInHand().toString();
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAKESHACK", e);
		}
		return beanData;
	}
	
	// Customer Transaction Report

		@POST
		@Path("/getCustomerTransactionDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String getCustomerTransactionDetails(@FormParam("customer_name") String customer_name) {
			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println(customer_name);

				bean = new ConnectDataBean();
				beanData = bean.getCustomerTransactionDetails(customer_name).toString();
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
	
	
		// Vendors Transaction Report

				@POST
				@Path("/getVendorsTransactionDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getVendorsTransactionDetails(@FormParam("vendors_name") String vendors_name) {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println(vendors_name);

						bean = new ConnectDataBean();
						beanData = bean.getVendorsTransactionDetails(vendors_name).toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
				
				
				// Product Transaction Report

				@POST
				@Path("/getProductTransactionDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getProductTransactionDetails(@FormParam("product_name") String product_name) {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println(product_name);

						bean = new ConnectDataBean();
						beanData = bean.getProductTransactionDetails(product_name).toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
			
				// Product Transaction Report

				@POST
				@Path("/getPurchaseProductDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getPurchaseProductDetails() {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println();

						bean = new ConnectDataBean();
						beanData = bean.getPurchaseProductDetails().toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
			
				// Product Transaction Report

				@POST
				@Path("/getSaleableProductDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getSaleableProductDetails() {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						//System.out.println(product_name);

						bean = new ConnectDataBean();
						beanData = bean.getSaleableProductDetails().toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
			
				@POST
				@Path("/getInvoiceCode")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getInvoiceCode() {

					ConnectDataBean bean = null;
					String beanData = null;
					try {

						bean = new ConnectDataBean();
						beanData = bean.getInvoiceCode().toString();

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAKESHACK", e);
					}

					return beanData;
				}
	
				
				
				@POST
				@Path("/getPaymentModeWiseTotal")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getPaymentModeWiseTotal() {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						bean = new ConnectDataBean();
						beanData = bean.getPaymentModeWiseTotal().toString();
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAKESHACK", e);
					}
					return beanData;
				}
	
				
				
				@POST
				@Path("/getCustomerOustandingForReport")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getCustomerOustandingForReport() {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						bean = new ConnectDataBean();
						beanData = bean.getCustomerOustandingForReport().toString();
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAKESHACK", e);
					}
					return beanData;
				}
					
				@POST
				@Path("/getVendorsOustandingForReport")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getVendorsOustandingForReport() {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						bean = new ConnectDataBean();
						beanData = bean.getVendorsOustandingForReport().toString();
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAKESHACK", e);
					}
					return beanData;
				}
						
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				/*
	 * 
	 * 
	 * 
	 * 
	 * 
	 * //Recipe master
	 * 
	 * @POST
	 * 
	 * @Path("/insertUpdateRecipe")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public int
	 * insertUpdateRecipe(
	 * 
	 * @FormParam("recipe_name") String recipe_name,
	 * 
	 * @FormParam("recipe_code") String recipe_code,
	 * 
	 * @FormParam("product") int product,
	 * 
	 * @FormParam("product_req") String product_req,
	 * 
	 * @FormParam("recipe_id") int recipe_id,
	 * 
	 * @FormParam("flag") int flag) {
	 * 
	 * ConnectDataBean bean = null; int beanData = 0; try {
	 * System.out.println("recipe_name   : " + recipe_name);
	 * System.out.println("pcode   : " + product);
	 * 
	 * 
	 * Logger.log("BAKESHACK", "recipe_name:: " + recipe_name);
	 * 
	 * bean = new ConnectDataBean(); beanData = bean.insertUpdateRecipe(recipe_name,
	 * recipe_code ,product ,product_req, recipe_id, flag); Logger.log("BAKESHACK",
	 * "beandata:: " + beanData);
	 * 
	 * if (beanData > 0) {
	 * 
	 * } } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e);
	 * }
	 * 
	 * return beanData; }
	 * 
	 * @POST
	 * 
	 * @Path("/getRecipeDetails")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String
	 * getRecipeDetails() {
	 * 
	 * ConnectDataBean bean = null; String beanData = null; try {
	 * System.out.println("getRecipeDetails");
	 * 
	 * bean = new ConnectDataBean(); beanData = bean.getRecipeDetails().toString();
	 * Logger.log("BAKESHACK", "beandata:: " + beanData);
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e); }
	 * 
	 * return beanData; } //customer masterd
	 * 
	 *
	 * 
	 *
	 * 
	 * 
	 * 
	 * @POST
	 * 
	 * @Path("/getOrderCode")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String getOrderCode()
	 * {
	 * 
	 * ConnectDataBean bean = null; String beanData = null; try {
	 * System.out.println("getOrderCode");
	 * 
	 * bean = new ConnectDataBean(); beanData = bean.getOrderCode().toString();
	 * Logger.log("BAKESHACK", "beandata:: " + beanData);
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e); }
	 * 
	 * return beanData; }
	 * 
	 * 
	 * //Recipe master
	 * 
	 * @POST
	 * 
	 * @Path("/insertUpdateOrderedProduct")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public int
	 * insertUpdateOrderedProduct(
	 * 
	 * @FormParam("ordered_product") String ordered_product,
	 * 
	 * @FormParam("ordered_product_id") int ordered_product_id,
	 * 
	 * @FormParam("flag") int flag) {
	 * 
	 * ConnectDataBean bean = null; int beanData = 0; try {
	 * System.out.println("ordered_product   : " + ordered_product);
	 * //System.out.println("pcode   : " + product);
	 * 
	 * 
	 * Logger.log("BAKESHACK", "ordered_product:: " + ordered_product);
	 * 
	 * bean = new ConnectDataBean(); beanData =
	 * bean.insertUpdateOrderedProduct(ordered_product, ordered_product_id, flag);
	 * Logger.log("BAKESHACK", "beandata:: " + beanData);
	 * 
	 * if (beanData > 0) {
	 * 
	 * } } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e);
	 * }
	 * 
	 * return beanData; }
	 * 
	 * @POST
	 * 
	 * @Path("/getOrderedProductDetails")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String
	 * getOrderedProductDetails() {
	 * 
	 * ConnectDataBean bean = null; String beanData = null; try {
	 * System.out.println("getOrderProductDetails");
	 * 
	 * bean = new ConnectDataBean(); beanData =
	 * bean.getOrderedProductDetails().toString(); Logger.log("BAKESHACK",
	 * "beandata:: " + beanData);
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e); }
	 * 
	 * return beanData; }
	 * 
	 * 
	 * 
	 * // Bank Master
	 * 
	 * @POST
	 * 
	 * @Path("/insertUpdateBank")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public int insertUpdateBank(
	 * 
	 * @FormParam("bank_name") String bank_name,
	 * 
	 * @FormParam("account_holder_name") String account_holder_name,
	 * 
	 * @FormParam("account_no") String account_no,
	 * 
	 * @FormParam("IFSC_code") String IFSC_code,
	 * 
	 * @FormParam("branch") String branch,
	 * 
	 * @FormParam("acc_type") String acc_type,
	 * 
	 * @FormParam("opening_amount") String opening_amount,
	 * 
	 * @FormParam("bank_id") int bank_id,
	 * 
	 * @FormParam("flag") int flag) { ConnectDataBean bean = null; int beanData = 0;
	 * try { System.out.println("I am here");
	 * 
	 * 
	 * 
	 * bean = new ConnectDataBean(); beanData =
	 * bean.insertUpdateBank(bank_name,account_holder_name,account_no,IFSC_code,
	 * branch, acc_type,opening_amount,bank_id,flag);
	 * 
	 * 
	 * if (beanData > 0) {
	 * 
	 * } } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e);
	 * }
	 * 
	 * return beanData; }
	 * 
	 * 
	 * @POST
	 * 
	 * @Path("/getBankDetails")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String
	 * getBankDetails() {
	 * 
	 * ConnectDataBean bean = null; String beanData = null; try {
	 * 
	 * 
	 * bean = new ConnectDataBean(); beanData = bean.getBankDetails().toString();
	 * 
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e); }
	 * 
	 * return beanData; }
	 * 
	 * //generate Invoice code
	 * 
	 * @POST
	 * 
	 * @Path("/getInvoiceId")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String getInvoiceId()
	 * {
	 * 
	 * ConnectDataBean bean = null; String beanData = null; try {
	 * 
	 * 
	 * bean = new ConnectDataBean(); beanData = bean.getInvoiceId().toString();
	 * Logger.log("BAKESHACK", "beandata:: " + beanData);
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e); }
	 * 
	 * return beanData; }
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * @POST
	 * 
	 * @Path("/getInvoiceDetails1")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String
	 * getInvoiceDetails1() {
	 * 
	 * ConnectDataBean bean = null; String beanData = null; try {
	 * System.out.println("getInvoiceDetails");
	 * 
	 * bean = new ConnectDataBean(); beanData =
	 * bean.getInvoiceDetails1().toString(); Logger.log("BAKESHACK", "beandata:: " +
	 * beanData);
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAKESHACK", e); }
	 * 
	 * return beanData; }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 *
	 * 
	 *
	 * 
	 * //Purchase product category wise report
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 * //Finish Good Product report
	 * 
	 *
	 * 
	 * 
	 * 
	 * 
	 * ///generated invoice
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 * @POST
	 * 
	 * @Path("/getMontSubcategoryDetails")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String
	 * getMontSubcategoryDetails() { ConnectDataBean bean = null; String beanData =
	 * null; try { System.out.println(product_name);
	 * 
	 * bean = new ConnectDataBean(); beanData =
	 * bean.getMontSubcategoryDetails().toString(); Logger.log("BAFNA",
	 * "beandata:: " + beanData);
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAFNA", e); }
	 * 
	 * return beanData; }
	 * 
	 * 
	 * 
	 * 
	 * 
	 * @POST
	 * 
	 * @Path("/getUpcomingOrderDetails")
	 * 
	 * @Produces(MediaType.TEXT_PLAIN)
	 * 
	 * @Consumes(MediaType.APPLICATION_FORM_URLENCODED) public String
	 * getUpcomingOrderDetails() { ConnectDataBean bean = null; String beanData =
	 * null; try { System.out.println(product_name);
	 * 
	 * bean = new ConnectDataBean(); beanData =
	 * bean.getUpcomingOrderDetails().toString(); Logger.log("BAFNA", "beandata:: "
	 * + beanData);
	 * 
	 * } catch (Exception e) { System.out.println(e); Logger.log("BAFNA", e); }
	 * 
	 * return beanData; }
	 * 
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 *
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 *
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 * 
	 */
}
