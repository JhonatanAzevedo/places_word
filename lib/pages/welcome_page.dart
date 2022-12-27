import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_world_app/cubit/app_cubit.dart';
import 'package:places_world_app/widgets/app_large_text.dart';

import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _HomePageState();
}

class _HomePageState extends State<WelcomePage> {
  List<String> images = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: ((context, index) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 40, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppLargeText(text: 'Viagens'),
                  const AppText(text: 'Montanha', fontSize: 30.0),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppText(
                        text:
                            'Caminhar nas montanhas proporciona\numa incrível sensação de liberdade\njunto com testes de resistência',
                        color: Color(0xFF878593),
                        fontSize: 14.0,
                      ),
                      Column(
                        children: [
                          ...List.generate(
                            3,
                            (indexDots) {
                              return Container(
                                margin: const EdgeInsets.only(bottom: 2.0),
                                width: 8.0,
                                height: index == indexDots ? 24.0 : 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: index == indexDots
                                      ? const Color(0xFF5d69b3)
                                      : const Color(0xFF5d69b3)
                                          .withOpacity(0.3),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      BlocProvider.of<AppCubit>(context).getData();
                    },
                    child: const ResponsiveButton(width: 120.0),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
