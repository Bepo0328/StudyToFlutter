Flutter - Future-Async
========

# 1. Thread
	프로세스내에서 실행되는 흐름의 단위
    Process vs. Programe
    Dart는 싱글 스레드로 운영되는 언어
    
***
# 2. Event loop
	isolate
    1. First In First Out(FIFO) 방식으로 "MicroTask와 Event" 준비
    2. main함수 실행
    3. Event loop 실행
    
    Button tap, Fetching data, Reading files, drawing, gesture
    Future, Stream

***
# 3. Future
	1. 다트에 의해서 future 객체가 내부적인 배열에 등록
	2. Future관련해서 실행되어야 하는 코드들이 이벤트 큐에 등록
	3. 불완전한 future객체가 반환
	4. Synchronous 방식으로 실행되어야 할 코드 먼저 실행
	5. 최종적으로 실제적인 data 값이 future 객체로 전달

```
void main() {
  print('Before the Future');
  Future((){
    print('Running the Future');
  }).then((_){
    print('Future is complete');
  });
  print('After the Future');
}
```

***
# 4. Aysnc method
	1. 메서드를 통해서 나오는 결과물은 future
	2. Await 키워드를 만날때 까지 synchronous 방식으로 코드 처리
	3. await 키워드를 만나면 future가 완료될 때까지 대기
	4. future가 완료 되자마자 그 다음 코드들을 실행

```
Future<String> createOrderMessage() async {
  print('synchronous');
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
  return
    Future.delayed(
      Duration(seconds: 2), 
    () => 'Large Latte',);
}

// Synchronous
main() async {
  print('Fetching user order...');
  print(await createOrderMessage());
}
```

```
void main() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

methodA(){
  print('A');
}

methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

methodC(String from) async {
  print('C start from $from');
  
  Future((){
    print('C running Future from $from');
  }).then((_){
    print('C end of Future from $from');
  });
  
  print('C end from $from');
}

methodD(){
  print('D');
}
```