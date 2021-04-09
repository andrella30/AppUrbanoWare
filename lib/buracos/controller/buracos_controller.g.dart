// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buracos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuracoController on _BuracoControllerBase, Store {
  final _$latitudeBuracosAtom =
      Atom(name: '_BuracoControllerBase.latitudeBuracos');

  @override
  List<double> get latitudeBuracos {
    _$latitudeBuracosAtom.reportRead();
    return super.latitudeBuracos;
  }

  @override
  set latitudeBuracos(List<double> value) {
    _$latitudeBuracosAtom.reportWrite(value, super.latitudeBuracos, () {
      super.latitudeBuracos = value;
    });
  }

  final _$longitudeBuracosAtom =
      Atom(name: '_BuracoControllerBase.longitudeBuracos');

  @override
  List<double> get longitudeBuracos {
    _$longitudeBuracosAtom.reportRead();
    return super.longitudeBuracos;
  }

  @override
  set longitudeBuracos(List<double> value) {
    _$longitudeBuracosAtom.reportWrite(value, super.longitudeBuracos, () {
      super.longitudeBuracos = value;
    });
  }

  final _$_BuracoControllerBaseActionController =
      ActionController(name: '_BuracoControllerBase');

  @override
  dynamic fetchSensorBuracos() {
    final _$actionInfo = _$_BuracoControllerBaseActionController.startAction(
        name: '_BuracoControllerBase.fetchSensorBuracos');
    try {
      return super.fetchSensorBuracos();
    } finally {
      _$_BuracoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic zeraSensors() {
    final _$actionInfo = _$_BuracoControllerBaseActionController.startAction(
        name: '_BuracoControllerBase.zeraSensors');
    try {
      return super.zeraSensors();
    } finally {
      _$_BuracoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
latitudeBuracos: ${latitudeBuracos},
longitudeBuracos: ${longitudeBuracos}
    ''';
  }
}
