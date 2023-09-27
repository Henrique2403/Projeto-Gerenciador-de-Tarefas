package models;

import java.time.LocalDate;

public class Tarefa {
	
	private int id;
	private String title;
	private String descricao;
	private boolean status;
	private LocalDate created_at;
	private LocalDate dueDate;
	private Categoria categoria;
	
	public Tarefa(int id, String title, String descricao, boolean status, LocalDate created_at, LocalDate dueDate,
			Categoria categoria) {
		super();
		this.id = id;
		this.title = title;
		this.descricao = descricao;
		this.status = status;
		this.created_at = created_at;
		this.dueDate = dueDate;
		this.categoria = categoria;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public LocalDate getCreated_at() {
		return created_at;
	}

	public void setCreated_at(LocalDate created_at) {
		this.created_at = created_at;
	}

	public LocalDate getDueDate() {
		return dueDate;
	}

	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}
	
	
	
	
	
	
	
	
	
	

}
