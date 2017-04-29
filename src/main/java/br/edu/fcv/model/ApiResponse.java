package br.edu.fcv.model;

import java.util.List;

public class ApiResponse {

	public ApiResponse() {

	}

	private List<Produto> produtos;

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}

}