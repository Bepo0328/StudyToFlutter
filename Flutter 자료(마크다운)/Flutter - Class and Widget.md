Flutter - Class and Widget
========

# 1. Class and Widget 1
- 프로그래밍 상에서의 클래스란?
  - 객체가 가져야 하는 속성과 기능을 정의한 내용을 담고 있는 설계도 역할<br/><br/>
- 프로그래밍 상에서의 객체란?
  - 클래스가 정의된 후 메모리상에 할당되었을 때 이를 객체라고 함<br/><br/>
- 프로그래밍 상에서의 인스턴스란? 
  - 클래스를 기반으로 생성 됨
  - 클래스의 속성과 기능을 똑같이 가지고 있는 프로그래밍 상에서 사용되는 대상<br/><br/>
- Dart (DartPad)
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

***
# 2. Class and Widget 2
- 생성자와 관련된 함수의 구조와 기능
- 생성자의 구조와 역할
- 클래스와 위젯의 관계

```
class Person{
  String? name;
  int? age;
  String? sex;
}

int addNumber(int num1, int num2){
  return num1 + num2;
}

void main() {
  
  Person p1 = new Person();
  
  print(p1.age);
  
  addNumber(3, 4);
  print(addNumber(3, 4));
}
```

```
class Person{
  String? name;
  int? age;
  String? sex;
  
  Person({String? name, int? age, String? sex}) {
    this.name = name;
    this.age = age;
    this.sex = sex;
  }
}

void main() {
  
  Person p1 = new Person(age: 30);
  Person p2 = new Person(sex: 'male');
  
  print(p1.age);
  print(p2.sex);
}
```