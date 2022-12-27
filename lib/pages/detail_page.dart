import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_world_app/cubit/app_cubit.dart';
import 'package:places_world_app/widgets/app_large_text.dart';
import 'package:places_world_app/widgets/app_text.dart';

import '../widgets/app_buttons.dart';
import '../widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, CubitState>(
      builder: (context, state) {
        DatailState detail = state as DatailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20.0,
                  top: 50.0,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubit>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 250,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                                text: detail.place.name, color: Colors.black54),
                            AppLargeText(
                                text: '\$${detail.place.price}',
                                color: Colors.blueGrey),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 4.0),
                            AppText(text: detail.place.location),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Wrap(
                              children: [
                                ...List.generate(
                                  5,
                                  (index) {
                                    return Icon(
                                      Icons.star,
                                      color: index < detail.place.stars
                                          ? Colors.yellow
                                          : Colors.grey,
                                    );
                                  },
                                )
                              ],
                            ),
                            const SizedBox(width: 10),
                            AppText(
                              text: '(${detail.place.stars})',
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20.0,
                        ),
                        const SizedBox(height: 4.0),
                        const AppText(
                          text: 'Number of people in your group',
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 4.0),
                        Wrap(
                          children: [
                            ...List.generate(5, (index) {
                              return InkWell(
                                onTap: (() {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                }),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: AppButtons(
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : Colors.grey.withOpacity(0.1),
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : Colors.grey.withOpacity(0.1),
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    size: 50.0,
                                    label: (index + 1).toString(),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 20.0,
                        ),
                        const SizedBox(height: 4.0),
                        AppText(text: detail.place.description),
                        const SizedBox(height: 4.0),
                        Row(
                          children: const [
                            AppButtons(
                              isIcon: true,
                              color: Colors.grey,
                              backgroundColor: Colors.white,
                              size: 60.0,
                              borderColor: Colors.black,
                              icon: Icons.favorite_border,
                            ),
                            SizedBox(width: 20.0),
                            Expanded(
                              child: ResponsiveButton(
                                isResponsive: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
