# <center> :tomato: SaladMall - 첫 번째 팀 프로젝트 : 샐러드 쇼핑몰 제작</center>
<br>

![image](https://user-images.githubusercontent.com/92525310/149265167-e87e19a5-ea38-4800-95bb-5703feedd350.png)

## 1. 프로젝트 소개

### - Spring MVC 패턴의 샐러드 쇼핑몰
- 5단계의 주문 과정을 통해 고객이 직접 샐러드 재료를 선택 할 수 있는 쇼핑몰
- 자신의 레시피를 레시피 게시판에 등록하여 다른 사람들과 공유 할 수 있다.
- 고객 게시판을 통해 주문 및 상품에 대한 내용을 문의 할 수 있다.

### - 관리자 아이디 로그인 시 관리자 페이지로 이동
- 실시간 주문 내역과 고객 정보 파악 가능
- 샐러드 재료 등록 및 관리
- 쿠폰 발급 및 쿠폰 내역 조회 가능

## 2. 개발환경

![image](https://user-images.githubusercontent.com/92525310/148393565-f53a059f-8189-4b1d-86df-b6ad0dfd754f.png)

- JavaSE 1.8
- Spring Framework ver 4.3.8 RELEASE
- Tomcat ver 8.5
- MySQL Server ver 5.7

## 3. 제작 기간 및 참여인원

- 2021년 9월 1일 ~ 10월 7일 (약 한 달 간)
- 팀원 총 8명
- 나의 역할 : 팀장 / 관리자 페이지 기능 전체 + 로그인 및 회원 마이페이지 전체 구현

## 4. 기획 내용

### - UML
![01 0910_UML](https://user-images.githubusercontent.com/92525310/149267222-dd2da9fa-2b6c-419e-98c2-a9daccacff22.jpg)

### - 디비 설계 

![image](https://user-images.githubusercontent.com/92525310/149462199-4428181a-83e9-49f1-aa2a-f9da719a58c0.png)
 
## 4. 핵심 기능 설명

### 1> 검색 기능 : 검색할 테이블 선택 후 검색어를 모든 컬럼에 검색하여 결과 반환

1. 검색할 테이블 선택

2. 선택한 테이블의 기본키 컬럼 이름 가져오기
	
 > SELECT COLUMN_NAME <br>
 > FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE <br>
 > WHERE TABLE_NAME = #{table_name} <br>
 > AND CONSTRAINT_NAME = 'PRIMARY' <br>

3. 선택한 테이블 모든 컬럼 이름 가져오기
> SELECT column_name as 'columns' FROM information_schema.columns <br>
> WHERE table_name=#{table_name} <br>

4. 가져온 컬럼 중 검색에 제외할 컬럼 선택 후 제외

5. 각 컬럼별 검색할 데이터 검색하여 ( like '%데이터%' ) 기본키 값 가져오기

6. 검색한 기본키 값으로 해당 테이블 모든 값 가져오기 <br>
   (각 테이블마다 Bean이 다르므로 Object 타입으로 업 캐스팅 후 다운 캐스팅)

7. 불러온 값들을 SeachVO타입으로 변환하여 결과 반환 후 jsp페이지에 출력 

### 2> 샐러드 레시피 저장 방식  <br>

    ⓐ 선택한 재료의 고유번호를 오름차순이나 내림차순으로 정렬하여 구분자(,)로 구분한다
    ex) 3 2 5 4 1 -> 1,2,3,4,5
    ⓑ 재료 종류에 따라 구분자(/)로 구분하여 합친다.(순서를 야채 육류 소스로 예시)
    ex) 1,3,5/6,7,10/81,87
    ⓒ ⓑ의 레시피를 db에 저장하되 유니크 속성으로 중복 확인 한다.

## 5. 주요 기능

1> <b> 로그인 및 회원가입 </b>
- 회원가입 유효성 검사 (ajax(비동기 방식)으로 구현)
- 회원가입 시 이메일 인증 (SMTP)
- 회원가입 시 우편주소 api로 주소 불러오기
- 소셜로그인 정보 받아서 회원가입으로 연결하기
- 아이디/비밀번호 찾기 (이메일 인증)

2> <b> 마이 페이지 </b>
- 회원 정보 조회, 수정, 삭제하기
- 나의 등급, 쿠폰 조회하기
- 주문정보 조회, 수정, 삭제하기

3> <b> 샐러드 주문하기 </b>
- 커스터마이징(옵션선택)주문
- 나만의 레시피 등록
- 실시간 금액 합계 반영
- 장바구니 추가 및 삭제
- 선택된 레시피 결제

4> <b> 레시피 게시판 </b>
- 주간 인기 레시피 조회
- 조건에 맞는 레시피 검색
- 레시피 리뷰 등록하기 및 파일 업로드
- 좋아요 기능(찜)

5> <b> 고객센터 </b>
- 1대1 문의 카테고리 설정
- 문의글 작성, 수정, 삭제하기
- 관리자 전용 답변 기능 구현
- 댓글 달기 기능 구현

6> <b> 관리자 페이지 </b>
- 회원관리하기 : 전체 회원정보 조회, 수정, 삭제
- 주문관리하기 : 전체 주문정보 조회, 수정, 취소
- 인기 레시피 게시판 관리
- 주간 인기상품 등록하기
- 쿠폰 관리, 쿠폰 등록하기 (조건에 맞게 발급)
- 재료정보 등록, 수정, 삭제

## 📈 발표자료_PPT

<details>
<summary>발표 자료 보기</summary>
<div markdown="1">
1. <img src="https://user-images.githubusercontent.com/92525310/148395220-0d0876e5-a3ee-46af-894e-57432880069a.png">
2. <img src="https://user-images.githubusercontent.com/92525310/148395267-a1520e6e-65ca-407e-9264-83e1a0896751.png">
3. <img src="https://user-images.githubusercontent.com/92525310/148395318-ef1e4993-a630-46d3-85ef-28bd229ef341.png">
4. <img src="https://user-images.githubusercontent.com/92525310/148395367-a8055ae9-43c9-465a-ba52-3c37b74edb5b.png">
5. <img src="https://user-images.githubusercontent.com/92525310/148395400-9705ba11-5a6b-4565-b1eb-c395b27af26f.png">
6. <img src="https://user-images.githubusercontent.com/92525310/148395455-b446778e-7ba0-4d8f-bdd1-ed7410d58669.png">
7. <img src="https://user-images.githubusercontent.com/92525310/148395501-a5fa18fa-62e1-4f4d-9874-29d5e973e8fa.png">
8. <img src="https://user-images.githubusercontent.com/92525310/148395541-2acec542-6aff-46b5-8eb4-af3e0ec40555.png">
   <img src="https://user-images.githubusercontent.com/92525310/148395567-ca44eb0c-cf67-4fec-8f4a-7c4b1d6daefc.png">
</div>
</details>







