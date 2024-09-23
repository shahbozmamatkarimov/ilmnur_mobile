import 'dart:convert';

import 'package:ilmnur_mobile/core/error/exception_handler.dart';
import 'package:ilmnur_mobile/features/group/data/models/group.dart';
import 'package:ilmnur_mobile/core/resources/data_state.dart';
import 'package:ilmnur_mobile/features/group/domain/repositories/group_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data_sources/group_service.dart';

class ImplGroupRepo extends GroupRepo {
  final GroupService groupService;
  SharedPreferences? preferences; // Use nullable to check initialization

  ImplGroupRepo({required this.groupService});

  Future<void> _initializePreferences() async {
    preferences ??= await SharedPreferences.getInstance();
  }

  // Retrieve groups from SharedPreferences
  Future<List<Group>?> _getGroupsFromPreferences() async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String>? groupJsonStrings = preferences?.getStringList('Groups');

    if (groupJsonStrings == null) {
      return null;
    }

    return groupJsonStrings.map((groupJson) {
      return Group.fromJson(jsonDecode(groupJson) as Map<String, dynamic>);
    }).toList();
  }

  // Save groups to SharedPreferences
  Future<void> _saveGroupsToPreferences(List<Group> groups) async {
    await _initializePreferences(); // Ensure SharedPreferences is initialized

    final List<String> groupJsonStrings = groups.map((group) {
      return jsonEncode(group.toJson());
    }).toList();

    preferences?.setStringList('Groups', groupJsonStrings);
  }

  @override
  Future<DataState<List<Group>>> getGroups(int id) async {
    try {
      final List<Group>? groups = await _getGroupsFromPreferences();
      print(groups);
      if (groups != null && groups.isNotEmpty) {
        // return DataSuccess<List<Group>>(data: groups);
      }
      final response = await groupService.getGroups(id);
      await _saveGroupsToPreferences(response.data);
      return DataSuccess<List<Group>>(data: response.data);
    } catch (e) {
      print(e);
      return DataException.getError<List<Group>>(e);
    }
  }
}
