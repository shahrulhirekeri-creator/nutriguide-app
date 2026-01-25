class FavoritesStore {
  static final List<Map<String, dynamic>> favoriteDays = [];

  static void addDay(Map<String, dynamic> dayPlan) {
    if (!favoriteDays.any((d) => d["day"] == dayPlan["day"])) {
      favoriteDays.add(dayPlan);
    }
  }

  static void removeDay(String day) {
    favoriteDays.removeWhere((d) => d["day"] == day);
  }

  static bool containsDay(String day) {
    return favoriteDays.any((d) => d["day"] == day);
  }
}
