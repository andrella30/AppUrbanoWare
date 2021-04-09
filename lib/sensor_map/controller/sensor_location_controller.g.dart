// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SensorLocationController on _SensorLocationControllerBase, Store {
  final _$circlesAtom = Atom(name: '_SensorLocationControllerBase.circles');

  @override
  Set<Circle> get circles {
    _$circlesAtom.reportRead();
    return super.circles;
  }

  @override
  set circles(Set<Circle> value) {
    _$circlesAtom.reportWrite(value, super.circles, () {
      super.circles = value;
    });
  }

  final _$temperaturaSensorAtom =
      Atom(name: '_SensorLocationControllerBase.temperaturaSensor');

  @override
  List<double> get temperaturaSensor {
    _$temperaturaSensorAtom.reportRead();
    return super.temperaturaSensor;
  }

  @override
  set temperaturaSensor(List<double> value) {
    _$temperaturaSensorAtom.reportWrite(value, super.temperaturaSensor, () {
      super.temperaturaSensor = value;
    });
  }

  final _$umidadeSensorAtom =
      Atom(name: '_SensorLocationControllerBase.umidadeSensor');

  @override
  List<double> get umidadeSensor {
    _$umidadeSensorAtom.reportRead();
    return super.umidadeSensor;
  }

  @override
  set umidadeSensor(List<double> value) {
    _$umidadeSensorAtom.reportWrite(value, super.umidadeSensor, () {
      super.umidadeSensor = value;
    });
  }

  final _$indiceUvSensorAtom =
      Atom(name: '_SensorLocationControllerBase.indiceUvSensor');

  @override
  List<int> get indiceUvSensor {
    _$indiceUvSensorAtom.reportRead();
    return super.indiceUvSensor;
  }

  @override
  set indiceUvSensor(List<int> value) {
    _$indiceUvSensorAtom.reportWrite(value, super.indiceUvSensor, () {
      super.indiceUvSensor = value;
    });
  }

  final _$qualidadeArSensorAtom =
      Atom(name: '_SensorLocationControllerBase.qualidadeArSensor');

  @override
  List<double> get qualidadeArSensor {
    _$qualidadeArSensorAtom.reportRead();
    return super.qualidadeArSensor;
  }

  @override
  set qualidadeArSensor(List<double> value) {
    _$qualidadeArSensorAtom.reportWrite(value, super.qualidadeArSensor, () {
      super.qualidadeArSensor = value;
    });
  }

  final _$latitudeSensorAtom =
      Atom(name: '_SensorLocationControllerBase.latitudeSensor');

  @override
  List<String> get latitudeSensor {
    _$latitudeSensorAtom.reportRead();
    return super.latitudeSensor;
  }

  @override
  set latitudeSensor(List<String> value) {
    _$latitudeSensorAtom.reportWrite(value, super.latitudeSensor, () {
      super.latitudeSensor = value;
    });
  }

  final _$longitudeSensorAtom =
      Atom(name: '_SensorLocationControllerBase.longitudeSensor');

  @override
  List<String> get longitudeSensor {
    _$longitudeSensorAtom.reportRead();
    return super.longitudeSensor;
  }

  @override
  set longitudeSensor(List<String> value) {
    _$longitudeSensorAtom.reportWrite(value, super.longitudeSensor, () {
      super.longitudeSensor = value;
    });
  }

  final _$controlaMenuAtom =
      Atom(name: '_SensorLocationControllerBase.controlaMenu');

  @override
  bool get controlaMenu {
    _$controlaMenuAtom.reportRead();
    return super.controlaMenu;
  }

  @override
  set controlaMenu(bool value) {
    _$controlaMenuAtom.reportWrite(value, super.controlaMenu, () {
      super.controlaMenu = value;
    });
  }

  final _$indiceAtom = Atom(name: '_SensorLocationControllerBase.indice');

  @override
  int get indice {
    _$indiceAtom.reportRead();
    return super.indice;
  }

  @override
  set indice(int value) {
    _$indiceAtom.reportWrite(value, super.indice, () {
      super.indice = value;
    });
  }

  final _$_SensorLocationControllerBaseActionController =
      ActionController(name: '_SensorLocationControllerBase');

  @override
  dynamic fetchSensorMonitor() {
    final _$actionInfo = _$_SensorLocationControllerBaseActionController
        .startAction(name: '_SensorLocationControllerBase.fetchSensorMonitor');
    try {
      return super.fetchSensorMonitor();
    } finally {
      _$_SensorLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic zeraSensors() {
    final _$actionInfo = _$_SensorLocationControllerBaseActionController
        .startAction(name: '_SensorLocationControllerBase.zeraSensors');
    try {
      return super.zeraSensors();
    } finally {
      _$_SensorLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCircle() {
    final _$actionInfo = _$_SensorLocationControllerBaseActionController
        .startAction(name: '_SensorLocationControllerBase.setCircle');
    try {
      return super.setCircle();
    } finally {
      _$_SensorLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic menuControlUp(int id) {
    final _$actionInfo = _$_SensorLocationControllerBaseActionController
        .startAction(name: '_SensorLocationControllerBase.menuControlUp');
    try {
      return super.menuControlUp(id);
    } finally {
      _$_SensorLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic menuControlDonw() {
    final _$actionInfo = _$_SensorLocationControllerBaseActionController
        .startAction(name: '_SensorLocationControllerBase.menuControlDonw');
    try {
      return super.menuControlDonw();
    } finally {
      _$_SensorLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
circles: ${circles},
temperaturaSensor: ${temperaturaSensor},
umidadeSensor: ${umidadeSensor},
indiceUvSensor: ${indiceUvSensor},
qualidadeArSensor: ${qualidadeArSensor},
latitudeSensor: ${latitudeSensor},
longitudeSensor: ${longitudeSensor},
controlaMenu: ${controlaMenu},
indice: ${indice}
    ''';
  }
}
