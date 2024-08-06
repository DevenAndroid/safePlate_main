class OnBoardModelResponse {
  final String? image, title, description;

  OnBoardModelResponse({
    this.image,
    this.title,
    this.description,
  });
}

List<OnBoardModelResponse> OnBoardData = [
  OnBoardModelResponse(
      image: "assets/images/Onbording 1.png",
      title: "Lorem Ipsum is the printing The and typesetting industry.",
      description: "Lorem Ipsum is simply dummy text of the in printing and typesetting industry."),
  OnBoardModelResponse(
      image: "assets/images/Onbording 2.png",
      title: "Lorem Ipsum is the printing The and typesetting industry.",
      description: "Lorem Ipsum is simply dummy text of the in printing and typesetting 2"),
  OnBoardModelResponse(
      image:  "assets/images/Onbording 3.png",
      title: "Lorem Ipsum is the printing The and typesetting industry.",
      description: "Lorem Ipsum is simply dummy text of the in printing and typesetting 3"),
];
