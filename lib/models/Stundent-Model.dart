class StudentModel {
  String? name;
  final int? age;
  final String? course;
  final int? yearLevel;
  final String? photo;
  final List<String>? subjects;

  StudentModel({this.name, this.age, this.course, this.yearLevel, this.photo, this.subjects});
}

List<StudentModel> students = [
  StudentModel(
      name: "John Doe",
      age: 20,
      course: "Computer Science",
      yearLevel: 3,
      subjects: ["Math", "Science", "English"],
      photo:
          "https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg"),
  StudentModel(
      name: "Jane Doe",
      age: 22,
      course: "Information Technology",
      yearLevel: 4,
      subjects: ["History", "Art", "Physical Education"],
      photo:
          "https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation-thumbnail.png"),
  StudentModel(
      name: "Mark Johnson",
      age: 21,
      course: "Business Administration",
      yearLevel: 2,
      subjects: ["Computer Science", "Physics", "Chemistry"],
      photo: "https://cdn-icons-png.flaticon.com/512/147/147144.png"),
  StudentModel(
      name: "Emma Watson",
      age: 19,
      course: "Nursing",
      yearLevel: 1,
      subjects: ["Computer Science", "Math", "English"],
      photo:
          "https://w7.pngwing.com/pngs/481/915/png-transparent-computer-icons-user-avatar-woman-avatar-computer-business-conversation-thumbnail.png"),
  StudentModel(
      name: "Michael Brown",
      age: 22,
      course: "Electrical Engineering",
      yearLevel: 4,
      subjects: ["Programming Flutter", "Math", "English"],
      photo: "https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584__340.png"),
  StudentModel(
      name: "Emily Smith",
      age: 20,
      course: "Biology",
      yearLevel: 3,
      subjects: ["Data Structures", "Science", "English"],
      photo:
          "https://w7.pngwing.com/pngs/340/946/png-transparent-avatar-user-computer-icons-software-developer-avatar-child-face-heroes-thumbnail.png"),
  StudentModel(
      name: "Matthew Wilson",
      age: 21,
      course: "Chemistry",
      yearLevel: 2,
      subjects: ["Psychology", "Science", "History"],
      photo:
          "https://static.wikia.nocookie.net/jamescameronsavatar/images/e/e5/Avatar_TWoW_Neytiri_Textless_Poster.jpg/revision/latest?cb=20221125232909"),
  StudentModel(
      name: "Madison Davis",
      age: 19,
      course: "Political Science",
      yearLevel: 1,
      subjects: ["Programming 2", "Science", "History"],
      photo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGjR6KWZBf3_2C_UPQGkp4qRF9GfPafu2y-2CLAofOc-IDOn8liwUBEMB11fIMXACwgiw&usqp=CAU"),
  StudentModel(
      name: "Joshua Garcia",
      age: 22,
      course: "Sociology",
      yearLevel: 4,
      subjects: ["Python", "Art", "Physical Education"],
      photo: "https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/11_avatar-512.png"),
  StudentModel(
      name: "Nicholas Rodriguez",
      age: 20,
      course: "Mathematics",
      yearLevel: 3,
      subjects: ["Programming 1", "Science", "History"],
      photo:
          "https://media.istockphoto.com/id/1331329483/vector/female-avatar-icon.jpg?s=612x612&w=0&k=20&c=VPS89ZjzR7Ft7YkJWCg2ItTQTeIhdXjEut-Hc1gcpPI="),
];
