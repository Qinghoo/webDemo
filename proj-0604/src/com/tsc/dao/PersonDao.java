package com.tsc.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.company.utils.BaseDbutil;
import com.company.utils.Page;
import com.tsc.popj.Person;

public class PersonDao extends BaseDbutil {
	static QueryRunner qRunner = new QueryRunner(pool);

	public void insertPerson(Person person) {
		String sql = "insert into t_person(name,age,birthday,hobbies,sex,photopath) values(?,?,?,?,?,?)";

		try {
			// new BaseDbutil();
			int i = qRunner.update(sql, person.getName(), person.getAge(), person.getBirthday(), person.getHobbies(),
					person.getSex(), person.getPhotopath());
			// System.out.println(company);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<Person> selectPersonAll(Page page, String name) {
		String sql = "select * from t_person where name like ? limit ?,?";

		try {
			// new BaseDbutil();
			List<Person> list = qRunner.query(sql, new BeanListHandler<>(Person.class), "%" + name + "%",
					page.getStartRecord(), page.getPageSize());
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public List<Person> selectPersonAll() {
		String sql = "select * from t_person";

		try {
			// new BaseDbutil();
			List<Person> list = qRunner.query(sql, new BeanListHandler<>(Person.class));
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int getCount(String name) {
		String sql = "select count(*) from t_person where name like ?";
		try {
			return ((Long) qRunner.query(sql, new ScalarHandler<>(1), "%" + name + "%")).intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Person findCompanyById(int id) {
		String sql = "select * from t_person where id=?";

		try {
			// new BaseDbutil();
			Person person = qRunner.query(sql, new BeanHandler<>(Person.class), id);
			return person;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public void updatePerson(Person person) {

		String sql = "update t_person set name=?,age=?,birthday=?,hobbies=?,sex=?,photopath=? where id=?";

		try {
			// new BaseDbutil();
			int i = qRunner.update(sql, person.getName(), person.getAge(), person.getBirthday(),person.getHobbies(),person.getSex(),person.getPhotopath(), person.getId());
			// System.out.println(company);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deletePerson(int id) {
		String sql = "delete from t_person where id=?";

		try {
			// new BaseDbutil();
			int i = qRunner.update(sql, id);
			// System.out.println(company);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
