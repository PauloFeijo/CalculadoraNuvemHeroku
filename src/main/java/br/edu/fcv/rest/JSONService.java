package br.edu.fcv.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import br.edu.fcv.model.ApiResponse;
import br.edu.fcv.model.Produto;

@Path("/json/product")
public class JSONService {

	@GET
	@Path("/get")
	@Produces("application/json")
	public Produto getProdutoJSON() {

		Produto produto = new Produto();
		produto.setNome("Moto X - Android");
		produto.setQuantidade(10);

		return produto;

	}

	@POST
	@Path("/post")
	@Consumes("application/json")
	public Response criarProdutoJSON(Produto produto) {

		String result = "Product created : " + produto;
		return Response.status(201).entity(result).build();

	}

	@GET
	@Path("/listaprodutos")
	@Produces("application/json")
	public ApiResponse getListaProdutos() {
		List<Produto> novaLista = new ArrayList<Produto>();

		Produto Moto = new Produto();
		Moto.setNome("Moto X - Android");
		Moto.setQuantidade(10);
		novaLista.add(Moto);

		Produto Galaxy = new Produto();
		Galaxy.setNome("Galaxy 7");
		Galaxy.setQuantidade(15);
		novaLista.add(Galaxy);

		Produto Iphone = new Produto();
		Iphone.setNome("Iphone");
		Iphone.setQuantidade(5);
		novaLista.add(Iphone);

		ApiResponse apiResponse = new ApiResponse();
		apiResponse.setProdutos(novaLista);

		return apiResponse;
	}

}
