import 'package:zfuel/export_all.dart';
import 'package:intl/intl.dart';

class TestPage extends StatefulWidget {
  static const String id = "/TestPage";
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
