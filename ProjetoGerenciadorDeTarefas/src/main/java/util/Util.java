package util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import models.Categoria;
import services.CategoriaServices;

public class Util {
	
	public LocalDate formatarData(String dataString) {
		String[] dataAux = dataString.split("-");
		dataString = "";
		dataString = dataAux[2] + "/" + dataAux[1] + "/" + dataAux[0];
		
		DateTimeFormatter formato = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate data = LocalDate.parse(dataString, formato);
		return data;
	}
	
	public String criptografar(String senha) {
		String senhaCriptografada = null;
		try {
			MessageDigest algoritmo = MessageDigest.getInstance("SHA-256");
			byte[] aux = algoritmo.digest(senha.getBytes("UTF-8"));
			StringBuilder senhaHex = new StringBuilder();
			for(byte b : aux) {
				senhaHex.append(String.format("%02X", 0xFF & b));
			}
			senhaCriptografada = senhaHex.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
		return senhaCriptografada;
	}
	
	public Categoria converterParaCategoria(String categoriaParam) {
	    if (categoriaParam != null && !categoriaParam.isEmpty()) {
	        try {
	            int categoriaId = Integer.parseInt(categoriaParam);

	            Categoria categoria = new Categoria(categoriaId, null);

	            return categoria;
	        } catch (NumberFormatException e) {
	        }
	    }
	    return null; 
	    }



}
