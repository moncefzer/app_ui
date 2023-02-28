//! Mixins
//* in dart we can only extend only one class
class User {
  void postComment() {
    print('post comment');
  }
}

//* 1- can be defined like this
// class Publisher extends User {
//   void publishArticle() {
//     print('publishArticle');
//   }
// }

//* 2- can be defined like this
class Publisher extends User with CanPublishArticle {}

//! Mixin
// mixins can contain function ,vars, ....
//* they are used to get access to muti class members without inheritance
mixin CanPublishArticle {
  void publishArticle() {
    print('publishArticle');
  }
}
