#include "reverse_string.h"

namespace reverse_string {
  std::string reverse_string(std::string str) {
      std::string ret = "";
      for (int i = str.length() - 1; i >= 0; i--) {
          ret += str[i];
      }
      return ret;
  }
}  // namespace reverse_string
