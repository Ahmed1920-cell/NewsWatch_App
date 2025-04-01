class Valid{
   static String? valid_name(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (!RegExp(r"^[a-zA-Z][a-zA-Z0-9 ._]{2,19}$")
        .hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }
   static String? valid_email(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
   static String? valid_password(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
   static String? valid_phone(String? value){
     if (value == null || value.isEmpty) {
       return 'Please enter your phone';
     }else if (!RegExp(r'^\d+$')
         .hasMatch(value)) {
       return 'Please enter a valid phone';
     }return null;
   }
}