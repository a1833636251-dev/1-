$token = "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"
$filePath = "C:\Users\Lenovo\3dm-guide\index.html"
$content = Get-Content $filePath -Raw

$body = @{
    description = "3DM游戏攻略网页"
    public = $false
    files = @{
        "index.html" = @{ content = $content }
    }
}

$json = $body | ConvertTo-Json -Depth 10
$headers = @{
    "Authorization" = "Bearer $token"
    "User-Agent" = "Mozilla/5.0"
    "Content-Type" = "application/json"
}

try {
    $response = Invoke-WebRequest -Uri "https://api.github.com/gists" -Method Post -Headers $headers -Body ([System.Text.Encoding]::UTF8.GetBytes($json)) -ContentType "application/json" -TimeoutSec 60
    $result = $response.Content | ConvertFrom-Json
    Write-Output "SUCCESS"
    Write-Output "Gist URL: $($result.html_url)"
} catch {
    Write-Output "ERROR: $_"
    Write-Output $_.Exception.Message
}