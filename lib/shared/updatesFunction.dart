

getUpdates(Map updates) {
  var dates = [];
  var new_updates = [];

  updates.forEach((key, value) {
    dates.add(int.parse(key));
  });

  dates.sort();

  print(dates.length);

  for (int i = 0; i < dates.length; i++) {
    var update = [];



    update.add(updates[dates[i].toString()][0]);
    update.add(updates[dates[i].toString()][1]);
    update.add(updates[dates[i].toString()][2]);
    update.add(updates[dates[i].toString()][3]);

    update.add(dates[i]);

    new_updates.add(update);
  }

  return new_updates;
}

String giveDateInformation(int time) {
  var date = DateTime.fromMillisecondsSinceEpoch(time);
  var now = DateTime.now();

  Duration difference = now.difference(date);

  if (difference.inDays*365 != 0)
  {
    return ((difference.inDays*365).toString() + "y ago");
  }

  else if (difference.inDays*7 != 0)
  {
    return ((difference.inDays*7).toString() + "w ago");
  }

  else if (difference.inDays != 0)
  {
    return ((difference.inDays).toString() + "d ago");
  }

  else if (difference.inHours != 0)
  {
    return ((difference.inHours).toString() + "h ago");
  }

  else if (difference.inMinutes != 0)
  {
    return ((difference.inMinutes).toString() + "m ago");
  }

  else {
    return "Now";
  }
}