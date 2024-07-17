# list.txtから検索ワードを読み込む
$searchTerms = Get-Content -Path "list.txt"

# Microsoft Edgeを起動し、bing.comにアクセス
Start-Process "firefox.exe" "https://www.bing.com"
Start-Sleep -Seconds 5  # Edgeが起動するのを待つ

# キーボードエミュレーションのためのAdd-Type
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# 検索ワードを順に入力して検索
for ($i = 0; $i -lt 5 -and $i -lt $searchTerms.Length; $i++) {
    $searchTerm = $searchTerms[$i]
    
    # 検索ボックスにフォーカスを移動
    [System.Windows.Forms.SendKeys]::SendWait("^l")
    Start-Sleep -Milliseconds 500
    
    # 検索ワードを入力
    [System.Windows.Forms.SendKeys]::SendWait($searchTerm)
    Start-Sleep -Milliseconds 500
    
    # Enterキーを押して検索
    [System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
    Start-Sleep -Seconds 5  # 検索結果が表示されるのを待つ
}
