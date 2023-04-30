import 'package:zfuel/export_all.dart';

class IconWithText extends StatelessWidget {
  final Color backgroundColor1;
  final Color backgroundColor2;
  final Color backgroundColor3;
  final Widget content1;
  final Widget content2;
  final Widget content3;
  final String text1;
  final String text2;
  final String text3;
  const IconWithText({
    Key? key,
    required this.backgroundColor1,
    required this.backgroundColor2,
    required this.backgroundColor3,
    required this.content1,
    required this.content2,
    required this.content3,
    required this.text1,
    required this.text2,
    required this.text3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(AppDimensions.height5),
                decoration: BoxDecoration(
                  color: backgroundColor1,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(child: content1),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(AppDimensions.height5),
                decoration: BoxDecoration(
                  color: backgroundColor2,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(child: content2),
              ),
            ),
            Expanded(
              child: Divider(
                thickness: 2,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(AppDimensions.height5),
                decoration: BoxDecoration(
                  color: backgroundColor3,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(child: content3),
              ),
            ),
          ],
        ),
        AppThemes.kSizedBoxHeight5,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.height5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text1),
              Text(text2),
              Text(text3),
            ],
          ),
        ),
      ],
    );
  }
}
