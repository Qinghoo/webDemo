package com.tsc.service;

import java.util.List;

import com.company.utils.Page;
import com.tsc.dao.PersonDao;
import com.tsc.popj.Person;

public class PersonService {
	private PersonDao dao=new PersonDao();

	public void addPerson(Person person) {
		dao.insertPerson(person);
		
	}

	public List<Person> findPersonAll(Page page,String name) {
		// TODO Auto-generated method stub
		return dao.selectPersonAll(page,name);
	}

	public List<Person> findPersonAll() {
		// TODO Auto-generated method stub
		return  dao.selectPersonAll();
	}

	public int getCount(String name) {
		// TODO Auto-generated method stub
		return dao.getCount(name);
	}

	public Person findCompanyById(int id) {
		return dao.findCompanyById(id);
	}

	public void updatePerson(Person person) {
		dao.updatePerson(person);
		
	}

	public void deletePerson(int id) {
		dao.deletePerson(id);
		
	}

}
