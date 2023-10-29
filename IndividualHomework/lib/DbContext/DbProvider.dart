import 'dart:io';

import 'package:individualhomework/Models/Category.dart';
import 'package:individualhomework/Models/Movie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  DbProvider._();

  static final DbProvider db = DbProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}catalogs.db';
    final bool dbExists = await databaseExists(path);

    final db = await openDatabase(path, version: 1, onCreate: _createDb);

    if (!dbExists) {
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/d/de/Movie_poster_the_shawshank_redemption.jpg",
        "name": "Побег из Шоушенка", "description": "Несправедливо осужденный банкир готовит побег из тюрьмы.", "director": "Фрэнк Дарабонт",
        "categoryName": "Драма", "year": "1994"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/c/c4/Godfather_vhs.jpg",
        "name": "	Крёстный отец", "description": "Престарелый дон Карлеоне понемногу теряет влияние в преступном мире, и тем самым дает возможность конкурентам начать «войну».",
        "director": "Фрэнсис Форд Коппола", "categoryName": "Драма", "year": "1972"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/f/f4/%D0%A2%D1%91%D0%BC%D0%BD%D1%8B%D0%B9_%D1%80%D1%8B%D1%86%D0%B0%D1%80%D1%8C_%282008%29_%D0%BF%D0%BE%D1%81%D1%82%D0%B5%D1%80.jpg",
        "name": "Тёмный рыцарь", "description": "Крутецкий супер-геройский боевик.", "director": "Кристофер Нолан",
        "categoryName": "Боевик", "year": "2008"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/a/a1/Godfather_2.jpg",
        "name": "Крёстный отец 2", "description": "Для дона Корлеоне и его сына не существует моральных преград на пути к достижению целей.",
        "director": "Фрэнсис Форд Коппола", "categoryName": "Драма", "year": "1974"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/12_Angry_Men_%281957_film_poster%29.jpg/800px-12_Angry_Men_%281957_film_poster%29.jpg",
        "name": "12 разгневанных мужчин", "description": "12 присяжных должны решить судьбу парня, который якобы зарезал своего отца ножом.",
        "director": "Фрэнсис Форд Коппола", "categoryName": "Драма", "year": "1957"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/3/38/Schindler%27s_List_movie.jpg",
        "name": "Список Шиндлера", "description": "Загадочный мужчина спасает евреев во время второй мировой войны.",
        "director": "Стивен Спилберг", "categoryName": "Драма", "year": "1993"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/5/53/The_Lord_of_the_Rings._The_Return_of_the_King_%E2%80%94_movie.jpg",
        "name": "Властелин колец: Возвращение короля", "description": "Арагорн штурмует Мордор, а Фродо устал бороться с чарами кольца.",
        "director": "Питер Джексон", "categoryName": "Приключение", "year": "2003"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/9/93/Pulp_Fiction.jpg",
        "name": "Криминальное чтиво", "description": "Двое бандитов Винсент Вега и Джулс Винфилд ведут философские беседы в перерывах между разборками и решением проблем с должниками криминального босса Марселласа.",
        "director": "Квентин Тарантино", "categoryName": "Драма", "year": "1994"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/0/08/The_Lord_of_the_Rings._The_Fellowship_of_the_Ring_%E2%80%94_movie.jpg",
        "name": "Властелин колец: Братство Кольца", "description": "Фродо Бэггинс отправляется спасать Средиземье.",
        "director": "Питер Джексон", "categoryName": "Приключение", "year": "2001"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/f/fd/Goodbadugly.JPG",
        "name": "Хороший, плохой, злой", "description": "Вестерн про охотников за головами.",
        "director": "Серджо Леоне", "categoryName": "Вестерн", "year": "1966"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/d/de/%D0%A4%D0%BE%D1%80%D1%80%D0%B5%D1%81%D1%82_%D0%93%D0%B0%D0%BC%D0%BF.jpg",
        "name": "Форрест Гамп", "description": "Полувековая история США глазами чудака из Алабамы.",
        "director": "Роберт Земекис", "categoryName": "Приключение", "year": "1994"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/8/8a/Fight_club.jpg",
        "name": "Бойцовский клуб", "description": "Страховой работник разрушает рутину своей благополучной жизни.",
        "director": "Дэвид Финчер", "categoryName": "Драма", "year": "1999"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/f/f0/The_Lord_of_the_Rings._The_Two_Towers_—_movie.jpg",
        "name": "Властелин колец: Две крепости", "description": "Братство распалось, но Кольцо Всевластья должно быть уничтожено.",
        "director": "Питер Джексон", "categoryName": "Приключение", "year": "2002"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/b/bc/Poster_Inception_film_2010.jpg",
        "name": "Начало", "description": "Кобб – талантливый вор, лучший из лучших в опасном искусстве извлечения.",
        "director": "Кристофер Нолан", "categoryName": "Научная фантастика", "year": "2010"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/e/e0/Empire20strikes20back_old.jpg",
        "name": "Звёздные войны. Эпизод V: Империя наносит ответный удар", "description": "Юный Люк продолжает постигать Силу, но его ждет страшная тайна.",
        "director": "Ирвин Кершнер", "categoryName": "Приключение", "year": "1980"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/9/9d/Matrix-DVD.jpg",
        "name": "Матрица", "description": "Хакер Нео узнает, что его мир — виртуальный.",
        "director": "Энди и Ларри Вачовски", "categoryName": "Научная фантастика", "year": "1999"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/9/99/Goodfellas_Cover.jpg",
        "name": "Славные парни", "description": "Путь к власти легендарного мафиози Генри Хилла.",
        "director": "Мартин Скорсезе", "categoryName": "Драма", "year": "1990"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/2/26/One_Flew_Over_the_Cuckoo%27s_Nest_poster.jpg",
        "name": "Пролетая над гнездом кукушки", "description": "Джек Николсон — запертый в психушке бунтарь, который борется с системой.",
        "director": "Милош Форман", "categoryName": "Драма", "year": "1975"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/ru/8/83/Se7en_%28poster%29.jpg",
        "name": "Семь", "description": "Детективы ищут маньяка, убивающего грешников.",
        "director": "Дэвид Финчер", "categoryName": "Драма", "year": "1995"});
      await db.insert("Movie", {"imageSource": "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Sevensamurai-movieposter1954.jpg/800px-Sevensamurai-movieposter1954.jpg",
        "name": "Семь самураев", "description": "Бедные крестьяне нанимают для защиты деревни семерых самураев.",
        "director": "Акира Куросава", "categoryName": "Боевик", "year": "1954"});

      await db.insert("Category", {"imageSource": "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Sevensamurai-movieposter1954.jpg/800px-Sevensamurai-movieposter1954.jpg",
         "categoryName": "Драма"});
      await db.insert("Category", {"imageSource": "http://kinomoe.com/wp-content/uploads/2016/04/kadr-iz-filma-angliyskiy-pacient-e1476036644429.jpg",
        "categoryName": "Боевик"});
      await db.insert("Category", {"imageSource": "https://sun9-26.userapi.com/dyrIWJXDP5Vs5JdNV2u_gttLrd46fLHVtsrIVg/IMI9IFdNyvo.jpg",
        "categoryName": "Приключение"});
      await db.insert("Category", {"imageSource": "https://i.pinimg.com/originals/cc/60/24/cc6024b266e6de4957502436d3c26b26.jpg",
        "categoryName": "Вестерн"});
      await db.insert("Category", {"imageSource": "https://wallup.net/wp-content/uploads/2018/10/05/698520-sci-fi-fantasy-art-artwork-science-fiction-futuristic-original-adventure-fantasy.jpg",
        "categoryName": "Научная фантастика"});
    }

    return db;
  }


  Future<void> _createDb(Database db, int version) async {
    await db.execute("CREATE TABLE Movie ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "imageSource TEXT,"
        "name TEXT,"
        "description TEXT,"
        "director TEXT,"
        "categoryName TEXT,"
        "year INTEGER"
        ");");

    await db.execute("CREATE TABLE Category ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "imageSource TEXT,"
        "categoryName TEXT"
        ");");
  }

  Future<List<Category>> getAllCategories() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> data = await db.query("Category");
    return data.map((item) => Category.fromMap(item)).toList();
  }

  Future<List<Movie>> getAllMovies() async {
    Database db = await this.database;
    final List<Map<String, dynamic>> data = await db.query("Movie");
    return data.map((item) => Movie.fromMap(item)).toList();
  }

  Future<Movie?> getMovie(int id) async {
    Database db = await this.database;
    final List<Map<String, dynamic>> data = await db.query("Movie", where: "id = ?", whereArgs: [id]);
    if (data.isNotEmpty) {
      return Movie.fromMap(data.first);
    }
    return null;
  }
}