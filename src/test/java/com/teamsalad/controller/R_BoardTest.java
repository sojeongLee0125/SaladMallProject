package com.teamsalad.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.teamsalad.persistence.R_BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class R_BoardTest {
	
	@Inject
	private R_BoardDAO dao;
	
	@Test
	public void searchTest() throws Exception {
		List<Integer> rcp_b_nums = dao.r_Board_searchData("rcp_b_title", "t");
	}
}
