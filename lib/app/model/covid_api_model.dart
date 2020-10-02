class CovidApiModel {
  int uid;
  String uf;
  String state;
  int cases;
  int deaths;
  int suspects;
  int refuses;
  String datetime;
  String country;
  int confirmed;
  int recovered;
  String updatedAt;

  CovidApiModel.fromJsonByState(Map<String, dynamic> json) {
    uid = json['uid'];
    uf = json['uf'];
    state = json['state'];
    cases = json['cases'];
    deaths = json['deaths'];
    suspects = json['suspects'];
    refuses = json['refuses'];
    datetime = json['datetime'];
  }
  CovidApiModel.fromJsonByCountry(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    updatedAt = json['updated_at'];
  }
}
