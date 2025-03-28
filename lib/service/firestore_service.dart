import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lyra/service/lyric_service.dart';

class FireStoreService {
  Future<void> getLyrics() async {
    FirebaseFirestore.instance.collection('lyrics').get().then(
        (QuerySnapshot querySnapshot) => {
              LyricService.instance
                  .batchInsertFromQuerySnapshotDocs(querySnapshot.docs)
            });
  }
}
