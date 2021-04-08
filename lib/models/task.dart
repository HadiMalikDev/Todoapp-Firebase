class Task{

  String title;
  String description;

  Task({this.title,this.description});


  Map<String,dynamic> toJson()=>{'title':title,'description':description};
}