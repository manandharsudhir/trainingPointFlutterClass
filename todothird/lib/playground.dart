void main() {
  myFood(
    "Biryani",
  );

  myFood("Pizza", "this is good");
}

void myFood([String name = "", String desc = "hello"]) {
  print(name);
  print(desc);
}
