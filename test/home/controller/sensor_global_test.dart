
import 'package:UrbanoWareCity_app/home/repositories/sensor_global_repository.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  final repository = SensorGlobalRepository();
  
  test('Trazer dados do sensor', () async {
    final sensor = await repository.fetchSensors();
    print(sensor);
  });
}