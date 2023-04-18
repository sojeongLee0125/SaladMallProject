package com.teamsalad.controller;

import com.teamsalad.domain.Criteria;
import com.teamsalad.domain.PageMaker;
import com.teamsalad.domain.replyVO;
import com.teamsalad.service.ReplyService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/Reply")
public class Reply_Controller {

    @Inject
    private ReplyService service;

    // 댓글 등록
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ResponseEntity<String> Register(@RequestBody replyVO rvo, HttpSession session) throws Exception {
        // ip 변수 선언
        InetAddress local;
        String ip = null;

        // 응답 변수
        ResponseEntity<String> entity = null;

        // 세션 제어
        String id = (String) session.getAttribute("m_id");

        // 관리자 댓글
        if (id.equals("admin")) {
            service.adminUpdate(rvo);
        }

        // ip 가져오기
        try {
            local = InetAddress.getLocalHost();
            ip = local.getHostAddress();
        } catch (UnknownHostException e1) {
            e1.printStackTrace();
        }

        // 댓글 등록
        try {
            rvo.setReply_b_ip(ip);
            service.create(rvo);
            entity = new ResponseEntity<String>("registerSuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 댓글 목록
    @RequestMapping(value = "/list/{reply_b_main_num}", method = RequestMethod.GET)
    public ResponseEntity<List<replyVO>> List(@PathVariable("reply_b_main_num") Integer reply_b_main_num) {

        ResponseEntity<List<replyVO>> entity = null;

        try {
            entity = new ResponseEntity<List<replyVO>>(service.list(reply_b_main_num), HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<List<replyVO>>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 댓글 수정
    @RequestMapping(value = "/{reply_b_num}", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public ResponseEntity<String> update(@PathVariable("reply_b_num") Integer reply_b_num, @RequestBody replyVO rvo) {
        ResponseEntity<String> entity = null;

        try {
            rvo.setReply_b_num(reply_b_num);
            service.update(rvo);
            entity = new ResponseEntity<String>("modifySuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 댓글 삭제
    @RequestMapping(value = "/{reply_b_num}", method = RequestMethod.DELETE)
    public ResponseEntity<String> delete(@PathVariable("reply_b_num") Integer reply_b_num) {
        ResponseEntity<String> entity = null;

        try {
            service.delete(reply_b_num);
            entity = new ResponseEntity<String>("deleteSuccess", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 댓글 리스트 페이징 처리
    @RequestMapping(value = "paging/{reply_b_main_num}/{pageNum}", method = RequestMethod.GET)
    public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("reply_b_main_num") Integer reply_b_main_num,
                                                          @PathVariable("pageNum") Integer pageNum) {
        ResponseEntity<Map<String, Object>> entity = null;

        try {
            Criteria criteria = new Criteria();
            criteria.setPageNum(pageNum);

            List<replyVO> replyList = service.listPaging(reply_b_main_num, criteria);

            int repliesCount = service.countReplies(reply_b_main_num);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(criteria);
            pageMaker.setTotalCount(repliesCount);

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("replyList", replyList);
            map.put("pageMaker", pageMaker);

            entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

}
