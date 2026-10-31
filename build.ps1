param()
$ErrorActionPreference = 'Stop'
Push-Location -LiteralPath $PSScriptRoot
try {
    $templateLatexmk = Get-Command latexmk -ErrorAction SilentlyContinue
    if ($templateLatexmk) {
        $templateCompiler = $templateLatexmk.Source
    } elseif (Test-Path -LiteralPath 'C:\texlive\2026\bin\windows\latexmk.exe') {
        $templateCompiler = 'C:\texlive\2026\bin\windows\latexmk.exe'
    } else {
        throw 'Install TeX Live with XeLaTeX and latexmk, then run this script again.'
    }
    & $templateCompiler -xelatex -interaction=nonstopmode -halt-on-error -outdir=build main.tex
    if ($LASTEXITCODE -ne 0) { throw 'Compilation failed. Check build/main.log.' }
    Write-Host 'PDF ready: build/main.pdf'
} finally {
    Pop-Location
}
