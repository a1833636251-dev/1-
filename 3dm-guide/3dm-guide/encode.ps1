$filePath = "C:\Users\Lenovo\3dm-guide\index.html"
$fileBytes = [System.IO.File]::ReadAllBytes($filePath)
$encoded = [System.Convert]::ToBase64String($fileBytes)
$tempFile = "$env:TEMP\3dm_base64.txt"
[System.IO.File]::WriteAllText($tempFile, $encoded, [System.Text.Encoding]::UTF8)
Write-Output "File encoded, size: $($encoded.Length) characters"
Write-Output "Temp file: $tempFile"