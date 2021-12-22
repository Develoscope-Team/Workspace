package com.ipd.api;

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
import com.ipd.api.ConnectDataBean;
import com.fasterxml.jackson.core.JsonParser;

import jdk.nashorn.internal.parser.JSONParser;

@Path("/ipdapi")
public class ConnectAPI {
	
	
	
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

			Logger.log("IPD", "advice_name:: " + advice_name);

			bean = new ConnectDataBean();
			beanData = bean.insertUpdateAdvice(advice_name, advice_desc, advice_id, flag);
			Logger.log("IPD", "beandata:: " + beanData);

			if (beanData > 0) {

			}
		} catch (Exception e) {
			System.out.println(e);
			Logger.log("IPD", e);
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
			Logger.log("IPD", e);
		}

		return beanData;
	}

	
}
