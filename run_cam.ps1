Write-Output "Start..."
$counter = 0
# ������ ��� �������� ������� ������
$dirs = Get-ChildItem -Path $args[0] -Directory
foreach ($dir in $dirs) {
    $counter++
    # ������ ��� ����� ��������� ���� ��������, ����� �����
    $pcb = Get-ChildItem -Path $dir.FullName -File -Filter *cam.pcb | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    Write-Output $pcb.FullName
    d:\bat\pcb.bat $pcb.FullName
    if ($counter -gt 9) {
        $counter = 0
        Read-Host -Prompt "Waits end of processing opened files. Press enter"
        # �������� ������, ������� ������'
    }
}