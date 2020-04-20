class Todo{
  int id;
  String description;
  bool isDone = false;

  Todo({this.id,this.description,this.isDone = false});

  factory Todo.fromDatabaseJson(Map<String,dynamic> data) => Todo(
    //This will be used to convert JSON objects that
    //are coming from querying the database and converting
    //it into a Todo object

    id: data['id'],
    description: data['description'],

    isDone: data['isDone'] == 0 ? false : true,
  );

  Map<String,dynamic> toDatabaseJson() => {
    //This will be used to convert Todo objects that
    //are to be stored into the datbase in a form of JSON

    "id" : this.id,
    "description" : this.description,
    "isDone" : this.isDone == false ? 0 : 1,
  };
}