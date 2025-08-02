BEGIN {FPAT = "[0-9]"}
{
    sum = 0;
    for (i = 1; i <= NF; i++) sum += (NF-i) % 2 ? int($i*2.2): $i;
    print(!/[^0-9 ]/ && sum % 10 == 0 && NF > 1) ? "true" : "false"
}
