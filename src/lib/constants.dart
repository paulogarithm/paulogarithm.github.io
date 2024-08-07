// This is all the constants of my website.

class Constants {
  static const String githubLink = 'https://github.com/paulogarithm';
  static const String linkedinLink = 'https://www.linkedin.com/in/paulparisot';

  static const List<String> skillsNames = [
    "Flutter",
    "C",
    "C++",
    "Lua",
    "Python",
    "Haskell"
  ];

  static const int widthConstraint = 600;

  static const String aboutMePath = "assets/about_me.txt";

  static final DateTime myBirthday = DateTime(2005, 1, 9);

  static final bool todayIsBirthday =
      Constants.myBirthday.month == DateTime.now().month &&
          Constants.myBirthday.day == DateTime.now().day;

  static const int appearTimeMs = 400;
}
