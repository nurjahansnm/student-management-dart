
import 'dart:io';

String getGrade(double score) {
  if (score >= 80) return "A+";
  else if (score >= 70) return "A";
  else if (score >= 60) return "A-";
  else if (score >= 50) return "B";
  else if (score >= 40) return "C";
  else if (score >= 33) return "D";
  else return "F";
}

void main() {
  
  List<Map<String, dynamic>> students = [];

  while (true) {
    print("\nEnter Student Name (Or type 'exit' to stop): ");
    String name = stdin.readLineSync()!.trim();

    
    if (name.toLowerCase() == "exit") break;

    print("Enter Student ID: ");
    String id = stdin.readLineSync()!.trim();

    
    bool exists = students.any((student) => student['ID'] == id);
    if (exists) {
      print("❌ This ID already exists. Please enter a unique ID.");
      continue;
    }

    print("Enter Student Score (0-100): ");
    double score = double.parse(stdin.readLineSync()!);

   
    String grade = getGrade(score);


    students.add({
      'Name': name,
      'ID': id,
      'Score': score,
      'Grade': grade,
    });

    print("✅ Student Record Added Successfully!");
  }

  students.sort((a, b) => b['Score'].compareTo(a['Score']));

  print("\n==================== Student List (Sorted by Score) ===================");
  for (var s in students) {
    print("${s['Name']} | ID: ${s['ID']} | Score: ${s['Score']} | Grade: ${s['Grade']}");
  }

  print("\nTotal Students: ${students.length}");

  if (students.isNotEmpty) {
    double highest = students.first['Score'];
    double lowest = students.last['Score'];

    print("Highest Score: $highest");
    print("Lowest Score: $lowest");
  }

  print("\nProgram Ended. Thank You!");
  
}
