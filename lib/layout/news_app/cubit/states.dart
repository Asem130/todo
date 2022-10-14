abstract class NewsStates{}

class NewsInistioalState extends NewsStates{}

class NewsBottomNavBarState extends NewsStates {}

class NewsGetBusinessLodingState extends NewsStates {}
class NewsGetBusinessSuccssState extends NewsStates {}
class NewsGetBusinessErrorState extends NewsStates {
  late final String error;
  NewsGetBusinessErrorState(this.error);
}
class NewsGetSportsLodingState extends NewsStates {}
class NewsGetSportsSuccssState extends NewsStates {}
class NewsGetSportsErrorState extends NewsStates {
  late final String error;
  NewsGetSportsErrorState(this.error);
}
class NewsGetScienceLodingState extends NewsStates {}
class NewsGetScienceSuccssState extends NewsStates {}
class NewsGetScienceErrorState extends NewsStates {
  late final String error;
  NewsGetScienceErrorState(this.error);
}
