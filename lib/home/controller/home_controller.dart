import 'package:UrbanoWareCity_app/home/model/sensor_global_model.dart';
import 'package:UrbanoWareCity_app/home/repositories/sensor_global_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  SensorGlobalRepository _sensorGlobalRepository;

  _HomeControllerBase() {
    _sensorGlobalRepository = SensorGlobalRepository();
  }

  @observable
  double temperaturaGlobal = 0;

  @observable
  double umidadeGlobal = 0;

  @observable
  double qualidadeArGlobal = 0;

  @observable
  double indiceUvGlobal = 0;

  @observable
  double co = 0;

  @observable
  double co2 = 0;

  @observable
  double nh4 = 0;

  @observable
  double tolueno = 0;

  @action
  loadSensors() async {
    List<SensorGlobalModel> sensorList = [];

    sensorList = await _sensorGlobalRepository.fetchSensors();

    temperaturaGlobal = 0;
    umidadeGlobal = 0;
    qualidadeArGlobal = 0;
    indiceUvGlobal = 0;

    for (int i = 0; i < sensorList.length; i++) {
      temperaturaGlobal = sensorList[i].temperatura + temperaturaGlobal;
      umidadeGlobal = sensorList[i].umidade + umidadeGlobal;
      qualidadeArGlobal = sensorList[i].qualidadeAr + qualidadeArGlobal;
      indiceUvGlobal = sensorList[i].indiceUv + indiceUvGlobal;
      co = sensorList[i].co + co;
      co2 = sensorList[i].co2 + co2;
      nh4 = sensorList[i].nh4 + nh4;
      tolueno = sensorList[i].tolueno + tolueno;
    }

    temperaturaGlobal = temperaturaGlobal / sensorList.length;
    umidadeGlobal = umidadeGlobal / sensorList.length;
    qualidadeArGlobal = qualidadeArGlobal / sensorList.length;
    indiceUvGlobal = indiceUvGlobal / sensorList.length;
    co = co / sensorList.length;
    co2 = co2 / sensorList.length;
    nh4 = nh4 / sensorList.length;
    tolueno = tolueno / sensorList.length;
  }
}
