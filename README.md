## 💡 프로젝트 소개
MVC2 구조로 구현한 전통주 판매 쇼핑몰입니다. Tailwind CSS를 사용하여 디자인하였고, kakao API에서 AccessToken을 받기위해 JAVA에서 JSON을 파싱하는 용도로 GSON라이브러리를 사용했습니다.<br>
제가 맡은 프론트&백앤드 부분은 로그인/회원가입, 로그아웃, kakao API 소셜로그인(성인인증), 메일인증, 아이디/비밀번호 찾기 기능입니다.

#### 🧙진행 기간
* 22.1.02 - 23.4.09<br>
**인원** : 5명
- 김민지, 강홍구, 최유진, 최광열, 이선우

### ⚙️ 개발 환경
- **개발언어** : Java 8, JDK 1.8.0, jstl...
- **라이브러리** : Jquery, GSON
- **프레임워크** : Tailwind CSS
- **개발도구** : Eclipse, VS Code
- **웹서버** : Apache Tomcat (v9.0)
- **데이타 베이스** : Oracle DB(11g)

## 💡 맡은 주요 기능
- 로그인/회원가입, 메인페이지, 로그아웃 : CRUD
- 소셜로그인 : kakao API, 성인인증 기능 추가
- 아이디/비밀번호 찾기 : 메일인증

## 💡 DB 설계(ERD)
![image](https://github.com/RedNine97/KIC4_Project3/assets/117744969/7c954ef8-6954-4e7a-aaf3-4787bfd2464d)

## 💡 개발 내용
**밸로그 링크** <br>
[로그인/회원가입)(https://velog.io/@ghdrn221/%EC%A3%BC%EB%A5%98-%ED%8C%90%EB%A7%A4-%EC%87%BC%ED%95%91%EB%AA%B0)<br>
[id/pwd 찾기1](https://velog.io/@ghdrn221/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%A3%BC%EB%A5%98-%ED%8C%90%EB%A7%A4-%EC%87%BC%ED%95%91%EB%AA%B02)<br>
[id/pwd 찾기2](https://velog.io/@ghdrn221/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8idpwd-%EC%B0%BE%EA%B8%B02)<br>
[zpcode el(막혔던 부분)](https://velog.io/@ghdrn221/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8zpcode-el-DB-%ED%85%8C%EC%9D%B4%EB%B8%94)<br>
[id/pwd 찾기3](https://velog.io/@ghdrn221/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8idpwd-%EC%B0%BE%EA%B8%B03)<br>
[id/pwd 찾기4](https://velog.io/@ghdrn221/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8idpwd-%EC%B0%BE%EA%B8%B04)<br>
[소셜로그인(삽질)](https://velog.io/@ghdrn221/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%86%8C%EC%85%9C%EB%A1%9C%EA%B7%B8%EC%9D%B8)<br>
[소셜로그인2](https://velog.io/@ghdrn221/%ED%8C%80%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8%EC%86%8C%EC%85%9C%EB%A1%9C%EA%B7%B8%EC%9D%B82)<br>
[메인페이지](https://velog.io/@ghdrn221/%EB%A9%94%EC%9D%B8%ED%8E%98%EC%9D%B4%EC%A7%80)<br>

## 💡 느낀점
프론트엔드에서는 프레임워크인 Tailwind CSS를 다뤄볼수있었고, 반응형 웹을 구현할수있게 되었습니다. 유효성검사 등의 기능을 자바스크립트와 Jquery, Ajax를 사용해서 구현할수 있게되었습니다.
백엔드에서는 프로젝트를 하면서 mvc2구조에 대해서 정확히 알수있었고, 로그인/회원가입을 구현하면서 crud를 어느정도 할수있게 되었습니다. 카카오 소셜로그인을 구현하면서 API를 사용해봤고, json객체를 파싱해 볼 수도 있었습니다.
