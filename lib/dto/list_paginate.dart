
import 'package:noppal_util/converter/npl_converter_object.dart';

class ListPaginate<T>{
  List<T> data;
  int lastPage;
  int  currentPage;
  int total;
  Map<String,dynamic> ? avec;
  ListPaginate({
    List<T> ? data,
    this.currentPage=0,
    this.lastPage=0,
    this.total=0,
    this.avec,
  })
      :data=data ??[]
  ;

  ListPaginate.fromJson(Map<String,dynamic> json,NplConverterObject<T> converterObject,{String ? dataKey='data',String lastPageKey="last_page", String currentPageKey="current_page",String totalKey="total"}):
      data=(json[dataKey]==null)?[]:(json[dataKey]).map<T>((e) => converterObject.converter(e)).toList(),
      lastPage=json[lastPageKey],
      currentPage=json[currentPageKey],
      total=json['total'],
      avec=json['avec']
  ;


  ListPaginate<T> copyWith({
    List<T> ? data,
    int ? currentPage,
    int ? lastPage,
    int ? total,
    Map<String,dynamic> ? avec
  })=>ListPaginate(
    data: data ?? this.data,
    currentPage: currentPage ?? this.currentPage,
    lastPage: lastPage ?? this.lastPage,
    total:  total ?? this.total,
    avec: avec ?? this.avec,
  );

  void clear(){
    data=[];
    currentPage=0;
    total=0;
    lastPage=0;
    avec={};
  }


  void addPage(ListPaginate<T> paginateList){
    data.addAll(paginateList.data);
    currentPage=paginateList.currentPage;
    lastPage=paginateList.lastPage;
    total=paginateList.total;
  }


  void insertFirst(T element){
    data.insert(0, element);
  }

  bool isLimit(){
    return currentPage>=lastPage && currentPage!=0;
  }


}