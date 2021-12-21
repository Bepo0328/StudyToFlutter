Flutter - For loop 2
========

# 1. For loop
	1. For loop 구조
	2. For in loop 구조
	3. forEach loop 구조
	4. for loop, for in loop / 로또 프로그램
	5. Set, while loop / 로또 프로그램
	6. List.generate / 로또 프로그램

## 1.5. Set, while loop / 로또 프로그램
### 1.5.1. Set
```
Set<int> rainbow = {1,2,3,4,5,6};
1,2,3,4,5,5 => {1,2,3,4,5}
```

### 1.5.2. while loop
```
while(a != 100000){
  doing something
}
```

```
import 'dart:math';

Set<int> lottoNumber() {
  final random = Random();
  final Set<int> lottoSet = {};
  
  while(lottoSet.length != 6) {
    lottoSet.add(random.nextInt(45) + 1);
  }
  
  print('당첨번호');
  print(lottoSet.toList());
  
  return lottoSet;
}

Set<int> myNumber() {
  final random = Random();
  final Set<int> mySet = {};
  
  while(mySet.length != 6) {
    mySet.add(random.nextInt(45) + 1);
  }
  
  print('내 추첨 번호');
  print(mySet.toList());
  
  return mySet;
}

void checkNumber(lottoSet, mySet) {
  
  int match = 0;
  
  for(int lotto in lottoSet) {
    for(int myNum in mySet) {
      if(lotto == myNum) {
        match++;
        print('당첨번호: $myNum');
      }
    }
  }
  
  print('$match개의 당첨번호가 있습니다!');
}

void main() {
  Set<int> lottoFinal = lottoNumber();
  Set<int> myFinal = myNumber();
  
  checkNumber(lottoFinal, myFinal);
}
```

## 1.6. List.generate / 로또 프로그램
```
void main() {
  var test = (List<int>.generate(45, (i) => i + 1)..shuffle()).sublist(0, 6);
  print(test);
}
```
```
List<int> lottoNumber() {

  var number = (List<int>.generate(45, (index) => ++index)..shuffle()).sublist(0, 6);
  
  print('당첨번호');
  print(number);
  
  return number;
}

List<int> myNumber() {
  var number2 = (List<int>.generate(45, (index) => ++index)..shuffle()).sublist(0, 6);
  
  print('내 추첨번호');
  print(number2);
  
  return number2;
}

void checkNumber(List<int> number, List<int> number2) {
  
  int match = 0;
  
  for(int lotto in number) {
    for(int myNum in number2) {
      if(lotto == myNum) {
        match++;
        print('당첨번호: $myNum');
      }
    }
  }
  
  print('$match개의 당첨번호가 있습니다!');
}

void main() {
  List<int> lottoFinal = lottoNumber();
  List<int> myFinal = myNumber();
  
  checkNumber(lottoFinal, myFinal);
}
```