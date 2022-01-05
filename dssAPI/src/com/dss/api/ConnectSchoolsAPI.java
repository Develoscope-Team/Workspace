package com.dss.api;

import javax.ws.rs.Path;

import java.sql.Date;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.json.JSONArray;
import org.json.JSONObject;


//import com.bakeshack.api.ConnectDataBean;
//import com.bakeshack.api.ConnectDataBean;
import com.customLog.*;
import com.fasterxml.jackson.core.JsonParser;

import jdk.nashorn.internal.parser.JSONParser;

@Path("/dfapi")
public class ConnectSchoolsAPI {

	@POST
	@Path("/getAdminLoginDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int getAdminLoginDetails(@FormParam("UserName") String UserName, @FormParam("Password") String Password) {
		String loginDetailsstr = "";
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");

			Logger.log("BAFNA", "UserName:: " + UserName);
			Logger.log("BAFNA", "Password:: " + Password);
			// beanData = new JSONObject();
			bean = new ConnectDataBean();
			beanData = bean.getUsersDetails(UserName, Password);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateMedicineDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateMedicineDetails(@FormParam("medicineName") String medicineName,
			@FormParam("medicineType") String medicineType, @FormParam("medicineCategory") String medicineCategory,
			@FormParam("mgfName") String mgfName, @FormParam("mrName") String mrName,
			@FormParam("isPrintable") String isPrintable, @FormParam("isSpecial") String isSpecial,
			@FormParam("flag") int flag, @FormParam("medId") int medId) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");

			Logger.log("BAFNA", "medicineName:: " + medicineName);
			Logger.log("BAFNA", "medicineType:: " + medicineType);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateMedicineDetails(medicineName, medicineType, medicineCategory, mgfName, mrName,
					isPrintable, isSpecial, flag, medId);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMedicineDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMedicineDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("I am here");

			bean = new ConnectDataBean();
			beanData = bean.getMedicineDetails().toString();
//				Logger.log("BAFNA","beandata:: "+ beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateQualification")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateMedicineDetails(@FormParam("degree") String degree, @FormParam("degree_id") int degree_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");

			Logger.log("BAFNA", "degree:: " + degree + "degree_id:: " + degree_id + "flag:: " + flag);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateQualification(degree, degree_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getQualificationDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getQualificationDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getQualificationDetails");

			bean = new ConnectDataBean();
			beanData = bean.getQualificationDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// City
	@POST
	@Path("/insertUpdateCity")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateCityDetails(@FormParam("city") String city, @FormParam("city_id") int city_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println("I am here");

			Logger.log("BAFNA", "city:: " + city + "city_id" + city_id);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateCity(city, city_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getCityDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCityDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getCityDetails");

			bean = new ConnectDataBean();
			beanData = bean.getCityDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// district

	@POST
	@Path("/insertUpdateDistrict")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateDistrictDetails(@FormParam("district") String district,
			@FormParam("district_id") int district_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println(district);

			Logger.log("BAFNA", "District:: " + district);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateDistrict(district, district_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getDistrictDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getDistrictDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getDistrictDetails");

			bean = new ConnectDataBean();
			beanData = bean.getDistrictDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdatePatientDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePatientDetails(@FormParam("patient_name") String patient_name,
			@FormParam("birth_date") Date birth_date, @FormParam("patient_code") String patient_code,
			@FormParam("mobile_no") String mobile_no, @FormParam("city_desc") String city_desc,
			@FormParam("blood_group") String blood_group,
			@FormParam("gender") String gender,@FormParam("registration_date") Date registration_date,@FormParam("age") String age,
			@FormParam("patient_id") int patient_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println(patient_name);
			Logger.log("BAFNA", "Patient Name:: " + patient_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatePatientDetails(patient_name, birth_date, patient_code, mobile_no, city_desc,
					blood_group,gender, registration_date,age, patient_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getPatientDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPatientDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getPatientDetails");

			bean = new ConnectDataBean();
			beanData = bean.getPatientDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateVitalDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateVitalDetails(@FormParam("visit_id") int visit_id,
			@FormParam("patient_code") String patient_code, @FormParam("pulse") String pulse,
			@FormParam("blood_pressure") String blood_pressure, @FormParam("weight") String weight,
			@FormParam("hb") String hb, @FormParam("temperature") String temperature, @FormParam("sugar") String sugar,
			@FormParam("other") String other, @FormParam("vitil_id") int vitil_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println(blood_pressure);
			Logger.log("BAFNA", "Blood Pressure:: " + blood_pressure);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateVitalDetails(visit_id, patient_code, pulse, blood_pressure, weight, hb,
					temperature, sugar, other, vitil_id, flag);
//				Logger.log("BAFNA","beandata:: "+beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getVitalDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getVitalDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getPatientDetails");

			bean = new ConnectDataBean();
			beanData = bean.getVitalDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Patient Complaints

	@POST
	@Path("/insertUpdatePatientComplaints")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePatientComplaints(@FormParam("visit_id") int visit_id,
			@FormParam("patient_code") String patient_code, @FormParam("complaints_desc") String complaints_desc,
			@FormParam("other_complaints") String other_complaints, @FormParam("diagnosis_desc") String diagnosis_desc,
			@FormParam("complaints_id") int complaints_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println(complaints_desc);
			Logger.log("BAFNA", "complaints_desc:: " + complaints_desc);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatePatientComplaints(visit_id, patient_code, complaints_desc, other_complaints,
					diagnosis_desc, complaints_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getPatientComplaints")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPatientComplaints() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getPatientDetails");

			bean = new ConnectDataBean();
			beanData = bean.getPatientComplaints().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Patient Prescription

	@POST
	@Path("/insertUpdatePatientPrescription")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePatientPrescription(@FormParam("visit_id") int visit_id,
			@FormParam("patient_code") String patient_code, @FormParam("prescription_desc") String prescription_desc,
			@FormParam("special_advise") String special_advise,@FormParam("reVisit") String re_visit,
			@FormParam("prescription_id") int prescription_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {
			System.out.println(prescription_desc);
			Logger.log("BAFNA", "prescription_desc:: " + prescription_desc);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatePatientPrescription(visit_id, patient_code, prescription_desc, special_advise,re_visit,
					flag, prescription_id);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getPatientPrescription")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPatientPrescription() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getPatientPrescription");

			bean = new ConnectDataBean();
			beanData = bean.getPatientPrescription().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// template master
	@POST
	@Path("/insertUpdateMedicineTemplate")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateMedicineTemplate(@FormParam("template_name") String template_name,
			@FormParam("template_code") String template_code,
			@FormParam("template_desc") String template_desc,
			@FormParam("created_by") String created_by,
			@FormParam("created_date") String created_date,
			@FormParam("updated_by") String updated_by,
			@FormParam("update_date") String update_date,
			@FormParam("template_id") int template_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			System.out.println("template_name");
			System.out.println(template_desc);
			Logger.log("BAFNA", "template name:: " + template_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateMedicineTemplate(template_name, template_code, template_desc, created_by,
					created_date, updated_by, update_date, template_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {
				

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMedicineTemplateMaster")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMedicineTemplateMaster() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getMedicineTemplateMaster");

			bean = new ConnectDataBean();
			beanData = bean.getMedicineTemplateMaster().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Wizard Form
	@POST
	@Path("/insertWizardFormDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertWizardFormDetails(@FormParam("patientDetails") String patientDetails,
			@FormParam("vitalDetails") String vitalDetails, @FormParam("complaintsDetails") String complaintsDetails,
			@FormParam("prescriptionDetails") String prescriptionDetails, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			System.out.println(patientDetails);
			System.out.println(vitalDetails);
			System.out.println(prescriptionDetails);
			Logger.log("BAFNA", "Complaints Details:: " + complaintsDetails);

			bean = new ConnectDataBean();
			beanData = bean.insertWizardFormDetails(patientDetails, vitalDetails, complaintsDetails,
					prescriptionDetails, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/updateWizardFormDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int updateWizardFormDetails(@FormParam("patient_code") String patient_code,
			@FormParam("patientDetails") String patientDetails, @FormParam("vitalDetails") String vitalDetails,
			@FormParam("complaintsDetails") String complaintsDetails,
			@FormParam("prescriptionDetails") String prescriptionDetails, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			System.out.println(vitalDetails);
			System.out.println(prescriptionDetails);
			Logger.log("BAFNA", "Complaints Details:: " + complaintsDetails);

			bean = new ConnectDataBean();
			beanData = bean.updateWizardFormDetails(patient_code, patientDetails, vitalDetails, complaintsDetails,
					prescriptionDetails, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getWizardFormData")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getWizardFormData(@FormParam("patient_code") String patient_code) {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getWizardFormData" + patient_code);

			bean = new ConnectDataBean();
			beanData = bean.getWizardFormData(patient_code).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateComplaint")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateComplaint(@FormParam("complaint_name") String complaint_name,
			@FormParam("complaint_desc") String complaint_desc, @FormParam("complaint_id") int complaint_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "complaints_name:: " + complaint_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateComplaint(complaint_name, complaint_desc, complaint_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getComplaints")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getComplaints() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getComplaint().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateDiagnosis")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateDiagnosis(@FormParam("diagnosis_name") String diagnosis_name,
			@FormParam("diagnosis_desc") String diagnosis_desc, @FormParam("diagnosis_id") int diagnosis_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "complaints_name:: " + diagnosis_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateDiagnosis(diagnosis_name, diagnosis_desc, diagnosis_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getDiagnosis")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getDiagnosis() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getDiagnosis().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateMedicineType")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateMedicineType(@FormParam("medicine_type_name") String medicine_type_name,
			@FormParam("medicine_type_id") int medicine_type_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "medicine_type_name:: " + medicine_type_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateMedicineType(medicine_type_name, medicine_type_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMedicineType")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMedicineType() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getMedicineType().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateMedicineCategory")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateMedicineCategory(@FormParam("medicine_category_name") String medicine_category_name,
			@FormParam("medicine_category_id") int medicine_category_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "medicine_category_name:: " + medicine_category_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateMedicineCategory(medicine_category_name, medicine_category_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getMedicineCategory")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getMedicineCategory() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getMedicineCategory().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateRemark")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateRemark(@FormParam("remark_name") String remark_name,
			@FormParam("remark_desc") String remark_desc, @FormParam("remark_id") int remark_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "remark_name:: " + remark_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateRemark(remark_name, remark_desc, remark_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getRemark")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getRemark() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getRemark().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/insertUpdateAdvice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateAdvice(@FormParam("advice_name") String advice_name,
			@FormParam("advice_desc") String advice_desc, @FormParam("advice_id") int advice_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "advice_name:: " + advice_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateAdvice(advice_name, advice_desc, advice_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getAdvice")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getAdvice() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getAdvice().toString();
//				Logger.log("BAFNA","beandata:: "+beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getCitywisePatientRecord")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getCitywisePatientRecord(@FormParam("from_date") String from_date,
			@FormParam("to_date") String to_date, @FormParam("city_desc") String city_desc) {
		ConnectDataBean bean = null;
		String result = "";

		try {

			bean = new ConnectDataBean();
			result = bean.getCitywisePatientRecord(from_date, to_date, city_desc);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return result;
	}

	// Payment Details
	@POST
	@Path("/insertUpdatePaymentDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdatePaymentDetails(@FormParam("visit_id") int visit_id,
			@FormParam("patient_code") String patient_code, @FormParam("payment_date") String payment_date,
			@FormParam("payment_mode") String payment_mode, @FormParam("cheque_no") String cheque_no,
			@FormParam("payment_upi") String payment_upi,
			@FormParam("online_transaction_id") String online_transaction_id, @FormParam("amount") String amount,
			@FormParam("received_by") String received_by,
			@FormParam("receipt_no") int receipt_no,
			@FormParam("discount") String discount,
			@FormParam("invoice_total") String invoice_total,
			@FormParam("grand_total") String grand_total,
			@FormParam("paid_amount") String paid_amount,
			@FormParam("balance_amount") String balance_amount,
			@FormParam("invoice_id") int invoice_id,
			@FormParam("payment_details_id") int payment_details_id,
			@FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "payment mode name:: " + payment_mode);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdatePaymentDetails(visit_id, patient_code, payment_date, payment_mode, cheque_no,
					payment_upi, online_transaction_id, amount, received_by,receipt_no,discount,invoice_total,grand_total,paid_amount,balance_amount,invoice_id, payment_details_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getPaymentDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPaymentDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {
			System.out.println("getPaymentDetails");

			bean = new ConnectDataBean();
			beanData = bean.getPaymentDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	// Upi master

	@POST
	@Path("/insertUpdateUPI")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public int insertUpdateUPI(@FormParam("upi_name") String upi_name, 
			@FormParam("upi_id") int upi_id, @FormParam("flag") int flag) {
		ConnectDataBean bean = null;
		int beanData = 0;
		try {

			Logger.log("BAFNA", "upi_handler:: " + upi_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateUPI(upi_name, upi_id, flag);
			Logger.log("BAFNA", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getUPIDetails")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getUPIDetails() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getUPIDetails().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getStatsCounts")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getStatsCounts() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getStatsCounts().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		System.out.println(beanData);

		return beanData;
	}

	@POST
	@Path("/getTodayVisitedPatient")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getTodayVisitedPatient() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getTodayVisitedPatient().toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		System.out.println(beanData);

		return beanData;
	}

	@POST
	@Path("/getPatientVisitHistory")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPatientVisitHistory(@FormParam("patient_code") String patient_code) {
		ConnectDataBean bean = null;
		String result = "";

		try {

			bean = new ConnectDataBean();
			result = bean.getPatientVisitHistory(patient_code);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return result;
	}

	@POST
	@Path("/getVisitCount")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getVisitCount() {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getVisitCount().toString();

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}

	@POST
	@Path("/getPatientHistoryDateWise")
	@Produces(MediaType.TEXT_PLAIN)
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String getPatientHistoryDateWise(@FormParam("patient_code") String patient_code) {

		ConnectDataBean bean = null;
		String beanData = null;
		try {

			bean = new ConnectDataBean();
			beanData = bean.getPatientHistoryDateWise(patient_code).toString();
			Logger.log("BAFNA", "beandata:: " + beanData);

		} catch (Exception e) {
			System.out.println(e);
			Logger.log("BAFNA", e);
		}

		return beanData;
	}
	
	
//Role Master
	
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

				Logger.log("BAFNA", "Role:: " + role_type + "role_id" + role_id);

				bean = new ConnectDataBean();
				beanData = bean.insertUpdateRole(role_type, role_id, flag);
				Logger.log("BAFNA", "beandata:: " + beanData);

				if (beanData > 0) {

				}
			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
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
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}

		
//getting Users Details
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
//					Logger.log("BAFNA","beandata:: "+ beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
		
//insertion in users Master
		
		@POST
		@Path("/insertUpdateUsersDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public int insertUpdateUsersDetails(
				@FormParam("users_name") String users_name,
				@FormParam("password") String password,
				@FormParam("birth_date") String birth_date,
				@FormParam("role_type") String role_type,
				@FormParam("address") String address,
				@FormParam("city_desc") String city_desc,
				@FormParam("district_desc") String district_desc,
				@FormParam("gender") String gender,
				@FormParam("mobile_no") String mobile_no,
				@FormParam("email_id") String email_id,
				@FormParam("gov_id") String gov_id,
				@FormParam("flag") int flag, 
				@FormParam("users_id") int users_id) {
			ConnectDataBean bean = null;
			int beanData = 0;
			try {
				System.out.println("I am here");

				Logger.log("BAFNA", "users_name:: " + users_name);
				Logger.log("BAFNA", "password:: " + password);

				bean = new ConnectDataBean();
				beanData = bean.insertUpdateUsersDetails(users_name,password,birth_date,role_type,address, city_desc,district_desc,gender,mobile_no,
						email_id, gov_id, flag, users_id);
				Logger.log("BAFNA", "beandata:: " + beanData);

				if (beanData > 0) {

				}
			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
// getting patient History
		@POST
		@Path("/getPatientHistory")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String getPatientHistory() {

			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println("I am here");

				bean = new ConnectDataBean();
				beanData = bean.getPatientHistory().toString();
//					Logger.log("BAFNA","beandata:: "+ beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}

//report details
		
		@POST
		@Path("/getReportDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String getReportDetails() {

			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println("getReportDetails");

				bean = new ConnectDataBean();
				beanData = bean.getReportDetails().toString();
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}

		//notice Details
		
		
		@POST
		@Path("/insertUpdateNoticeDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public int insertUpdateNoticeDetails(
				@FormParam("notice_name") String notice_name,
				@FormParam("notice_desc") String notice_desc,
				@FormParam("from_date") String from_date,
				@FormParam("till_date") String till_date,	
				@FormParam("notice_id") int notice_id,
				@FormParam("flag") int flag) {
			ConnectDataBean bean = null;
			int beanData = 0;
			try {

				Logger.log("BAFNA", "notice_name:: " + notice_name);

				bean = new ConnectDataBean();
				beanData = bean.insertUpdateNoticeDetails( notice_name, notice_desc,from_date, till_date,notice_id, flag);
				Logger.log("BAFNA", "beandata:: " + beanData);

				if (beanData > 0) {

				}
			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}

		@POST
		@Path("/getNoticeDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String getNoticeDetails() {

			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println("getNoticeDetails");

				bean = new ConnectDataBean();
				beanData = bean.getNoticeDetails().toString();
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}

		
		
		//Invoice Master
		
		
		
		@POST
		@Path("/insertUpdateInvoiceDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public int insertUpdateInvoiceDetails(
				@FormParam("patient_code") int patient_code,
				@FormParam("visit_id") int visit_id,
				@FormParam("inv_date") String inv_date,
			    @FormParam("clinic_fee") String clinic_fee,
				@FormParam("to_be_paid") String to_be_paid,
				@FormParam("paid_fee") String paid_fee,
				@FormParam("paid_date") String paid_date,
				@FormParam("balance_amt") String balance_amt,
				@FormParam("transaction_id") String transaction_id,
				@FormParam("payment_mode") String payment_mode,
				@FormParam("invoice_id") int invoice_id,
				@FormParam("flag") int flag) {
			ConnectDataBean bean = null;
			int beanData = 0;
			try {

				Logger.log("BAFNA", "payment mode name:: " + patient_code);

				bean = new ConnectDataBean();
				beanData = bean.insertUpdateInvoiceDetails( patient_code,visit_id, inv_date, clinic_fee, to_be_paid,
						paid_fee, paid_date, balance_amt,transaction_id,payment_mode, invoice_id, flag);
				Logger.log("BAFNA", "beandata:: " + beanData);

				if (beanData > 0) {

				}
			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
		@POST
		@Path("/getInvoiceDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String getInvoiceDetails() {

			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println("getInvoiceDetails");

				bean = new ConnectDataBean();
				beanData = bean.getInvoiceDetails().toString();
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
		
		@POST
		@Path("/getLatestGeneratedInvoiceId")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String getLatestGeneratedInvoiceId() {

			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println("getLatestGeneratedInvoiceId");

				bean = new ConnectDataBean();
				beanData = bean.getLatestGeneratedInvoiceId().toString();
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
		@POST
		@Path("/insertUpdateOutStandingInvoiceDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public int insertUpdateOutStandingInvoiceDetails(
				@FormParam("patient_code") int patient_code,
				@FormParam("visit_id") int visit_id,
				@FormParam("inv_date") String inv_date,
			    @FormParam("clinic_fee") String clinic_fee,
				@FormParam("to_be_paid") String to_be_paid,
				@FormParam("paid_fee") String paid_fee,
				@FormParam("paid_date") String paid_date,
				@FormParam("balance_amt") String balance_amt,
				@FormParam("transaction_id") String transaction_id,
				@FormParam("payment_mode") String payment_mode,
				@FormParam("invoice_id") int invoice_id,
				@FormParam("flag") int flag) {
			ConnectDataBean bean = null;
			int beanData = 0;
			try {

				Logger.log("BAFNA", "payment mode name:: " + patient_code);

				bean = new ConnectDataBean();
				beanData = bean.insertUpdateOutStandingInvoiceDetails( patient_code,visit_id, inv_date, clinic_fee, to_be_paid,
						paid_fee, paid_date, balance_amt,transaction_id,payment_mode, invoice_id, flag);
				Logger.log("BAFNA", "beandata:: " + beanData);

				if (beanData > 0) {

				}
			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
		@POST
		@Path("/updatePaymentDetails")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public int updatePaymentDetails(@FormParam("visit_id") int visit_id,
				@FormParam("patient_code") String patient_code, @FormParam("payment_date") String payment_date,
				@FormParam("payment_mode") String payment_mode, @FormParam("cheque_no") String cheque_no,
				@FormParam("payment_upi") String payment_upi,
				@FormParam("online_transaction_id") String online_transaction_id, @FormParam("amount") String amount,
				@FormParam("received_by") String received_by,
				@FormParam("receipt_no") int receipt_no,
				@FormParam("discount") String discount,
				@FormParam("invoice_total") String invoice_total,
				@FormParam("grand_total") String grand_total,
				@FormParam("paid_amount") String paid_amount,
				@FormParam("balance_amount") String balance_amount,
				@FormParam("invoice_id") int invoice_id,
				@FormParam("payment_details_id") int payment_details_id,
				@FormParam("flag") int flag) {
			ConnectDataBean bean = null;
			int beanData = 0;
			try {

				Logger.log("BAFNA", "payment mode name:: " + payment_mode);

				bean = new ConnectDataBean();
				beanData = bean.updatePaymentDetails(visit_id, patient_code, payment_date, payment_mode, cheque_no,
						payment_upi, online_transaction_id, amount, received_by,receipt_no,discount,invoice_total,grand_total,paid_amount,balance_amount,invoice_id, payment_details_id, flag);
				Logger.log("BAFNA", "beandata:: " + beanData);

				if (beanData > 0) {

				}
			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		@POST
		@Path("/filterPatientRecord1")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String filterPatientRecord1(
			@FormParam("patient_code1") String patient_code1,
			@FormParam("sorted_by") String sorted_by,
			@FormParam("order") String order,
			@FormParam("date_range") String date_range,
			@FormParam("year1") String year1,
			@FormParam("upto_date") String upto_date) {
			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println(sorted_by);

				bean = new ConnectDataBean();
				beanData = bean.filterPatientRecord1(patient_code1,sorted_by,order,date_range,year1,upto_date).toString();
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
		
		//Api for city Report
		
		@POST
		@Path("/filterCityRecord")
		@Produces(MediaType.TEXT_PLAIN)
		@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
		public String filterCityRecord(
			@FormParam("city") String city,
			@FormParam("sorted_by") String sorted_by,
			@FormParam("order") String order,
			@FormParam("from_date") String from_date,
			@FormParam("upto_date") String upto_date) {
			ConnectDataBean bean = null;
			String beanData = null;
			try {
				System.out.println(city);
				System.out.println(from_date);
				System.out.println(upto_date);
				bean = new ConnectDataBean();
				beanData = bean.filterCityRecord(city,sorted_by,order,from_date,upto_date).toString();
				Logger.log("BAFNA", "beandata:: " + beanData);

			} catch (Exception e) {
				System.out.println(e);
				Logger.log("BAFNA", e);
			}

			return beanData;
		}
		
		
		//Api for Diagnosis Report
		
				@POST
				@Path("/filterDiagnosisRecord")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String filterDiagnosisRecord(
					@FormParam("diagnosis_dex") String diagnosis_dex,
					@FormParam("sorted_by") String sorted_by,
					@FormParam("order") String order,
					@FormParam("from_date") String from_date,
					@FormParam("upto_date") String upto_date) {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						//System.out.println(diagnosis_dex);

						bean = new ConnectDataBean();
						beanData = bean.filterDiagnosisRecord(diagnosis_dex,sorted_by,order,from_date,upto_date).toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
		
				///filterFeesCollectionRecord
				
				@POST
				@Path("/filterFeesCollectionRecord")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String filterFeesCollectionRecord(
					@FormParam("payment_mode") String payment_mode,
					@FormParam("sorted_by") String sorted_by,
					@FormParam("order") String order,
					@FormParam("from_date") String from_date,
					@FormParam("to_date") String to_date) {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println(payment_mode);

						bean = new ConnectDataBean();
						beanData = bean.filterFeesCollectionRecord(payment_mode,sorted_by,order,from_date,to_date).toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
		
		
				@POST
				@Path("/getWizardData")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getWizardData() {

					ConnectDataBean bean = null;
					String beanData = null;
					try {
						//System.out.println("getWizardFormData" + patient_code);

						bean = new ConnectDataBean();
						beanData = bean.getWizardData().toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
		
		
		
		
		
				@POST
				@Path("/updatePrescriptionDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public int updatePrescriptionDetails(@FormParam("patient_code") int patient_code,
						@FormParam("visit_id") int visit_id,
						@FormParam("prescription_desc") String prescription_desc
						) {
					ConnectDataBean bean = null;
					int beanData = 0;
					try {

						System.out.println("template_name");
						
						

						bean = new ConnectDataBean();
						beanData = bean.updatePrescriptionDetails(patient_code, visit_id, prescription_desc);
						Logger.log("BAFNA", "beandata:: " + beanData);

						if (beanData > 0) {
							

						}
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}

				
				//15-12-2021
				
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
						//Logger.log("BAKESHACK", "customer_name:: " + vendors_name);
						bean = new ConnectDataBean();
						beanData = bean.insertUpdateVendors(vendors_name, vendors_code, mobile_no, address, vendors_master_id,
								flag);
						Logger.log("BAFNA", "beandata:: " + beanData);

						if (beanData > 0) {

						}
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
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
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}

		
		
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

						Logger.log("BAFNA", "payment mode name:: " + payment_mode);

						bean = new ConnectDataBean();
						beanData = bean.insertUpdatePurchaseDetails(vendors_code, delivery_address, order_date, delivery_date,
								order_code, product_list, amount, discount, payment_mode, upi_name, total_amount,
								partial_paid_amount, balance_amount, received_bank, account_no,delivery_charges, invoice_code,credit_period, purchase_id, flag);
						Logger.log("BAFNA", "beandata:: " + beanData);

						if (beanData > 0) {

						}
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
		
		
				@POST
				@Path("/getCityWisePatientCount")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getCityWisePatientCount() {

					ConnectDataBean bean = null;
					String beanData = null;
					try {

						bean = new ConnectDataBean();
						beanData = bean.getCityWisePatientCount().toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
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

						bean = new ConnectDataBean();
						beanData = bean.getMonthWiseSaleReportForGraph().toString();

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
		
				// City
				@POST
				@Path("/insertUpdateCompany")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public int insertUpdateCompany(@FormParam("company_name") String company_name, @FormParam("company_id") int company_id,
						@FormParam("flag") int flag) {
					ConnectDataBean bean = null;
					int beanData = 0;
					try {
						System.out.println("I am here");

						Logger.log("BAFNA", "city:: " + company_name + "city_id" + company_id);

						bean = new ConnectDataBean();
						beanData = bean.insertUpdateCompany(company_name, company_id, flag);
						Logger.log("BAFNA", "beandata:: " + beanData);

						if (beanData > 0) {

						}
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}

				@POST
				@Path("/getCompanyDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getCompanyDetails() {

					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println("getCompanyDetails");

						bean = new ConnectDataBean();
						beanData = bean.getCompanyDetails().toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}

				
				@POST
				@Path("/insertUpdatemr")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public int insertUpdatemr(
						@FormParam("mr_name") String mr_name,
						@FormParam("mr_code") int mr_code,
						@FormParam("mobile_no") String mobile_no,
						@FormParam("company_name") String company_name,
						@FormParam("mr_master_id") int mr_master_id,
						@FormParam("flag") int flag) {
					ConnectDataBean bean = null;
					int beanData = 0;
					try {
						System.out.println("customer_name   : " + mr_name);
						Logger.log("BAFNA", "customer_name:: " + mr_name);
						bean = new ConnectDataBean();
						beanData = bean.insertUpdatemr(mr_name, mr_code, mobile_no, company_name, mr_master_id,
								flag);
						Logger.log("BAFNA", "beandata:: " + beanData);
						if (beanData > 0) {
						}
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}
					return beanData;
				}

				@POST
				@Path("/getmrDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getmrDetails() {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println("getmrDetails");
						bean = new ConnectDataBean();
						beanData = bean.getmrDetails().toString();
						Logger.log("BAFNA", "beandata:: " + beanData);
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}
					return beanData;
				}

			
				
				@POST
				@Path("/insertUpdatemrvisit")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public int insertUpdatemrvisit(
						@FormParam("mr_name") String mr_name,
						@FormParam("mr_code") int mr_code,
						@FormParam("mobile_no") String mobile_no,
						@FormParam("company_name") String company_name,
						@FormParam("product_list") String product_list,
						@FormParam("visit_date") String visit_date,
						@FormParam("mr_visit_master_id") int mr_visit_master_id,
						@FormParam("flag") int flag) {
					ConnectDataBean bean = null;
					int beanData = 0;
					try {
						System.out.println("customer_name   : " + mr_name);
						Logger.log("BAFNA", "customer_name:: " + mr_name);
						bean = new ConnectDataBean();
						beanData = bean.insertUpdatemrvisit(mr_name, mr_code, mobile_no, company_name,product_list,visit_date, mr_visit_master_id,
								flag);
						Logger.log("BAFNA", "beandata:: " + beanData);
						if (beanData > 0) {
						}
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}
					return beanData;
				}
				
				@POST
				@Path("/getmrVisitDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getmrVisitDetails() {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println("getmrVisitDetails");
						bean = new ConnectDataBean();
						beanData = bean.getmrVisitDetails().toString();
						Logger.log("BAFNA", "beandata:: " + beanData);
					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}
					return beanData;
				}

				
				@POST
				@Path("/getProfitAndLossDetails")
				@Produces(MediaType.TEXT_PLAIN)
				@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
				public String getProfitAndLossDetails(
						@FormParam("from_date") String from_date, @FormParam("till_date") String till_date) {
					ConnectDataBean bean = null;
					String beanData = null;
					try {
						System.out.println("api" + from_date);

						bean = new ConnectDataBean();
						beanData = bean.getProfitAndLossDetails( from_date, till_date).toString();
						Logger.log("BAFNA", "beandata:: " + beanData);

					} catch (Exception e) {
						System.out.println(e);
						Logger.log("BAFNA", e);
					}

					return beanData;
				}
				

}
