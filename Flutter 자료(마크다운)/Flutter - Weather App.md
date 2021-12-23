Flutter - Weather App
========

# 0. Weather App
	1. Widget lifecycle
	2. API
	3. Exception handling
	4. Http package
	5. Jason parsing
	6. Passing data

***
# 1. Widget lifecycle
	1. Stateful widgets live longer than stateless widgets!
      - stateless 위젯보다 좀 더 긴 생명주기를 가진다!

	2. Stateful widget lifecycle
      - initState method
      - build method
      - dispose method, deactivate method

***
# 2. API
	1. API: Application Programming Interface
      - "응용 프로그램에서 사용할 수 있도록, 운영 체제나 프로그래밍 언어가
         제공하는 기능을 제어할 수 있게 만든 인터페이스를 뜻한다."
         
	2. 일련의 표준화된 명령어나 기능
      - appBar, backgroundColor, textStyle..

	3. 매개 역할자로써의 API

***
# 3. Exception handling
	- try ~ catch
    try {
      실행에 실패할 수도 있는 코드
    } catch(e) {
      코드 실행에 실패할 경우 출력될 내용 (예외처리 구문)
    }

***
# 5. Jason parsing
	JSON vs. XML
	XML: eXtensible Markup Language
      - <key>value</key>
      - <날씨앱>
      -   <api>api설명</api>
      -   <json>JSON설명</json>
	http: <p></p>, <h1></h1>
    JSON: JavaScript Object Notation