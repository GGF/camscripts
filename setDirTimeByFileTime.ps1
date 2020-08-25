#
# Скрипт для изменения дат изменения каталогов по дате последнего файла в нем
#

# получим все каталоги ниже текущего
$dirs = Get-ChildItem -Directory -Recurse
# для каждого из них
foreach ($dir in $dirs) {
   # соберем все только файлы сортированные по времени последнего изменения в нисходящем порядке
   $files = Get-ChildItem -Path $dir.FullName -File | Sort-Object -Property LastWriteTime -Descending
   # если такие файлы нашлись (каталоги бывают пустые)
   if ($files.Length) {
        #установим дату этого каталога по первому в списке, то есть из-за сортировки самому новому
        $dir.LastWriteTime = $files[0].LastWriteTime
   }
}