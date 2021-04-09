class SensorUserModel {
  double co;
  double co2;
  int indiceUv;
  String latitudeAtual;
  String longitudeAtual;
  double nh4;
  double pressao;
  int qualidadeAr;
  double temperatura;
  double tolueno;
  double umidade;

  SensorUserModel(
      {this.co,
      this.co2,
      this.indiceUv,
      this.latitudeAtual,
      this.longitudeAtual,
      this.nh4,
      this.pressao,
      this.qualidadeAr,
      this.temperatura,
      this.tolueno,
      this.umidade});

  SensorUserModel.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    co2 = json['co2'];
    indiceUv = json['indiceUv'];
    latitudeAtual = json['latitudeAtual'];
    longitudeAtual = json['longitudeAtual'];
    nh4 = json['nh4'];
    pressao = json['pressao'];
    qualidadeAr = json['qualidadeAr'];
    temperatura = json['temperatura'];
    tolueno = json['tolueno'];
    umidade = json['umidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co'] = this.co;
    data['co2'] = this.co2;
    data['indiceUv'] = this.indiceUv;
    data['latitudeAtual'] = this.latitudeAtual;
    data['longitudeAtual'] = this.longitudeAtual;
    data['nh4'] = this.nh4;
    data['pressao'] = this.pressao;
    data['qualidadeAr'] = this.qualidadeAr;
    data['temperatura'] = this.temperatura;
    data['tolueno'] = this.tolueno;
    data['umidade'] = this.umidade;
    return data;
  }
}
