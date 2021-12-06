Flutter - Wideget
========

# 1. Flutter 상에서의 위젯이란?
## 1.1. Widget
	1. 독립적으로 실행되는 작은 프로그램
	2. 주로 바탕화면 등에서 날씨나 뉴스, 생활정보 등을 보여줌
	3. 그래픽이나 데이터 요소를 처리하는 함수를 가지고 있음
  
## 1.2. What is Widget in flutter?
	1. UI를 만들고 구성하는 모든 기본 단위 요소 (image, text, icon, Text field, button)
	2. 눈에 보이지 않는 요소들까지 위젯 (center, column, padding)
	3. Everything is a widget 

***  
# 2. Stateless widgets vs. Sateful widgets
### 2.1. Stateless와 Stateful의 일반적인 의미
	1. Stateful -> value 값을 지속적으로 추적 보존
	2. Stateless -> 이전 상호작용의 어떠한 값도 저장하지 않음
	
### 2.2. Types of Widgtes
	1. Stateless Widgets (움직임이 없는 정적인 위젯)
	2. Stateful Widgets (계속 움직임이나 변화가 있는 위젯)
	
### 2.3. Stateless Widgtes
	1. 스크린상에 존재만 할 뿐 아무것도 하지 않음
	2. 어떠한 실시간 데이터도 저장하지 않음
	3. 어떤 변화 (모양, 상태)를 유발시키는 value값을 가지지 않음
	
### 2.4. Stateful Widgets
	1. 사용자의 interaction에 따라서 모양이 바뀜
	2. 데이터를 받게 되었을 때 모양이 바뀜
	
***
# 3. Widget tree
## 3.1. Flutter Widget tree
	1. Widget들은 tree 구조로 정리될 수 있음
	2. 한 Widget내에 얼마든지 다른 widget들이 포함될 수 있음
	3. Widget은 부모 위젯과 자식 위젯으로 구성
	4. Parent widget을 widget container라고 부르기도 함

***
# Summary
	1. Flutter의 모든 것은 Widget
	2. 위젯이 전혀 변화가 없으면 stateless widget
	3. 위젯의 모양이나 상태가 바뀐다면 stateful widget
	4. 위젯은 트리구조로 구성되어 있다