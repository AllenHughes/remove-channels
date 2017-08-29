Get-ChildItem | ForEach-Object {
    if ($_.Extension -eq ".mov") {
        $filename = $_.Name
        $outputname = $_.Name + "-output.mov"
        ffmpeg -i $filename -c:v copy -map_channel 0.2.0 -map_channel -0.2.1 $outputname
        Remove-Item $filename
        Rename-Item -Path $outputname -NewName $filename
    }
}