class SensorGlobalModel {
  double co;
  double co2;
  int indiceUv;
  String latitude;
  String longitude;
  double nh4;
  double pressao;
  double qualidadeAr;
  double temperatura;
  double temperature;
  double tolueno;
  double umidade;

  SensorGlobalModel(
      {this.co,
      this.co2,
      this.indiceUv,
      this.latitude,
      this.longitude,
      this.nh4,
      this.pressao,
      this.qualidadeAr,
      this.temperatura,
      this.temperature,
      this.tolueno,
      this.umidade});

  SensorGlobalModel.fromJson(Map<String, dynamic> json) {
    co = json['co'];
    co2 = json['co2'];
    indiceUv = json['indiceUv'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    nh4 = json['nh4'];
    pressao = json['pressao'];
    qualidadeAr = json['qualidadeAr'];
    temperatura = json['temperatura'];
    temperature = json['temperature'];
    tolueno = json['tolueno'];
    umidade = json['umidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['co'] = this.co;
    data['co2'] = this.co2;
    data['indiceUv'] = this.indiceUv;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['nh4'] = this.nh4;
    data['pressao'] = this.pressao;
    data['qualidadeAr'] = this.qualidadeAr;
    data['temperatura'] = this.temperatura;
    data['temperature'] = this.temperature;
    data['tolueno'] = this.tolueno;
    data['umidade'] = this.umidade;
    return data;
  }
}
