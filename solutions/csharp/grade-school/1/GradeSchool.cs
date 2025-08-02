using System;
using System.Collections.Generic;
using System.Linq;

public class GradeSchool
{
    private Dictionary<int, List<string>> _school = new Dictionary<int, List<string>>();
    public void Add(string student, int grade)
    {
        if (!_school.ContainsKey(grade)) 
        {
            _school[grade] = new List<string>();
        }
        _school[grade].Add(student);
    }

    public IEnumerable<string> Roster()
    {
        var ret = new List<string>();
        foreach(var kvp in _school.OrderBy(x => x.Key)) 
        {
            foreach(var student in kvp.Value.OrderBy(x => x)) {
                ret.Add(student);
            }
        }
        return ret;
    }

    public IEnumerable<string> Grade(int grade)
    {
        var ret = new List<string>();
        if (_school.ContainsKey(grade))
        {
            ret = _school[grade].OrderBy(x => x).ToList();
        }
        return ret;
    }
}