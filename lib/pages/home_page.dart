import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places_world_app/cubit/app_cubit.dart';
import 'package:places_world_app/widgets/app_large_text.dart';
import 'package:places_world_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    Map<String, String> images = {
      'assets/images/image1.jpeg': 'ballonuing',
      'assets/images/image2.jpeg': 'hiking',
      'assets/images/image3.jpeg': 'kayaking',
      'assets/images/image4.jpeg': 'kayaking',
      'assets/images/image5.jpeg': 'kayaking',
    };

    return Scaffold(
      body: BlocBuilder<AppCubit, CubitState>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                  child: Row(
                    children: [
                      const Icon(Icons.menu, size: 30, color: Colors.black54),
                      const Spacer(),
                      Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: const AppLargeText(text: 'Discover'),
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding:
                        const EdgeInsets.only(left: 20.0, right: 20.0),
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const CircleTabIndicador(Color(0xFF5d69b3), 4.0),
                    tabs: const [
                      Tab(text: 'Places'),
                      Tab(text: 'Inspiration'),
                      Tab(text: 'Emotions'),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: info.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubit>(context)
                                  .datailPage(info[index]);
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.only(right: 15.0, top: 10.0),
                              width: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const Text('There'),
                      const Text('Bye'),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AppLargeText(text: 'Explore more', fontSize: 22.0),
                      AppText(
                        text: 'See all',
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white,
                                image: DecorationImage(
                                  image:
                                      AssetImage(images.keys.elementAt(index)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            AppText(
                              text: images.values.elementAt(index),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicador extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicador(this.color, this.radius);
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
