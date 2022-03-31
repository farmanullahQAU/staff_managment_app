class UserModel{
  final String? imageUrl;
  final String firstName;
  //last name could be null
  final String? lastName;

  bool? selected=false;

  final bool  status;
  final String employmentType;
  final String email;
  final Office office;

  final String position;


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
}



class Office{
  
  final String officeAddress;
  //last name could be null
  final String department;

  final String  team;



  Office({
   
   
  required this.officeAddress,
  required this.department,
  required this.team,
  
   });
}