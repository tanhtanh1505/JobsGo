class Job {
  final String id;
  final String title;
  final String company;
  final String location;
  final String salary;
  final String description;
  final String requirements;
  final String datePosted;
  final String dateClosed;
  final String imageUrl;

  Job({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.description,
    required this.requirements,
    required this.datePosted,
    required this.dateClosed,
    required this.imageUrl,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title'],
      company: json['company'],
      location: json['location'],
      salary: json['salary'],
      description: json['description'],
      requirements: json['requirements'],
      datePosted: json['datePosted'],
      dateClosed: json['dateClosed'],
      imageUrl: json['image_url'],
    );
  }

  //to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'company': company,
      'location': location,
      'salary': salary,
      'description': description,
      'requirements': requirements,
      'datePosted': datePosted,
      'dateClosed': dateClosed,
      'imageUrl': imageUrl,
    };
  }
}

Job exampleJob() => Job.fromJson({
      'id': 'id',
      'title': 'title',
      'company': 'company',
      'location': 'location',
      'salary': 'salary',
      'description': 'description',
      'requirements': 'requirements',
      'datePosted': 'datePosted',
      'dateClosed': 'dateClosed',
      'imageUrl': 'imageUrl',
    });
Job nullJob = Job.fromJson({
  'id': 'x',
  'title': 'x',
  'company': 'x',
  'location': 'x',
  'salary': 'x',
  'description': 'x',
  'requirements': 'x',
  'datePosted': 'x',
  'dateClosed': 'x',
  'imageUrl': 'x',
});
