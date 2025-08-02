using System;

static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        var idStr = id != null? $"[{id}] - ": "";
		var departmentStr = department != null? department.ToUpper(): "OWNER";
		return $"{idStr}{name} - {departmentStr}";
    }
}
