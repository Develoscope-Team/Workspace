package com.ipd.api;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.sql.Date;
import org.json.JSONArray;
import org.json.JSONObject;

import com.config.ConnectionFactory;
import com.customLog.Logger;

public class ConnectDataBean {

	private ConnectionFactory cf = null;
	String dbConnVar = "IPD";

	public ConnectDataBean() {
		cf = new ConnectionFactory(dbConnVar);
	}

	public int insertUpdateAdvice(String advice_name, String advice_desc, int advice_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Advice name in bean Ipd " + advice_name);
			System.out.println("Advice name in bean Ipd " + advice_desc);
			System.out.println("Advice name in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_advice(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, advice_name);
			cs.setString(3, advice_desc);
			cs.setInt(4, advice_id);
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

	public JSONArray getAdvice() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String advice_id = "", advice_name = "", advice_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_advice(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				advice_id = rs.getString(1);
				advice_name = rs.getString(2);
				advice_desc = rs.getString(3);

				resultjson.put("advice_id", advice_id);
				resultjson.put("advice_name", advice_name);
				resultjson.put("advice_desc", advice_desc);

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
	
	
	public int insertUpdateAmbulance(String ambulance_no, Date ambulance_purchase_date, String price, String purchase_place, int ambulance_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Ambulance no in bean Ipd " + ambulance_no);
			System.out.println("Ambulance purchase date in bean Ipd " + ambulance_purchase_date);
			System.out.println("Price in bean Ipd " + price);
			System.out.println("Purchase place in bean Ipd " +  purchase_place);
			System.out.println("Ambulance no in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_ambulance(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, ambulance_no);
			cs.setDate(3, ambulance_purchase_date);
			cs.setString(4, price);
			cs.setString(5, purchase_place);
			cs.setInt(6, ambulance_id);
			cs.setInt(7, flag);

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

	public JSONArray getAmbulance() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String  ambulance_no = "", ambulance_purchase_date = "", price = "", purchase_place = "";
		int ambulance_id = 0;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_ambulance(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				ambulance_id = rs.getInt(1);
				ambulance_no = rs.getString(2);
				ambulance_purchase_date = rs.getString(3);
				price = rs.getString(4);
				purchase_place = rs.getString(5);
				

				resultjson.put("ambulance_id", ambulance_id);
				resultjson.put("ambulance_no", ambulance_no);
				resultjson.put("ambulance_purchase_date", ambulance_purchase_date);
				resultjson.put("price", price);
				resultjson.put("purchase_place", purchase_place);

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
  
	
	
	public int insertUpdateQualification(String qualification_name, int qualification_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Qualification name in bean Ipd " + qualification_name);
			System.out.println("Qualification name in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_qualification(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, qualification_name);
			cs.setInt(3, qualification_id);
			cs.setInt(4, flag);

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

	public JSONArray getQualification() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String qualification_id = "", qualification_name = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_qualification(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				qualification_id = rs.getString(1);
				qualification_name = rs.getString(2);
				
				resultjson.put("qualification_id", qualification_id);
				resultjson.put("qualification_name", qualification_name);
				

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