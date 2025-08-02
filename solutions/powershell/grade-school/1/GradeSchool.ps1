class Student {
    $Grade
    $Name
    Student($Grade, $Name) {
        $this.Grade = $Grade; $this.Name = $Name
    }
}

class Roster {
    [Student[]]$Students
    Roster() {
        $this.Students = @()
    }

    [bool] AddStudent($Grade, $Name) {
        if (-not ($this.Students | ? Name -eq $Name)) {
            $this.Students += [Student]::new($Grade, $Name)
            return $true
        }
        return $false
    }

    [Student[]] GetRoster() {
        return $this.Students | Sort-Object Grade, Name
    }

    [Student[]] GetRoster($Grade) {
        return $this.Students | Where-Object {$_.Grade -eq $Grade} | Sort-Object Grade, Name
    }
}