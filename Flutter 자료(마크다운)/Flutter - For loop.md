Flutter - For loop
========

# 1. For loop
	1. For loop 구조
	2. For in loop 구조
	3. forEach loop 구조
	4. for loop, for in loop / 로또 프로그램
	5. Set, while loop / 로또 프로그램
	6. List.generate / 로또 프로그램


## 1.1. For loop 구조
```
void forward(int move) {
  for(int i = 0; i <= move; i++) {
    print("${i + 1}칸 이동했습니다.");
  }
}

void main() {
  forward(5);
}
```


## 1.2. For in loop 구조
```
void main() {
  List<String> rainbow = ["빨","주", "노", "초", "파", "남", "보"];
  
  for(String x in rainbow) {
    print(x);
  }
}
```

## 1.3. forEach loop 구조
```
void main() {
  List<String> carMaker = ["BMW", "Benz", "Audi", "Jaguar"];
  
  carMaker.forEach((name){
    print(name);
  });
}
```

## 1.4. for loop, for in loop / 로또 프로그램
```
import 'dart:math';

List<int> lottoNumber() {
  var random = Random();
  
  List<int> lottoList = [];
  var num;
  
  for(int i = 0; i < 6; i++) {
    num = random.nextInt(45) + 1;
    lottoList.add(num);
  }
  
  print('당첨번호');
  print(lottoList);
  
  return lottoList;
}

List<int> myNumber() {
  var random = Random();
  
  List<int> myList = [];
  var num;
  
  for(int i = 0; i < 6; i++) {
    num = random.nextInt(45) + 1;
    myList.add(num);
  }
  
  print('내 추첨번호');
  print(myList);
  
  return myList;
}

void checkNumber(lottoList, myList) {
  
  int match = 0;
  
  for(int lotto in lottoList) {
    for(int myNum in myList) {
      if(lotto == myNum) {
        match++;
        print('당첨번호: $myNum');
      }
//       print('로또번호 = $lotto');
//       print('내 추첨번호 = $myNum');
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