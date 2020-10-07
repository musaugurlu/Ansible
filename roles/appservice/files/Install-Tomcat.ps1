[CmdletBinding()]
param (
    [ValidateScript({Test-Path $_})]
    [string] $SetupPath = "$(Split-Path $PSCommandPath -Parent)\apache-tomcat-9.0.38-windows-x64.zip",

    [ValidateScript({Test-Path $_})]
    [string] $InstallDirectory = "D:",
    
    [string] $ServiceName = "Tomcat9",

    [int] $ServicePort = "8090"
)

begin {
    
}

process {
    $FilePath = Resolve-Path $SetupPath | Select-Object -ExpandProperty Path
    $FolderName = Split-Path ($FilePath.Replace(".zip","").Replace("-x64","").Replace("-windows","")) -Leaf
    $FolderPath = Join-Path $InstallDirectory $FolderName

    if(!(Test-Path $FolderPath)) {
        Expand-Archive -Path $FilePath -DestinationPath $InstallDirectory
        
        $ServerConf = Get-Content "$FolderPath\conf\server.xml"
        $ServerConf.Replace("8080",$ServicePort) | Set-Content -Path "$FolderPath\conf\server.xml"
        
        $CurrentPath = $pwd
        Set-Location "$FolderPath\bin"
        
        .\service.bat install

        Set-Location $CurrentPath
    }
}

end {
    
}
