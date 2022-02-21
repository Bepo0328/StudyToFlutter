import 'package:fluent_ui/fluent_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: 'Windows APp',
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool checked = false;
  bool checked2 = false;
  double currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF53A0DEFF),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                FluentIcons.add,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                FluentIcons.add_link,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Button(
            child: const Text('Windows button'),
            onPressed: () {
              debugPrint('button pressed');
            },
            style: ButtonStyle(
                backgroundColor: ButtonState.all(Colors.white),
                elevation: ButtonState.all(10)),
          ),
          const SizedBox(
            height: 30,
          ),
          Checkbox(
            checked: checked,
            onChanged: (select) {
              setState(() {
                checked = select!;
              });
            },
            style: CheckboxThemeData(
              checkedIconColor: ButtonState.all(Colors.red),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ToggleSwitch(
            checked: checked2,
            onChanged: (select) {
              setState(() {
                checked2 = select;
              });
            },
            style: const ToggleSwitchThemeData(
              animationDuration: Duration(milliseconds: 500),
              animationCurve: Curves.bounceOut,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            width: 200,
            child: Column(
              children: [
                Slider(
                  divisions: 10,
                  value: currentValue,
                  onChanged: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                  style: SliderThemeData(
                    activeColor: Colors.red,
                  ),
                ),
                Text(
                  currentValue.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
