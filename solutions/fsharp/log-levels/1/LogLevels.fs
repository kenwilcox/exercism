module LogLevels

let message (logLine: string): string =
    let msg = logLine.Split(':')[1]
    msg.Trim()

let logLevel(logLine: string): string =
    let level = logLine.Split(':')[0]
    level.Replace("[", "").Replace("]", "").ToLower().Trim()

let reformat(logLine: string): string =
    let msg = message logLine
    let level = logLevel logLine
    $"{msg} ({level})"
