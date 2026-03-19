$base = "HKCU:\Software\SimonTatham\PuTTY\Sessions"

# List your session keys (optional)
# Get-ChildItem $base | Select-Object -ExpandProperty PSChildName

# Set this to the exact font string PuTTY uses.
# Common pattern is: "FontName:style:pointsize"
# Example:
$newFont = "0xProto Nerd Font Mono"

Get-ChildItem $base | ForEach-Object {
  $k = $_.PsPath
  if (Get-ItemProperty -Path $k -Name "Font" -ErrorAction SilentlyContinue) {
    Set-ItemProperty -Path $k -Name "Font" -Value $newFont
  } else {
    New-ItemProperty -Path $k -Name "Font" -PropertyType String -Value $newFont | Out-Null
  }
}

Write-Host "Updated PuTTY Font for all saved sessions to: $newFont"
