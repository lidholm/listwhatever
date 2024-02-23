enum ListType {
  restaurants,
  food,
  activities,
  movies,
  other,
}

extension ListTypename on ListType {
  String readable() => toCapitalized(name);
  // String getImagePath() => images[this] ?? 'assets/images/generic.jpg';
}

String toCapitalized(String text) =>
    text.isNotEmpty ? '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}' : '';

// const images = {
//   ListType.restaurants: 'assets/images/restaurants.jpeg',
//   ListType.food: 'assets/images/food.webp',
//   ListType.movies: 'assets/images/movies.webp',
//   ListType.activities: 'assets/images/activities.png',
// };
