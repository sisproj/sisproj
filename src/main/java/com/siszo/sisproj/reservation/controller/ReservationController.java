package com.siszo.sisproj.reservation.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.reservation.model.ReservationService;

@Controller
@RequestMapping("/resource")
public class ReservationController {
	private static final Logger logger=LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	private ReservationService resService;

}
