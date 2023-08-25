class OnboardingContents {
  final String title;
  final String image;
  final String desc;



  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track Your work and get the result",
    image: "images/Group.svg",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Stay organized with team",
    image: "images/Group 44.svg",
    desc:
    "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "images/icon 3.svg",
    desc:
    "Take control of notifications, collaborate live or on your own time.",
  ),
];