class S {
  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  String get appTitle => 'Farmers Market';
  String get buyButton => 'Buy Now';
  String get addedToCart => '{product} added to cart';
  String get profile => 'Profile';
  String get profileDetails => 'User profile details go here.';
  String get dashboard => 'Dashboard';
  String get dashboardInfo => 'Dashboard information goes here.';
}
