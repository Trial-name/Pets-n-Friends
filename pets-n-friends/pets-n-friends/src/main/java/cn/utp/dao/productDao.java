package cn.utp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.utp.model.User;
import cn.utp.model.producto;
import cn.utp.model.producto.*;
public class productDao {

	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet results;


	
	public productDao(Connection con) {
		this.con = con;
	}

	public List<producto> getAllProducts(){
		List<producto> products = new ArrayList<producto>();
		
		try {
			query ="Select * from product_info;";
			pst = this.con.prepareStatement(query);
			results = pst.executeQuery();
			while (results.next()) {
				producto product = new producto();
				product.setId(results.getInt("id"));
				product.setNombre(results.getString("nombre_producto"));
				product.setDescripcion(results.getString("descripcion"));
				product.setPrecio(results.getDouble("precio"));
				product.setCategoria(results.getString("categoria"));
				product.setCantidad(results.getInt("cantidad_inventario"));
				product.setImageUrl(results.getString("image_Url"));
				
				products.add(product);
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
	
		return products; 
	}
	
	public List<producto> getRecProducts(){
		List<producto> products = new ArrayList<producto>();
		
		try {
			query ="select * from first_four_products;";
			pst = this.con.prepareStatement(query);
			results = pst.executeQuery();
			while (results.next()) {
				producto product = new producto();
				product.setId(results.getInt("id"));
				product.setNombre(results.getString("nombre_producto"));
				product.setDescripcion(results.getString("descripcion"));
				product.setPrecio(results.getDouble("precio"));
				product.setCategoria(results.getString("categoria"));
				product.setCantidad(results.getInt("cantidad_inventario"));
				product.setImageUrl(results.getString("image_Url"));
				
				products.add(product);
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
	
		return products; 
	}
	
	public List<producto> getProductsByCategory(int categoryId){
		List<producto> products = new ArrayList<producto>();
		
		try {
			query ="select * from first_four_products;";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, categoryId);
			results = pst.executeQuery();
			while (results.next()) {
				producto product = new producto();
				product.setId(results.getInt("id"));
				product.setNombre(results.getString("nombre_producto"));
				product.setDescripcion(results.getString("descripcion"));
				product.setPrecio(results.getDouble("precio"));
				product.setCategoria(results.getString("categoria"));
				product.setCantidad(results.getInt("cantidad_inventario"));
				product.setImageUrl(results.getString("image_Url"));
				
				products.add(product);
			}
					
		}catch (Exception e) {
			e.printStackTrace();
			System.out.print(e.getMessage());
		}
	
		return products; 
	}
	
}
