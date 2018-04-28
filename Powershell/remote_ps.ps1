$hostname = "13.56.247.89"                     # 接続先ホスト（環境に合わせて変更する）
$username = "Administrator"                    # 接続ユーザー（環境に合わせて変更する）
$passwd   = "YlA.s(yxkv7rk&*InKWt-YTL?(tD)xP4" # パスワード （環境に合わせて変更する）

# セキュアストリングの作成（パスワードの暗号化）
$sec_str = ConvertTo-SecureString $passwd -AsPlainText -Force

# Credential オプションに指定するオブジェクトのインスタンス生成
$psc = New-Object System.Management.Automation.PsCredential($username, $sec_str)

# New-PSSession コマンドによるセッションの生成
$sess = New-PSSession -ComputerName $hostname -Credential $psc

Get-PSSession # セッションの確認

# コマンドをリモートホスト上で実行する
Invoke-Command -Session $sess -ScriptBlock {Get-ExecutionPolicy;}

Remove-PSSession -Session $sess # セッションを削除
Get-PSSession # セッションの確認
