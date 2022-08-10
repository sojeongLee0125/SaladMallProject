<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="col-lg-4 col-md-5">
                   <div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>Weekly Popular</h4>
							<div class="blog__sidebar__recent">
								<c:forEach var="item" items="${weeklyPopular }">
									<a href="../R_Board/board_detail?rcp_b_num=${item.board.rcp_b_num }" class="blog__sidebar__recent__item">
									<div class="blog__sidebar__recent__item__pic">
										<img src="${filePath}${item.board.rcp_b_thumbnail}" alt="">
									</div>
									<div class="blog__sidebar__recent__item__text">
										<h6>${item.board.rcp_b_title }<%-- <br /> ${item.board.rcp_b_content } --%></h6>
										<span>${item.board.rcp_b_date }</span>
									</div>
									</a>
								</c:forEach>
							</div>
						</div>      
						<div class="blog__sidebar__item">
							<h4>Search By Recipe Board</h4>
							<div class="blog__sidebar__search">
								<form action="#">
									<input id="searchText" type="text" placeholder="Search..." autocomplete="off">
									<button type="submit"><span class="icon_search"></span></button>
								</form>
							</div>
							<!-- 스크롤바 숨기기 css 작성해야함 -->
							<ul id="autoText">
							</ul>
						</div>      
                   </div>
               </div>
