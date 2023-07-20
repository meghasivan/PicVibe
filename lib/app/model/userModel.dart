class UserModel{
  late String displayName;
  late String email;
  late String id;
  late String photoURL;

  UserModel(this.displayName,this.email,this.id,this.photoURL);

  UserModel.fromMap(Map<String,dynamic> data){
    displayName = data["displayName"]!;
    email = data["email"]!;
    id = data["id"]!;
    photoURL = data["photoURL"]!;
  }

  toMap(){
    return {
      "displayName"  : displayName,
      "email" : email,
      "id" : id,
      "photoURL" : photoURL
    };
  }
}