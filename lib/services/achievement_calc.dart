import 'package:fishfinder_app/services/database.dart';

checkAchievements(Map map, String puid) {

  List list = [];
  List species = [];

  map.forEach((k, v) {
    list.add(v);
    species.add(v);
  });


//  for (int i = 0; i < list.length; i++) {
//    if (!species.contains(list[i])) {
//      species.add(list[i]);
//    }
//  }

  if (species.length >= 5) {
    // ac 1
    DatabaseService().updateAchievement("achievement_1", puid);
  }

  if (species.length >= 10) {
    // ac 2
    DatabaseService().updateAchievement("achievement_2", puid);
  }

  if (species.length >= 20) {
    // ac 3
    DatabaseService().updateAchievement("achievement_3", puid);
  }

  if (species.length == 64) {
    // ac 4
    DatabaseService().updateAchievement("achievement_4", puid);
  }

  if (list.length >=  5) {
   // ac 5
    DatabaseService().updateAchievement("achievement_5", puid);
 }

  if (list.length >=  10) {
    // ac 6
    DatabaseService().updateAchievement("achievement_6", puid);
  }

  if (list.length >=  50) {
    // ac 7
    DatabaseService().updateAchievement("achievement_7", puid);
  }

  if (list.length >=  100) {
    // ac 8
    DatabaseService().updateAchievement("achievement_8", puid);
  }
}