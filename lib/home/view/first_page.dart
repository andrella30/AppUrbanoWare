import 'package:UrbanoWareCity_app/home/controller/home_controller.dart';
import 'package:UrbanoWareCity_app/home/view/widgets/air_quality_card.dart';
import 'package:UrbanoWareCity_app/home/view/widgets/app_bar_widget.dart';
import 'package:UrbanoWareCity_app/home/view/widgets/map_card.dart';
import 'package:UrbanoWareCity_app/home/view/widgets/temperature_card.dart';
import 'package:UrbanoWareCity_app/home/view/widgets/umidade_card.dart';
import 'package:UrbanoWareCity_app/home/view/widgets/uv_card.dart';
import 'package:UrbanoWareCity_app/map/controller/sensor_user_controller.dart';
import 'package:UrbanoWareCity_app/map/repositories/sensor_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final controller = GetIt.I.get<HomeController>();
  final controllerMap = GetIt.I.get<SensorUserController>();
  SensorUserRepository repository = SensorUserRepository();
  @override
  void initState() {
    controller.loadSensors();
    controllerMap.loadSensoruser();
    super.initState();
  }

  Future<void> _reloadPage() async {
    await Future.delayed(Duration(seconds: 1), () {
      setState(() {
        controller.loadSensors();
        controllerMap.loadSensoruser();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          AppBarWidget(
                            constraints: constraints,
                            reloadPage: _reloadPage,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * 0.2),
                            child: RefreshIndicator(
                              onRefresh: _reloadPage,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: constraints.maxWidth * 0.08,
                                  right: constraints.maxWidth * 0.08,
                                ),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    AnimationLimiter(
                                        child: Column(
                                      children: AnimationConfiguration
                                          .toStaggeredList(
                                        duration:
                                            const Duration(milliseconds: 375),
                                        childAnimationBuilder: (widget) =>
                                            SlideAnimation(
                                          horizontalOffset: 50.0,
                                          child: FadeInAnimation(
                                            child: widget,
                                          ),
                                        ),
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TemperaturaCard(
                                                constraints: constraints,
                                                temperatura: controller
                                                    .temperaturaGlobal,
                                              ),
                                              AirQualityCard(
                                                constraints: constraints,
                                                qualidadeAr: controller
                                                    .qualidadeArGlobal,
                                                co: controller.co,
                                                co2: controller.co2,
                                                nh4: controller.nh4,
                                                tolueno: controller.tolueno,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              UmidadeCard(
                                                constraints: constraints,
                                                umidade:
                                                    controller.umidadeGlobal,
                                              ),
                                              UvCard(
                                                constraints: constraints,
                                                indiceUv: controller
                                                    .indiceUvGlobal
                                                    .toInt(),
                                              )
                                            ],
                                          ),
                                          MapCard(
                                            constraints: constraints,
                              
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
