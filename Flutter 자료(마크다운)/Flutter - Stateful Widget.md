Flutter - Stateful Widget
========

# 1. State
	- State는 데이터이다?
	- State란 UI가 변경되도록 영향을 미치는 데이터이다.
	- App 수준과 Widget 수준의 데이터가 있다.

***
# 2. Stateless Widget
	- state가 변하지 않는 위젯
	- Text("korea") => Text("France")

***
# 3. Widget tree and Element Tree
|Widget Tree|Element Treee|Render Tree|
|---|---|---|
|MyApp|MyApp element|Render object|
|Scaffold|Scaffold element|Render object|
|AppBar|AppBar elemnet|Render object|
|Text|Text element|Render object|
	- Reload vs. Rebuild
	- Are the element tree and render tree rebuilt?
	- Stateless 위젯은 rebuild만을 통해서 새로운 State 적용 가능
	- Flutter는 초당 60프레임 속도

  - container widget(white => blue) -> Hot reload -> build method -> widget tree rebuild -> <br/>Element tree link update -> Element tree' info -> Render tree -> Render object re-rendering

***
# 4. Extend(상속)
```
class DialPhone {
  int? year;
  DialPhone() {
    print("이 전화기는 다이얼을 돌려서 전화를 겁니다.");
  }
  
  void whenCame() {
    print("1889년 발명");
  }
}

class ButtonPhone extends DialPhone {
  ButtonPhone() {
    print("이 전화기는 버튼을 눌러서 전화를 겁니다.");
  }
  
  @override
  void whenCame() {
    print("1963년 발명");
  }
}

class SmartPhone extends ButtonPhone {
  String? manufacturer;
  String? model;
  
  SmartPhone(String manufacturer, String model, int year) {
    this.manufacturer = manufacturer;
    this.model = model;
    this.year = year;

    print("이 전화기는 터치를 해서 전화를 겁니다.");
  }
  
  @override
  void whenCame() {
    print("1993년 처음 등장");
  }
}

void main() {
  SmartPhone s1 = SmartPhone("제조사: 삼성", "모델명: 갤럭시 S20", 2020);
  
  print("${s1.manufacturer}, ${s1.model}, ${s1.year}");
  
  s1.whenCame();
}
```