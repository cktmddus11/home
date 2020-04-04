package com.studyspring.db;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import dto.Student;

public class SelectMain {

	public static void main(String[] args) {
		Selectmember select = new Selectmember();
		
		Student student = select.getStudentById("hajunghwan");
		System.out.println(student);
		System.out.println("=====spring template 이용=========");
		
		ClassPathXmlApplicationContext context = 
				new ClassPathXmlApplicationContext("com/studyspring/db/dbstudy.xml");
		Selectmember select2 = context.getBean(Selectmember.class);
		Student student2 = select2.getStudentById2("hajunghwan");
		System.out.println(student2);
	}

}
