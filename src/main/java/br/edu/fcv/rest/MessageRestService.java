package br.edu.fcv.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

@Path("/calculadora")
public class MessageRestService {

	@GET
	@Path("/{param}")
	public Response printMessage(@PathParam("param") String msg) {
		String result = "Restful example alterado : " + msg;
		return Response.status(200).entity(result).build();
	}

	@GET
	@Path("/soma/{n1}/{n2}")
	public Response printMessage(@PathParam("n1") Double n1, @PathParam("n2") Double n2) {

		String result = "Resultado da soma : " + (n1 + n2);

		return Response.status(200).entity(result).build();
	}

}
