enum ListType {
  restaurants,
  food,
  activities,
  movies,
  other,
}

extension ListTypename on ListType {
  String readable() => toCapitalized(name);
  String getImagePath() => images[this] ?? 'generic.jpg';
}

String toCapitalized(String text) =>
    text.isNotEmpty ? '${text[0].toUpperCase()}${text.substring(1).toLowerCase()}' : '';

const images = {
  ListType.restaurants: 'restaurants.jpeg',
  ListType.food: 'food.webp',
  ListType.movies: 'movies.webp',
  ListType.activities: 'activities.png',
  ListType.other: 'generic.jpg',
};
