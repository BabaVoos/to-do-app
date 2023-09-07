class UserModel {
  String? id;
  String? name;
  String? age;
  String? email;

  UserModel({
    this.id = "",
    this.name,
    this.age,
    this.email,
  });

  UserModel.fromFirestore(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          email: json['email'],
          age: json['age'],
        );

  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "age": age,
    };
  }
}
