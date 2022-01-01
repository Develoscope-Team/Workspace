


package com.dss.api;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.json.JSONArray;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.WebResource;

import com.config.ConnectionFactory;
import com.config.I18nUtility;
import com.customLog.Logger;

public class ConnectDataBean {

	private ConnectionFactory cf = null;
	String dbConnVar = "BAFNA"; // AdminPortalAPI

	public ConnectDataBean() {
		cf = new ConnectionFactory(dbConnVar);
	}

	public int getUsersDetails(String UserName, String Password) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_authenticate_user(?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, UserName);
			cs.setString(3, Password);
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

	public int insertUpdateMedicineDetails(String medicineName, String medicineType, String medicineCategory,
			String mgfName, String mrName, String isPrintable, String isSpecial, int flag, int med_id) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_medicine_details(?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, medicineName);
			cs.setString(3, medicineType);
			cs.setString(4, medicineCategory);
			cs.setString(5, mgfName);
			cs.setString(6, mrName);
			cs.setString(7, isPrintable);
			cs.setString(8, isSpecial);
			cs.setInt(9, flag);
			cs.setInt(10, med_id);
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

	public JSONArray getMedicineDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String medicine_id = "", medicine_name = "", medicine_type = "", medicine_category = "", mgf_name = "",
				mr_name = "", is_printable = "", is_special = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_medicine_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				medicine_id = rs.getString(1);
				medicine_name = rs.getString(2);
				medicine_type = rs.getString(3);
				medicine_category = rs.getString(4);
				mgf_name = rs.getString(5);
				mr_name = rs.getString(6);
				is_printable = rs.getString(7);
				is_special = rs.getString(8);

				resultjson.put("medicine_id", medicine_id);
				resultjson.put("medicine_name", medicine_name);
				resultjson.put("medicine_type", medicine_type);
				resultjson.put("medicine_category", medicine_category);
				resultjson.put("mgf_name", mgf_name);
				resultjson.put("mr_name", mr_name);
				resultjson.put("is_printable", is_printable);
				resultjson.put("is_special", is_special);

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

	public JSONObject getAdminLoginDetails(String UserName, String Password) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		String school_code = "", school_name = "", school_url = "", common_db_flag="";
		int school_id;

		JSONObject resultjson = new JSONObject();
		JSONArray jsonArray = new JSONArray();

		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call admin_portal_fun_user_authentication(?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, UserName);
			cs.setString(3, Password);
			cs.setObject(4, rs);
			con.setAutoCommit(false);
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			if (rs.next()) {
				do {
					school_code = rs.getString(1);
					school_id = rs.getInt(2);
					school_name = rs.getString(3);
					school_url = rs.getString(4);
					common_db_flag = rs.getString(5);

					JSONObject resjson = new JSONObject();

					resjson.put("school_id", school_id);
					resjson.put("school_code", school_code);
					resjson.put("school_name", school_name);
					resjson.put("school_url", school_url);

					jsonArray.put(resjson);

				} while (rs.next());

				resultjson.put("result", "0");
				resultjson.put("data", jsonArray);

			} else {
				resultjson.put("result", "1");
				resultjson.put("data", "Authentication Failed");
			}

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

		return resultjson;
	}

	public int insertUpdateQualification(String degree, int degree_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_qualification(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, degree);
			cs.setInt(3, degree_id);
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

	public JSONArray getQualificationDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String degree_id = "", degree_name = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_qualification_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				degree_id = rs.getString(1);
				degree_name = rs.getString(2);

				resultjson.put("degree_id", degree_id);
				resultjson.put("degree_name", degree_name);

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

	public int insertUpdateCity(String city, int city_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_city(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, city);
			cs.setInt(3, city_id);
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

	public JSONArray getCityDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String city_id = "", city_name = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_city_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				city_id = rs.getString(1);
				city_name = rs.getString(2);

				resultjson.put("city_id", city_id);
				resultjson.put("city_name", city_name);

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

	public int insertUpdateDistrict(String district, int district_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_district(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, district);
			cs.setInt(3, district_id);
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

	public JSONArray getDistrictDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String district_id = "", district_name = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_district_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				district_id = rs.getString(1);
				district_name = rs.getString(2);

				resultjson.put("district_id", district_id);
				resultjson.put("district_name", district_name);

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

	// Patient Details

	public int insertUpdatePatientDetails(String patient_name, Date birth_date, String patient_code, String mobile_no,
			String city_desc, String blood_group, String gender, Date registration_date, int patient_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("In bean city : " + city_desc);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_patient_details(?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, patient_name);
			cs.setDate(3, birth_date);
			cs.setString(4, patient_code);
			cs.setString(5, mobile_no);
			cs.setString(6, city_desc);
			cs.setString(7, blood_group);
			cs.setString(8, gender);
			cs.setDate(9, registration_date);
			cs.setInt(10, flag);
			cs.setInt(11, patient_id);

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

	public JSONArray getPatientDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String patient_id = "", patient_name = "", birth_date = "", patient_code = "", mobile_no = "", city_desc = "",
				blood_group = "", age = "", gender = "", aadhar_no = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_patient_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				patient_id = rs.getString(1);
				patient_name = rs.getString(2);
				birth_date = rs.getString(3);
				age = rs.getString(4);
				aadhar_no = rs.getString(5);
				patient_code = rs.getString(6);
				mobile_no = rs.getString(7);
				city_desc = rs.getString(8);
				blood_group = rs.getString(9);
				gender = rs.getString(10);

				resultjson.put("patient_id", patient_id);
				resultjson.put("patient_name", patient_name);
				resultjson.put("birth_date", birth_date);
				resultjson.put("patient_code", patient_code);
				resultjson.put("mobile_no", mobile_no);
				resultjson.put("city_desc", city_desc);
				resultjson.put("blood_group", blood_group);
				resultjson.put("age", age);
				resultjson.put("aadhar_no", aadhar_no);
				resultjson.put("gender", gender);

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

//	Vital Details

	public int insertUpdateVitalDetails(int visit_id, String patient_code, String pulse, String blood_pressure,
			String weight, String hb, String temperature, String sugar, String other, int vitil_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("patient_code " + patient_code);
			System.out.println("temperature " + temperature);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_vital_details(?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, visit_id);
			cs.setString(3, patient_code);
			cs.setString(4, pulse);
			cs.setString(5, blood_pressure);
			cs.setString(6, weight);
			cs.setString(7, hb);
			cs.setString(8, temperature);
			cs.setString(9, sugar);
			cs.setString(10, other);
			cs.setInt(11, flag);
			cs.setInt(12, vitil_id);

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

	public JSONArray getVitalDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String vitil_id = "", blood_pressure = "", pulse = "", weight = "", temperature = "", sugar = "", hb = "",
				other = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_vital_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				vitil_id = rs.getString(1);
				blood_pressure = rs.getString(5);

				resultjson.put("vitil_id", vitil_id);
				resultjson.put("blood_pressure", blood_pressure);
				resultjson.put("pulse", pulse);
				resultjson.put("weight", weight);
				resultjson.put("temperature", temperature);
				resultjson.put("hb", hb);
				resultjson.put("sugar", sugar);
				resultjson.put("other", other);

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

	// Patient Complaints

	public int insertUpdatePatientComplaints(int visit_id, String patient_code, String complaints_desc,
			String other_complaints, String diagnosis_desc, int complaints_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println(patient_code + " " + other_complaints);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_patient_complaints_details(?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, visit_id);
			cs.setString(3, patient_code);
			cs.setString(4, complaints_desc);
			cs.setString(5, other_complaints);
			cs.setString(6, diagnosis_desc);
			cs.setInt(7, flag);
			cs.setInt(8, complaints_id);

			cs.execute();
			// rs = cs.getResultSet();

			result = cs.getInt(1);

			System.out.println(result);

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

	public JSONArray getPatientComplaints() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String complaints_id = "", visit_id = "", patient_code = "", complaints_desc = "", other_complaints = "",
				diagnosis_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_patient_complaints_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				complaints_id = rs.getString(1);
				visit_id = rs.getString(2);
				patient_code = rs.getString(3);
				complaints_desc = rs.getString(4);
				other_complaints = rs.getString(5);
				diagnosis_desc = rs.getString(6);

				resultjson.put("complaints_id", complaints_id);
				resultjson.put("visit_id", visit_id);
				resultjson.put("patient_code", patient_code);
				resultjson.put("complaints_desc", complaints_desc);
				resultjson.put("other_complaints", other_complaints);
				resultjson.put("diagnosis_desc", diagnosis_desc);

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

//	PatientPrescription Details

	public int insertUpdatePatientPrescription(int visit_id, String patient_code, String prescription_desc,
			String special_advise,String re_visit, int prescription_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_patient_prescription_detailss(?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, visit_id);
			cs.setString(3, patient_code);
			cs.setString(4, prescription_desc);
			cs.setString(5, special_advise);
			cs.setString(6, re_visit);
			cs.setInt(7, flag);
			cs.setInt(8, prescription_id);

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

	public JSONArray getPatientPrescription() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String prescription_id = "", visit_id = "", patient_code = "", prescription_desc = "", special_advise = "",
				kco = "", allergy = "" , re_visit="";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_patient_prescription_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				prescription_id = rs.getString(1);
				visit_id = rs.getString(2);
				patient_code = rs.getString(3);
				prescription_desc = rs.getString(4);
				special_advise = rs.getString(5);
				kco = rs.getString(6);
				allergy = rs.getString(7);
				re_visit = rs.getString(8);

				resultjson.put("prescription_id", prescription_id);
				resultjson.put("visit_id", visit_id);
				resultjson.put("patient_code", patient_code);
				resultjson.put("prescription_desc", prescription_desc);
				resultjson.put("special_advise", special_advise);
				resultjson.put("kco", kco);
				resultjson.put("allergy", allergy);
				resultjson.put("re_visit", re_visit);

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

//	Template master Details

	public int insertUpdateMedicineTemplate(String template_name, String template_code, String template_desc,
			String created_by, String created_date, String updated_by, String update_date, int template_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_medicine_template_master(?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, template_name);
			cs.setString(3, template_code);
			cs.setString(4, template_desc);
			cs.setString(5, created_by);
			cs.setString(6, created_date);
			cs.setString(7, updated_by);
			cs.setString(8, update_date);
			cs.setInt(9, flag);
			cs.setInt(10, template_id);

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

	public JSONArray getMedicineTemplateMaster() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String template_id = "", template_name = "", template_code = "", created_by = "", updated_by = "";
		Date created_date, update_date;
		String template_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_medicine_template_master(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				template_id = rs.getString(1);
				template_name = rs.getString(2);
				template_code = rs.getString(3);
				template_desc = rs.getString(4);
				created_by = rs.getString(5);
				created_date = rs.getDate(6);
				updated_by = rs.getString(7);
				update_date = rs.getDate(8);

				resultjson.put("template_id", template_id);
				resultjson.put("template_name", template_name);
				resultjson.put("template_code", template_code);
				resultjson.put("template_desc", template_desc);
				resultjson.put("created_by", created_by);
				resultjson.put("created_date", created_date);
				resultjson.put("updated_by", updated_by);
				resultjson.put("update_date", update_date);

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

	public int insertWizardFormDetails(String patientDetails, String vitalDetails, String complaintsDetails,
			String prescriptionDetails, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("vitalDetails in bean " + vitalDetails);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_wizard_form(?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, patientDetails);
			cs.setString(3, vitalDetails);
			cs.setString(4, complaintsDetails);
			cs.setString(5, prescriptionDetails);
			cs.setInt(6, flag);

			cs.execute();
			// rs = cs.getResultSet();

			result = cs.getInt(1);

			System.out.println(flag);
			System.out.println(result);

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

	public int updateWizardFormDetails(String patient_code, String patientDetails, String vitalDetails,
			String complaintsDetails, String prescriptionDetails, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("vitalDetails in bean " + vitalDetails);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_wizard_form_existing(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, patient_code);
			cs.setString(3, patientDetails);
			cs.setString(4, vitalDetails);
			cs.setString(5, complaintsDetails);
			cs.setString(6, prescriptionDetails);
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

	public JSONArray getWizardFormData(String p_code) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String patient_code = "", patient_name = "", date = "", prescription_desc = "", special_advise = "", kco = "",
				allergy = "", age = "", weight = "", temperature = "", sugar = "", blood_pressure = "", hb = "",
				pulse = "", complaints_desc = "", other_complaints = "", diagnosis_desc = "", gender = "",
				visit_id = "";
		try {
			jarr = new JSONArray();

			System.out.println("getWizardFormData" + p_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_wizard_form(?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, p_code);
			cs.setObject(3, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				patient_name = rs.getString(1);
				date = rs.getString(2);
				patient_code = rs.getString(3);
				prescription_desc = rs.getString(4);
				special_advise = rs.getString(5);
				age = rs.getString(6);
				weight = rs.getString(7);
				temperature = rs.getString(8);
				sugar = rs.getString(9);
				hb = rs.getString(10);
				complaints_desc = rs.getString(11);
				other_complaints = rs.getString(12);
				diagnosis_desc = rs.getString(13);
				kco = rs.getString(14);
				blood_pressure = rs.getString(15);
				allergy = rs.getString(16);
				gender = rs.getString(17);
				pulse = rs.getString(18);

				visit_id = rs.getString(19);

				resultjson.put("patient_name", patient_name);
				resultjson.put("date", date);
				resultjson.put("patient_code", patient_code);
				resultjson.put("prescription_desc", prescription_desc);
				resultjson.put("special_advise", special_advise);
				resultjson.put("age", age);
				resultjson.put("weight", weight);
				resultjson.put("temperature", temperature);
				resultjson.put("sugar", sugar);
				resultjson.put("hb", hb);
				resultjson.put("complaints_desc", complaints_desc);
				resultjson.put("other_complaints", other_complaints);
				resultjson.put("diagnosis_desc", diagnosis_desc);
				resultjson.put("kco", kco);
				resultjson.put("blood_pressure", blood_pressure);
				resultjson.put("allergy", allergy);
				resultjson.put("gender", gender);
				resultjson.put("pulse", pulse);

				resultjson.put("visit_id", visit_id);

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

	// Complaint master

	public int insertUpdateComplaint(String complaint_name, String complaint_desc, int complaint_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Complaint name in bean " + complaint_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_complaints(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, complaint_name);
			cs.setString(3, complaint_desc);
			cs.setInt(4, complaint_id);
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

	public JSONArray getComplaint() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String complaint_id = "", complaint_name = "", complaint_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_complaints(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				complaint_id = rs.getString(1);
				complaint_name = rs.getString(2);
				complaint_desc = rs.getString(3);

				resultjson.put("complaint_id", complaint_id);
				resultjson.put("complaint_name", complaint_name);
				resultjson.put("complaint_desc", complaint_desc);

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

	// Diagnosis master

	public int insertUpdateDiagnosis(String diagnosis_name, String diagnosis_desc, int diagnosis_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Diagnosis name in bean " + diagnosis_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_diagnosis(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, diagnosis_name);
			cs.setString(3, diagnosis_desc);
			cs.setInt(4, diagnosis_id);
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

	public JSONArray getDiagnosis() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String diagnosis_id = "", diagnosis_name = "", diagnosis_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_diagnosis(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				diagnosis_id = rs.getString(1);
				diagnosis_name = rs.getString(2);
				diagnosis_desc = rs.getString(3);

				resultjson.put("diagnosis_id", diagnosis_id);
				resultjson.put("diagnosis_name", diagnosis_name);
				resultjson.put("diagnosis_desc", diagnosis_desc);

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

	// Medicine Type master

	public int insertUpdateMedicineType(String medicine_type_name, int medicine_type_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Medicine Type name in bean " + medicine_type_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_medicine_type(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, medicine_type_name);
			cs.setInt(3, medicine_type_id);
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

	public JSONArray getMedicineType() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String medicine_type_id = "", medicine_type_name = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_medicine_type(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				medicine_type_id = rs.getString(1);
				medicine_type_name = rs.getString(2);

				resultjson.put("medicine_type_id", medicine_type_id);
				resultjson.put("medicine_type_name", medicine_type_name);

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

	// Medicine Category master

	public int insertUpdateMedicineCategory(String medicine_category_name, int medicine_category_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Medicine Category name in bean " + medicine_category_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_medicine_category(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, medicine_category_name);
			cs.setInt(3, medicine_category_id);
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

	public JSONArray getMedicineCategory() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String medicine_category_id = "", medicine_category_name = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_medicine_category(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				medicine_category_id = rs.getString(1);
				medicine_category_name = rs.getString(2);

				resultjson.put("medicine_category_id", medicine_category_id);
				resultjson.put("medicine_category_name", medicine_category_name);

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

	// Diagnosis master

	public int insertUpdateRemark(String remark_name, String remark_desc, int remark_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Remark name in bean " + remark_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_remark(?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, remark_name);
			cs.setString(3, remark_desc);
			cs.setInt(4, remark_id);
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

	public JSONArray getRemark() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String remark_id = "", remark_name = "", remark_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_remark(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				remark_id = rs.getString(1);
				remark_name = rs.getString(2);
				remark_desc = rs.getString(3);

				resultjson.put("remark_id", remark_id);
				resultjson.put("remark_name", remark_name);
				resultjson.put("remark_desc", remark_desc);

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

	// Diagnosis master

	public int insertUpdateAdvice(String advice_name, String advice_desc, int advice_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Advice name in bean " + advice_name);

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

	// Get City Wise Patient Record
	public String getCitywisePatientRecord(String from_date, String to_date, String city_desc) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jsonArr = null;

		int patient_master_id = 0;
		String patient_code = "";
		String patient_name = "";
		String mobile_no = "";
		String blood_group = "";
		String city_desc_v = "";

		try {

			jsonArr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_patient_record_citywise(?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, from_date);
			cs.setString(3, to_date);
			cs.setString(4, city_desc);
			cs.setObject(5, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {

				JSONObject resultjson = new JSONObject();

				patient_master_id = rs.getInt(1);
				patient_code = rs.getString(2);
				patient_name = rs.getString(3);
				mobile_no = rs.getString(4);
				blood_group = rs.getString(5);
				city_desc_v = rs.getString(6);

				resultjson.put("patient_id", patient_master_id);
				resultjson.put("patient_code", patient_code);
				resultjson.put("patient_name", patient_name);
				resultjson.put("mobile_no", mobile_no);
				resultjson.put("blood_group", blood_group);
				resultjson.put("city_desc", city_desc_v);

				jsonArr.put(resultjson);
			}

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

		return jsonArr.toString();
	}

	// payment master

	public int insertUpdatePaymentDetails(int visit_id, String patient_code, String payment_date, String payment_mode,
			String cheque_no, String payment_upi, String online_transaction_id, String amount, String received_by, int receipt_no, 
			String discount, String invoice_total,String grand_total, String paid_amount, String balance_amount, int invoice_id,int payment_details_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_payment_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, visit_id);
			cs.setString(3, patient_code);
			cs.setString(4, payment_date);
			cs.setString(5, payment_mode);
			cs.setString(6, cheque_no);
			cs.setString(7, payment_upi);
			cs.setString(8, online_transaction_id);
			cs.setString(9, amount);
			cs.setString(10, received_by);
			cs.setInt(11, receipt_no);
			cs.setString(12, discount);
			cs.setString(13, invoice_total);
			cs.setString(14, grand_total);
			cs.setString(15, paid_amount);
			cs.setString(16, balance_amount);
			cs.setInt(17, invoice_id);
			cs.setInt(18, payment_details_id);
			cs.setInt(19, flag);

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

//getting Payment Details	
	
	public JSONArray getPaymentDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;

		int visit_id, receipt_no, payment_details_id,invoice_id;
		String patient_code, payment_mode, card_no, payment_upi, online_transaction_id, received_by;
		double amount ,discount,invoice_total,grand_total,paid_amount,balance_amount;
		Date payment_date;

		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_payment_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				payment_details_id = rs.getInt(1);
				visit_id = rs.getInt(2);
				patient_code = rs.getString(3);
				payment_date = rs.getDate(4);
				payment_mode = rs.getString(5);
				card_no = rs.getString(6);
				payment_upi = rs.getString(7);
				online_transaction_id = rs.getString(8);
				amount = rs.getDouble(9);
				received_by = rs.getString(10);
				receipt_no = rs.getInt(11);
				discount = rs.getDouble(12);
				invoice_total = rs.getDouble(13);
				grand_total = rs.getDouble(14);
				paid_amount = rs.getDouble(15);
				balance_amount = rs.getDouble(16);
				invoice_id = rs.getInt(17);

				resultjson.put("payment_details_id", payment_details_id);
				resultjson.put("visit_id", visit_id);
				resultjson.put("patient_code", patient_code);
				resultjson.put("payment_date", payment_date);
				resultjson.put("payment_mode", payment_mode);
				resultjson.put("card_no", card_no);
				resultjson.put("payment_upi", payment_upi);
				resultjson.put("online_transaction_id", online_transaction_id);
				resultjson.put("amount", amount);
				resultjson.put("received_by", received_by);
				resultjson.put("receipt_no", receipt_no);
				resultjson.put("discount", discount);
				resultjson.put("invoice_total", invoice_total);
				resultjson.put("grand_total", grand_total);
				resultjson.put("paid_amount", paid_amount);
				resultjson.put("balance_amount", balance_amount);
				resultjson.put("invoice_id", invoice_id);
				

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

	// Upi master

	public int insertUpdateUPI(String upi_name, int upi_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("upi name in bean " + upi_name);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_upi(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, upi_name);
			
			cs.setInt(3, upi_id);
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

	public JSONArray getUPIDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String upi_id = "", upi_name = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_upi_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				upi_id = rs.getString(1);
				upi_name = rs.getString(2);
				

				resultjson.put("upi_id", upi_id);
				resultjson.put("upi_name", upi_name);
				

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

	public JSONArray getStatsCounts() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String patient_count = "", regular_patient_count = "", new_reg_count = "", daily_collection = "",
				visit_count = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_stats_counts(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				patient_count = rs.getString(1);
				regular_patient_count = rs.getString(2);
				new_reg_count = rs.getString(3);
				daily_collection = rs.getString(4);
				visit_count = rs.getString(5);

				resultjson.put("patient_count", patient_count);
				resultjson.put("regular_patient_count", regular_patient_count);
				resultjson.put("new_reg_count", new_reg_count);
				resultjson.put("daily_collection", daily_collection);
				resultjson.put("visit_count", visit_count);

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

	public JSONArray getTodayVisitedPatient() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String patient_name = "", city = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_today_visited_patient(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				patient_name = rs.getString(1);
				city = rs.getString(2);

				resultjson.put("patient_name", patient_name);
				resultjson.put("city", city);

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

	public String getPatientVisitHistory(String p_code) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jsonArr = null;

		try {

			jsonArr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_patient_visit_history(?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, p_code);
			cs.setObject(3, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {

				JSONObject resultjson = new JSONObject();

				resultjson.put("visit_id", rs.getString(1));
				resultjson.put("visit_date", rs.getString(2));
				resultjson.put("patient_code", rs.getString(3));

				jsonArr.put(resultjson);
			}

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

		return jsonArr.toString();
	}

	public JSONArray getVisitCount() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String visit_count = "",  month = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_visit_count(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {

				
				 month = rs.getString(1);
                visit_count = rs.getString(2);
                jarr.put(month);
				jarr.put(visit_count);
				
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

	public JSONArray getPatientHistoryDateWise(String p_code) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String patient_code = "", patient_name = "", aadhar_no = "", age = "", birth_date = "", city_desc = "",
				blood_group = "", mobile_no = "", gender = "", registration_date = "",

				visit_id = "", pulse = "", blood_pressure = "", weight = "", hb = "", temperature = "", sugar = "",
				other = "",

				complaints_desc = "", other_complaints = "", diagnosis_desc = "",

				prescription_desc = "", special_advise = "", kco = "", allergy = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_patient_history_datewise(?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, p_code);
			cs.setObject(3, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				patient_code = rs.getString(1);
				patient_name = rs.getString(2);
				aadhar_no = rs.getString(3);
				age = rs.getString(4);
				birth_date = rs.getString(5);
				city_desc = rs.getString(6);
				blood_group = rs.getString(7);
				mobile_no = rs.getString(8);
				gender = rs.getString(9);
				registration_date = rs.getString(10);

				visit_id = rs.getString(11);
				pulse = rs.getString(12);
				blood_pressure = rs.getString(13);
				weight = rs.getString(14);
				hb = rs.getString(15);
				temperature = rs.getString(16);
				sugar = rs.getString(17);
				other = rs.getString(18);

				complaints_desc = rs.getString(19);
				other_complaints = rs.getString(20);
				diagnosis_desc = rs.getString(21);

				prescription_desc = rs.getString(22);
				special_advise = rs.getString(23);
				kco = rs.getString(24);
				allergy = rs.getString(25);

				resultjson.put("patient_code", patient_code);
				resultjson.put("patient_name", patient_name);
				resultjson.put("aadhar_no", aadhar_no);
				resultjson.put("age", age);
				resultjson.put("birth_date", birth_date);
				resultjson.put("city_desc", city_desc);
				resultjson.put("blood_group", blood_group);
				resultjson.put("mobile_no", mobile_no);
				resultjson.put("gender", gender);
				resultjson.put("registration_date", registration_date);

				resultjson.put("visit_id", visit_id);
				resultjson.put("pulse", pulse);
				resultjson.put("blood_pressure", blood_pressure);
				resultjson.put("weight", weight);
				resultjson.put("hb", hb);
				resultjson.put("temperature", temperature);
				resultjson.put("sugar", sugar);
				resultjson.put("other", other);

				resultjson.put("complaints_desc", complaints_desc);
				resultjson.put("other_complaints", other_complaints);
				resultjson.put("diagnosis_desc", diagnosis_desc);

				resultjson.put("prescription_desc", prescription_desc);
				resultjson.put("special_advise", special_advise);
				resultjson.put("kco", kco);
				resultjson.put("allergy", allergy);

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
	
//Role Master
	
	public int insertUpdateRole(String role_type, int role_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_role(?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, role_type);
			cs.setInt(3, role_id);
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

	public JSONArray getRoleDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String role_id = "", role_type = "";
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

				role_id = rs.getString(1);
				role_type = rs.getString(2);

				resultjson.put("role_id", role_id);
				resultjson.put("role_type", role_type);

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
	
	
	
	
	
//Geting Users Information
	
	public JSONArray getUsersDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String users_id = "", password="" ,users_name = "", birth_date="", role_type = "", address = "", city_desc = "", district_desc="",
				gender = "", mobile_no = "", email_id = "",gov_id="";
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

				users_id = rs.getString(1);
				password = rs.getString(2);
				users_name=rs.getString(3);
				birth_date = rs.getString(4);
				role_type = rs.getString(5);
				address = rs.getString(6);
				city_desc=rs.getString(7);
				district_desc = rs.getString(8);
				gender=rs.getString(9);
				mobile_no=rs.getString(10);
				email_id = rs.getString(11);
				gov_id = rs.getString(12);

				resultjson.put("users_id", users_id);
				resultjson.put("password", password);
				resultjson.put("users_name", users_name);
				resultjson.put("birth_date", birth_date);
				resultjson.put("role_type", role_type);
				resultjson.put("address", address);
				resultjson.put("city_desc", city_desc);
				resultjson.put("district_desc", district_desc);
				resultjson.put("gender", gender);
				resultjson.put("mobile_no", mobile_no);
				resultjson.put("email_id", email_id);
				resultjson.put("gov_id", gov_id);


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

//inserting Users Data
	
	
	public int insertUpdateUsersDetails(String users_name, String password, String birth_date,
			String role_type, String address, String city_desc, String district_desc,String gender, String mobile_no,String email_id,String gov_id, int flag, int users_id) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_users_details(?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, users_name);
			cs.setString(3, password);
			cs.setString(4, birth_date);
			cs.setString(5, role_type);
			cs.setString(6, address);
			cs.setString(7, city_desc);
			cs.setString(8, district_desc);
			cs.setString(9, gender);
			cs.setString(10, mobile_no);
			cs.setString(11, email_id);
			cs.setString(12, gov_id);
			cs.setInt(13, flag);
			cs.setInt(14, users_id);
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

//Getting Patient_History
	

	public JSONArray getPatientHistory() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String visit_id = "", visit_date=" " ,patient_code = " ", complaint_desc = " ", diagnosis_desc="" , prescription_id="",prescription_desc="",re_visit="";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_patient_history(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				visit_id = rs.getString(1);
				visit_date = rs.getString(2);
				patient_code = rs.getString(3);
				complaint_desc=rs.getString(4);
				diagnosis_desc = rs.getString(5);
				prescription_id=rs.getString(6);
				prescription_desc=rs.getString(7);
				re_visit =rs.getString(8);
				

				resultjson.put("visit_id", visit_id);
				resultjson.put("visit_date",visit_date );
				resultjson.put("patient_code", patient_code);
				resultjson.put("complaint_desc", complaint_desc);
				resultjson.put("diagnosis_desc", diagnosis_desc);
				resultjson.put("prescription_id", prescription_id);
				resultjson.put("prescription_desc", prescription_desc);
				resultjson.put("re_visit", re_visit);
				

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

//report Details
	
	public JSONArray getReportDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String visit_id = "", visit_date = "", patient_code = "",patient_name="",  city_desc = "",age = "",mobile_no = "",gender = "",
				blood_group = "", complaint_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_report_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				visit_id = rs.getString(1);
				visit_date = rs.getString(2);
				patient_code = rs.getString(3);
				patient_name = rs.getString(4);
				city_desc = rs.getString(5);
				age = rs.getString(6);
				mobile_no = rs.getString(7);
				gender = rs.getString(8);
				blood_group = rs.getString(9);
				complaint_desc = rs.getString(10);

				resultjson.put("visit_id", visit_id);
				resultjson.put("visit_date", visit_date);
				resultjson.put("patient_code", patient_code);
				resultjson.put("patient_name", patient_name);
				resultjson.put("city_desc", city_desc);
				resultjson.put("age", age);
				resultjson.put("mobile_no", mobile_no);
				resultjson.put("gender", gender);
				resultjson.put("blood_group", blood_group);
				resultjson.put("complaint_desc", complaint_desc);

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
	public int insertUpdateNoticeDetails(String notice_name,String notice_desc, String from_date, String till_date,int notice_id, int flag) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_notice(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setString(2, notice_name);
			cs.setString(3, notice_desc);
			cs.setString(4, from_date);
			cs.setString(5, till_date);
			cs.setInt(6, notice_id);
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

	public JSONArray getNoticeDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_notice_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("notice_id", rs.getInt(1));
				resultjson.put("notice_name", rs.getString(2));
				resultjson.put("notice_desc", rs.getString(3));
				resultjson.put("from_date",  rs.getDate(4));
				resultjson.put("till_date",  rs.getDate(5));



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
	
	
	
	//invoice master
	
	
	
	public int insertUpdateInvoiceDetails( int patient_code,int visit_id, String inv_date, 
			  String clinic_fee, String to_be_paid,
			String paid_fee, String paid_date,String balance_amt, String transaction_id, String payment_mode , int invoice_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Invoice Code " + invoice_id);
            
			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_invoice_details(?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, patient_code);
			cs.setInt(3, visit_id);
			cs.setString(4, inv_date);
			cs.setString(5, clinic_fee);
			cs.setString(6, to_be_paid);
			cs.setString(7, paid_fee);
			cs.setString(8, paid_date);
			cs.setString(9, balance_amt);
			cs.setString(10, transaction_id);
			cs.setString(11, payment_mode);
			cs.setInt(12, invoice_id);
			cs.setInt(13, flag);

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
//getting invoice master info
	public JSONArray getInvoiceDetails() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_invoice_details(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("invoice_id", rs.getInt(1));
				resultjson.put("patient_code", rs.getString(2));
				resultjson.put("visit_id", rs.getInt(3));
				resultjson.put("invoice_date",  rs.getDate(4));
				resultjson.put("clinic_fee",  rs.getDouble(5));
				resultjson.put("to_be_paid",  rs.getDouble(6));
				resultjson.put("paid_fee",  rs.getDouble(7));
				resultjson.put("paid_date",  rs.getDate(8));
				resultjson.put("balance_amt",  rs.getDouble(9));
				



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
	
	//getting invoice id
	public JSONArray getLatestGeneratedInvoiceId() {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_latest_generated_invoice_id(?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setObject(2, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				resultjson.put("latest_invoice_id", rs.getInt(1));
				
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
	
	public int insertUpdateOutStandingInvoiceDetails( int patient_code,int visit_id, String inv_date, 
			  String clinic_fee, String to_be_paid,
			String paid_fee, String paid_date,String balance_amt, String transaction_id,String payment_mode ,int invoice_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Patient Code " + patient_code);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_crud_outstanding_invoice_details(?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, patient_code);
			cs.setInt(3, visit_id);
			cs.setString(4, inv_date);
			cs.setString(5, clinic_fee);
			cs.setString(6, to_be_paid);
			cs.setString(7, paid_fee);
			cs.setString(8, paid_date);
			cs.setString(9, balance_amt);
			cs.setString(10, transaction_id);
			cs.setString(11, payment_mode);
			cs.setInt(12, invoice_id);
			cs.setInt(13, flag);

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
	
	//update Payment Details
	
	public int updatePaymentDetails(int visit_id, String patient_code, String payment_date, String payment_mode,
			String cheque_no, String payment_upi, String online_transaction_id, String amount, String received_by, int receipt_no, 
			String discount, String invoice_total,String grand_total, String paid_amount, String balance_amount, int invoice_id,int payment_details_id, int flag) {

		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		int result = 0;
		try {

			System.out.println("Payment Mode in bean " + payment_mode);

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_update_payment_details(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.INTEGER);
			cs.setInt(2, visit_id);
			cs.setString(3, patient_code);
			cs.setString(4, payment_date);
			cs.setString(5, payment_mode);
			cs.setString(6, cheque_no);
			cs.setString(7, payment_upi);
			cs.setString(8, online_transaction_id);
			cs.setString(9, amount);
			cs.setString(10, received_by);
			cs.setInt(11, receipt_no);
			cs.setString(12, discount);
			cs.setString(13, invoice_total);
			cs.setString(14, grand_total);
			cs.setString(15, paid_amount);
			cs.setString(16, balance_amount);
			cs.setInt(17, invoice_id);
			cs.setInt(18, payment_details_id);
			cs.setInt(19, flag);

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
	
	
	
	// Report Filtering for PatientRecord
	public JSONArray filterPatientRecord1(String patient_code1, String sorted_by , String order , String date_range, String year1,String upto_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String visit_id = "", visit_date = "", patient_code = "",patient_name="",  city_desc = "",age = "",mobile_no = "",gender = "",
				blood_group = "", diagnosis_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_report_filter(?,?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, patient_code1);
			cs.setString(3, sorted_by);
			cs.setString(4, order);
			cs.setString(5, date_range);
			cs.setString(6, year1);
			cs.setString(7, upto_date);
			cs.setObject(8, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				visit_id = rs.getString(1);
				visit_date = rs.getString(2);
				patient_code = rs.getString(3);
				patient_name = rs.getString(4);
				city_desc = rs.getString(5);
				age = rs.getString(6);
				mobile_no = rs.getString(7);
				gender = rs.getString(8);
				blood_group = rs.getString(9);
				diagnosis_desc = rs.getString(10);

				resultjson.put("visit_id", visit_id);
				resultjson.put("visit_date", visit_date);
				resultjson.put("patient_code", patient_code);
				resultjson.put("patient_name", patient_name);
				resultjson.put("city_desc", city_desc);
				resultjson.put("age", age);
				resultjson.put("mobile_no", mobile_no);
				resultjson.put("gender", gender);
				resultjson.put("blood_group", blood_group);
				resultjson.put("diagnosis_desc", diagnosis_desc);

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
	
//Report filtering for City Record
	
	public JSONArray filterCityRecord(String city, String sorted_by , String order , String from_date, String upto_date) {
		Connection con = null;
		CallableStatement cs = null;
		ResultSet rs = null;

		JSONArray jarr = null;
		JSONObject finaljson = null;
		String visit_id = "", visit_date = "", patient_code = "",patient_name="",  city_desc = "",age = "",mobile_no = "",gender = "",
				blood_group = "", diagnosis_desc = "";
		try {
			jarr = new JSONArray();

			con = cf.getConnection();
			cs = con.prepareCall("{?=call fun_retrieve_city_report_filter(?,?,?,?,?,?)}");
			cs.registerOutParameter(1, Types.OTHER);
			cs.setString(2, city);
			cs.setString(3, sorted_by);
			cs.setString(4, order);
			cs.setString(5, from_date);
			cs.setString(6, upto_date);
			cs.setObject(7, rs);

			con.setAutoCommit(false); // without this the Result set is not returning
			cs.execute();
			rs = (ResultSet) cs.getObject(1);

			while (rs.next()) {
				JSONObject resultjson = new JSONObject();

				visit_id = rs.getString(1);
				visit_date = rs.getString(2);
				patient_code = rs.getString(3);
				patient_name = rs.getString(4);
				city_desc = rs.getString(5);
				age = rs.getString(6);
				mobile_no = rs.getString(7);
				gender = rs.getString(8);
				blood_group = rs.getString(9);
				diagnosis_desc = rs.getString(10);

				resultjson.put("visit_id", visit_id);
				resultjson.put("visit_date", visit_date);
				resultjson.put("patient_code", patient_code);
				resultjson.put("patient_name", patient_name);
				resultjson.put("city_desc", city_desc);
				resultjson.put("age", age);
				resultjson.put("mobile_no", mobile_no);
				resultjson.put("gender", gender);
				resultjson.put("blood_group", blood_group);
				resultjson.put("diagnosis_desc", diagnosis_desc);

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
	
	
	//Report filtering for Diagnosis Record
	
		public JSONArray filterDiagnosisRecord(String diagnosis_dex, String sorted_by , String order , String from_date, String upto_date) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
			String visit_id = "", visit_date = "", patient_code = "",patient_name="",  city_desc = "",age = "",mobile_no = "",gender = "",
					blood_group = "", diagnosis_desc = "";
			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_diagnosis_report_filter(?,?,?,?,?,?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setString(2, diagnosis_dex);
				cs.setString(3, sorted_by);
				cs.setString(4, order);
				cs.setString(5, from_date);
				cs.setString(6, upto_date);
				cs.setObject(7, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					visit_id = rs.getString(1);
					visit_date = rs.getString(2);
					patient_code = rs.getString(3);
					patient_name = rs.getString(4);
					city_desc = rs.getString(5);
					age = rs.getString(6);
					mobile_no = rs.getString(7);
					gender = rs.getString(8);
					blood_group = rs.getString(9);
					diagnosis_desc = rs.getString(10);

					resultjson.put("visit_id", visit_id);
					resultjson.put("visit_date", visit_date);
					resultjson.put("patient_code", patient_code);
					resultjson.put("patient_name", patient_name);
					resultjson.put("city_desc", city_desc);
					resultjson.put("age", age);
					resultjson.put("mobile_no", mobile_no);
					resultjson.put("gender", gender);
					resultjson.put("blood_group", blood_group);
					resultjson.put("diagnosis_desc", diagnosis_desc);

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
		
		//Report filtering for Fees Collection Record
		public JSONArray filterFeesCollectionRecord(String payment_mode, String sorted_by , String order , String from_date, String to_date) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
			String inv_no = "", inv_date = "", patitent_code = "",inv_amt="",  paid_amt = "",to_be_paid = "",mode = "",patitent_name="",city_desc="";
			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_feescollection_report_filter(?,?,?,?,?,?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setString(2, payment_mode);
				cs.setString(3, sorted_by);
				cs.setString(4, order);
				cs.setString(5, from_date);
				cs.setString(6, to_date);
				cs.setObject(7, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					inv_no = rs.getString(1);
					inv_date = rs.getString(2);
					patitent_code = rs.getString(3);
					inv_amt = rs.getString(4);
					paid_amt = rs.getString(5);
					to_be_paid = rs.getString(6);
					mode = rs.getString(7);
					patitent_name = rs.getString(8);
					city_desc = rs.getString(9);
					

					resultjson.put("inv_no", inv_no);
					resultjson.put("inv_date", inv_date);
					resultjson.put("patitent_code", patitent_code);
					resultjson.put("inv_amt", inv_amt);
					resultjson.put("paid_amt", paid_amt);
					resultjson.put("to_be_paid", to_be_paid);
					resultjson.put("mode", mode);
					resultjson.put("patitent_name", patitent_name);
					resultjson.put("city_desc", city_desc);
					
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
		
// wizard data
		
		public JSONArray getWizardData() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
			String patient_code = "", patient_name = "", date = "", prescription_desc = "", special_advise = "", kco = "",
					allergy = "", age = "", weight = "", temperature = "", sugar = "", blood_pressure = "", hb = "",
					pulse = "", complaints_desc = "", other_complaints = "", diagnosis_desc = "", gender = "",
					visit_id = "";
			try {
				jarr = new JSONArray();

				//System.out.println("getWizardFormData" + p_code);

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_wizard_data(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				//cs.setString(2, p_code);
				cs.setObject(2, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					patient_name = rs.getString(1);
					date = rs.getString(2);
					patient_code = rs.getString(3);
					prescription_desc = rs.getString(4);
					special_advise = rs.getString(5);
					age = rs.getString(6);
					weight = rs.getString(7);
					temperature = rs.getString(8);
					sugar = rs.getString(9);
					hb = rs.getString(10);
					complaints_desc = rs.getString(11);
					other_complaints = rs.getString(12);
					diagnosis_desc = rs.getString(13);
					kco = rs.getString(14);
					blood_pressure = rs.getString(15);
					allergy = rs.getString(16);
					gender = rs.getString(17);
					pulse = rs.getString(18);

					visit_id = rs.getString(19);

					resultjson.put("patient_name", patient_name);
					resultjson.put("date", date);
					resultjson.put("patient_code", patient_code);
					resultjson.put("prescription_desc", prescription_desc);
					resultjson.put("special_advise", special_advise);
					resultjson.put("age", age);
					resultjson.put("weight", weight);
					resultjson.put("temperature", temperature);
					resultjson.put("sugar", sugar);
					resultjson.put("hb", hb);
					resultjson.put("complaints_desc", complaints_desc);
					resultjson.put("other_complaints", other_complaints);
					resultjson.put("diagnosis_desc", diagnosis_desc);
					resultjson.put("kco", kco);
					resultjson.put("blood_pressure", blood_pressure);
					resultjson.put("allergy", allergy);
					resultjson.put("gender", gender);
					resultjson.put("pulse", pulse);

					resultjson.put("visit_id", visit_id);

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

		
		public int updatePrescriptionDetails(int patient_code, int visit_id,String prescription_desc) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			int result = 0;
			try {

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_update_prescription_details(?,?,?)}");
				cs.registerOutParameter(1, Types.INTEGER);
				cs.setInt(2, patient_code);
				cs.setInt(3, visit_id);
				cs.setString(4, prescription_desc);
				

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
		
		
//15-12-2021
		
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
		
	
		
		public JSONArray getCityWisePatientCount() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
			String city_desc = "", patient_count = "";
			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_city_wise_patient_count(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setObject(2, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					city_desc = rs.getString(1);
					patient_count = rs.getString(2);
					

					resultjson.put("city_desc", city_desc);
					resultjson.put("patient_count", patient_count);
					

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
				cs = con.prepareCall("{?=call fun_retrieve_visit_count(?)}");
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
		
		
		
		public int insertUpdateCompany(String company_name, int company_id, int flag) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			int result = 0;
			try {

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_crud_company(?,?,?)}");
				cs.registerOutParameter(1, Types.INTEGER);
				cs.setString(2, company_name);
				cs.setInt(3, company_id);
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

		public JSONArray getCompanyDetails() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
			String company_id = "", company_name = "";
			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_company_details(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setObject(2, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					company_id = rs.getString(1);
					company_name = rs.getString(2);

					resultjson.put("company_id", company_id);
					resultjson.put("company_name", company_name);

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
		
		public int insertUpdatemr(String mr_name, int mr_code, String mobile_no, String company_name,
				int mr_master_id, int flag) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			int result = 0;
			try {

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_crud_mr_details(?,?,?,?,?,?)}");
				cs.registerOutParameter(1, Types.INTEGER);
				cs.setString(2, mr_name);
				cs.setInt(3, mr_code);
				cs.setString(4, mobile_no);
				cs.setString(5, company_name);
				cs.setInt(6, mr_master_id);
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

		public JSONArray getmrDetails() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_mr_details(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setObject(2, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					resultjson.put("mr_master_id", rs.getInt(1));
					resultjson.put("mr_name", rs.getString(2));
					resultjson.put("mr_code", rs.getString(3));
					resultjson.put("mobile_no", rs.getString(4));
					resultjson.put("company_name", rs.getString(5));

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
		
		
		
		public int insertUpdatemrvisit(String mr_name, int mr_code, String mobile_no, String company_name,String product_list,String visit_date,
				int mr_visit_master_id, int flag) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			int result = 0;
			try {

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_crud_mr_visit_details(?,?,?,?,?,?,?,?)}");
				cs.registerOutParameter(1, Types.INTEGER);
				cs.setString(2, mr_name);
				cs.setInt(3, mr_code);
				cs.setString(4, mobile_no);
				cs.setString(5, company_name);
				cs.setString(6, product_list);
				cs.setString(7, visit_date);
				cs.setInt(8, mr_visit_master_id);
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
		
		
		
		public JSONArray getmrVisitDetails() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;

			JSONArray jarr = null;
			JSONObject finaljson = null;
			try {
				jarr = new JSONArray();

				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_mr_visit_details(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setObject(2, rs);

				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);

				while (rs.next()) {
					JSONObject resultjson = new JSONObject();

					resultjson.put("mr_visit_master_id", rs.getInt(1));
					resultjson.put("visit_date", rs.getString(2));
					resultjson.put("mr_name", rs.getString(3));
					resultjson.put("mr_code", rs.getString(4));
					resultjson.put("mobile_no", rs.getString(5));
					resultjson.put("company_name", rs.getString(6));
					resultjson.put("product_list", rs.getString(7));

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
				cs = con.prepareCall("{?=call fun_retrieve_income_n_expenses_details(?,?,?)}");
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
					resultjson.put("invoice_date", rs.getDate(2));
					resultjson.put("paid_date", rs.getDate(3));
					resultjson.put("patient_code", rs.getString(4));
					resultjson.put("payment_mode", rs.getString(5));
					resultjson.put("clinic_fee", rs.getString(6));
					resultjson.put("to_be_paid", rs.getString(7));
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
