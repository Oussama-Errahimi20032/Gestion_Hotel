package dao;

import java.util.List;

import entities.Hotel;
import jakarta.ejb.Remote;

@Remote
public interface IDaoRemote <T> {
	
	T create(T o);
	T update(T o);
	boolean delete(T o);
	T findById(int id);
	List<T> findAll();
	List<Hotel> findByVille(String name);
	

}
