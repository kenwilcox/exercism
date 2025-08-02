using System;

public static class ErrorHandling
{
    public static void HandleErrorByThrowingException()
    {
        throw new Exception("Wa wa");
    }

    public static int? HandleErrorByReturningNullableType(string input)
    {
        if (int.TryParse(input, out var i)) return i;
        return null;
    }

    public static bool HandleErrorWithOutParam(string input, out int result)
    {
        if (int.TryParse(input, out var i))
        {
            result = i;
            return true;
        }
        result = -1;
        return false;
    }

    public static void DisposableResourcesAreDisposedWhenExceptionIsThrown(IDisposable disposableObject)
    {
        disposableObject.Dispose();
        throw new Exception("oogabooga");
    }
}
