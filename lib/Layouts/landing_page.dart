import 'package:flutter/material.dart';
import 'package:spo_act/Layouts/login.dart';
import 'package:spo_act/widgets/custom_sized_box.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CustomSizedBox(
                height: 50,
              ),
              const Text(
                'Success starts with self-discipline.',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Make your workout so good that your excuses feel guilty.',
                style: TextStyle(
                  fontSize: 21,
                  color: Color(0xFF3D3F3E),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              SvgPicture.asset(
                'images/health_sports.svg',
                height: 469.95,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (builder) => const Login(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(
                      0xFF056333,
                    ),
                  ),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
      // body: OrientationBuilder(
      //   builder: (context, orientation) {
      //     print(orientation);
      //     return Center(
      //       child: Text(
      //         'Orientation: ${orientation == Orientation.portrait ? 'Portrait' : 'Landscape'}',
      //         style: const TextStyle(fontSize: 24),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
