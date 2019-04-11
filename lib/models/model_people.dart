
class People{
  String name;
  String pob;
  String dob;
  String imageURL;
  String description;


  People({this.name,this.pob,this.dob,this.imageURL,this.description});

  People.map(Map<String,dynamic> obj) {
    this.name = obj['name'];
    this.pob = obj['pob'];
    this.dob = obj['dob'];
    this.imageURL=obj['imageURL'];
    this.description = obj['description'];

  }


}