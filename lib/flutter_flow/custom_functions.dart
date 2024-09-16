import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> cleanJson(String jsonString) {
  int startIndex = jsonString.indexOf('[');
  int endIndex = jsonString.lastIndexOf(']');

  // Проверить, что оба индекса найдены и расположены корректно
  if (startIndex != -1 && endIndex != -1 && startIndex < endIndex) {
    // Извлечь подстроку между '[' и ']', включая сами скобки
    String jsonArrayString = jsonString.substring(startIndex, endIndex + 1);

    // Преобразовать извлеченную строку в JSON массив
    try {
      return jsonDecode(jsonArrayString) as List<dynamic>;
    } catch (e) {
      // Если не удалось декодировать, вернуть пустой список
      return [];
    }
  }

  // Если '[' или ']' не найдены, вернуть пустой список
  return [];
}

String? stringToAPI(String? text) {
  if (text == null) {
    return null;
  }
  // Используйте jsonEncode для экранирования строки
  String encodedText = jsonEncode(text);

  // Уберите начальные и конечные кавычки
  return encodedText.substring(1, encodedText.length - 1);
}

List<dynamic>? questions(
  List<dynamic>? chat,
  String? author,
  String? message,
) {
  // Get the current time in the format "22:17"
  String formattedTime = DateFormat('HH:mm').format(DateTime.now());

  // If the chat list is null or empty, initialize it with the bot's default message.
  if (chat == null || chat.isEmpty) {
    return [
      {
        'author': 'GPT',
        'message': 'Please, wait. I am generating questions....',
        'timestamp': formattedTime,
      }
    ];
  }

  // If message is provided, add it to the chat list.
  if (message != null) {
    chat.add({
      if (author != null) 'author': author,
      'message': message,
      'timestamp': formattedTime,
    });
  }

  return chat;
}

DocumentReference? idToReferenceNetworking(String? firestoreID) {
  // make reference from firestore id
  if (firestoreID == null) {
    return null;
  }
  return FirebaseFirestore.instance.collection('networking').doc(firestoreID);
}

List<String> imagesList(
  List<String> newimages,
  List<String>? listImages,
) {
  // add newImages to listImages and return new list of images
  if (listImages == null) {
    return newimages;
  } else {
    return [...listImages, ...newimages];
  }
}

List<CompetitorsStruct>? competitors(
  List<CompetitorsStruct>? appState,
  List<String>? options,
  int? competitorIndex,
  int? optionIndex,
  String? competitorTextfield,
  bool? boolean,
  String? optionTextfield,
) {
  if (appState == null || options == null) {
    return appState;
  }

  // Если обновляем имя компетитора
  if (competitorIndex != null && optionIndex == null) {
    if (competitorIndex < appState.length) {
      var updatedCompetitor = appState[competitorIndex];
      updatedCompetitor.competitorName = optionTextfield;
      appState[competitorIndex] = updatedCompetitor;
    }
  } else if (optionIndex != null) {
    // Если обновляем опцию
    for (var i = 0; i < appState.length; i++) {
      var competitor = appState[i];
      if (optionIndex < competitor.options.length) {
        competitor.options[optionIndex].option = optionTextfield;
      } else {
        competitor.options.add(
            CompetitorOptionsStruct(option: optionTextfield, presence: false));
      }
      appState[i] = competitor;
    }
  }

  return appState;
}

List<PostStruct>? sortPosts(List<PostStruct>? posts) {
  // sort posts by timestamp, handling possible null values
  if (posts == null || posts.isEmpty) {
    return null;
  }

  posts.sort((a, b) {
    // Treat nulls as less than any non-null DateTime.
    if (a.timestamp == null && b.timestamp == null) {
      return 0;
    }
    if (a.timestamp == null) {
      return 1;
    }
    if (b.timestamp == null) {
      return -1;
    }
    // If both timestamps are not null, compare them normally.
    return b.timestamp!.compareTo(a.timestamp!);
  });

  return posts;
}

String? flowiseJson(String? json) {
  if (json == null) return null;

  int startIndex = json.indexOf('[');
  int endIndex = json.lastIndexOf(']');

  if (startIndex == -1 || endIndex == -1 || startIndex > endIndex) {
    return '[]'; // Возвращает пустой JSON-список, если не найдены правильные скобки
  }

  String cleanJson = json.substring(startIndex, endIndex + 1);
  return cleanJson;
}

String generateRandomString(int? length) {
  final int len = length ?? 12; // Default length to 12 if null
  const String chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  final StringBuffer buffer = StringBuffer();
  final math.Random rnd = math.Random();

  for (int i = 0; i < len; i++) {
    buffer.write(chars[rnd.nextInt(chars.length)]);
  }
  return buffer.toString();
}

String? jsonListToText(
  List<dynamic>? jsonList,
  int? elementsCount,
) {
  if (jsonList == null) {
    return '[]';
  }

  // Если elementsCount не указан (null), используем весь список
  List<dynamic> sublist;
  if (elementsCount == null || elementsCount >= jsonList.length) {
    sublist = jsonList;
  } else {
    sublist = jsonList.sublist(math.max(0, jsonList.length - elementsCount));
  }

  // Логирование подсписка

  List<String> encodedList = sublist.map((json) {
    if (json is Map<String, dynamic>) {
      String encodedJson = jsonEncode(json.map((key, value) {
        if (value is DateTime) {
          return MapEntry(key, value.toIso8601String());
        } else if (value is LatLng) {
          return MapEntry(key, value.toString());
        } else if (value is DocumentReference) {
          return MapEntry(key, value.path);
        }
        return MapEntry(key, value);
      }));
      return encodedJson;
    }
    String encodedJson = jsonEncode(json);
    return encodedJson;
  }).toList();

  // Логирование закодированного списка

  return encodedList.toString();
}

String newCustomFunction(String text) {
  String newText = text.replaceAll('\$', '');
  // Добавляем знак доллара в конец обработанного текста
  newText = '\$' + newText;
  return newText;
}

bool compareTimestamps(
  DateTime? timestamp1st,
  DateTime timestamp2nd,
) {
  // If the first timestamp is null, we cannot compare the days.
  if (timestamp1st == null) return false;

  // Compare the year, month, and day components of the timestamps.
  return timestamp1st.year != timestamp2nd.year ||
      timestamp1st.month != timestamp2nd.month ||
      timestamp1st.day != timestamp2nd.day;
}

List<String>? reverseImagesList(List<String>? imagesList) {
  if (imagesList == null || imagesList.isEmpty) return null;
  // Remove null or empty items
  imagesList.removeWhere((item) => item == null || item.isEmpty);
  return List.from(imagesList.reversed);
}

List<EventsRecord> reverseEventsList(List<EventsRecord> eventsList) {
  if (eventsList.isEmpty) return [];
  return List.from(eventsList.reversed);
}

List<ChatsRecord> chatmessages1(
  List<ChatsRecord>? chatmessages,
  String? textfieldValue,
) {
  if (chatmessages == null ||
      textfieldValue == null ||
      textfieldValue.isEmpty) {
    return [];
  }

  final lowerCaseSearchText = textfieldValue.trim().toLowerCase();

  return chatmessages.where((chat) {
    return chat.chatMessages.any((message) {
      final lowerCaseMessageText = message.text.trim().toLowerCase();
      return lowerCaseMessageText.contains(lowerCaseSearchText);
    });
  }).toList();
}

String? chatMessages2(
  List<ChatsRecord>? chatmessages,
  String? textfieldValue,
) {
  if (chatmessages == null ||
      textfieldValue == null ||
      textfieldValue.isEmpty) {
    return null;
  }

  final lowerCaseSearchText = textfieldValue.trim().toLowerCase();

  for (var chat in chatmessages) {
    for (var message in chat.chatMessages) {
      final lowerCaseMessageText = message.text.trim().toLowerCase();
      if (lowerCaseMessageText.contains(lowerCaseSearchText)) {
        return message.text; // Возвращаем первое найденное сообщение
      }
    }
  }

  return null; // Возвращаем null, если ничего не найдено
}

LatLng stringToLatLng(String? location) {
  // convert string to latlng
  if (location == null || location.isEmpty) {
    return const LatLng(0.0, 0.0);
  }
  final latLngList = location.split(',');
  final latitude = double.tryParse(latLngList[0]) ?? 0.0;
  final longitude = double.tryParse(latLngList[1]) ?? 0.0;
  return LatLng(latitude, longitude);
}

List<Color> listStringToListColors(List<String> colors) {
  // Convert list string in hex format to list of colors
  return colors
      .map((color) => Color(int.parse(color, radix: 16) | 0xFF000000))
      .toList();
}

List<String>? listColorsToListString(List<Color>? colors) {
  // convert list of colors to list of strings
  if (colors == null) {
    return null;
  }
  return colors.map((color) => color.toString()).toList();
}

List<dynamic> removeKeysFromJsonList(List<dynamic> jsonList) {
  // Remove keys: "options", "isMultiselect" "type" from all items of jsonList
  return jsonList.map((item) {
    Map<String, dynamic> newItem = Map.from(item);
    newItem.remove('options');
    newItem.remove('isMultiselect');
    newItem.remove('type');
    return newItem;
  }).toList();
}

int findMemberIndexInList(
  DocumentReference user,
  List<TeamMemberStruct>? teamMembers,
) {
  if (user == null || teamMembers == null) {
    return -1; // Возвращаем -1, если входные параметры недействительны
  }

  for (int i = 0; i < teamMembers.length; i++) {
    if (teamMembers[i].user == user) {
      return i;
    }
  }

  return -1; // Возвращаем -1, если элемент не найден
}

List<SmartSearchStruct>? reverseSmartSearchHistoryList(
    List<SmartSearchStruct> history) {
  // reverse this data type list
  List<SmartSearchStruct>? reverseSmartSearchHistoryList(
      List<SmartSearchStruct> history) {
    return history.reversed.toList();
  }
}

String videoToStr(String video) {
  // convert video url to string
  return video.toString();
}

dynamic processPartialJson(String partialJson) {
  partialJson = partialJson.replaceAll(RegExp(r'^null|null$'), '').trim();

  // Находим начало JSON объекта
  int startIndex = partialJson.indexOf('{');
  if (startIndex == -1) return null;
  partialJson = partialJson.substring(startIndex);

  Map<String, dynamic> result = {'text': '', 'searchResults': []};

  // Функция для извлечения значения по ключу
  String extractValue(String key) {
    RegExp regex =
        RegExp(r'"?' + key + r'"?\s*:\s*"?((?:(?!,\s*"?\w+":).)*)"?');
    Match? match = regex.firstMatch(partialJson);
    if (match != null) {
      return match.group(1)!.trim().replaceAll(RegExp(r'^"|"$'), '');
    }
    return '';
  }

  // Извлекаем text
  result['text'] = extractValue('text');

  // Обрабатываем searchResults
  int searchResultsStart = partialJson.indexOf('searchResults');
  if (searchResultsStart != -1) {
    int bracketStart = partialJson.indexOf('[', searchResultsStart);
    if (bracketStart != -1) {
      String searchResultsStr = partialJson.substring(bracketStart + 1);
      int depth = 0;
      String currentResult = '';
      bool inQuotes = false;

      for (int i = 0; i < searchResultsStr.length; i++) {
        if (searchResultsStr[i] == '"' &&
            (i == 0 || searchResultsStr[i - 1] != '\\')) {
          inQuotes = !inQuotes;
        }

        if (!inQuotes) {
          if (searchResultsStr[i] == '{') {
            if (depth == 0) currentResult = '';
            depth++;
          } else if (searchResultsStr[i] == '}') {
            depth--;
            if (depth == 0) {
              result['searchResults']
                  .add(processSearchResult(currentResult + '}'));
              currentResult = '';
              continue;
            }
          }
        }

        if (depth > 0 || inQuotes) {
          currentResult += searchResultsStr[i];
        }

        // Добавляем частичный результат поиска, если достигнут конец строки
        if (i == searchResultsStr.length - 1 && currentResult.isNotEmpty) {
          result['searchResults'].add(processSearchResult(currentResult));
        }
      }
    }
  }

  return result;
}

Map<String, dynamic> processSearchResult(String resultStr) {
  Map<String, dynamic> result = {};

  // Функция для извлечения значения по ключу
  String extractValue(String key) {
    RegExp regex =
        RegExp(r'"?' + key + r'"?\s*:\s*"?((?:(?!,\s*"?\w+":).)*)"?');
    Match? match = regex.firstMatch(resultStr);
    if (match != null) {
      return match.group(1)!.trim().replaceAll(RegExp(r'^"|"$'), '');
    }
    return '';
  }

  result['firebase_id'] = extractValue('firebase_id');
  result['type'] = extractValue('type');
  result['explanation'] = extractValue('explanation');

  String percentStr = extractValue('percent');
  result['percent'] = int.tryParse(percentStr) ?? 0;

  return result;
}

List<dynamic> createMessagesForAI(
  String prompt,
  List<dynamic> listOfMessages,
  String role,
  String message,
  int? index,
  List<String>? images,
  bool isChange,
) {
  List<dynamic> updatedMessages = listOfMessages;

  // Добавляем или заменяем сообщение с prompt
  Map<String, String> promptMessage = {
    'role': 'system',
    'content': prompt,
  };
  if (updatedMessages.isEmpty) {
    updatedMessages.add(promptMessage);
  } else {
    updatedMessages[0] = promptMessage;
  }

  // Если isChange == true, заменяем последний объект с ролью 'user' и ничего не добавляем
  if (isChange) {
    for (int i = updatedMessages.length - 1; i >= 0; i--) {
      if (updatedMessages[i]['role'] == 'user') {
        updatedMessages[i]['content'] = [
          {
            'type': 'text',
            'text': message,
          }
        ];
        break;
      }
    }
  } else {
    // Если роль 'assistant', добавляем только сообщение без изображений
    if (role == 'assistant') {
      if (message.isNotEmpty) {
        updatedMessages.add({
          'role': 'assistant',
          'content': message,
        });
      }
    } else {
      // Если индекс не равен null, удаляем сообщения начиная с указанного индекса
      if (index != null) {
        updatedMessages.removeRange(index * 2, updatedMessages.length);
      }

      // Добавляем текстовое сообщение, если оно не пустое
      if (message.isNotEmpty) {
        updatedMessages.add({
          'role': role,
          'content': [
            {
              'type': 'text',
              'text': message,
            }
          ],
        });
      }

      // Если images не пустой, добавляем каждое изображение как отдельный элемент
      if (images != null && images.isNotEmpty) {
        for (String imageUrl in images) {
          updatedMessages.add({
            'role': role,
            'content': [
              {
                'type': 'image_url',
                'image_url': {
                  'url': imageUrl,
                },
              },
            ],
          });
        }
      }
    }
  }

  return updatedMessages;
}

String jsonToText(dynamic json) {
  // convert json to text
  return jsonEncode(json);
}

String extractVectorsContent(String vectors) {
  print('Input JSON: $vectors');

  // Фиксация формата JSON
  String fixedJson = fixJsonFormat(vectors);
  print('Fixed JSON: $fixedJson');

  // Парсинг строки JSON в список динамических объектов
  List<dynamic> dataList;
  try {
    dataList = jsonDecode(fixedJson);
    print('Parsed JSON: $dataList');
  } catch (e) {
    print('Error parsing JSON: $e');
    return 'Error parsing JSON';
  }

  // Инициализация пустой строки для накопления результатов
  String result = '';

  // Итерация по каждому элементу списка
  for (int i = 0; i < dataList.length; i++) {
    try {
      // Доступ к 'pageContent' из каждого документа
      String pageContent = dataList[i]['document']['pageContent'];

      // Логирование извлеченного контента
      print('Document ${i + 1} - Page Content: $pageContent');

      // Форматирование выходной строки с индексом и контентом
      result += 'Piece of information ${i + 1}:\n\n$pageContent\n\n';
    } catch (e) {
      print('Error processing document ${i + 1}: $e');
    }
  }

  // Логирование конечного форматированного контента
  print('Formatted Content:\n$result');

  return result.trim(); // Удаление лишних завершающих переводов строки
}

String fixJsonFormat(String jsonString) {
  // Удаляем пробелы и лишние символы, чтобы сохранить чистоту формата
  jsonString = jsonString
      .replaceAll("'", '"') // Заменяем одинарные кавычки на двойные
      .replaceAll(RegExp(r'(\w+):'),
          r'"\1":') // Добавляем двойные кавычки вокруг ключей
      .replaceAll(RegExp(r':\s*([,\]}])'),
          r':\1') // Удаляем пробелы после двоеточий перед знаками ,
      .replaceAll(
          RegExp(r'(?<=\w):\s*null'), r':null') // Правильное использование null
      .replaceAll(RegExp(r'\\'), '\\\\') // Экранируем обратные слэши
      .replaceAll(RegExp(r'(".*?")\s*:\s*"([^"]*?)"'),
          r'"\1":"\2"'); // Исправляем проблемы с двойными кавычками внутри строк

  // Проверяем наличие пропущенных скобок и исправляем их
  int openBraces = jsonString.allMatches('{').length;
  int closeBraces = jsonString.allMatches('}').length;
  if (openBraces > closeBraces) {
    jsonString += '}' * (openBraces - closeBraces);
  } else if (closeBraces > openBraces) {
    jsonString = '{' * (closeBraces - openBraces) + jsonString;
  }

  return jsonString;
}

String? imagesListToStr(List<String> imageList) {
  // Check if the list is empty
  if (imageList.isEmpty) {
    return null;
  }

  // Join the list items into a single string separated by commas
  String result = imageList.join(',');

  return result;
}

List<dynamic>? mediaJsonList(List<dynamic>? chatmessages) {
  if (chatmessages == null) return null;

  List<Map<String, String?>> result = [];

  for (var item in chatmessages) {
    String? imageUrl;
    String? videoUrl;

    // Проверяем наличие изображений
    if (item.containsKey('images') && item['images'].isNotEmpty) {
      imageUrl = item['images'][0]; // Берем первое изображение
    }

    // Проверяем наличие видео
    if (item.containsKey('video')) {
      videoUrl = item['video'];
    }

    // Добавляем в список только если есть либо imageUrl, либо videoUrl
    if (imageUrl != null || videoUrl != null) {
      result.add({
        'image_url': imageUrl,
        'video_url': videoUrl,
      });
    }
  }

  return result;
}

List<DocumentReference> usersList(
  List<DocumentReference>? usersList1,
  List<DocumentReference>? usersList2,
) {
  // summarize two list of users references
  List<DocumentReference> combinedList = [];
  if (usersList1 != null) {
    combinedList.addAll(usersList1);
  }
  if (usersList2 != null) {
    combinedList.addAll(usersList2);
  }
  return combinedList.toSet().toList();
}

dynamic transformPartialJson(
  String? partialJson,
  String? jsonStructure,
) {
  if (partialJson == null || jsonStructure == null) {
    return {};
  }

  // Удаляем 'null' в начале и конце строки
  partialJson = partialJson.replaceAll(RegExp(r'^null|null$'), '').trim();

  if (partialJson.isEmpty) {
    return fillDefaultStructure(jsonStructure);
  }

  int startIndex = partialJson.indexOf(RegExp(r'[\[{]'));
  if (startIndex == -1) {
    return {};
  }
  partialJson = partialJson.substring(startIndex);

  dynamic structure;
  try {
    structure = json.decode(jsonStructure);
  } catch (e) {
    return {};
  }

  dynamic result;
  try {
    result = processJsonString(partialJson, structure);
  } catch (e) {
    print('Error processing JSON: $e');
    result = processWithRegex(partialJson, structure);
  }

  // Если структура — список JSON-объектов, возвращаем объект с ключом 'result'
  if (structure is List) {
    return {'result': result};
  }

  return result;
}

dynamic processJsonString(String jsonString, dynamic structure) {
  // Удаляем переносы строк и лишние пробелы
  jsonString = jsonString.replaceAll(RegExp(r'\s+'), ' ').trim();

  // Добавляем кавычки к ключам
  jsonString = jsonString.replaceAllMapped(
      RegExp(r'(\w+)(:)'), (match) => '"${match[1]}"${match[2]}');

  // Обрабатываем значения
  jsonString = jsonString.replaceAllMapped(
      RegExp(r':(\s*)([\w\s\.\,\-]+)(?=[,}])'),
      (match) => ': "${match[2]?.trim() ?? ''}"');

  // Заменяем одинарные кавычки на двойные
  jsonString = jsonString.replaceAll("'", '"');

  try {
    dynamic jsonData = json.decode(jsonString);
    return processJsonData(jsonData, structure);
  } catch (e) {
    print('Error decoding JSON: $e');
    print('Problematic string: $jsonString');
    return processWithRegex(jsonString, structure);
  }
}

dynamic processJsonData(dynamic jsonData, dynamic structure) {
  if (structure is Map<String, dynamic>) {
    Map<String, dynamic> result = {};
    for (var key in structure.keys) {
      if (jsonData is Map<String, dynamic>) {
        if (jsonData.containsKey(key)) {
          if (structure[key] is String) {
            result[key] = jsonData[key]?.toString() ?? '';
          } else if (structure[key] is List) {
            result[key] = processJsonList(jsonData[key], structure[key]);
          } else if (structure[key] is Map) {
            result[key] = processJsonData(jsonData[key], structure[key]);
          }
        } else {
          // Если ключа нет, добавляем его с пустым значением
          result[key] = structure[key] is String
              ? ''
              : (structure[key] is List ? [] : {});
        }
      }
    }
    return result;
  } else if (structure is List) {
    return processJsonList(jsonData, structure);
  }
  return {};
}

dynamic processJsonList(dynamic jsonData, List<dynamic> structure) {
  List<dynamic> result = [];
  if (jsonData is List) {
    for (var item in jsonData) {
      result.add(
          structure.isNotEmpty ? processJsonData(item, structure[0]) : item);
    }
  } else if (jsonData != null) {
    result.add(structure.isNotEmpty
        ? processJsonData(jsonData, structure[0])
        : jsonData);
  }
  return result;
}

dynamic processWithRegex(String partialJson, dynamic structure) {
  if (structure is Map<String, dynamic>) {
    Map<String, dynamic> result = {};
    for (var key in structure.keys) {
      if (structure[key] is String) {
        result[key] = extractValue(partialJson, key);
      } else if (structure[key] is List) {
        result[key] = extractList(partialJson, key, structure[key]);
      } else if (structure[key] is Map) {
        String extractedObject = extractObject(partialJson, key);
        result[key] = processWithRegex(extractedObject, structure[key]);
      }
    }
    return result;
  } else if (structure is List) {
    return extractList(partialJson, '', structure);
  }
  return {};
}

String extractValue(String json, String key) {
  RegExp regex = RegExp(r'"?' + key + r'"?\s*:\s*"?((?:(?!,\s*"?\w+":).)*)"?');
  Match? match = regex.firstMatch(json);
  return match?.group(1)?.trim().replaceAll(RegExp(r'^"|"$'), '') ?? '';
}

dynamic extractList(String json, String key, dynamic itemStructure) {
  List<dynamic> result = [];
  int listStart = key.isEmpty ? 0 : json.indexOf(key) + key.length;
  int bracketStart = json.indexOf('[', listStart);
  if (bracketStart != -1) {
    String listStr = json.substring(bracketStart + 1);
    int depth = 0;
    StringBuffer currentItem = StringBuffer();
    bool inQuotes = false;

    for (int i = 0; i < listStr.length; i++) {
      if (listStr[i] == '"' && (i == 0 || listStr[i - 1] != '\\')) {
        inQuotes = !inQuotes;
      }

      if (!inQuotes) {
        if (listStr[i] == '{' || listStr[i] == '[') {
          depth++;
        } else if (listStr[i] == '}' || listStr[i] == ']') {
          depth--;
          if (depth < 0) break; // Конец списка
        }
      }

      if (depth > 0 || inQuotes) {
        currentItem.write(listStr[i]);
      } else if (listStr[i] == ',' || depth < 0) {
        if (currentItem.isNotEmpty) {
          result.add(currentItem.toString().trim().replaceAll('"', ''));
          currentItem.clear();
        }
      } else {
        currentItem.write(listStr[i]);
      }
    }

    if (currentItem.isNotEmpty) {
      result.add(currentItem.toString().trim().replaceAll('"', ''));
    }
  }
  return result.isEmpty ? {} : result;
}

String extractObject(String json, String key) {
  int objectStart = json.indexOf(key) + key.length;
  int bracketStart = json.indexOf('{', objectStart);
  if (bracketStart != -1) {
    int depth = 1;
    for (int i = bracketStart + 1; i < json.length; i++) {
      if (json[i] == '{') depth++;
      if (json[i] == '}') depth--;
      if (depth == 0) {
        return json.substring(bracketStart, i + 1);
      }
    }
  }
  return json.substring(bracketStart);
}

dynamic fillDefaultStructure(String jsonStructure) {
  try {
    dynamic structure = json.decode(jsonStructure);
    return processJsonData({}, structure);
  } catch (e) {
    return {};
  }
}

List<dynamic> listjsonToAPI(List<dynamic> listOfJsonObjects) {
  return listOfJsonObjects.map((jsonObject) {
    // Преобразуем объект JSON в строку JSON с экранированными символами
    return jsonEncode(jsonObject);
  }).toList();
}

String analyzeJsonList(List<dynamic> listOfJsonObjects) {
  StringBuffer analysis = StringBuffer();

  // Анализ всего списка
  analysis.writeln('Received a list of ${listOfJsonObjects.length} objects.');
  analysis.writeln('List type: ${listOfJsonObjects.runtimeType}');
  analysis.writeln('\nFull list content:');
  analysis.writeln(listOfJsonObjects);

  analysis.writeln('\nDetailed analysis of each object:');

  for (int i = 0; i < listOfJsonObjects.length; i++) {
    var jsonObject = listOfJsonObjects[i];

    analysis.writeln('\nObject $i:');
    analysis.writeln('Type: ${jsonObject.runtimeType}');
    analysis.writeln('Content: $jsonObject');

    if (jsonObject is String) {
      try {
        // Попытка парсинга JSON без модификаций
        var decoded = json.decode(jsonObject);
        analysis.writeln('Successfully parsed as JSON.');
        analysis.writeln('Parsed content: $decoded');

        // Проверка ожидаемой структуры
        if (decoded is Map<String, dynamic>) {
          if (!decoded.containsKey('title')) {
            analysis.writeln('Warning: Missing "title" key.');
          }
          if (!decoded.containsKey('description')) {
            analysis.writeln('Warning: Missing "description" key.');
          }
        } else {
          analysis.writeln('Warning: Parsed object is not a Map.');
        }
      } catch (e) {
        analysis.writeln('Error parsing JSON: $e');

        // Анализ возможных проблем в структуре
        if (jsonObject.contains('{') && jsonObject.contains('}')) {
          analysis.writeln(
              'The string contains curly braces, suggesting it might be a JSON-like structure.');
          if (!jsonObject.contains('"')) {
            analysis.writeln(
                'Warning: No double quotes found. This might be causing the parsing error.');
          }
          if (jsonObject.contains(':')) {
            analysis.writeln('Colons found, suggesting key-value pairs.');
          }
          if (jsonObject.contains('\n')) {
            analysis.writeln(
                'New lines detected. This might affect parsing if not properly handled.');
          }
        } else {
          analysis.writeln(
              'The string does not appear to be in a JSON-like format.');
        }
      }
    } else {
      analysis.writeln('Object is not a string. Cannot parse as JSON.');
    }
  }

  return analysis.toString();
}

List<dynamic> processPlanjson(String? partialJson) {
  if (partialJson == null || partialJson.isEmpty) {
    return [];
  }

  partialJson = partialJson.replaceAll(RegExp(r'^null|null$'), '').trim();

  // Find the start of the JSON array
  int startIndex = partialJson.indexOf('[');
  if (startIndex == -1) return [];
  partialJson = partialJson.substring(startIndex);

  List<dynamic> result = [];

  int depth = 0;
  String currentObject = '';
  bool inQuotes = false;

  for (int i = 0; i < partialJson.length; i++) {
    if (partialJson[i] == '"' && (i == 0 || partialJson[i - 1] != '\\')) {
      inQuotes = !inQuotes;
    }

    if (!inQuotes) {
      if (partialJson[i] == '{') {
        if (depth == 0) currentObject = '';
        depth++;
      } else if (partialJson[i] == '}') {
        depth--;
        if (depth == 0) {
          result.add(processObject(currentObject + '}'));
          currentObject = '';
          continue;
        }
      }
    }

    if (depth > 0 || inQuotes) {
      currentObject += partialJson[i];
    }

    // Add partial object if end of string is reached
    if (i == partialJson.length - 1 && currentObject.isNotEmpty) {
      result.add(processObject(currentObject));
    }
  }

  return result;
}

Map<String, dynamic> processObject(String objectStr) {
  Map<String, dynamic> result = {};

  // Function to extract value by key
  String extractValue(String key) {
    RegExp regex = RegExp(r'"?' + key + r'"?\s*:\s*"((?:[^"\\]|\\.)*)"');
    Match? match = regex.firstMatch(objectStr);
    if (match != null) {
      return match.group(1)!;
    }
    // If no match found with quotes, try without quotes
    regex = RegExp(r'"?' + key + r'"?\s*:\s*([^,}]+)');
    match = regex.firstMatch(objectStr);
    if (match != null) {
      return match.group(1)!.trim();
    }
    return '';
  }

  result['title'] = extractValue('title');
  result['description'] = extractValue('description');

  return result;
}

int dateTimeComparison(
  DateTime currentTime,
  DateTime dateTime,
) {
  DateTime currentDate =
      DateTime(currentTime.year, currentTime.month, currentTime.day);
  DateTime targetDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

  // Находим разницу в днях между двумя датами
  Duration difference = targetDate.difference(currentDate);

  // Возвращаем разницу в днях как целое число
  return difference.inDays;
}

int jsonIndexFromListJson(
  String id,
  List<dynamic> listOfJsonObjects,
) {
  for (int i = 0; i < listOfJsonObjects.length; i++) {
    if (listOfJsonObjects[i]['id'] == id) {
      return i;
    }
  }

  return -1; // Return -1 if no match is found
}
