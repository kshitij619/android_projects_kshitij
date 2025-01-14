// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeScreenText {
  final String mainText;
  final String fontFamily;
  final double fontSize;
  final double opacity;

  const HomeScreenText({
    required this.mainText,
    this.fontFamily = 'Poppins',
    this.fontSize = 62,
    this.opacity = 0.4,
  });
}
