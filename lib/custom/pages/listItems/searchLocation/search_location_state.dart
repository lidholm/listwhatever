import 'package:flutter/material.dart';
import 'package:allmylists/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';

@immutable
sealed class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  SearchLoaded(this.lists);
  final List<GeocoderResult>? lists;
}

class SearchOperationSuccess extends SearchState {
  SearchOperationSuccess(this.message);
  final String message;
}

class SearchError extends SearchState {
  SearchError(this.errorMessage);
  final String errorMessage;
}
