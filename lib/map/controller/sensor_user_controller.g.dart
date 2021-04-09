// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SensorUserController on _SensorUserControllerBase, Store {
  final _$latitudeAtom = Atom(name: '_SensorUserControllerBase.latitude');

  @override
  String get latitude {
    _$latitudeAtom.reportRead();
    return super.latitude;
  }

  @override
  set latitude(String value) {
    _$latitudeAtom.reportWrite(value, super.latitude, () {
      super.latitude = value;
    });
  }

  final _$longitudeAtom = Atom(name: '_SensorUserControllerBase.longitude');

  @override
  String get longitude {
    _$longitudeAtom.reportRead();
    return super.longitude;
  }

  @override
  set longitude(String value) {
    _$longitudeAtom.reportWrite(value, super.longitude, () {
      super.longitude = value;
    });
  }

  final _$temperaturaAtom = Atom(name: '_SensorUserControllerBase.temperatura');

  @override
  double get temperatura {
    _$temperaturaAtom.reportRead();
    return super.temperatura;
  }

  @override
  set temperatura(double value) {
    _$temperaturaAtom.reportWrite(value, super.temperatura, () {
      super.temperatura = value;
    });
  }

  final _$umidadeAtom = Atom(name: '_SensorUserControllerBase.umidade');

  @override
  double get umidade {
    _$umidadeAtom.reportRead();
    return super.umidade;
  }

  @override
  set umidade(double value) {
    _$umidadeAtom.reportWrite(value, super.umidade, () {
      super.umidade = value;
    });
  }

  final _$qualidadeArAtom = Atom(name: '_SensorUserControllerBase.qualidadeAr');

  @override
  int get qualidadeAr {
    _$qualidadeArAtom.reportRead();
    return super.qualidadeAr;
  }

  @override
  set qualidadeAr(int value) {
    _$qualidadeArAtom.reportWrite(value, super.qualidadeAr, () {
      super.qualidadeAr = value;
    });
  }

  final _$indiceUvAtom = Atom(name: '_SensorUserControllerBase.indiceUv');

  @override
  int get indiceUv {
    _$indiceUvAtom.reportRead();
    return super.indiceUv;
  }

  @override
  set indiceUv(int value) {
    _$indiceUvAtom.reportWrite(value, super.indiceUv, () {
      super.indiceUv = value;
    });
  }

  final _$polylinesAtom = Atom(name: '_SensorUserControllerBase.polylines');

  @override
  Set<Polyline> get polylines {
    _$polylinesAtom.reportRead();
    return super.polylines;
  }

  @override
  set polylines(Set<Polyline> value) {
    _$polylinesAtom.reportWrite(value, super.polylines, () {
      super.polylines = value;
    });
  }

  final _$loadSensoruserAsyncAction =
      AsyncAction('_SensorUserControllerBase.loadSensoruser');

  @override
  Future loadSensoruser() {
    return _$loadSensoruserAsyncAction.run(() => super.loadSensoruser());
  }

  final _$_SensorUserControllerBaseActionController =
      ActionController(name: '_SensorUserControllerBase');

  @override
  dynamic setPolylines(String route) {
    final _$actionInfo = _$_SensorUserControllerBaseActionController
        .startAction(name: '_SensorUserControllerBase.setPolylines');
    try {
      return super.setPolylines(route);
    } finally {
      _$_SensorUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
latitude: ${latitude},
longitude: ${longitude},
temperatura: ${temperatura},
umidade: ${umidade},
qualidadeAr: ${qualidadeAr},
indiceUv: ${indiceUv},
polylines: ${polylines}
    ''';
  }
}
