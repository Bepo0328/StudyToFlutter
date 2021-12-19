Flutter - Final and Const variable
========

# 1. Final
```
class Person {
  final int age;
  String name;
  
  Person(this.age, this.name);
}

void main() {
  Person p1 = Person(21, 'Tom');
  print(p1.age);
}
```

***
# 2. Const
- compile-time constant는 컴파일 시에 상수가 됨
- const 변수는 선언과 동시에 초기화

***
# 3. Final and Const variable
1. const 변수는 컴파일 시에 상수화
2. final 변수는 런타임 시에 상수화
3. Compile-time constant = Run-time constant
4. final 변수는 rebuild 될 수 있음