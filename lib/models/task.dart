class Task {
  String id;
  String title;
  String descrepition;

  int data;
  bool isdone;



  Task({
    this.id = "",
    required this.title,
    required this.descrepition,
    required this.data,
    this.isdone = false});

  Task.fromJson(Map<String,dynamic>json):this(
    id: json["id"],
    isdone: json["isdone"],
    title: json["title"],
    data: json["data"],
    descrepition: json["descrepition"]

  );
  Map<String,dynamic> tojson(){
    return{
      "id":id,
      "title":title,
      "descrepition":descrepition,
      "data":data,
      "isdone":isdone
    };
  }
}