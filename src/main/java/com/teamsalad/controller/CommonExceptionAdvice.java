package com.teamsalad.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class CommonExceptionAdvice {

    private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);

    //ModelAndView 객체 : Model객체의 데이터와 view페이지 처리를 동시에 처리하는 객체
    @ExceptionHandler(Exception.class)
    public ModelAndView errModelAndView(Exception e) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("err_commons"); // err_commons.jsp 페이지
        mav.addObject("err", e); // err이름으로 e객체를 저장
        mav.addObject("ERROR", "에러발생!");
        return mav;
    }


}
