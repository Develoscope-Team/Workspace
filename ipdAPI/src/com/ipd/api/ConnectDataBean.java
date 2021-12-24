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
	
	
	///////////////////////////////Ambulance File///////////////////////////
	
	
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
  
	 ///////////////////////////////////Asset File//////////////////////////////
	
	public int insertUpdateAsset(String asset_name, String asset_code, String asset_price, String asset_desc, String asset_scan_pdf_name, String asset_amount, String percent, int asset_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Asset name in bean Ipd " + asset_name);
			System.out.println("Asset code in bean Ipd " + asset_code);
		    System.out.println("Asset price in bean Ipd " + asset_price);
		    System.out.println("Asset desc in bean Ipd " + asset_desc);
		    System.out.println("Asset scan pdf name in bean Ipd " + asset_scan_pdf_name);
		    System.out.println("Asset amount in bean Ipd " + asset_amount);
		    System.out.println("Asset percent in bean Ipd " + percent);
			System.out.println("Advice name in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_advice(?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, asset_name);
			cs.setString(3, asset_code);
			cs.setString(4, asset_price);
			cs.setString(5, asset_desc);
			cs.setString(6, asset_scan_pdf_name);
			cs.setString(7, asset_amount);
			cs.setString(8, percent);
			cs.setInt(9, asset_id);
			cs.setInt(10, flag);

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
	public JSONArray getAsset() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String  asset_name = "", asset_code = "", asset_price = "", asset_desc = "", asset_scan_pdf_name = "", asset_amount = "", percent = "";
		int asset_id = 0;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_asset(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				asset_id = rs.getInt(1);
				asset_name = rs.getString(2);
				asset_code = rs.getString(3);
				asset_price = rs.getString(4);
				asset_desc = rs.getString(5);
				asset_scan_pdf_name = rs.getString(6);
				asset_amount = rs.getString(7);
				percent = rs.getString(8);
				

				resultjson.put("asset_id", asset_id);
				resultjson.put("asset_name", asset_name);
				resultjson.put("asset_code", asset_code);
				resultjson.put("asset_price", asset_price);
				resultjson.put("asset_desc", asset_desc);
				resultjson.put("asset_scan_pdf_name", asset_scan_pdf_name);
				resultjson.put("asset_amount", asset_amount);
				resultjson.put("percent", percent);
				
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
     //////////////////////////////////Basic Calender File///////////////////////
	public int insertUpdateCalender(String date, String add_event, int calender_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Calender date in bean Ipd " + date);
			System.out.println("Calender add event in bean Ipd " + add_event);
			System.out.println("Calender name in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_advice(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, date);
			cs.setString(3, add_event);
			cs.setInt(4, calender_id);
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

	public JSONArray getCalender() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String date = "", add_event = "";
		int calender_id = 0;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_calender(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				calender_id = rs.getInt(1);
				date = rs.getString(2);
				add_event = rs.getString(3);

				resultjson.put("calender_id", calender_id);
				resultjson.put("date", date);
				resultjson.put("add_event", add_event);

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
	////////////////////////////////////Building File///////////////////////////
	public int insertUpdateBuilding(String building_name, String building_floors, String building_count, 
			String wards, String floors, String rooms, String operation_theater,String icu, int building_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Building name in bean Ipd " + building_name);
			System.out.println("Building floors in bean Ipd " + building_floors);
			System.out.println("Building count in bean Ipd " + building_count);
			System.out.println("Wards in bean Ipd " + wards);
			System.out.println("Floors in bean Ipd " + floors);
			System.out.println("Rooms in bean Ipd " + rooms);
			System.out.println("Operation Theater in bean Ipd " + operation_theater);
			System.out.println("ICU in bean Ipd " + icu);
			System.out.println("Calender name in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_advice(?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, building_name);
			cs.setString(3, building_floors);
			cs.setString(4, building_count);
			cs.setString(5, wards);
			cs.setString(6, floors);
			cs.setString(7, rooms);
			cs.setString(8, operation_theater);
			cs.setString(9, icu);
			cs.setInt(10, flag);

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

	public JSONArray getBuilding() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String building_name = "", building_floors = "", building_count = "", wards = "", floors = "", rooms = "", operation_theater = "", icu = "";
		int building_id = 0;
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_building(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				building_id = rs.getInt(1);
				building_name = rs.getString(2);
				building_floors = rs.getString(3);
				building_count = rs.getString(4);
				wards = rs.getString(5);
				floors = rs.getString(6);
				rooms = rs.getString(7);
				operation_theater = rs.getString(8);
				icu = rs.getString(9);

				resultjson.put("building_id", building_id);
				resultjson.put("building_name", building_name);
				resultjson.put("building_floors", building_floors);
				resultjson.put("building_count", building_count);
				resultjson.put("wards", wards);
				resultjson.put("floors", floors);
				resultjson.put("rooms", rooms);
				resultjson.put("operation_theater", operation_theater);
				resultjson.put("icu", icu);
				
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
	
	///////////////////////////////////Qualification File///////////////////////
	
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
	
	//////////////////////
}