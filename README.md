# <center> 😎 두번째 프로젝트 : 커스터마이징 샐러드 쇼핑몰 </center>
<br>

![image](https://user-images.githubusercontent.com/92525310/149265167-e87e19a5-ea38-4800-95bb-5703feedd350.png)

## 1. 프로젝트 소개
- 5단계의 주문 과정을 통해 고객이 직접 샐러드 재료를 선택 할 수 있는 샐러드 쇼핑몰.
- 자신의 레시피를 레시피 게시판에 등록하여 다른 사람들과 공유 할 수 있다.

## 2. 개발환경
![image](https://user-images.githubusercontent.com/92525310/148393565-f53a059f-8189-4b1d-86df-b6ad0dfd754f.png)
- JavaSE 1.8
- Spring Framework ver 4.3.8 RELEASE
- Tomcat ver 8.5
- MySQL Server ver 5.7

## 3. 제작 기간 및 참여인원
- 2021년 9월 1일 ~ 10월 7일
- 참여 인원 : 6명

## 4. 기획 내용
### - UML
![01 0910_UML](https://user-images.githubusercontent.com/92525310/149267222-dd2da9fa-2b6c-419e-98c2-a9daccacff22.jpg)

### - 디비 설계
![image](https://user-images.githubusercontent.com/92525310/149462199-4428181a-83e9-49f1-aa2a-f9da719a58c0.png)
 
## 5. 핵심 기능 설명

### 1) 검색 기능
1. 검색할 테이블을 선택한다.
2. 선택한 테이블의 기본키 컬럼 이름을 가져온다.
 > SELECT COLUMN_NAME <br>
 > FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE <br>
 > WHERE TABLE_NAME = #{table_name} <br>
 > AND CONSTRAINT_NAME = 'PRIMARY' <br>
3. 선택한 테이블의 모든 컬럼 이름을 가져온다.
> SELECT column_name as 'columns' <br>
> FROM information_schema.columns <br>
> WHERE table_name=#{table_name} <br>
4. 가져온 컬럼 중 검색에 제외할 컬럼 선택 후 제외한다.
5. 각 컬럼별 검색할 데이터 검색하여 ( like '%데이터%' ) 기본키 값을 가져온다.
6. 검색한 기본키 값으로 해당 테이블 모든 값 가져온다.<br>
   (각 테이블마다 Bean이 다르므로 Object 타입으로 업 캐스팅 후 다운 캐스팅)
7. 불러온 값들을 SeachVO타입으로 변환하여 결과 반환 후 jsp 페이지에서 출력한다. 

### 2) 샐러드 레시피 저장 기능

    ⓐ 선택한 재료의 고유번호를 오름차순이나 내림차순으로 정렬하여 구분자(,)로 구분한다
    ex) 3 2 5 4 1 -> 1,2,3,4,5
    ⓑ 재료 종류에 따라 구분자(/)로 구분하여 합친다.(순서 - 야채 육류 소스)
    ex) 1,3,5/6,7,10/81,87
    ⓒ ⓑ의 레시피를 db에 저장하되 유니크 속성으로 중복 확인 한다.

## 6. 주요 기능

1) <b> 로그인 및 회원가입 </b>
- 회원가입 유효성 검사 (Ajax)
- 회원가입 시 이메일 인증 (SMTP)
- 회원가입 시 우편 주소 OPEN-API 주소 불러오기
- 소셜 로그인 정보 받아서 회원 가입으로 연결
- 아이디/비밀번호 찾기 (이메일 인증)

2) <b> 마이 페이지 </b>
- 회원 정보 조회, 수정, 삭제
- 나의 등급, 쿠폰 조회
- 주문정보 조회, 수정, 삭제

3) <b> 샐러드 주문 </b>
- 커스터마이징(옵션 선택) 주문
- 나만의 레시피 등록
- 실시간 금액 합계 반영
- 장바구니 추가 및 삭제
- 선택된 레시피 결제

4) <b> 레시피 게시판 </b>
- 주간 인기 레시피 조회
- 조건에 맞는 레시피 검색
- 레시피 리뷰 등록하기 및 파일 업로드
- 좋아요 기능

5) <b> 고객센터 </b>
- 1대1 문의 카테고리 설정
- 문의글 작성, 수정, 삭제
- 관리자 전용 답변 기능
- 댓글 달기 기능

6) <b> 관리자 페이지 </b>
- 회원 관리 : 전체 회원정보 조회, 수정, 삭제
- 주문 관리 : 전체 주문정보 조회, 수정, 취소
- 인기 레시피 관리
- 주간 인기상품 등록
- 쿠폰 관리, 쿠폰 등록 (조건에 맞게 발급)
- 재료정보 등록, 수정, 삭제

## 7. 회고
- Spring MVC 구조의 웹 어플리케이션
- 








