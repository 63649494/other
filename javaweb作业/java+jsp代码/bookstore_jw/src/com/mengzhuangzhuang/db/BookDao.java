package com.mengzhuangzhuang.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mengzhuangzhuang.entity.Book;

public class BookDao extends DBOper{
	public List<Book> getAllBook(){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM goods";
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setid(rs.getString("id"));
			book.setgoodsName(rs.getString("goodsName"));
			book.setgoodsType(rs.getInt("goodsType"));
			book.setPrice(rs.getDouble("price"));
			book.setquantity(rs.getInt("quantity"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//根据id查找一本图书
	public Book getBookByid(String id){
			Book book = null;
			String sql = "SELECT * FROM goods WHERE id=?";
			try{
				ResultSet rs = this.executeQuery(sql, new String[] {id});
				if(rs.next()){
				book = new Book();
				book.setid(rs.getString("id"));
				book.setgoodsName(rs.getString("goodsName"));
				book.setgoodsType(rs.getInt("goodsType"));
				book.setPrice(rs.getDouble("price"));
				book.setquantity(rs.getInt("quantity"));
				}
				}catch(SQLException e){
					e.printStackTrace();
				}finally{
					this.closeAll();
				}
			return book;
		}
	//根据书名查找图书列表
	public List<Book> getBookByName(String name){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM goods WHERE goodsName LIKE '%"+name+"%'";
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setid(rs.getString("id"));
			book.setgoodsName(rs.getString("goodsName"));
			book.setgoodsType(rs.getInt("goodsType"));
			book.setPrice(rs.getDouble("price"));
			book.setquantity(rs.getInt("quantity"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//根据类型ID查找列表
	public List<Book> getBookBygoodsType(int pid){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM goods WHERE goodsType="+pid;
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setid(rs.getString("id"));
			book.setgoodsName(rs.getString("goodsName"));
			book.setgoodsType(rs.getInt("goodsType"));
			book.setPrice(rs.getDouble("price"));
			book.setquantity(rs.getInt("quantity"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//根据书名和类型查找图书
	public List<Book> getBookByNameAndPubliser(String name,int pid){
		List<Book> bookList = new ArrayList<Book>();
		String sql = "SELECT * FROM goods WHERE goodsName LIKE '%"+name+"%' And goodsType="+pid;
		try{
			ResultSet rs = this.executeQuery(sql, null);
			while(rs.next()){
			Book book = new Book();
			book.setid(rs.getString("id"));
			book.setgoodsName(rs.getString("goodsName"));
			book.setgoodsType(rs.getInt("goodsType"));
			book.setPrice(rs.getDouble("price"));
			book.setquantity(rs.getInt("quantity"));
			bookList.add(book);
			}
			}catch(SQLException e){
				e.printStackTrace();
			}finally{
				this.closeAll();
			}
		return bookList;
	}
	//添加图书
	public boolean addBook(Book book){
		boolean r = false;
		try{
			String sql = "INSERT INTO goods(id,goodsName,goodsType,price,quantity) VALUES(?,?,?,?,?)";
			int rs = this.executeUpdate(sql, new String[]{book.getid(),book.getgoodsName(),""+book.getgoodsType(),""+book.getPrice(),""+book.getquantity()});
			if(rs>0){
				//插入成功
				r = true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return r;
	}
	//修改图书
	public boolean editBook(Book book){
		boolean r = false;
		try{
			String sql = "UPDATE goods SET bookNam?,goodsType=?,price=?,quantity=? WHERE id=?";
			int rs = this.executeUpdate(sql, new String[]{book.getgoodsName(),""+book.getgoodsType(),""+book.getPrice(),""+book.getquantity(),book.getid()});
			if(rs>0){
				//修改成功
				r = true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return r;
	}
	//删除指定id的图书
	public boolean delBookByid(String id){
		boolean r = false;
		try{
			String sql = "DELETE FROM goods WHERE id=?";
			int rs = this.executeUpdate(sql, new String[]{id});
			if(rs>0){
				//修改成功
				r = true;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return r;
	}
}
