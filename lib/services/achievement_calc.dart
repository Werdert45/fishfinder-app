import 'package:fishfinder_app/services/database.dart';

checkAchievements(List list) {

  List species = [];

  for (int i = 0; i < list.length; i++) {
    if (!species.contains(list[i])) {
      species.add(list[i]);
    }
  }

  if (species.length >= 5) {
    // ac 1
    DatabaseService().updateAchievment("achievement_1");
  }

  if (species.length >= 10) {
    // ac 2
    DatabaseService().updateAchievment("achievement_2");
  }

  if (species.length >= 20) {
    // ac 3
    DatabaseService().updateAchievment("achievement_3");
  }

  if (species.length == 64) {
    // ac 4
    DatabaseService().updateAchievment("achievement_4");
  }

  if (list.length >=  5) {
   // ac 5
    DatabaseService().updateAchievment("achievement_5");
 }

  if (list.length >=  10) {
    // ac 6
    DatabaseService().updateAchievment("achievement_6");
  }

  if (list.length >=  50) {
    // ac 7
    DatabaseService().updateAchievment("achievement_7");
  }

  if (list.length >=  100) {
    // ac 8
    DatabaseService().updateAchievment("achievement_8");
  }
}