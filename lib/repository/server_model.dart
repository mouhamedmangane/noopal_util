

class ServerModel{
  String host;
  int port;
  String protocole;

  ServerModel({
    required this.host,
    this.port=80,
    this.protocole='http'
  });

  ServerModel.fromJson(Map<String,dynamic> json):
    this.host=json['host']??'',
    this.port=(json['port']!=null)? int.parse(json['port']):80,
    this.protocole=json['schema']??'http';
}