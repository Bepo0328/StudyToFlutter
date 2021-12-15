Flutter - Collection and Generic
========

# 1. String interpolation
  - interpolation: 보간법
```
void main() {
  
  String name = "Sean";
  print(name);
  
  print("Hi, $name, what's up?");
}
```

***
# 2. Collection / Generic
  - Collection: 데이터들을 모아서 가지고 있는 자료구조
  - Generic: Collection이 가지고 있는 데이터들의 데이터 타입을 지정
```
int addNumber(int num1, int num2) {
  return num1 + num2;
}

void main() {
  List<dynamic> number = [];
  
  number.add(2);
  number.add("test");
  number.add(7.4);
  number.add(addNumber(3,4));
  number.add(true);
  print(number);
}
```
```
void printNumber(List<int> a) {
  print(a);
}

void main() {
  List<int> number = [];
  number.add(5);
  printNumber(number);
}
```
```
void main() {
  List<dynamic> names = [];
  
  names.addAll(["James", "John", "Tom"]);
  print(names);
}
```