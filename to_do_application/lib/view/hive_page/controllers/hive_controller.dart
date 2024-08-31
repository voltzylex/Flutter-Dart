import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:to_do_application/view/hive_page/models/hive_task_model.dart';

/// A singleton class for managing operations related to Hive.
///
/// The `HiveController` class follows the Singleton design pattern, which ensures
/// that only one instance of this class can exist throughout the application's lifecycle.
/// This is useful for managing a centralized point of access for interacting with
/// Hive, a lightweight and fast key-value database used in Flutter applications.
class HiveController {
  /// The single instance of `HiveController` that will be used throughout the application.
  ///
  /// This instance is created by calling the private constructor `_internal`.
  /// The `static` keyword means that `_instance` is a class-level variable,
  /// and `final` ensures that it is immutable after being set.
  static final HiveController _instance = HiveController._internal();

  /// Factory constructor that returns the single instance of `HiveController`.
  ///
  /// The `factory` keyword is used to define a factory constructor, which is responsible
  /// for returning the instance of the class. In this case, it returns the existing
  /// `_instance`, ensuring that no new instances are created.
  factory HiveController() => _instance;

  /// Private constructor for `HiveController`.
  ///
  /// This constructor is named `_internal` and is private (indicated by the leading
  /// underscore). This prevents external code from instantiating the class directly,
  /// enforcing the singleton pattern.
  HiveController._internal();

  /// A reference to the Hive box used for storing data.
  final box = Hive.box(name: 'hiveBox');

  /// Adds a task to the list of tasks stored in the Hive box.
  ///
  /// This method retrieves the existing list of tasks (if any) and appends the
  /// new task to the list. The updated list is then stored back in the box.
  Future<bool> addData(String key, Task value) async {
    try {
      // Retrieve the existing list from the box, or create a new empty list if none exists.
      List<dynamic> currentList =
          box.get(key, defaultValue: []) as List<dynamic>;

      // Add the new value to the list.
      currentList.add(value.toMap());

      // Store the updated list back in the box.
      box.put(key, currentList);
      return true;
    } catch (e) {
      log("Add Data Error: $e");
      return false;
    }
  }

  /// Retrieves the list of tasks stored under the specified key in the Hive box.
  ///
  /// This method fetches the list of tasks (if any) stored in the Hive box under
  /// the specified key. If no list is found, it returns an empty list.
  Future<List<Task>> getData(String key) async {
    try {
      // Retrieve the list from the box.
      List<dynamic> data = box.get(key, defaultValue: []) as List<dynamic>;

      // Convert the list of maps back into a list of Task objects.
      List<Task> taskList = data.map((item) => Task.fromMap(item)).toList();

      log("Get Data: ${taskList.map(
        (e) => e.toMap(),
      )}");
      return taskList;
    } catch (e) {
      log("Get Data Error: $e");
      return [];
    }
  }

  /// Deletes a task from the list of tasks stored under the specified key in the Hive box.
  ///
  /// This method removes a task from the list by its index and updates the list
  /// in the Hive box. If the index is out of range, an error is logged.
  Future<bool> deleteData(String key, int index) async {
    try {
      // Retrieve the existing list from the box.
      List<dynamic> currentList =
          box.get(key, defaultValue: []) as List<dynamic>;

      // Remove the item at the specified index.
      if (index >= 0 && index < currentList.length) {
        currentList.removeAt(index);

        // Store the updated list back in the box.
        box.put(key, currentList);
        return true;
      } else {
        log("Delete Data Error: Index out of range");
        return false;
      }
    } catch (e) {
      log("Delete Data Error: $e");
      return false;
    }
  }
}
