import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';
part 'buracos_controller.g.dart';

class BuracoController = _BuracoControllerBase with _$BuracoController;

abstract class _BuracoControllerBase with Store {
  @observable
  List<double> latitudeBuracos = [];

  @observable
  List<double> longitudeBuracos = [];

  @action
  fetchSensorBuracos() {
    final databaseReference = FirebaseDatabase.instance.reference();

    databaseReference.child('buracos').once().then((DataSnapshot snapshot) {
      for (int i = 1; i < 5; i++) {
        print(i);
        latitudeBuracos
            .add(double.parse(snapshot.value['id$i']['latitudeBuracos']));
        longitudeBuracos
            .add(double.parse(snapshot.value['id$i']['longitudeBuracos']));
      }
      print(latitudeBuracos);
      print(longitudeBuracos);
    });
  }

  @action
  zeraSensors() {
    latitudeBuracos = [];
    longitudeBuracos = [];
  }
}
