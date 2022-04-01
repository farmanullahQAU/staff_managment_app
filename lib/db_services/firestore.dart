import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:staff_managment_dashboard/models/user_model.dart';

class FirestoreServices{


 static final moviesCollection = FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
     fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!,snapshot.id),
     toFirestore: (user, _) => user.toMap(),
   );

      static Future<List<UserModel>> getStaffsMembers() async {
    return await FirebaseFirestore.instance.collection("users").get().then((value) =>
        value.docs.map((e) => UserModel.fromJson(e.data(), e.id)).toList());
  }
}


