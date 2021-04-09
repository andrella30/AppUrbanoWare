// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$temperaturaGlobalAtom =
      Atom(name: '_HomeControllerBase.temperaturaGlobal');

  @override
  double get temperaturaGlobal {
    _$temperaturaGlobalAtom.reportRead();
    return super.temperaturaGlobal;
  }

  @override
  set temperaturaGlobal(double value) {
    _$temperaturaGlobalAtom.reportWrite(value, super.temperaturaGlobal, () {
      super.temperaturaGlobal = value;
    });
  }

  final _$umidadeGlobalAtom = Atom(name: '_HomeControllerBase.umidadeGlobal');

  @override
  double get umidadeGlobal {
    _$umidadeGlobalAtom.reportRead();
    return super.umidadeGlobal;
  }

  @override
  set umidadeGlobal(double value) {
    _$umidadeGlobalAtom.reportWrite(value, super.umidadeGlobal, () {
      super.umidadeGlobal = value;
    });
  }

  final _$qualidadeArGlobalAtom =
      Atom(name: '_HomeControllerBase.qualidadeArGlobal');

  @override
  double get qualidadeArGlobal {
    _$qualidadeArGlobalAtom.reportRead();
    return super.qualidadeArGlobal;
  }

  @override
  set qualidadeArGlobal(double value) {
    _$qualidadeArGlobalAtom.reportWrite(value, super.qualidadeArGlobal, () {
      super.qualidadeArGlobal = value;
    });
  }

  final _$indiceUvGlobalAtom = Atom(name: '_HomeControllerBase.indiceUvGlobal');

  @override
  double get indiceUvGlobal {
    _$indiceUvGlobalAtom.reportRead();
    return super.indiceUvGlobal;
  }

  @override
  set indiceUvGlobal(double value) {
    _$indiceUvGlobalAtom.reportWrite(value, super.indiceUvGlobal, () {
      super.indiceUvGlobal = value;
    });
  }

  final _$coAtom = Atom(name: '_HomeControllerBase.co');

  @override
  double get co {
    _$coAtom.reportRead();
    return super.co;
  }

  @override
  set co(double value) {
    _$coAtom.reportWrite(value, super.co, () {
      super.co = value;
    });
  }

  final _$co2Atom = Atom(name: '_HomeControllerBase.co2');

  @override
  double get co2 {
    _$co2Atom.reportRead();
    return super.co2;
  }

  @override
  set co2(double value) {
    _$co2Atom.reportWrite(value, super.co2, () {
      super.co2 = value;
    });
  }

  final _$nh4Atom = Atom(name: '_HomeControllerBase.nh4');

  @override
  double get nh4 {
    _$nh4Atom.reportRead();
    return super.nh4;
  }

  @override
  set nh4(double value) {
    _$nh4Atom.reportWrite(value, super.nh4, () {
      super.nh4 = value;
    });
  }

  final _$toluenoAtom = Atom(name: '_HomeControllerBase.tolueno');

  @override
  double get tolueno {
    _$toluenoAtom.reportRead();
    return super.tolueno;
  }

  @override
  set tolueno(double value) {
    _$toluenoAtom.reportWrite(value, super.tolueno, () {
      super.tolueno = value;
    });
  }

  final _$loadSensorsAsyncAction =
      AsyncAction('_HomeControllerBase.loadSensors');

  @override
  Future loadSensors() {
    return _$loadSensorsAsyncAction.run(() => super.loadSensors());
  }

  @override
  String toString() {
    return '''
temperaturaGlobal: ${temperaturaGlobal},
umidadeGlobal: ${umidadeGlobal},
qualidadeArGlobal: ${qualidadeArGlobal},
indiceUvGlobal: ${indiceUvGlobal},
co: ${co},
co2: ${co2},
nh4: ${nh4},
tolueno: ${tolueno}
    ''';
  }
}
