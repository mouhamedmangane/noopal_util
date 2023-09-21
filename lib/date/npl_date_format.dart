class NplDateFormat{
  static String simpleFormat(DateTime ? date,{DateTime ? today,addTime=false,verbose=false}){
    if(date==null) return "-- -- --";
    today ??= DateTime.now();
    if(date.year==today.year && date.month==today.month){
      if(today.day==date.day) {
        return timeFormat(date,verbose: verbose);
      } else if ((today.day - date.day)==1) {
        return (addTime)?"Hier "+timeFormat(date,verbose: verbose):'Hier';
      }
    }
    return (addTime)?"${dayFormat(date,verbose: verbose)} ${timeFormat(date,verbose: verbose)}":dayFormat(date,verbose: verbose);

  }


  static String timeFormat(DateTime ? date,{verbose=false}){
    if(date==null) return "__ __";
    if(verbose){
      return "à ${date.hour.toString().padLeft(2,'0')}h ${date.second.toString().padLeft(2,'0')}mn";
    }
    else{
      return "${date.hour.toString().padLeft(2,'0')}:${date.second.toString().padLeft(2,'0')}";

    }
  }


  static String dayFormat(DateTime ? date , {verbose=false,String separator = "/"}){
    if(date==null) return "-- -- --";
    return"${verbose?'le ':''}${date.day.toString().padLeft(2,'0')}$separator${date.month.toString().padLeft(2,'0')}$separator${date.year}";
  }
}

