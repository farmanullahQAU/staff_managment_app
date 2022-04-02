class UserModel{
  late final String userId;
    String? imageUrl;
   late final String firstName;
  //last name could be null
  late final  String? lastName;

  bool? selected=false;



   late final bool  status;
  late final String employmentType;
   late final String email;
   late Office office;

   late final String position;


  UserModel({

    this.imageUrl,
   
   
   required this.firstName,
    this.selected,
    

   this.lastName,
   required this.status,

   required this.employmentType,
   required this.email,
   required this.office,
   required this.position,
   
   });


     UserModel.fromJson(Map<String, dynamic> json, String id,) {
    userId = id;
    firstName= json["first_name"].toString().toLowerCase();
    imageUrl=json['image_url'];
    lastName= json["last_name"].toLowerCase();
    status= json["status"];
    employmentType= json["employment_type"].toLowerCase();
    email= json["email"];
    position= json["position"].toLowerCase();

    office=Office.fromJson(json['office']);

    
    
 
  }

    Map<String, dynamic> toMap() {
    return {
      'first_name':firstName,
      'last_name': lastName,
      'image_url':imageUrl,
      'status':status,
      'employment_type':employmentType,
      'email':email,
      'position':position,
      'office':office.toMap(),
   
  
    };
  }

}



class Office{
  
  late  String officeAddress;
  //last name could be null
  late String department;

  late String  team;



  Office({
   
   
  required this.officeAddress,
  required this.department,
  required this.team,
  
   });



     Office.fromJson(Map<String, dynamic> json,) {

    officeAddress= json["office_address"].toLowerCase();
    department= json["department"].toLowerCase();
    team= json["team"].toLowerCase();
  

    
    
 
  }

   Map<String, dynamic> toMap() {
    return {
      'office_address':officeAddress,
      'department': department,
      'team':team,
     
   
  
    };
}
}