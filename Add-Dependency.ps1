function Add-Dependency([string]$folder, [string]$command) {

    if(-not (Get-Command $command -Erroraction 'silentlycontinue')) {   # -erroraction prevents get-command's error from showing when it fails.
        $env:PATH += ";$folder"  # temporarily add program to path variable for the session
        if(-not (Get-Command $command -Erroraction 'silentlycontinue')) {
            Write-Error "Could not run dependency program $command. Try adding $folder to your PATH environment variable."
            exit
        }
        else{Write-Warning "$folder has been added to your PATH environment variable for this session."}
    }

}