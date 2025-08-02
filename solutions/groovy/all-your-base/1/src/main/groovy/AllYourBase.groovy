class AllYourBase {
    int value;
    
    AllYourBase(inputBase, digits) {
        if (inputBase < 2) throw new ArithmeticException("no");
        if (digits.any {d -> d < 0 || d >= inputBase}) throw new ArithmeticException("no");
        this.value = digits.inject(0) {out, d -> out * inputBase + d};
    }

    def rebase(outputBase) {
        if (outputBase < 2) throw new ArithmeticException("no");
        def ret = [];
        int n = this.value;
        while (n > 0) {
            ret = [n % outputBase] + ret;
            n = n.intdiv(outputBase);
        }
        return ret.size() == 0 ? [0] : ret;
    }
}