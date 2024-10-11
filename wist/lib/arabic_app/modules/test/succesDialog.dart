import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shard/components/components.dart';
import '../../shard/styles/color.dart';

class SuccessDialog extends StatefulWidget {
  const SuccessDialog({super.key});

  @override
  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return Colors.white;
                }
                return Colors.deepOrange; // Use the component's default.
              },
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: ColorMain.colorMain,
                  child: Stack(
                    children: [
                      Transform.translate(
                        offset: const Offset(20.0, -100.0),
                        child: SvgPicture.asset(
                          'assets/Stars.svg',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: SvgPicture.asset('assets/Reload 2.svg',fit: BoxFit.cover,),
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    child: SvgPicture.asset('assets/levelButton.svg'),
                                  ),
                                ],
                              ),
                            ),
                            SvgPicture.asset('assets/Gift.svg'),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: defultButton( pagename: () {  }, text: 'التالي'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Text('Dialog'),
        ),
      ),
    );
  }
}
