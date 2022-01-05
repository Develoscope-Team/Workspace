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
	
	
	public int insertUpdateambulance(String ambulance_no, String ambulance_purchase_date, String ambulance_price, String purchase_place, int ambulance_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Ambulance No in bean Ipd " + ambulance_no);
			System.out.println("Ambulance purchase date in bean Ipd " + ambulance_purchase_date);
			System.out.println("Ambulance price in bean Ipd " + ambulance_price);
			System.out.println("Purchase place in bean Ipd " + purchase_place);
			System.out.println("Ambulance  in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_ambulance(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, ambulance_no);
			cs.setString(3, ambulance_purchase_date);
			cs.setString(4, ambulance_price);
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

	public JSONArray getambulance() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		//String ambulance_id = "", ambulance_no = "", ambulance_purchase_date = "", ambulance_price = "", purchase_place = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_ambulance_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("ambulance_id", rs.getInt(1));
				resultjson.put("ambulance_no",  rs.getString(2));
				resultjson.put("ambulance_purchase_date", rs.getString(3));
				resultjson.put("ambulance_price",  rs.getString(4));
				resultjson.put("purchase_place", rs.getString(5));

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
	
	
	public int insertUpdatebed(int bed_no, int room_no, int bed_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("bed no in bean Ipd " + bed_no);
			//System.out.println("Advice name in bean Ipd " + advice_desc);
			System.out.println("flag in bean Ipd " + flag);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_bed(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, bed_no);
			cs.setInt(3, room_no);
			cs.setInt(4, bed_id);
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

	public JSONArray getbed() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String bed_id = "", bed_no = "", room_no = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_bed_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

			

				resultjson.put("bed_id",  rs.getInt(1));
				resultjson.put("bed_no", rs.getInt(2));
				resultjson.put("room_no", rs.getInt(3));

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