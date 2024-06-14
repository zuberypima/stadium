import 'package:cloud_firestore/cloud_firestore.dart';

class Bookingservices {
  Future<void> bookingOnProgress(String _docId) async {
    await FirebaseFirestore.instance
        .collection('StadiumSeats')
        .doc('North')
        .collection('VIPA')
        .doc(_docId)
        .update({'Status': 'OnProgress'});
  }

  Future<int> userBooking() async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc("0718934183")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
      print(documentSnapshot.data().toString().length);
      return documentSnapshot.data().toString().length;
    });
  }
}
