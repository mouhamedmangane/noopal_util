



class NplTreatRequestException implements Exception{
  static final String NO_DATA="Aucune donnée disponible";
  String message;
  Map<String,dynamic> ? errors;
  dynamic ? data;
  NplTreatRequestException(this.message,{this.errors,this.data});
}
