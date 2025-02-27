
Map<String, Map<String, dynamic>> library = {};

void addBook({
  required String title,
  String author = "Unknown",
  int year = 2000,
  String genre = "General",
}) {
  library[title] = {
    'author': author,
    'year': year,
    'genre': genre,
  };
  print("Book added successfully: $title");
}

String getBookInfo({required String title}) {
  if (library.containsKey(title)) {
    var book = library[title]!;
    return "Title: $title, Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}";
  }
  return "Book not found.";
}

void listAllBooks({String genre = ''}) {
  if (library.isEmpty) {
    print("No books in the library.");
    return;
  }

  if (genre.isEmpty) {
    library.forEach((title, book) {
      print("Title: $title, Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}");
    });
  } else {
    bool found = false;
    library.forEach((title, book) {
      if (book['genre'] == genre) {
        print("Title: $title, Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}");
        found = true;
      }
    });
    if (!found) {
      print("No books found for genre: $genre");
    }
  }
}


List<String> listBooksByGenre({required String genre}) {
  List<String> booksInGenre = [];

  library.forEach((title, book) {
    if (book['genre'] == genre) {
      booksInGenre.add(title);
    }
  });

  return booksInGenre.isEmpty ? ["No books found for this genre."] : booksInGenre;
}

String removeBook({required String title}) {
  if (library.containsKey(title)) {
    library.remove(title);
    return "Book removed successfully.";
  }
  return "Book not found.";
}

void main() {
  addBook(title: "white nights", author: "dosto...", year: 1111, genre: "novel");
  addBook(title: "darwish book", author: "mahmoud darwish", year: 2000, genre: "poerty");

  print(getBookInfo(title: "white nights"));
  listAllBooks();
  print(listBooksByGenre(genre: "novel"));
  print(listBooksByGenre(genre: "poerty"));
  print(removeBook(title: "darwish book"));
  listAllBooks();
  listAllBooks(genre: "novel");
  listAllBooks(genre: "anything");
  

}
