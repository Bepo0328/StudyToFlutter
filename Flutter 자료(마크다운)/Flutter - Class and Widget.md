Flutter - Class and Widget
========

# 1. Class
- 프로그래밍 상에서의 클래스란?
  - 객체가 가져야 하는 속성과 기능을 정의한 내용을 담고 있는 설계도 역할<br/><br/>
- 프로그래밍 상에서의 객체란?
  - 클래스가 정의된 후 메모리상에 할당되었을 때 이를 객체라고 함<br/><br/>
- 프로그래밍 상에서의 인스턴스란? 
  - 클래스를 기반으로 생성 됨
  - 클래스의 속성과 기능을 똑같이 가지고 있는 프로그래밍 상에서 사용되는 대상

***
# 2. Dart (DartPad)
```
class Person{
  String name = "John";
  int? age;
  String? sex;
}

void main() {
  
  Person p1 = new Person();
  p1.age = 30;
  print(p1.age);
}
```