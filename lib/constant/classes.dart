class Job {
  late String postName;
  late String companyName;
  late String companyLogo;
  late String applicationStatus;
  late DateTime appliedDate;
  late int numberOfApplicants;

  Job(
      {required this.postName,
      required this.companyName,
      required this.companyLogo,
      required this.applicationStatus,
      required this.appliedDate,
      required this.numberOfApplicants});
}
