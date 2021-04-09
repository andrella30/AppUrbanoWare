import 'package:UrbanoWareCity_app/login/controller/auth_controller.dart';
import 'package:UrbanoWareCity_app/map/model/sensor_user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

class SensorUserRepository {
  final authController = GetIt.I.get<AuthController>();
  SensorUserModel sensorUserModel = SensorUserModel();

  Future<SensorUserModel> fetchSensor() async {
    final databaseReference = FirebaseDatabase.instance.reference();
    databaseReference.child(authController.userId).once().then((DataSnapshot snapshot) {
      sensorUserModel.latitudeAtual = snapshot.value['sensor']['latitudeAtual'];
      sensorUserModel.longitudeAtual = snapshot.value['sensor']['longitudeAtual'];
      sensorUserModel.temperatura = snapshot.value['sensor']['temperatura'];
      sensorUserModel.umidade = snapshot.value['sensor']['umidade'];
      sensorUserModel.pressao = snapshot.value['sensor']['pressao'];     
      sensorUserModel.indiceUv = snapshot.value['sensor']['indiceUv'];
      sensorUserModel.co  = snapshot.value['sensor']['co'];
      sensorUserModel.co2 = snapshot.value['sensor']['co2'];
      sensorUserModel.nh4 = snapshot.value['sensor']['nh4'];
      sensorUserModel.tolueno = snapshot.value['sensor']['tolueno'];
      sensorUserModel.qualidadeAr = snapshot.value['sensor']['qualidadeAr'];
      print(sensorUserModel.latitudeAtual);
      
    });
    return sensorUserModel;
  }

  testeFetch(){
    print(sensorUserModel.temperatura);
  }
}
