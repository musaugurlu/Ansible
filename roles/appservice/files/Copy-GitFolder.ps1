[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateScript({Test-Path $_})]
    [string] $Path,

    [Parameter(Mandatory)]
    [string] $Uri
)

begin {
    $GitFolder = ($Uri.Split("/")[-1]).Replace(".git","")
    $FolderPath = Join-Path $Path $GitFolder
}

process {
    if(!(Test-Path $FolderPath)) {
        Set-Location -Path $Path
        (git clone $Uri)
    }
    
}

end {
    
}