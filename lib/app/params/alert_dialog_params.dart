class AlertDialogParams {
  final String dialogMsg;
  final String dialogHeading;
  final String? buttonText;
  final String? optionText;
  final bool? notFound;
  AlertDialogParams(
      {required this.dialogMsg,
      required this.dialogHeading,
      this.buttonText,
      this.optionText,
      this.notFound});
}
