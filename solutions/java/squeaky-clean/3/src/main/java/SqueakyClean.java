public class SqueakyClean {
    public static String clean(String identifier) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < identifier.length(); i++) {
            char c = identifier.charAt(i);
            if (c == '-' ) {
                char nextChar = identifier.charAt(i + 1);
                result.append(Character.toUpperCase(nextChar));
                i++;
            } else if(Character.isDigit(c)) {
                result.append(deleet(c));
            }else {
                result.append(c);
            }
        }
        return result.toString().replace(" ","_").replaceAll("[^a-zA-Z0-9_]", "");
    }

    // This is not spelled wrong :D
    static String deleet(Character c){
        return c.toString()
            .replace("4", "a")
            .replace("3", "e")
            .replace("0", "o")
            .replace("1", "l")
            .replace("7", "t");
    }
}