class SplashController {
  SplashController({
    this.displayDuration = const Duration(milliseconds: 1500),
  });

  final Duration displayDuration;

  Future<void> waitThenContinue() async {
    await Future.delayed(displayDuration);
  }
}
