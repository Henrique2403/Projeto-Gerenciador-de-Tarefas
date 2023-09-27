package models;

public class Categoria {
	
	private int category_id;
	private String nome;
	
	public Categoria(int category_id, String nome) {
		super();
		this.category_id = category_id;
		this.nome = nome;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
	
	
	
	
	

}
