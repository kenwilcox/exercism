using System;
using System.Collections.Generic;
using System.Linq;

public class GradeSchool
{
    private readonly Dictionary<string, int> _school = new();
    public bool Add(string student, int grade)
    {
        if (_school.ContainsKey(student)) return false;
        _school.Add(student, grade);
        return true;
    }

    public IEnumerable<string> Roster() => _school.OrderBy(x => x.Value).ThenBy(x => x.Key)
        .Select(x => x.Key);

    public IEnumerable<string> Grade(int grade) => _school.Where(x => x.Value == grade)
        .Select(x => x.Key).OrderBy(x => x);
}