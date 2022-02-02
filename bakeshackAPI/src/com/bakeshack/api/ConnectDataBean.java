package com.bakeshack.api;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;

import org.json.JSONArray;
import org.json.JSONObject;

import com.config.ConnectionFactory;
import com.customLog.Logger;

public class ConnectDataBean {

	private ConnectionFactory cf = null;
	String dbConnVar = "BAKESHACK";

	public ConnectDataBean() {
		cf = new ConnectionFactory(dbConnVar);
	}

	// Category master

	public int insertUpdateCategory(String category_name, String category_code, String inventory_flag, String sale_flag,String purchase_flag,
			int category_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("category name in bean : " + category_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_category(?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, category_name);
			cs.setString(3, category_code);
			cs.setString(4, inventory_flag);
			cs.setString(5, sale_flag);
			cs.setString(6, purchase_flag);
			cs.setInt(7, category_id);
			cs.setInt(8, flag);

			cs.execute();
			// rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getCategoryDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_category_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("category_id", rs.getString(1));
				resultjson.put("category_name", rs.getString(2));
				resultjson.put("category_code", rs.getString(3));
				resultjson.put("inventory_flag", rs.getString(4));
				resultjson.put("sale_flag", rs.getString(5));
				resultjson.put("purchase_flag", rs.getString(6));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Subcategory master

	public int insertUpdateSubcategory(String subcategory_name, int category, int subcategory_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_subcategory(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, subcategory_name);
			cs.setInt(3, category);
			cs.setInt(4, subcategory_id);
			cs.setInt(5, flag);

			cs.execute();
			// rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getSubcategoryDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_subcategory_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("subcategory_id", rs.getString(1));
				resultjson.put("subcategory_name", rs.getString(2));
				resultjson.put("category", rs.getString(3));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

//Unit master

	public int insertUpdateUnit(String unit_desc, String unit_code, int unit_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Unit desc in bean : " + unit_desc);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_unit(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, unit_desc);
			cs.setString(3, unit_code);
			cs.setInt(4, unit_id);
			cs.setInt(5, flag);

			cs.execute();
			// rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getUnitDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_unit_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("unit_id", rs.getString(1));
				resultjson.put("unit_desc", rs.getString(2));
				resultjson.put("unit_code", rs.getString(3));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

//Product Master

	public int insertUpdateProduct(String product_name, String product_code, String subcategory, String product_desc,
			String selling_price, String unit, String opening_quantity_main_unit, String opening_quantity_sub_unit,
			int product_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Product name in bean : " + product_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_product(?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, product_name);
			cs.setString(3, product_code);
			cs.setString(4, subcategory);
			cs.setString(5, product_desc);
			cs.setString(6, selling_price);
			cs.setString(7, unit);
			cs.setString(8, opening_quantity_main_unit);
			cs.setString(9, opening_quantity_sub_unit);
			cs.setInt(10, product_id);
			cs.setInt(11, flag);

			cs.execute();
			// rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getProductDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_product_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("product_id", rs.getString(1));
				resultjson.put("product_name", rs.getString(2));
				resultjson.put("product_code", rs.getString(3));
				resultjson.put("subcategory", rs.getString(4));
				resultjson.put("product_desc", rs.getString(5));
				resultjson.put("selling_price", rs.getString(6));
				resultjson.put("unit", rs.getString(7));
				resultjson.put("opening_quantity", rs.getString(8));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Insert Update product Quantity Master

	public int insertUpdateQuantityDetails(String entry_date, String expiry_date, String product_batch,
			String product_name, String unit, String price, String opening_quantity, String purchase_quantity,
			String purchase_return_quantity, String used_quantity, String sale_quantity, String sale_return_quantity,
			String out_quantity, String produced_quantity, String transaction_field, int quantity_master_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + entry_date);
			System.out.println("Payment Mode in bean " + product_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_product_quantity_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, entry_date);
			cs.setString(3, expiry_date);
			cs.setString(4, product_batch);
			cs.setString(5, product_name);
			cs.setString(6, unit);
			cs.setString(7, price);
			cs.setString(8, opening_quantity);
			cs.setString(9, purchase_quantity);
			cs.setString(10, purchase_return_quantity);
			cs.setString(11, used_quantity);
			cs.setString(12, sale_quantity);
			cs.setString(13, sale_return_quantity);
			cs.setString(14, out_quantity);
			cs.setString(15, produced_quantity);
			cs.setString(16, transaction_field);
			cs.setInt(17, quantity_master_id);
			cs.setInt(18, flag);

			cs.execute();
			// rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	// recipe master

	public int insertUpdateRecipe(String recipe_name, String recipe_code, int product, String product_req,
			int recipe_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_recipe(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, recipe_name);
			cs.setString(3, recipe_code);
			cs.setInt(4, product);
			cs.setString(5, product_req);
			cs.setInt(6, recipe_id);
			cs.setInt(7, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getRecipeDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();
			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_recipe_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);
			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("recipe_id", rs.getInt(1));
				resultjson.put("recipe_name", rs.getString(2));
				resultjson.put("recipe_code", rs.getString(3));
				resultjson.put("product", rs.getString(4));
				resultjson.put("product_req", rs.getString(5));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Bank Master

	public int insertUpdateBank(String bank_name, String account_holder_name, String account_no, String IFSC_code,
			String branch, String acc_type, String opening_amount, int bank_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_bank(?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, bank_name);
			cs.setString(3, account_holder_name);
			cs.setString(4, account_no);
			cs.setString(5, IFSC_code);
			cs.setString(6, branch);
			cs.setString(7, acc_type);
			cs.setString(8, opening_amount);
			cs.setInt(9, bank_id);
			cs.setInt(10, flag);
			cs.execute(); // rs = cs.getResultSet();
			result = cs.getInt(1);
		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}
		return result;
	}

	public JSONArray getBankDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_bank_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("bank_id", rs.getString(1));
				resultjson.put("bank_name", rs.getString(2));
				resultjson.put("account_holder_name", rs.getString(3));
				resultjson.put("account_no", rs.getString(4));
				resultjson.put("IFSC_code", rs.getString(5));
				resultjson.put("branch", rs.getString(6));
				resultjson.put("acc_type", rs.getString(7));
				resultjson.put("opening_amount", rs.getString(8));

				jarr.put(resultjson);
			}
			finaljson = new JSONObject();
			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

//Upi Master

	public int insertUpdateUpi(String upi_name, int upi_master_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_upi(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, upi_name);
			cs.setInt(3, upi_master_id);
			cs.setInt(4, flag);
			cs.execute(); // rs = cs.getResultSet();
			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}
		return result;
	}

	public JSONArray getUpiDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_upi(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);
			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("upi_master_id", rs.getString(1));
				resultjson.put("upi_name", rs.getString(2));
				jarr.put(resultjson);
			}
			finaljson = new JSONObject();
			finaljson.put("data", jarr);
		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

//Role master
		public int insertUpdateRole(String role_type , String role_permission, int role_id, int flag) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;
			int result = 0;
			try {
				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_crud_role(?,?,?,?)}");
				cs.registerOutParameter(1, Types.INTEGER);
				cs.setString(2, role_type);
				cs.setString(3, role_permission);
				cs.setInt(4, role_id);
				cs.setInt(5, flag);
				cs.execute();
				// rs = cs.getResultSet();
				result = cs.getInt(1);
			} catch (Exception e) {
				Logger.log(dbConnVar, e);
			} finally {
				try {
					if (con != null) {
						cf.freeConnection(con);
						con.close();
					}
					if (cs != null) {
						cs.close();
					}
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e1) {
					Logger.log(dbConnVar, e1);
				}
			}
			return result;
		}

		public JSONArray getRoleDetails() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
		
			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_role_details(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setObject(2, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					

					resultjson.put("role_id", rs.getInt(1));
					resultjson.put("role_type",  rs.getString(2));
					resultjson.put("role_permission", rs.getString(3));

					jarr.put(resultjson);
				}

				finaljson = new JSONObject();

				finaljson.put("data", jarr);

			} catch (Exception e) {
				Logger.log(dbConnVar, e);
			} finally {
				try {
					if (con != null) {
						con.close();
					}
					if (cs != null) {
						cs.close();
					}
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e1) {
					Logger.log(dbConnVar, e1);
				}
			}

			return jarr;
		}
		

//user Master

	public int insertUpdateUsersDetails(String users_name, String login_id, String password, String birth_date,
			String role_type, String address, String city_desc, String district_desc, String gender, String mobile_no,
			String email_id, String gov_id, String qualification, int flag, int users_id) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_users_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, users_name);
			cs.setString(3, login_id);
			cs.setString(4, password);
			cs.setString(5, birth_date);
			cs.setString(6, role_type);
			cs.setString(7, address);
			cs.setString(8, city_desc);
			cs.setString(9, district_desc);
			cs.setString(10, gender);
			cs.setString(11, mobile_no);
			cs.setString(12, email_id);
			cs.setString(13, gov_id);
			cs.setString(14, qualification);
			cs.setInt(15, flag);
			cs.setInt(16, users_id);
			cs.execute(); // rs = cs.getResultSet();
			result = cs.getInt(1);
		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getUsersDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		 
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_users_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();
				resultjson.put("users_id", rs.getInt(1));
				resultjson.put("login_id", rs.getString(2));
				resultjson.put("password", rs.getString(3));
				resultjson.put("users_name", rs.getString(4));
				resultjson.put("birth_date",  rs.getDate(5));
				resultjson.put("role_type",  rs.getString(6));
				resultjson.put("address",  rs.getString(7));
				resultjson.put("city_desc",  rs.getString(8));
				resultjson.put("district_desc", rs.getString(9));
				resultjson.put("gender",  rs.getString(10));
				resultjson.put("mobile_no",  rs.getString(11));
				resultjson.put("email_id",  rs.getString(12));
				resultjson.put("gov_id", rs.getString(13));
				resultjson.put("qualification", rs.getString(14));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

// Production master

	public int insertUpdateProduction(int product_name, int product_qty, String product_date, String expiry_date,
			String product_req, int users_id, int production_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_production(?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, product_name);
			cs.setInt(3, product_qty);
			cs.setString(4, product_date);
			cs.setString(5, expiry_date);
			cs.setString(6, product_req);
			cs.setInt(7, users_id);
			cs.setInt(8, production_id);
			cs.setInt(9, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getProductionDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_production_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("production_id", rs.getInt(1));
				resultjson.put("product_name", rs.getString(2));
				resultjson.put("product_qty", rs.getInt(3));
				resultjson.put("product_date", rs.getString(4));
				resultjson.put("expiry_date", rs.getString(5));
				resultjson.put("product_req", rs.getString(6));
				
				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getLatestProductionId() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_production_id(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("production_id", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getLatestOrder() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_order_id(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();
				resultjson.put("order_code", rs.getString(1));
				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getProducedProductListBatchWise() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_Produced_product_List_batch_wise(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("product_name", rs.getString(1));
				resultjson.put("product_id", rs.getString(2));
				resultjson.put("selling_price", rs.getString(3));
				resultjson.put("unit", rs.getString(4));
				resultjson.put("produced_quantity", rs.getString(5));
				resultjson.put("sale_quantity", rs.getString(6));
				resultjson.put("out_quantity", rs.getString(7));
				resultjson.put("balance_quantity", rs.getString(8));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

//customer master

	public int insertUpdateCustomer(String customer_name, int customer_code, String mobile_no, String address,
			int customer_master_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_customer_details(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, customer_name);
			cs.setInt(3, customer_code);
			cs.setString(4, mobile_no);
			cs.setString(5, address);
			cs.setInt(6, customer_master_id);
			cs.setInt(7, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getCustomerDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_customer_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("customer_master_id", rs.getInt(1));
				resultjson.put("customer_name", rs.getString(2));
				resultjson.put("customer_code", rs.getString(3));
				resultjson.put("mobile_no", rs.getString(4));
				resultjson.put("address", rs.getString(5));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Sales and Order insert and update

	public int insertUpdateSalesAndOrderDetails(int customer_code, String delivery_address, String order_date,
			String delivery_date, String order_code, String product_list, String amount, String discount,
			String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String received_bank, String account_no, String transaction_code, int invoice_code, int credit_period,
			int sales_and_order_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + customer_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_sales_and_order_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, customer_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, delivery_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, received_bank);
			cs.setString(16, account_no);
			cs.setString(17, transaction_code);
			cs.setInt(18, invoice_code);
			cs.setInt(19, credit_period);
			cs.setInt(20, sales_and_order_id);
			cs.setInt(21, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getLatestInvoice() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_sales_order_invoice_code_seq(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				
				resultjson.put("transaction_code", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public int insertUpdateInvoice(int customer_code, String order_code, String invoice_date, String paid_date,
			String invoice_amonut, String to_be_paid, String paid_amount, String current_paid_amount,
			String balance_amt, String field, String payment_mode, int vendors_code, String invoice_code,
			String transaction_code,String advance_paid, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("customer name in bean : " + customer_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_invoice_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, customer_code);
			cs.setString(3, order_code);
			cs.setString(4, invoice_date);
			cs.setString(5, paid_date);
			cs.setString(6, invoice_amonut);
			cs.setString(7, to_be_paid);
			cs.setString(8, paid_amount);
			cs.setString(9, current_paid_amount);
			cs.setString(10, balance_amt);
			cs.setString(11, field);
			cs.setString(12, payment_mode);
			cs.setInt(13, vendors_code);
			cs.setString(14, invoice_code);
			cs.setString(15, transaction_code);
			cs.setString(16, advance_paid);
			cs.setInt(17, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	// retrive Data from sales and order master

	public JSONArray getSalesAndOrderDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_sales_and_order_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("sales_and_order_id", rs.getString(1));
				resultjson.put("customer_code", rs.getString(2));
				resultjson.put("delivery_address", rs.getString(3));
				resultjson.put("order_date", rs.getString(4));
				resultjson.put("delivery_date", rs.getString(5));
				resultjson.put("order_code", rs.getString(6));
				resultjson.put("product_list", rs.getString(7));
				resultjson.put("amount", rs.getString(8));
				resultjson.put("discount", rs.getString(9));
				resultjson.put("payment_mode", rs.getString(10));
				resultjson.put("upi_name", rs.getString(11));
				resultjson.put("total_amount", rs.getString(12));
				resultjson.put("partial_paid_amount", rs.getString(13));
				resultjson.put("balance_amount", rs.getString(14));
				resultjson.put("received_bank", rs.getString(15));
				resultjson.put("account_no", rs.getString(16));
				resultjson.put("invoice_code", rs.getString(17));
				resultjson.put("transaction_code", rs.getString(18));
				resultjson.put("delivery_charges", rs.getString(19));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// update the sales and order data

	public int updateSalesAndOrderDetails(int customer_code, String delivery_address, String order_date,
			String delivery_date, String order_code, String product_list, String amount, String discount,
			String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String received_bank, String account_no, int invoice_code, int sales_and_order_id,
			int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + customer_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_update_sales_and_order_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, customer_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, delivery_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, received_bank);
			cs.setString(16, account_no);
			cs.setInt(17, invoice_code);
			cs.setInt(18, sales_and_order_id);
			cs.setInt(19, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	// sales and return data insertion

	public int insertUpdateSalesAndReturnDetails(int customer_code, String delivery_address, String order_date,
			String return_date, String order_code, String product_list, String amount, String discount,
			String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String given_bank, String account_no, int invoice_code, int sales_and_return_id,
			int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + customer_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_insert_sales_and_return_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, customer_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, return_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, given_bank);
			cs.setString(16, account_no);
			cs.setInt(17, invoice_code);
			cs.setInt(18, sales_and_return_id);
			cs.setInt(19, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	// latest generated invoice

	public JSONArray getLatestSalesReturnInvoice() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_sales_return_invoice_code_seq(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("invoice_code", rs.getString(1));
				resultjson.put("transaction_code", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// retrive Data from sales and Return master

	public JSONArray getSalesAndReturnDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_sales_and_order_return_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("sales_and_return_id", rs.getString(1));
				resultjson.put("customer_code", rs.getString(2));
				resultjson.put("delivery_address", rs.getString(3));
				resultjson.put("order_date", rs.getString(4));
				resultjson.put("return_date", rs.getString(5));
				resultjson.put("order_code", rs.getString(6));
				resultjson.put("product_list", rs.getString(7));
				resultjson.put("amount", rs.getString(8));
				resultjson.put("discount", rs.getString(9));
				resultjson.put("payment_mode", rs.getString(10));
				resultjson.put("upi_name", rs.getString(11));
				resultjson.put("total_amount", rs.getString(12));
				resultjson.put("partial_paid_amount", rs.getString(13));
				resultjson.put("balance_amount", rs.getString(14));
				resultjson.put("given_bank", rs.getString(15));
				resultjson.put("account_no", rs.getString(16));
				resultjson.put("invoice_code", rs.getString(17));
				resultjson.put("transaction_code", rs.getString(17));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// vendors master

	public int insertUpdateVendors(String vendors_name, int vendors_code, String mobile_no, String address,
			int vendors_master_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_vendors_details(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, vendors_name);
			cs.setInt(3, vendors_code);
			cs.setString(4, mobile_no);
			cs.setString(5, address);
			cs.setInt(6, vendors_master_id);
			cs.setInt(7, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getVendorsDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_vendors_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("vendors_master_id", rs.getInt(1));
				resultjson.put("vendors_name", rs.getString(2));
				resultjson.put("vendors_code", rs.getString(3));
				resultjson.put("mobile_no", rs.getString(4));
				resultjson.put("address", rs.getString(5));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// insert update purchase master

	public int insertUpdatePurchaseDetails(int vendors_code, String delivery_address, String order_date,
			String delivery_date, String order_code, String product_list, String amount, String discount,
			String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String given_bank, String account_no,String delivery_charges, int invoice_code, int credit_period, int purchase_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + vendors_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_insert_purchase_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, vendors_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, delivery_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, given_bank);
			cs.setString(16, account_no);
			cs.setString(17, delivery_charges);
			cs.setInt(18, invoice_code);
			cs.setInt(19, credit_period);
			cs.setInt(20, purchase_id);
			cs.setInt(21, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getLatestPurchaseInvoice() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_purchase_invoice_code_seq(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("invoice_code", rs.getString(1));
				resultjson.put("transaction_code", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// getting Data from purchase Master

	public JSONArray getpurchaseDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_purchase_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("purchase_id", rs.getString(1));
				resultjson.put("vendors_code", rs.getString(2));
				resultjson.put("delivery_address", rs.getString(3));
				resultjson.put("odrer_date", rs.getString(4));
				resultjson.put("delivery_date", rs.getString(5));
				resultjson.put("order_code", rs.getString(6));
				resultjson.put("product_list", rs.getString(7));
				resultjson.put("amount", rs.getString(8));
				resultjson.put("discount", rs.getString(9));
				resultjson.put("payment_mode", rs.getString(10));
				resultjson.put("upi_name", rs.getString(11));
				resultjson.put("total_amount", rs.getString(12));
				resultjson.put("partial_paid_amount", rs.getString(13));
				resultjson.put("balance_amount", rs.getString(14));
				resultjson.put("received_bank", rs.getString(15));
				resultjson.put("account_no", rs.getString(16));
				resultjson.put("invoice_code", rs.getString(17));
				resultjson.put("transaction_code", rs.getString(18));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// update purchase details

	public int updatePurchaseDetails(int vendors_code, String delivery_address, String order_date, String delivery_date,
			String order_code, String product_list, String amount, String discount, String payment_mode,
			String upi_name, String total_amount, String partial_paid_amount, String balance_amount, String given_bank,
			String account_no, int invoice_code, int purchase_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + vendors_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_update_purchase_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, vendors_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, delivery_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, given_bank);
			cs.setString(16, account_no);
			cs.setInt(17, invoice_code);
			cs.setInt(18, purchase_id);
			cs.setInt(19, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	// purchase_return data entry

	public int insertUpdatePurchaseReturnDetails(int vendors_code, String delivery_address, String order_date,
			String return_date, String order_code, String product_list, String amount, String discount,
			String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String given_bank, String account_no, int invoice_code, int purchase_return_id,
			int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + purchase_return_id);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_insert_purchase_return_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, vendors_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, return_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, given_bank);
			cs.setString(16, account_no);
			cs.setInt(17, invoice_code);
			cs.setInt(18, purchase_return_id);
			cs.setInt(19, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	// retrive purchase return master data

	public JSONArray getPurchaseAndReturnDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_purchase_return_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("purchase_return_id", rs.getString(1));
				resultjson.put("vendors_code", rs.getString(2));
				resultjson.put("delivery_address", rs.getString(3));
				resultjson.put("order_date", rs.getString(4));
				resultjson.put("return_date", rs.getString(5));
				resultjson.put("order_code", rs.getString(6));
				resultjson.put("product_list", rs.getString(7));
				resultjson.put("amount", rs.getString(8));
				resultjson.put("discount", rs.getString(9));
				resultjson.put("payment_mode", rs.getString(10));
				resultjson.put("upi_name", rs.getString(11));
				resultjson.put("total_amount", rs.getString(12));
				resultjson.put("partial_paid_amount", rs.getString(13));
				resultjson.put("balance_amount", rs.getString(14));
				resultjson.put("given_bank", rs.getString(15));
				resultjson.put("account_no", rs.getString(16));
				resultjson.put("invoice_code", rs.getString(17));
				resultjson.put("transaction_code", rs.getString(18));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getLatestPurchaseReturnInvoice() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_purchase_return_invoice_code_seq(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("invoice_code", rs.getString(1));
				resultjson.put("transaction_code", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// ExpiryGood master

	public int insertUpdateExpiryGood(String product_name, int product_qty, String price, String resion,
			String product_date, String expiry_date, int expiry_good_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_expiry_good(?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, product_name);
			cs.setInt(3, product_qty);
			cs.setString(4, price);
			cs.setString(5, resion);
			cs.setString(6, product_date);
			cs.setString(7, expiry_date);
			cs.setInt(8, expiry_good_id);
			cs.setInt(9, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getExpiryGoodDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_expiry_good_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("expiry_good_id", rs.getInt(1));
				resultjson.put("product_name", rs.getString(2));
				resultjson.put("product_qty", rs.getInt(3));
				resultjson.put("price", rs.getString(4));
				resultjson.put("resion", rs.getString(5));
				resultjson.put("product_date", rs.getString(6));
				resultjson.put("expirt_date", rs.getString(7));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getCustomerOutstandingForDashboard() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_customer_outstanding_for_dashboard(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("customer_name", rs.getString(1));
				resultjson.put("balance_amount", rs.getString(2));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getVendorsOutstandingForDashboard() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_vendors_outstanding_for_dashboard(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("vendors_name", rs.getString(1));
				resultjson.put("balance_amount", rs.getString(2));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getOrderDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_upcoming_order(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("customer_name", rs.getString(1));
				resultjson.put("product_list", rs.getString(2));
				resultjson.put("delivery_date", rs.getDate(3));
				resultjson.put("comment", rs.getString(4));
				resultjson.put("order_code", rs.getString(5));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getCustomerCount() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_customer_count(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("customer_count", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getTop5ProductDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_top_5_product(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("product_name", rs.getString(1));
				resultjson.put("product_total", rs.getString(2));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getTodaysFootfallCount() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_todays_footfall_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("todays_footfall", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getSubcategoryCountDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_month_subcategory_count_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("month", rs.getString(1));
				resultjson.put("subcategory_name", rs.getString(2));
				resultjson.put("monthly_sum", rs.getInt(3));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getMonthWiseSaleReportForGraph() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_month_wise_sale_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("production_to_month", rs.getString(1));
				resultjson.put("monthly_sum", rs.getString(2));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getMonthWisePurchaseReportForGraph() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_month_wise_purchase_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("production_to_month", rs.getString(1));
				resultjson.put("monthly_sum", rs.getString(2));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getWeekWiseSaleReportForGraph() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_week_wise_sale_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				
				resultjson.put("days", rs.getString(1));
				resultjson.put("day_wise_sum", rs.getString(2));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getWeekWisePurchaseReportForGraph() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_week_wise_purchase_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

			
				resultjson.put("days", rs.getString(1));
				resultjson.put("day_wise_sum", rs.getString(2));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

//Report

	// Finish Good Product report

	public JSONArray getFinishGoodProductReportDetails(String product_name, String from_date, String till_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_finish_good_product_details(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, product_name);
			cs.setString(3, from_date);
			cs.setString(4, till_date);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("product_name", rs.getString(1));
				resultjson.put("product_id", rs.getString(2));
				resultjson.put("entry_date", rs.getString(3));
				resultjson.put("purchase_quantity", rs.getString(4));
				resultjson.put("selling_price", rs.getString(5));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// get customer wise report

	public JSONArray getCustomerWiseReportDetails(String customer_name, String from_date, String till_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_customer_outstanding_details(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, customer_name);
			cs.setString(3, from_date);
			cs.setString(4, till_date);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("customer_name", rs.getString(1));
				resultjson.put("order_date", rs.getString(2));
				resultjson.put("order_code", rs.getString(3));
				resultjson.put("total_amount", rs.getString(4));
				resultjson.put("product_list", rs.getString(5));
				resultjson.put("payment_mode", rs.getString(6));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Product wise sale report

	public JSONArray getSaleProductReportDetails(String product_name, String from_date, String till_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_product_sale_details(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, product_name);
			cs.setString(3, from_date);
			cs.setString(4, till_date);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("product_name", rs.getString(1));
				resultjson.put("product_id", rs.getString(2));
				resultjson.put("entry_date", rs.getString(3));
				resultjson.put("sale_quantity", rs.getString(4));
				resultjson.put("selling_price", rs.getString(5));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Product wise purchase report

	public JSONArray getPurchaseProductReportDetails(String product_name, String from_date, String till_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_product_purchase_details(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, product_name);
			cs.setString(3, from_date);
			cs.setString(4, till_date);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("product_name", rs.getString(1));
				resultjson.put("product_id", rs.getString(2));
				resultjson.put("entry_date", rs.getString(3));
				resultjson.put("purchase_quantity", rs.getString(4));
				resultjson.put("selling_price", rs.getString(5));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// sale product category wise report

	public JSONArray getSaleProductCategoryReportDetails(String category_name, String from_date, String till_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_sales_product_category_details(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, category_name);
			cs.setString(3, from_date);
			cs.setString(4, till_date);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("category_name", rs.getString(1));
				resultjson.put("subcategory_name", rs.getString(2));
				resultjson.put("product_name", rs.getString(3));
				resultjson.put("entry_date", rs.getString(4));
				resultjson.put("sale_quantity", rs.getString(5));
				resultjson.put("selling_price", rs.getString(6));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Purchase product category wise report

	public JSONArray getPurchaseProductCategoryReportDetails(String category_name, String from_date, String till_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_purchase_product_category_details(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, category_name);
			cs.setString(3, from_date);
			cs.setString(4, till_date);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("category_name", rs.getString(1));
				resultjson.put("subcategory_name", rs.getString(2));
				resultjson.put("product_name", rs.getString(3));
				resultjson.put("entry_date", rs.getString(4));
				resultjson.put("purchase_quantity", rs.getString(5));
				resultjson.put("selling_price", rs.getString(6));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getMontProductDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_month_product_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("product_name", rs.getString(1));
				resultjson.put("entry_date", rs.getString(2));
				resultjson.put("distributed_quantity", rs.getString(3));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getMontSubcategoryDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_month_subcategory_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("subcategory_name", rs.getString(1));
				resultjson.put("entry_date", rs.getString(2));
				resultjson.put("distributed_quantity", rs.getString(3));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

//In Out Laser

	public JSONArray getInOutProductReportDetails(String product_name, String from_date, String till_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_product_in_out_details(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, product_name);
			cs.setString(3, from_date);
			cs.setString(4, till_date);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("entry_date", rs.getString(1));
				resultjson.put("product_name", rs.getString(2));
				resultjson.put("transaction_desc", rs.getString(3));
				resultjson.put("opening_quantity", rs.getString(4));
				resultjson.put("in_quantity", rs.getString(5));
				resultjson.put("out_quantity", rs.getString(6));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Order insert and update

	public int insertUpdateOrderBookingDetails(int customer_code, String delivery_address, String order_date,
			String delivery_date, String order_code, String product_list, String amount, String discount,
			String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String received_bank, String account_no, String transaction_code,
			String cancelation_date,String comment, int status, int credit_period, int order_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + customer_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_order_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, customer_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, delivery_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, received_bank);
			cs.setString(16, account_no);
			cs.setString(17, transaction_code);
			cs.setString(18, cancelation_date);
			cs.setString(19, comment);
			cs.setInt(20, status);
			cs.setInt(21, credit_period);
			cs.setInt(22, order_id);
			cs.setInt(23, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getOrderInvoiceTransactionCode() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_order_invoice_transaction_code_seq(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

			
				resultjson.put("transaction_code", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getOrderMasterDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_order_master_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("order_master_id", rs.getString(1));
				resultjson.put("customer_code", rs.getString(2));
				resultjson.put("delivery_address", rs.getString(3));
				resultjson.put("order_date", rs.getString(4));
				resultjson.put("delivery_date", rs.getString(5));
				resultjson.put("cancelation_date", rs.getString(6));
				resultjson.put("order_code", rs.getString(7));
				resultjson.put("product_list", rs.getString(8));
				resultjson.put("amount", rs.getString(9));
				resultjson.put("discount", rs.getString(10));
				resultjson.put("payment_mode", rs.getString(11));
				resultjson.put("upi_name", rs.getString(12));
				resultjson.put("total_amount", rs.getString(13));
				resultjson.put("partial_paid_amount", rs.getString(14));
				resultjson.put("balance_amount", rs.getString(15));
				resultjson.put("received_bank", rs.getString(16));
				resultjson.put("account_no", rs.getString(17));
				resultjson.put("invoice_code", rs.getString(18));
				resultjson.put("transaction_id", rs.getString(19));
				resultjson.put("status", rs.getString(20));
				resultjson.put("credit_period", rs.getString(21));
				resultjson.put("credit_period_end_date", rs.getDate(22));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public int insertUpdateSalesAndOrderDetailsFromDelivery(int customer_code, String delivery_address,
			String order_date, String delivery_date, String order_code, String product_list, String amount,
			String discount, String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String received_bank, String account_no, String transaction_code,
			String invoice_code,String advance_paid, String delivery_charges ,int credit_period, int sales_and_order_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + customer_code);

			con = cf.getConnection();
			cs = con.prepareCall(
					"{?=call fun_crud_sales_and_order_details_for_delivery(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, customer_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, delivery_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, received_bank);
			cs.setString(16, account_no);
			cs.setString(17, transaction_code);
			cs.setString(18, invoice_code);
			cs.setString(19, advance_paid);
			cs.setString(20, delivery_charges);
			cs.setInt(21, credit_period);
			cs.setInt(22, sales_and_order_id);
			cs.setInt(23, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public int insertUpdatePurchaseOrderMasterDetails(int vendors_code, String delivery_address, String order_date,
			String delivery_date, String order_code, String product_list, String amount, String discount,
			String payment_mode, String upi_name, String total_amount, String partial_paid_amount,
			String balance_amount, String received_bank, String account_no, String transaction_code,
			String cancelation_date,String advance_paid,String status, int invoice_code, int purchase_order_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);
			System.out.println("Payment Mode in bean " + vendors_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_purchase_order_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, vendors_code);
			cs.setString(3, delivery_address);
			cs.setString(4, order_date);
			cs.setString(5, delivery_date);
			cs.setString(6, order_code);
			cs.setString(7, product_list);
			cs.setString(8, amount);
			cs.setString(9, discount);
			cs.setString(10, payment_mode);
			cs.setString(11, upi_name);
			cs.setString(12, total_amount);
			cs.setString(13, partial_paid_amount);
			cs.setString(14, balance_amount);
			cs.setString(15, received_bank);
			cs.setString(16, account_no);
			cs.setString(17, transaction_code);
			cs.setString(18, cancelation_date);
			cs.setString(19, advance_paid);
			cs.setString(20, status);
			cs.setInt(21, invoice_code);
			cs.setInt(22, purchase_order_id);
			cs.setInt(23, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getLatestPurchaseOrderMasterInvoice() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_purchase_order_master_invoice_seq(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				
				resultjson.put("transaction_code", rs.getString(1));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getpurchaseorderDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_purchase_order_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("purchase_order_id", rs.getString(1));
				resultjson.put("vendors_code", rs.getString(2));
				resultjson.put("delivery_address", rs.getString(3));
				resultjson.put("order_date", rs.getString(4));
				resultjson.put("delivery_date", rs.getString(5));
				resultjson.put("cancelation_date", rs.getString(6));

				resultjson.put("order_code", rs.getString(7));
				resultjson.put("product_list", rs.getString(8));
				resultjson.put("amount", rs.getString(9));
				resultjson.put("discount", rs.getString(10));
				resultjson.put("payment_mode", rs.getString(11));
				resultjson.put("upi_name", rs.getString(12));
				resultjson.put("total_amount", rs.getString(13));
				resultjson.put("partial_paid_amount", rs.getString(14));
				resultjson.put("balance_amount", rs.getString(15));
				resultjson.put("received_bank", rs.getString(16));
				resultjson.put("account_no", rs.getString(17));
				resultjson.put("invoice_code", rs.getString(18));
				resultjson.put("transaction_code", rs.getString(19));
				resultjson.put("status", rs.getString(20));
				resultjson.put("advance_paid", rs.getString(21));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	// Fund_transfer Master

	public int insertUpdatefundTransferMaster(String sender_payment_mode, String sender_upi_name,
			String sender_select_bank, String sender_current_amount, String sender_bank_name, String sender_acc_no,
			String sender_ifsc_code, String sender_acc_holder_name, String receiver_payment_mode,
			String receiver_upi_name, String receiver_select_bank, String receiver_current_amount,
			String receiver_bank_name, String receiver_acc_no, String receiver_ifsc_code,
			String receiver_acc_holder_name, String amount, int fund_transfer_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_fund_transfer_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, sender_payment_mode);
			cs.setString(3, sender_upi_name);
			cs.setString(4, sender_select_bank);
			cs.setString(5, sender_current_amount);
			cs.setString(6, sender_bank_name);
			cs.setString(7, sender_acc_no);
			cs.setString(8, sender_ifsc_code);
			cs.setString(9, sender_acc_holder_name);
			cs.setString(10, receiver_payment_mode);
			cs.setString(11, receiver_upi_name);
			cs.setString(12, receiver_select_bank);
			cs.setString(13, receiver_current_amount);
			cs.setString(14, receiver_bank_name);
			cs.setString(15, receiver_acc_no);
			cs.setString(16, receiver_ifsc_code);
			cs.setString(17, receiver_acc_holder_name);
			cs.setString(18, amount);

			cs.setInt(19, fund_transfer_id);
			cs.setInt(20, flag);

			cs.execute(); // rs = cs.getResultSet();

			result = cs.getInt(1);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					cf.freeConnection(con);
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return result;
	}

	public JSONArray getFundTransferDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_fund_transfer_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("fund_transfer_id", rs.getString(1));
				resultjson.put("sender_payment_mode", rs.getString(2));
				resultjson.put("sender_upi_name", rs.getString(3));
				resultjson.put("sender_select_bank", rs.getString(4));
				resultjson.put("sender_current_amount", rs.getString(5));
				resultjson.put("sender_bank_name", rs.getString(6));
				resultjson.put("sender_acc_no", rs.getString(7));
				resultjson.put("sender_ifsc_code", rs.getString(8));
				resultjson.put("sender_acc_holder_name", rs.getString(9));

				resultjson.put("receiver_fund_transfer_id", rs.getString(10));
				resultjson.put("receiver_payment_mode", rs.getString(11));
				resultjson.put("receiver_upi_name", rs.getString(12));
				resultjson.put("receiver_select_bank", rs.getString(13));
				resultjson.put("receiver_current_amount", rs.getString(14));
				resultjson.put("receiver_bank_name", rs.getString(15));
				resultjson.put("receiver_acc_no", rs.getString(16));
				resultjson.put("receiver_ifsc_code", rs.getString(17));
				resultjson.put("receiver_acc_holder_name", rs.getString(18));
				resultjson.put("amount", rs.getString(18));

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	
	
	public JSONArray getTodaysCustomerCollection() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_todays_customer_collection(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("todays_collection", rs.getString(1));
				resultjson.put("todays_outstanding", rs.getString(2));
			

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}

	public JSONArray getTodaysVendorsCollection() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_todays_vendors_collection(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("todays_collection", rs.getString(1));
				resultjson.put("todays_outstanding", rs.getString(2));
			

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}
	
	
	public JSONArray getTodaysCashInHand() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_todays_cash_in_hand(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("todays_collection", rs.getString(1));
				resultjson.put("todays_outstanding", rs.getString(2));
			

				jarr.put(resultjson);
			}

			finaljson = new JSONObject();

			finaljson.put("data", jarr);

		} catch (Exception e) {
			Logger.log(dbConnVar, e);
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (cs != null) {
					cs.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e1) {
				Logger.log(dbConnVar, e1);
			}
		}

		return jarr;
	}
	
	
	// get customer Transaction report

		public JSONArray getCustomerTransactionDetails(String customer_name) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;

			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_customer_transaction_details(?,?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setString(2, customer_name);
				cs.setObject(3, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					resultjson.put("customer_name", rs.getString(1));
					resultjson.put("order_date", rs.getString(2));
					resultjson.put("order_code", rs.getString(3));
					resultjson.put("product_list", rs.getString(4));
					resultjson.put("amount", rs.getString(5));
					resultjson.put("partial_paid_amount", rs.getString(6));
					resultjson.put("balance_amount", rs.getString(7));

					jarr.put(resultjson);
				}

				finaljson = new JSONObject();

				finaljson.put("data", jarr);

			} catch (Exception e) {
				Logger.log(dbConnVar, e);
			} finally {
				try {
					if (con != null) {
						con.close();
					}
					if (cs != null) {
						cs.close();
					}
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e1) {
					Logger.log(dbConnVar, e1);
				}
			}

			return jarr;
		}
	
		// get vendors Transaction report

				public JSONArray getVendorsTransactionDetails(String vendors_name) {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_vendors_transaction_details(?,?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setString(2, vendors_name);
						cs.setObject(3, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("vendors_name", rs.getString(1));
							resultjson.put("order_date", rs.getString(2));
							resultjson.put("order_code", rs.getString(3));
							resultjson.put("product_list", rs.getString(4));
							resultjson.put("amount", rs.getString(5));
							resultjson.put("partial_paid_amount", rs.getString(6));
							resultjson.put("balance_amount", rs.getString(7));

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}
	
				
				
				// get Product Transaction report

				public JSONArray getProductTransactionDetails(String product_name) {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_product_transaction_details(?,?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setString(2, product_name);
						cs.setObject(3, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("product_name", rs.getString(1));
							resultjson.put("entry_date", rs.getString(2));
							resultjson.put("unit", rs.getString(3));
							resultjson.put("transaction_field", rs.getString(4));
							resultjson.put("opening_quantity", rs.getString(5));
							resultjson.put("purchase_quantity", rs.getString(6));
							resultjson.put("used_quantity", rs.getString(7));
							resultjson.put("sale_quantity", rs.getString(8));
							resultjson.put("out_quantity", rs.getString(9));
							resultjson.put("produced_quantity", rs.getString(10));
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}
				
				
				
				// get Purchase Product  report

				public JSONArray getPurchaseProductDetails() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_purchase_product_details(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						
						cs.setObject(2, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("product_id", rs.getString(1));
							resultjson.put("product_name", rs.getString(2));
							resultjson.put("unit", rs.getString(3));
							resultjson.put("subcategory", rs.getString(4));
							resultjson.put("selling_price", rs.getString(5));
							
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}			
				// get Purchase Product  report

				public JSONArray getSaleableProductDetails() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_saleable_product_details(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						
						cs.setObject(2, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("product_id", rs.getString(1));
							resultjson.put("product_name", rs.getString(2));
							resultjson.put("unit", rs.getString(3));
							resultjson.put("subcategory", rs.getString(4));
							resultjson.put("selling_price", rs.getString(5));
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}	
				
				
				
				
				public JSONArray getInvoiceCode() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;
					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_latest_generated_invoice_seq(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setObject(2, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

						
							resultjson.put("invoice_id", rs.getString(1));

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}	
				
				
				
				
				public JSONArray getTotalCashInHand() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;
					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_total_cash_in_hand(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setObject(2, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("payment_mode", rs.getString(1));
							resultjson.put("cash_in_hand", rs.getString(2));
						

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}
				
				public JSONArray getPaymentModeWiseTotal() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;
					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_payment_mode_wise_total(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setObject(2, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("payment_mode", rs.getString(1));
							resultjson.put("total", rs.getString(2));
						

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}

				
				
				
				
				
				
				
				
				
				
				public JSONArray getCustomerOustandingForReport() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_customer_transaction_outstanding_details(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						
						cs.setObject(2, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("customer_name", rs.getString(1));
							resultjson.put("order_date", rs.getString(2));
							resultjson.put("order_code", rs.getString(3));
							resultjson.put("product_list", rs.getString(4));
							resultjson.put("amount", rs.getString(5));
							resultjson.put("partial_paid_amount", rs.getString(6));
							resultjson.put("balance_amount", rs.getString(7));
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}	
				
				
				
				public JSONArray getVendorsOustandingForReport() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_vendors_transaction_outstanding_details(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						
						cs.setObject(2, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("vendors_name", rs.getString(1));
							resultjson.put("order_date", rs.getString(2));
							resultjson.put("order_code", rs.getString(3));
							resultjson.put("product_list", rs.getString(4));
							resultjson.put("amount", rs.getString(5));
							resultjson.put("partial_paid_amount", rs.getString(6));
							resultjson.put("balance_amount", rs.getString(7));
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}	
				
				
				public JSONArray getProfitAndLossDetails(String from_date, String till_date) {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_profit_n_loss_details(?,?,?)}");
						cs.registerOutParameter(1, Types.OTHER);
						
						cs.setString(2, from_date);
						cs.setString(3, till_date);
						cs.setObject(4, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("invoice_id", rs.getString(1));
							resultjson.put("customer_code", rs.getString(2));
							resultjson.put("vendors_code", rs.getString(3));
							resultjson.put("invoice_amonut", rs.getString(4));
							resultjson.put("current_paid_amount", rs.getString(5));
							resultjson.put("payment_mode", rs.getString(6));
							resultjson.put("paid_date", rs.getDate(7));
							resultjson.put("invoice_date", rs.getDate(8));
							resultjson.put("field", rs.getString(9));

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}			
				
				
				
				
				public JSONArray getDailySaleOfMonthDetails(String from_date, String till_date) {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_daily_sale_of_month_details(?,?,?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setString(2, from_date);
						cs.setString(3, till_date);
						cs.setObject(4, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("paid_date", rs.getDate(1));
							resultjson.put("invoice_amonut", rs.getString(2));
							resultjson.put("current_paid_amount", rs.getString(3));
							
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}			
				
				
				public JSONArray getDailyPurchaseOfMonthDetails(String from_date, String till_date) {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_daily_purchase_of_month_details(?,?,?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setString(2, from_date);
						cs.setString(3, till_date);
						cs.setObject(4, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("paid_date", rs.getString(1));
							resultjson.put("invoice_amonut", rs.getString(2));
							resultjson.put("current_paid_amount", rs.getString(3));
							
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}			
				
				
				
				public JSONArray getDailySaleOfYearDetails(String from_date, String till_date) {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_monthly_sale_of_year_details(?,?,?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setString(2, from_date);
						cs.setString(3, till_date);
						cs.setObject(4, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("paid_date", rs.getString(1));
							resultjson.put("payment_mode", rs.getString(2));
							resultjson.put("invoice_amonut", rs.getString(3));
							resultjson.put("current_paid_amount", rs.getString(4));
							
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}		
				
				
				public JSONArray getDailyPurchaseOfYearDetails(String from_date, String till_date) {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;

					JSONArray jarr = null;
					JSONObject finaljson = null;

					try {
						jarr = new JSONArray();

						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_monthly_purchase_of_year_details(?,?,?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setString(2, from_date);
						cs.setString(3, till_date);
						cs.setObject(4, rs);

						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);

						while (rs.next()) {
							JSONObject resultjson = new JSONObject();

							resultjson.put("paid_date", rs.getString(1));
							resultjson.put("payment_mode", rs.getString(2));
							resultjson.put("invoice_amonut", rs.getString(3));
							resultjson.put("current_paid_amount", rs.getString(4));
							
							

							jarr.put(resultjson);
						}

						finaljson = new JSONObject();

						finaljson.put("data", jarr);

					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}

					return jarr;
				}			
						
				public JSONArray getUser_Role_Details() {
					Connection con = null;
					CallableStatement cs = null;
					ResultSet rs = null;
					JSONArray jarr = null;
					JSONObject finaljson = null;
					try {
						jarr = new JSONArray();
						con = cf.getConnection();
						cs = con.prepareCall("{?=call fun_retrieve_user_role_details(?)}");
						cs.registerOutParameter(1, Types.OTHER);
						cs.setObject(2, rs);
						con.setAutoCommit(false); // without this the Result set is not returning
						cs.execute();
						rs = (ResultSet) cs.getObject(1);
						while (rs.next()) {
							JSONObject resultjson = new JSONObject();
							resultjson.put("users_id", rs.getInt(1));
							resultjson.put("login_id",  rs.getString(2));
							resultjson.put("password", rs.getString(3));
							resultjson.put("users_name", rs.getString(4));
							resultjson.put("role_type", rs.getString(5));
							resultjson.put("role_permission", rs.getString(6));
							resultjson.put("email_id", rs.getString(7));
							jarr.put(resultjson);
						}
						finaljson = new JSONObject();
						finaljson.put("data", jarr);
					} catch (Exception e) {
						Logger.log(dbConnVar, e);
					} finally {
						try {
							if (con != null) {
								con.close();
							}
							if (cs != null) {
								cs.close();
							}
							if (rs != null) {
								rs.close();
							}
						} catch (Exception e1) {
							Logger.log(dbConnVar, e1);
						}
					}
					return jarr;
				}

}