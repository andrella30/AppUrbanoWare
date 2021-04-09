import 'package:UrbanoWareCity_app/home/model/sensor_global_model.dart';
import 'package:dio/dio.dart';

class SensorGlobalRepository {
  final dio = Dio();

  Future<List<SensorGlobalModel>> fetchSensors() async {
    List<SensorGlobalModel> sensors = [];
    for (int i = 1; i < 4; i++) {
      final response = await dio.get(
          'https://urbanoware-cb53e-default-rtdb.firebaseio.com/sensor0$i.json');

      final sensor = SensorGlobalModel.fromJson(response.data);
      sensors.add(sensor);
    }
    return sensors;
  }
}
