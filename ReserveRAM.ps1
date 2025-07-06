# Cool ASCII Banner
$banner = @'
  _  __     _     _   _    _____    ____  
 | |/ /    / \   | \ | |  |_   _|  / ___ \ 
 | ' /    / _ \  |  \| |    | |   | |   | |
 | . \   / ___ \ | |\  |    | |   | |___| |
 |_|\_\ /_/   \_\|_| \_|    |_|    \____ /

              K   A   N   T   O
'@

Clear-Host
Write-Host $banner -ForegroundColor Cyan  # Soft blue

# Intro message
Write-Host ""
Write-Host "Starting buffer allocation..." -ForegroundColor DarkYellow  # Salmon tone

$sizeInMB = 512
try {
    $buffer = New-Object byte[] ($sizeInMB * 1MB)
    Write-Host "Buffer allocated successfully." -ForegroundColor Cyan
} catch {
    Write-Host "Failed to allocate buffer:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}

# Fill RAM to reserve
[Array]::Clear($buffer, 0, $buffer.Length)

# Info box
Write-Host ""
Write-Host "+--------------------------------------------+" -ForegroundColor DarkCyan
Write-Host ("|  RAM Reserved: {0} MB" -f $sizeInMB).PadRight(43) + "|" -ForegroundColor White
Write-Host "|  Script is running...                      |" -ForegroundColor White
Write-Host "|  Press Ctrl+C to stop and release memory.  |" -ForegroundColor White
Write-Host "+--------------------------------------------+" -ForegroundColor DarkCyan
Write-Host ""

# Keep RAM held
while ($true) {
    Start-Sleep -Seconds 10
}
