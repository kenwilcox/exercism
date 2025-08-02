class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder result = new StringBuilder();
        for (var i =0; i < identifier.length(); i++) {
            char c = identifier.charAt(i);
            if (c == ' ') {
                result.append('_');
            }
            else if (Character.isISOControl(c)) {
                result.append("CTRL");
            }
            else if (Character.isLetter(c)) {
                // ignore the range of greek chars
                if (c >= 'α' && c <= 'ω') continue;
                result.append(c);
            }
            else if (c == '-') {
                char next = identifier.charAt(++i);
                if (Character.isLetter(next)) {
                    String s = Character.toString(next).toUpperCase();
                    result.append(s);
                }
            }
        }
        return result.toString();
    }
}
