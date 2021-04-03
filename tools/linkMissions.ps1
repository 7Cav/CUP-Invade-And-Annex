get-childitem "../CommonBase" | % {
    $filePath = $_.FullName
    $fileName = $_.name
    get-childitem "../Maps" | % {
        $mapPath = $_.FullName+"/"+$fileName
        if ( [System.IO.File]::Exists($filePath) -or [System.IO.Directory]::Exists($filePath) ) { 
            New-Item -ItemType 'SymbolicLink' -Value $filePath -Path $mapPath # >$null 2>&1
        } else {
            Write-Host "'$fileName' does not exist..." -ForegroundColor Red
        }
    }
}